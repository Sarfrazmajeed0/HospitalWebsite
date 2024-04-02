<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Features.aspx.cs" Inherits="HospitalWebsite.Admin.Features" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script defer>
         function editFeature(id) {

             resetModel();

             var featureData = fetchFeatureData(id);
             
             // Update the modal fields with existing data
             document.getElementById('title').value = featureData.title;

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
             document.getElementById('featureImage').value = '';
             const imagePreview = document.getElementById('imagePreview');
             imagePreview.src = '#';
             imagePreview.style.display = 'none';
         }
         
         function fetchFeatureData(id) {
             // Replace this with your actual logic to fetch existing data based on ID
             // For demonstration, return a sample object
             return {
                 title: id,
                 // Add other properties as needed
             };
         }

        
         function previewImage(event) {
             var input = event.target;
             var imagePreview = document.getElementById('imagePreview');

             // Ensure that the input contains files and the browser supports FileReader
             if (input.files && input.files[0]) {
                 var reader = new FileReader();

                 reader.onload = function (e) {
                     // Set the source of the image to the data URL
                     imagePreview.src = e.target.result;
                     // Display the image preview
                     imagePreview.style.display = 'block';
                 };

                 // Read the image file as a data URL
                 reader.readAsDataURL(input.files[0]);
             }
         }
         
         

     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="BreadcrumbPlaceholder" runat="server"></div>
            <!-- Card with header and footer -->
 <div class="card">
            <div class="card-header"><span class="add-dept-header-text fw-bold fs-5" style="color: #012970;">Features</span><span class="d-flex float-end"><button type="button" class="add-dept-btn btn btn-primary rounded-pill" data-bs-toggle="modal" data-bs-target="#verticalycentered" onclick="editFeature(null)">Add Feature</button></span></div>
            <div class="card-body py-0">
                <div class="table-responsive overflow-auto">
            <table class="table table-bordered mt-3">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Title</th>
                    <th scope="col">Description</th>
                    <th scope="col">Image</th>
                    <th scope="col">Edit</th>
                    <th scope="col">Delete</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="departments-table">
                    <th scope="row">1</th>
                    <td><p>Features title</p></td>
                    <td ><p> features description </p></td>
                       <td class="text-center"> <img src="assets/img/slides-1.jpg" width="100" height="60" class="img-fluid"/> </td>
                      <%--<td><a  href="?all-departments"><i class="bi bi-pencil-square text-success"></i> </a></td>--%>
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
                <h4 class="modal-title mx-auto fw-bold" style="width: 50%; color: #012970;">Features</h4>
            </div>

            <div class="modal-body">
                
                    <div class="form-group mb-3">
                        <div class="row">
                            <label for="post_title" class="col-sm-12 col-lg-3 col-form-label"><b>Title</b></label>
                            <div class="col-sm-12 col-lg-9">
                                <%--<input type="text"  placeholder="Title" class="form-control" id="title" name="title" runat="server"  autofocus onblur="handleChange(event)">--%>
                                <asp:TextBox ID="Feature_title" class="form-control" runat="server" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="TitleField_Validator" runat="server" ErrorMessage="Please add  title to feature" ControlToValidate="Feature_title" ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        
                       
                    </div>
                    <div class="form-group mb-3">
                        <div class="row">
                            <label for="post_title" class="col-12 col-sm-12 col-lg-3 col-form-label"><b>Description</b></label>
                            <div class="col-12 col-sm-12 col-lg-9">
                                <asp:TextBox placeholder="Description" class="form-control" id="feature_description" runat="server" name="description" required autofocus TextMode="MultiLine"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please add some description" ControlToValidate="feature_description" ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator>
                            </div>
                           
                        </div>
                    </div>
                  <div class="form-group mb-3">
                    <div class="row">
                        <label for="post_title" class="col-12 col-sm-12 col-lg-3 col-form-label"><b>Choose Image</b></label>
                        <div class="col-12 col-sm-12 col-lg-9">
                            <asp:FileUpload ID="featureImage" runat="server" CssClass="form-control" accept="image/*" onchange="previewImage(event)" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="featureImage" ErrorMessage="Please select an image file." ForeColor="Red" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="featureImage" ErrorMessage="Only image files are allowed." ValidationExpression=".*\.(jpg|jpeg|png|gif)$" ForeColor="Red" Display="Dynamic"/>

                             <%--<input type="file" class="form-control" id="featureImage" name="featureImage" accept="image/*" runat="server" onchange="previewImage(event)" />--%>
                            <%--<asp:RequiredFieldValidator ID="rfvFeatureImage" runat="server" ControlToValidate="featureImage" ErrorMessage="Please select an image file." ForeColor="Red" Display="Dynamic" />--%>
                             <%--<asp:RegularExpressionValidator ID="revFeatureImage" runat="server" ControlToValidate="featureImage" ErrorMessage="Only image files are allowed." ValidationExpression=".*\.(jpg|jpeg|png|gif)$" ForeColor="Red" Display="Dynamic"/>--%>
                            <%--<input type="file" class="form-control" id="featureImage" name="featureImage" accept="image/*" runat="server" required autofocus onchange="previewImage(event)">--%>
                        </div>
                    </div>
                </div>
                    
                <div class="form-group mb-3" id="feature-image">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-lg-3 col-form-label"></div>
                        <div class="col-12 col-sm-12 col-lg-9">
                            <img id="imagePreview" src="#" alt="Image Preview" width="200" height="100" style="display: none;">
                        </div>
                    </div>
                </div>

               

                
            </div>
            <div class="modal-footer mb-0">
                <button type="button" class="btn btn-danger btn-small" data-bs-dismiss="modal">Close</button>          
                <asp:Button runat="server" type="button" class="btn btn-primary btn-small" id="saveButton"  Text="Save" OnClick="saveButton_Click"></asp:Button>
                <button type="button" class="btn btn-success btn-small" id="updateButton" style="display:none;" onclick="updateFeature()">Update</button>
            </div>
        </div>
    </div>
</div>

   

    
</asp:Content>
