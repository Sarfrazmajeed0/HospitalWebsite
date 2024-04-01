<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="HospitalWebsite.Admin.Feedback" %>
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
             document.getElementById('imageInput').value = '';
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

        

         
         

     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="BreadcrumbPlaceholder" runat="server"></div>
            <!-- Card with header and footer -->
 <div class="card">
            <div class="card-header"><span class="add-dept-header-text fw-bold fs-5" style="color: #012970;">Feedback</span></div>
            <div class="card-body py-0">
                <div class="table-responsive overflow-auto">
            <table class="table table-bordered mt-3">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Address</th>
                      <th scope="col">Emial</th> 
                    <th scope="col">Mobile No.</th>
                     
                    <th scope="col">Message</th>                     
                    <th scope="col">Updated At</th>
                   
                  </tr>
                </thead>
                <tbody>
                  <tr class="departments-table">
                    <th scope="row">1</th>
                    <td><p>Name</p></td>
                    <td ><p> Address </p></td>
                      <td ><p> Emial </p></td>
                      <td ><p> Mobile No </p></td>
                      <td ><p> Message </p></td>
                      <td ><p> Updated At </p></td>
                     
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


   

    
</asp:Content>