class ArticlesController < ApplicationController
        def index
          @account = Account.find_by(id: session[:account_id])
          @articles = @account.articles.all
        end
        def new
          @account = Account.find_by(id: session[:account_id])
          @article = @account.articles.new
        end
        def edit
          @account = Account.find_by(id: session[:account_id])
          @article = @account.articles.find(params[:id])
        end  
        
        def create
          @account = Account.find_by(id: session[:account_id])
          @article = @account.articles.new(article_params)
          if @article.save
          redirect_to account_article_path(@account, @article)
          else
            render 'new'
          end
        end   
        def update
          @account = Account.find_by(id: session[:account_id])
          @article = @account.articles.find(params[:id])   

          if @article.update(article_params)
            redirect_to account_article_path
           else 
            render 'edit'      
           end 
        end
        def show
          @account = Account.find_by(id: session[:account_id])
          @article = @account.articles.find(params[:id])
        end
        def destroy
          @account = Account.find_by(id: session[:account_id])
                    @article = @account.articles.find(params[:id])
          @article.destroy
          redirect_to account_articles_path
        end
        
        
        private
        def article_params
          params.require(:article).permit(:title,:text)
        end
        
         

end
