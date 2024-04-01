<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Achievements.aspx.cs" Inherits="HospitalWebsite.Admin.Achievements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script defer>
         function editFeature(id) {

             resetModel();

             var featureData = fetchFeatureData(id);
             
             // Update the modal fields with existing data
             document.getElementById('post_title').value = featureData.title;

             // Toggle visibility of buttons based on whether ID exists
             if (id) {
                 document.getElementById('saveButton').style.display = 'none';
                 document.getElementById('updateButton').style.display = 'block';
                 //document.getElementById('feature-image').className = 'form-group mb-3';

                 var modal = document.getElementById('verticalycentered');
                 var modalInstance = new bootstrap.Modal(modal);
                 modalInstance.show();
                 
             }
             else {
                 document.getElementById('saveButton').style.display = 'block';
                 document.getElementById('updateButton').style.display = 'none';
                 resetModel();
                 //document.getElementById('feature-image').className = 'form-group mb-3';
                
             }
             
           
            
         }

         function resetModel() {
            
         }
         
         function fetchFeatureData(id) {
             // Replace this with your actual logic to fetch existing data based on ID
             // For demonstration, return a sample object
             return {
                 title: id,
                 // Add other properties as needed
             };
         }




            

         
         

     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="BreadcrumbPlaceholder" runat="server"></div>
            <!-- Card with header and footer -->
 <div class="card">
            <div class="card-header"><span class="add-dept-header-text fw-bold">Achievements</span><span class="d-flex float-end"><button type="button" class="add-dept-btn btn btn-primary rounded-pill" data-bs-toggle="modal" data-bs-target="#verticalycentered" onclick="editFeature(null)">Add Achievement</button></span></div>
            <div class="card-body py-0">
                <div class="table-responsive overflow-auto">
            <table class="table table-bordered mt-3">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Achievements</th>
                    <th scope="col">Department</th>
                    
                    <th scope="col">Edit</th>
                    <th scope="col">Delete</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="departments-table">
                    <th scope="row">1</th>
                    <td><p>Features title</p></td>
                    <td ><p>features description </p></td>
                      
                         
                      <td> <button type="button" class="btn btn-link" onclick="editFeature(1);">
        <i class="bi bi-pencil-square text-success"></i>
    </button></td>
                    <td ><a  href="?all-departments" ><p><i class="bi bi-trash text-danger"></i></p> </a></td>
                  </tr>
                 
                </tbody>
              </table>
              <!-- End Bordered Table -->
            </div>
            </div>
            <div class="card-footer">
              <!-- Pagination with icons -->
              <nav aria-label="Page navigation example">
                <ul class="pagination  justify-content-center">
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav><!-- End Pagination with icons -->

            </div>
</div><!-- End Card with header and footer -->

 <!-- Vertically centered Modal -->
 
       <div class="modal fade" id="verticalycentered" tabindex="-1">
    <%--<div class="modal-dialog modal-dialog-centered modal-lg">--%>
        <div class="modal-dialog  modal-lg">
        <div class="modal-content">
           <div class="modal-header text-center">
                <h4 class="modal-title mx-auto" style="width: 50%;">Achievement</h4>
            </div>

            <div class="modal-body">
                <form>
                 
                    <div class="form-group mb-3">
                        <div class="row">
                            <label for="post_title" class="col-12 col-sm-12 col-lg-3 col-form-label"><b>Achievements</b></label>
                            <div class="col-12 col-sm-12 col-lg-9">
                                <Textarea type="text" placeholder="Description" class="form-control" id="post_title" name="post_title" required autofocus></Textarea>
                            </div>
                        </div>
                    </div>
                     <div class="form-group mb-3">
                         <div class="row">
                             <label for="post_title" class="col-12 col-sm-12 col-lg-3 col-form-label"><b>Department</b></label>
                             <div class="col-12 col-sm-12 col-lg-9">
                                 <select class="form-control form-select" id="selectInput" name="post_title" required autofocus>
                                     <option value="option1">Option 1</option>
                                     <option value="option2">Option 2</option>
                                     <option value="option3">Option 3</option>
                                     <!-- Add more options as needed -->
                                 </select>
                                  </div>
                              </div>
                         </div>
                    

              

                </form>
            </div>
            <div class="modal-footer mb-0">
                <button type="button" class="btn btn-danger btn-small" data-bs-dismiss="modal">Close</button>          
                <button type="button" class="btn btn-primary btn-small" id="saveButton" onclick="saveFeature()">Save</button>
                <button type="button" class="btn btn-success btn-small" id="updateButton" style="display:none;" onclick="updateFeature()">Update</button>
            </div>
        </div>
    </div>
</div>

   

    
</asp:Content>
