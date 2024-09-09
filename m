Return-Path: <linux-i2c+bounces-6420-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F560971FBC
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 18:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24F9F1F23D8F
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 16:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A2316DEB5;
	Mon,  9 Sep 2024 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDSD/Zen"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA027494;
	Mon,  9 Sep 2024 16:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725901185; cv=none; b=YeNmG1oJkLCyB5df8jFe+hobtDGbXCNXfmz3iu2w2NYA0s8EHDd+d4EA6KqjHsuzH9rscnfGiSftXQtouCR5WFARGCwvSCLe5580tg+ug7ymziRh7R4vEdLgvwCvyi+yqAIGQV1j2jHBMM9uBI8xx+QIXTvtyg1EODfXmV/RALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725901185; c=relaxed/simple;
	bh=nM7CZsoGLCT4wY7ZY5/syJ4q+B86ugmoTH13rD0W73w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYBguViUvz+ImbObnqdinJozr6i9021VVX5NB0kbIM8kLniL4+gomMmliJkU6pJZAKRqyEkt9CYNXiVStYTESLlAkSZEUQ8aD9kyoKmrBsVQ2908LG37SNgaf0ROQvNR2z4PEvMvwYnhVxdAvG2w6upn4jtLslJ/7FLQOg748qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDSD/Zen; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-718e6299191so1071996b3a.2;
        Mon, 09 Sep 2024 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725901183; x=1726505983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFqprlvsJK6OpDDUYmQUtgn9arEevKXXsRN15oRqNCc=;
        b=nDSD/ZenOKdGbdvJFEPlXRt9yhHVbnexrQsRZcZQKujBowCMpba/aUimu/51OsELAb
         Pm4l1xlWA8C1VGjGk1C1rAjHGe2+4PJdNYheqy7yEg2zcYbReNlGPrjpGM64RS0ZqG/H
         HRX7tlqP94D7/7SWBsbkFQSzk6SYihDSVtLjk4iGzqrbPpyynU4Zl8J5HsxiyyLvF66x
         RA53fEB33aRj1fAHueLJkUvcIAvqfUL3aJwRrX7Fyqb+XHqSGTuj33fAAC/gZBMTqXqo
         kEdgTG7HIqKYIku/37KX4w5stiyqSjpSNsrSkMHFaX+i2Jfzima+EWvcSjTzvGxLMeX2
         i6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725901183; x=1726505983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFqprlvsJK6OpDDUYmQUtgn9arEevKXXsRN15oRqNCc=;
        b=AxXnjD9Uh/CJV4jaaR9Xu81iJkWBTS+9at+lRyogz3XkzvrbGoUD9d2gGU2nEaHzyP
         YIbS9v7/eAtC67DtCh0qGTG8ovrS/91OUYXxky5TC294PIaRaDLc8Tk+tOSSJ2BsTp6p
         t7n1C22xq/+RGIBhivyhA29a4MrLjgep7gdWtU7ufcdpLxW1Ztz1XjhmUqNk4ToyLX24
         wjSAds2cACog0xd/eTYupcojjnRCFp+K+eyJHYqemVhufWLIgwc1ebvi03IDlci1IJ4q
         Y/C0pEluM1Mrq4D53DJx5vSOKQcpGIrl2vqAnsP18EuMoQXvvi06ztnPq/L4bm48z3TG
         XaQg==
X-Forwarded-Encrypted: i=1; AJvYcCUGFx6jkB4+qjznmDfHQ8SzDekZvyMRdNCQvmZYXBKwo5WxAJNOjSZ1sSctn/glnci/bxXnuli3RIiR4yg=@vger.kernel.org, AJvYcCUv8SMYZdi9/i93tGWrsDhqAQDlhiHxzYovyJdrWm/lPhwrMj7T1QVMEvnsZ3wnJQxnlFEgce5ZqyGE@vger.kernel.org, AJvYcCVdtYKt3eUi156iMNEKHpZVt66liAfbLLPSXHfnOqrPg6EG6VC8KB3tww6lRbp6WpgsaJ9QtF/ukt1pXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXE4QEKF3V+UOeYAjQTgAodZL6Hm7hXHVz2OPkvrUSe6v8Bs/v
	f17/ULDZ2iqmGmAmNycHvjxiTXpsCKujZ1n5coJuk3VG0ocGPz4t
