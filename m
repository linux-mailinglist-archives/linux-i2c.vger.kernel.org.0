Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73A80109E66
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2019 13:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727587AbfKZM5i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Nov 2019 07:57:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58740 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727209AbfKZM5i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Nov 2019 07:57:38 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE8DD554;
        Tue, 26 Nov 2019 13:57:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574773057;
        bh=J9SzQZZPDUF5VtY95t1tVID5XUuA7MYxXWRRT7k349g=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=eLeEpl5KayW23pUQb4nw2XYnussurEHLl2duq02gNZXpQfsbNhDJjIPTbbfKDHZ4l
         Xbjqw9kXSY2TQxJSvyNQj2rCMzk62Nq9LR0zvRGGpB8sBMW/hyOuXWxEpdaM7WGRtW
         brSEvVlObnrdkS12fInKUQr/dG52S+ti7l3seVuo=
Subject: Re: [PATCH v2] i2c: core: Use DEVICE_ATTR_*() helper macros
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191113152306.13968-1-geert+renesas@glider.be>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <1abe3b18-2914-c2a6-ce41-169953d3579b@ideasonboard.com>
Date:   Tue, 26 Nov 2019 12:57:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113152306.13968-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Geert,

On 13/11/2019 15:23, Geert Uytterhoeven wrote:
> Convert the i2c core sysfs attributes from DEVICE_ATTR() to
> DEVICE_ATTR_*(), to reduce boilerplate.
> This requires renaming some functions.

Seems a nice cleanup.


> Although no suitable macro exists for the delete_device attribute,
> rename i2c_sysfs_delete_device() to delete_device_store() for
> consistency.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
> v2:
>   - s/DEVICE_ATTR_RW/DEVICE_ATTR_*/ in summary and description,
>   - Add Reviewed-by.
> ---
>  drivers/i2c/i2c-core-base.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 6a5183cffdfc3e82..c87bf5bcab3f1349 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -449,15 +449,15 @@ static void i2c_client_dev_release(struct device *dev)
>  }
>  
>  static ssize_t
> -show_name(struct device *dev, struct device_attribute *attr, char *buf)
> +name_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	return sprintf(buf, "%s\n", dev->type == &i2c_client_type ?
>  		       to_i2c_client(dev)->name : to_i2c_adapter(dev)->name);
>  }
> -static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
> +static DEVICE_ATTR_RO(name);
>  
>  static ssize_t
> -show_modalias(struct device *dev, struct device_attribute *attr, char *buf)
> +modalias_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	int len;
> @@ -472,7 +472,7 @@ show_modalias(struct device *dev, struct device_attribute *attr, char *buf)
>  
>  	return sprintf(buf, "%s%s\n", I2C_MODULE_PREFIX, client->name);
>  }
> -static DEVICE_ATTR(modalias, S_IRUGO, show_modalias, NULL);
> +static DEVICE_ATTR_RO(modalias);
>  
>  static struct attribute *i2c_dev_attrs[] = {
>  	&dev_attr_name.attr,
> @@ -1039,8 +1039,8 @@ EXPORT_SYMBOL_GPL(i2c_adapter_depth);
>   * the user to provide incorrect parameters.
>   */
>  static ssize_t
> -i2c_sysfs_new_device(struct device *dev, struct device_attribute *attr,
> -		     const char *buf, size_t count)
> +new_device_store(struct device *dev, struct device_attribute *attr,
> +		 const char *buf, size_t count)
>  {
>  	struct i2c_adapter *adap = to_i2c_adapter(dev);
>  	struct i2c_board_info info;
> @@ -1095,7 +1095,7 @@ i2c_sysfs_new_device(struct device *dev, struct device_attribute *attr,
>  
>  	return count;
>  }
> -static DEVICE_ATTR(new_device, S_IWUSR, NULL, i2c_sysfs_new_device);
> +static DEVICE_ATTR_WO(new_device);
>  
>  /*
>   * And of course let the users delete the devices they instantiated, if
> @@ -1107,8 +1107,8 @@ static DEVICE_ATTR(new_device, S_IWUSR, NULL, i2c_sysfs_new_device);
>   * the user to delete the wrong device.
>   */
>  static ssize_t
> -i2c_sysfs_delete_device(struct device *dev, struct device_attribute *attr,
> -			const char *buf, size_t count)
> +delete_device_store(struct device *dev, struct device_attribute *attr,
> +		    const char *buf, size_t count)
>  {
>  	struct i2c_adapter *adap = to_i2c_adapter(dev);
>  	struct i2c_client *client, *next;
> @@ -1151,7 +1151,7 @@ i2c_sysfs_delete_device(struct device *dev, struct device_attribute *attr,
>  	return res;
>  }
>  static DEVICE_ATTR_IGNORE_LOCKDEP(delete_device, S_IWUSR, NULL,
> -				   i2c_sysfs_delete_device);
> +				  delete_device_store);
>  
>  static struct attribute *i2c_adapter_attrs[] = {
>  	&dev_attr_name.attr,
> 

