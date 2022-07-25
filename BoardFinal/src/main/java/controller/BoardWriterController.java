package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dto.BoardDTO;
import dto.FileDTO;
import service.BoardService;
import view.ModelAndView;

public class BoardWriterController implements Controller {

   @Override
   public ModelAndView execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      String title = null;
      String content = null;
      String writer = null;
      
      int bno = BoardService.getInstance().selectBoardNo();
      BoardDTO dto = new BoardDTO(title, writer, content);
      dto.setBno(bno);
      
      
      File userRoot = new File("c:\\fileupload\\");
      String encoding = "utf-8";
      
      if(!userRoot.exists())
         userRoot.mkdir();
      
      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setRepository(userRoot);
      factory.setSizeThreshold(1024*1024);
      
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      try {
         ArrayList<FileDTO> filelist = new ArrayList<FileDTO>();
         List<FileItem> list = upload.parseRequest(request);
         
         for(FileItem item : list) {
            if(item.isFormField()) {
               switch(item.getFieldName()) {
               case "title":
                  title = item.getString(encoding);
                  break;
               case "content":
                  content = item.getString(encoding);
                  break;
               case "writer":
                  writer = item.getString(encoding);
                  break;
               }
            }else {
               if(item.getSize() > 0) {
                  int idx = item.getName().lastIndexOf("\\");
                  if(idx == -1)
                     idx = item.getName().lastIndexOf("/");
                  
                  String fileName = item.getName().substring(idx + 1);
                  // 파일 경로 완성
                  File uploadFile = new File(userRoot + "\\" + fileName);
                  
                  if(!uploadFile.getParentFile().exists())
                     uploadFile.getParentFile().mkdirs();
                  filelist.add(new FileDTO(uploadFile.getAbsolutePath(), uploadFile.getName(),
                        fileName, 0, filelist.size()));
               }
            }
         }
         
         
         
      } catch (FileUploadException e) {
         e.printStackTrace();
      }
      
      BoardService.getInstance().insertBoard(dto);
      
      return new ModelAndView("main.do", true);
   }

}