X-Google-Smtp-Source: AGHT+IE7sj8Fh7XZvhVSBJupzOV94fri8+rslBzm2JkYj/ea3m+3x17jiZB2R2QYbw8jP1Caf+9WNw==
X-Received: by 2002:a05:6a00:1a89:b0:714:157a:bfc7 with SMTP id d2e1a72fcca58-718d5e53d08mr11433290b3a.15.1725901183464;
        Mon, 09 Sep 2024 09:59:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e5968a09sm3742437b3a.117.2024.09.09.09.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 09:59:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 9 Sep 2024 09:59:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Li Zetao <lizetao1@huawei.com>
Cc: jikos@kernel.org, bentiss@kernel.org, michael.zaidman@gmail.com,
	gupt21@gmail.com, djogorchock@gmail.com,
	roderick.colenbrander@sony.com, savicaleksa83@gmail.com,
	me@jackdoan.com, jdelvare@suse.com, mail@mariuszachmann.de,
	wilken.gottwalt@posteo.net, jonas@protocubo.io,
	mezin.alexander@gmail.com, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next v2 10/15] hwmon: (corsair-cpro) Use
 devm_hid_hw_start_and_open in ccp_probe()
Message-ID: <79fd01a8-da8e-4fc0-bd33-c2e70e902b75@roeck-us.net>
References: <20240909012313.500341-1-lizetao1@huawei.com>
 <20240909012313.500341-11-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909012313.500341-11-lizetao1@huawei.com>

On Mon, Sep 09, 2024 at 09:23:08AM +0800, Li Zetao wrote:
> Currently, the corsair-cpro module needs to maintain hid resources
> by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
> resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the out_hw_close and hid_hw_stop
> lables, and directly return the error code when an error occurs.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v1 -> v2: Adjust commit information
> v1:
> https://lore.kernel.org/all/20240904123607.3407364-15-lizetao1@huawei.com/
> 
>  drivers/hwmon/corsair-cpro.c | 24 +++++-------------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
> index e1a7f7aa7f80..7bba30840f32 100644
> --- a/drivers/hwmon/corsair-cpro.c
> +++ b/drivers/hwmon/corsair-cpro.c
> @@ -601,14 +601,10 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	if (ret)
>  		return ret;
>  
> -	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> +	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
>  	if (ret)
>  		return ret;
>  
> -	ret = hid_hw_open(hdev);
> -	if (ret)
> -		goto out_hw_stop;
> -
>  	ccp->hdev = hdev;
>  	hid_set_drvdata(hdev, ccp);
>  
> @@ -621,28 +617,20 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	/* temp and fan connection status only updates when device is powered on */
>  	ret = get_temp_cnct(ccp);
>  	if (ret)
> -		goto out_hw_close;
> +		return ret;
>  
>  	ret = get_fan_cnct(ccp);
>  	if (ret)
> -		goto out_hw_close;
> +		return ret;
>  
>  	ccp_debugfs_init(ccp);
>  
>  	ccp->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "corsaircpro",
>  							 ccp, &ccp_chip_info, NULL);
> -	if (IS_ERR(ccp->hwmon_dev)) {
> -		ret = PTR_ERR(ccp->hwmon_dev);
> -		goto out_hw_close;
> -	}
> +	if (IS_ERR(ccp->hwmon_dev))
> +		return PTR_ERR(ccp->hwmon_dev);
>  
>  	return 0;
> -
> -out_hw_close:
> -	hid_hw_close(hdev);
> -out_hw_stop:
> -	hid_hw_stop(hdev);
> -	return ret;
>  }
>  
>  static void ccp_remove(struct hid_device *hdev)
> @@ -651,8 +639,6 @@ static void ccp_remove(struct hid_device *hdev)
>  
>  	debugfs_remove_recursive(ccp->debugfs);
>  	hwmon_device_unregister(ccp->hwmon_dev);
> -	hid_hw_close(hdev);
> -	hid_hw_stop(hdev);
>  }
>  
>  static const struct hid_device_id ccp_devices[] = {
> -- 
> 2.34.1
> 
> 

