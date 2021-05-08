Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF4B93773DC
	for <lists+linux-i2c@lfdr.de>; Sat,  8 May 2021 21:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbhEHTku (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 May 2021 15:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhEHTkt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 May 2021 15:40:49 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1683C061574;
        Sat,  8 May 2021 12:39:47 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id o6-20020a05600c4fc6b029015ec06d5269so263590wmq.0;
        Sat, 08 May 2021 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/aT2AFj/W6pt+Y3HFn5Q+rY7c1xeC8Z2fMPQBVN+RjI=;
        b=S3ej4r8Wmp0240zqQhmNsHAcsH5gByygrKd1YQd6wNG9zlPJaYkHCWWWNcfHQkIWY5
         2KwNDcmYIfKy3qAgjLmeZw/YlI6t1E5OjY06XmhKiHbwuTjS02SOh0WUcQ8cYHCZg05P
         +a7LkBZZJDGOyUHuY0Rw8002AK6qc/V6I7QmGzbxnAuZjJxiRaAlONwu7/eRTmSZcxHk
         hGI1i0MFgDrET1zhnEn/ztqetpdbowmKh1SWYo9UwZeupiH445Mycnyq4w5l/Z8omqs5
         vb9iMnGOYQkgjZ52ma3/SYCeKMtMh2tnetJCKBxSJwBqQO2eqP4lzj1s4yRvA4MGulev
         YeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/aT2AFj/W6pt+Y3HFn5Q+rY7c1xeC8Z2fMPQBVN+RjI=;
        b=J5RMs/6TfhJbwX5isQc+ZJjOH0Lg1lx5xU9M+INaoVDxAFNd+ODnJ1V06E8Ox/mgww
         2lXiYrqWfR2iFRHduOp79zA34TUu/a924nunkGz8ZEDj3CBBn317BBu+Iw0Jl+iBLpV2
         jfRMD9MXj0VwHj0nuUDDmIFakOPQPQT0gdOBUWQzRnZvvq5fj3CZ0hbjf+d4e5etqko1
         4ZrR/o9gMOg7FnI0wQ7Y4AQj3pVmUkYevTYGRV53/j6Zi7JD/SmHoxLiLWwBSEXJEz/X
         n/hFgPy5vX77i2WMH0hLTOR5/xw7ugf6qcAWSSleiVO8aKfG5ECQJk489fJ1l8HcoVtq
         8jhw==
X-Gm-Message-State: AOAM5311/zde8/KzH6ejgSx8v3lI6g3mn/BjZRV0kXmp4n/DOVI3rSje
        +rfdIYg7r9SDAeQTwHdtQsP7X0k/pk47dQ==
X-Google-Smtp-Source: ABdhPJwFwC43on281PSVJ9/z+oV3EVuqNO4OKfwmHJwMU2KxkyH+ddQmClfeBUPVbt5B0Z8GGcR2DQ==
X-Received: by 2002:a1c:b38b:: with SMTP id c133mr4649652wmf.8.1620502786282;
        Sat, 08 May 2021 12:39:46 -0700 (PDT)
Received: from michael-VirtualBox (cbl217-132-244-50.bb.netvision.net.il. [217.132.244.50])
        by smtp.gmail.com with ESMTPSA id d3sm1000822wrs.41.2021.05.08.12.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 12:39:45 -0700 (PDT)
Date:   Sat, 8 May 2021 22:39:43 +0300
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     trix@redhat.com
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, michael.zaidman@gmail.com
Subject: Re: [PATCH] HID: ft260: improve error handling of
 ft260_hid_feature_report_get()
Message-ID: <20210508193943.GA1581@michael-VirtualBox>
References: <20210507183757.68810-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507183757.68810-1-trix@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 07, 2021 at 11:37:57AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Static analysis reports this representative problem
> 
> hid-ft260.c:787:9: warning: 4th function call argument is an
>   uninitialized value
>         return scnprintf(buf, PAGE_SIZE, "%hi\n", *field);
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Uses of ft260_hid_feature_report_get() check if the return size matches
> the requested size.  But the function can also fail with at least -ENOMEM.
> Add the < 0 checks.

Hi Tom, thanks for catching and fixing it!

I applied the patch, built the driver, and run some tests on my HW setup -
no regression so far. But I think the fix can be improved even more, by
reducing the number of questions to one in the successful case where the
performance matters. Please see the proposal below inline.

> 
> In ft260_hid_feature_report_get(), do not do the memcpy to the caller's
> buffer if there is an error.
> 
> Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/hid/hid-ft260.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> index 7a9ba984a75a..628fa664a10b 100644
> --- a/drivers/hid/hid-ft260.c
> +++ b/drivers/hid/hid-ft260.c
> @@ -249,7 +249,8 @@ static int ft260_hid_feature_report_get(struct hid_device *hdev,
>  
>  	ret = hid_hw_raw_request(hdev, report_id, buf, len, HID_FEATURE_REPORT,
>  				 HID_REQ_GET_REPORT);
> -	memcpy(data, buf, len);
> +	if (ret == len)
> +		memcpy(data, buf, len);
>  	kfree(buf);
>  	return ret;
>  }
> @@ -295,12 +296,16 @@ static int ft260_xfer_status(struct ft260_device *dev)
>  	struct hid_device *hdev = dev->hdev;
>  	struct ft260_get_i2c_status_report report;
>  	int ret;
> +	int len = sizeof(report);
>  
>  	ret = ft260_hid_feature_report_get(hdev, FT260_I2C_STATUS,
> -					   (u8 *)&report, sizeof(report));
> -	if (ret < 0) {
> +					   (u8 *)&report, len);
> +	if (ret != len) {
>  		hid_err(hdev, "failed to retrieve status: %d\n", ret);
> -		return ret;
> +		if (ret >= 0)
> +			return -EIO;
> +		else
> +			return ret;
>  	}
>  
>  	dev->clock = le16_to_cpu(report.clock);
> @@ -728,6 +733,8 @@ static int ft260_get_system_config(struct hid_device *hdev,
>  		hid_err(hdev, "failed to retrieve system status\n");
>  		if (ret >= 0)
>  			return -EIO;
> +		else
> +			return ret;
>  	}
>  	return 0;
>  }
> @@ -782,6 +789,8 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>  	ret = ft260_hid_feature_report_get(hdev, id, cfg, len);
>  	if (ret != len && ret >= 0)
>  		return -EIO;
> +	else if (ret < 0)
> +		return  ret;

Please consider the below code to reduce the number of questions to one in the "likely" case
and two in the worst-case scenario.

	if (ret != len) {
	        if (ret >= 0)
                        return -EIO;
                else
                        return ret;
        }

>  
>  	return scnprintf(buf, PAGE_SIZE, "%hi\n", *field);
>  }
> @@ -794,6 +803,8 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>  	ret = ft260_hid_feature_report_get(hdev, id, cfg, len);
>  	if (ret != len && ret >= 0)
>  		return -EIO;
> +	else if (ret < 0)
> +		return ret;

The same.

>  
>  	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
>  }
> -- 
> 2.26.3
> 
