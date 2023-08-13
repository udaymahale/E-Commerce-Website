<%-- 
    Document   : common_models
    Created on : 11-May-2023, 4:11:02 pm
    Author     : ROHIT
--%>

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" data-toggle="tooltip" data-placement="top" title="MyCart"  id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Your cart</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="cart-body">
              
              
              
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary checkout-btn" onclick="goToCheckout()">Checkout</button>
      </div>
    </div>
  </div>
</div>

<div id="toast" >This is our custom Toast text</div>

<script>
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip()
                })
            </script>