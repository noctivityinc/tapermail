class DownloadsController < InheritedResources::Base

  def show
    token = params[:token]
    download = Download.find_by_token(token)

    if download
      if cookies[:download] == token || download.number_remaining > 0
        download.decrement!(:number_remaining) if download.number_remaining > 0 && cookies[:download] != token 
        download.update_attributes(last_download_at: Time.now)
        cookies[:download] = { value: token, expires: 1.month.from_now }
      else
        redirect_to root_url, flash: {error: 'Sorry, that download link has expired'}
      end
    else
      redirect_to root_url, flash: {error: 'Sorry, that download link is not valid'}
    end
  end

end
