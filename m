Return-Path: <linux-i2c+bounces-6192-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B9196BFD5
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 16:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32C0D1C24BE9
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BFD1DB94D;
	Wed,  4 Sep 2024 14:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqJPW66I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580651DA614;
	Wed,  4 Sep 2024 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725459295; cv=none; b=HsNAApdQJQNX6Fs/qPqH2EAxg4ZDAbxG0vm4CNrSmBk8sKnmijMcOVSdyVExi6zu/fHnH0eVDhBPBioGxPMZT0vjbLzquVGZiXmRSk97Q5+ABYEwY70UbNxhEdT6gXsDzc8K4jBrbBYt1vTSU4dEwgaxyMzzaqhlVoaoTwocODc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725459295; c=relaxed/simple;
	bh=2Ss0V4B3gqh3Djf2sq8g60nY0lGcMeN+IdkPOnUIhJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNGGobsYtF20J9wO9vn0hCSnRx5QsmYDIE4jvTqFCkkZQsUFSleOI9vQUNv/k5UUKA5xu2tKYx3UAw+t4wpHxaAXG20gBbGrV6ACYWBsz2pW5KdV4/0LrsWfaae7tVxlFwGaeV2eu35YW0h9pJNHwEDbEFp1sNU4MxDPvP41JzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqJPW66I; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-205659dc63aso29408575ad.1;
        Wed, 04 Sep 2024 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725459292; x=1726064092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=plTGgq85TqC+My2Us7LwZDVrWHrQelSPxxPPRZE6+jM=;
        b=iqJPW66IDFuPJor0J7bsAT0Nk8Uuns55k4/A+PiU8fhlV4pyZNANSz0K5Wh5l9KwnC
         qoZPtPEgsuEhpeOv6dRLntdRMlSgszFZiWz917tVkHtMnRcwBBwSgdMlXJ1QnRYgPMfE
         MG6tB+T2I6jcFMTnGCTrUi+PDqivHOdQPPQcCqxAFDgnSK2IYqQszJtZXiCbIdaAU+q2
         I6tNQHUUP6GKksV9wjtuxW7C9sRnTvb8xcMp94k1D+AzqT6NUpl+XrYOOKlxioAALWjZ
         LwfW31In44jxIVYFm+5JzjR1uIuLejzT6uzJ8CQZdUwjWcwlSX0DYVV0DhBIcyFm4vbd
         nwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725459292; x=1726064092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plTGgq85TqC+My2Us7LwZDVrWHrQelSPxxPPRZE6+jM=;
        b=W0AWWBkhm6DcUCkyHZ072u9F1z7l3aGlTXHdpI2b0P85Lh6fC/MtYAogi34MPU2GfU
         3yh7Pkr3jMqR6GgDdCAZ+ukPyNP9kiYcnMrbMZESX1hCR1UMwfCE8WH/K+gJSSFjXP1v
         FOkiDQVkmK6PeP2s0+Z77ksTKrWek8wW62IWSV3VjoulbOw3MFDFva3o8Y2fQLrYuDMT
         aPjWSYg0LMr+zDh3QiED8IV0XPw/LrXuRnYSEY2Xj9tIMdsVqvVZdzhyFC0v9J5Y/bGJ
         Y46uht6W85ResYq9yx32PyIUYPOfWLxKKEqUsa4NqeoERitecdqyds1q3CKt+fYE0Wkt
         O8rw==
X-Forwarded-Encrypted: i=1; AJvYcCWDb+3uq4OauIBMyY+q8h7Oxvxz/cFpt72tTvpsVKk+s+dn7YlvioSUX/bPdpbg31eVmSruJm637S3xHw==@vger.kernel.org, AJvYcCWW2GvDSqqpgPoFYCV47YEt625FpzPkQSeiRRde6/32tQgwPPGiMIx+o71jklDqrIaG+FV8BRNjm2TG@vger.kernel.org
X-Gm-Message-State: AOJu0YzgQrFNeyasq3hPAnyukKCmgfnq6WqVPUFP2mymZ7ZId3VKLKU8
	gCr+JtIQZTkuK4m88a/aDQJVr5GlEjez8zMIZBdphOJpTAO5CaH0
X-Google-Smtp-Source: AGHT+IH9dkeJYt0ZES8dcaGSQEh/EcAPlzczePOsOYZeyBvH8XsuyXVoiyeTYzpUAgz5nFLriPtbEA==
X-Received: by 2002:a17:902:da8c:b0:206:9818:5439 with SMTP id d9443c01a7336-206981858c4mr84057205ad.19.1725459292464;
        Wed, 04 Sep 2024 07:14:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae90f076sm14189375ad.7.2024.09.04.07.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 07:14:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <eb7ffcbb-1e6c-448b-a09f-e10fd187a1ef@roeck-us.net>
Date: Wed, 4 Sep 2024 07:14:49 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 19/19] hwmon: (nzxt-smart2) Use
 devm_hid_hw_start_and_open in nzxt_smart2_hid_probe()
To: Li Zetao <lizetao1@huawei.com>, jikos@kernel.org, bentiss@kernel.org,
 michael.zaidman@gmail.com, gupt21@gmail.com, djogorchock@gmail.com,
 rrameshbabu@nvidia.com, bonbons@linux-vserver.org,
 roderick.colenbrander@sony.com, david@readahead.eu, savicaleksa83@gmail.com,
 me@jackdoan.com, jdelvare@suse.com, mail@mariuszachmann.de,
 wilken.gottwalt@posteo.net, jonas@protocubo.io, mezin.alexander@gmail.com
Cc: linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20240904123607.3407364-1-lizetao1@huawei.com>
 <20240904123607.3407364-20-lizetao1@huawei.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240904123607.3407364-20-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/24 05:36, Li Zetao wrote:
> Currently, the nzxt-smart2 module needs to maintain hid resources
> by itself. Consider using devm_hid_hw_start_and_open helper to ensure

For all patches:

s/Consider using/Use/

> that hid resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the out_hw_close and out_hw_stop
> lables, and directly return the error code when an error occurs.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>   drivers/hwmon/nzxt-smart2.c | 22 +++-------------------
>   1 file changed, 3 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
> index df6fa72a6b59..b5721a42c0d3 100644
> --- a/drivers/hwmon/nzxt-smart2.c
> +++ b/drivers/hwmon/nzxt-smart2.c
> @@ -750,14 +750,10 @@ static int nzxt_smart2_hid_probe(struct hid_device *hdev,
>   	if (ret)
>   		return ret;
>   
> -	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> +	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
>   	if (ret)
>   		return ret;
>   
> -	ret = hid_hw_open(hdev);
> -	if (ret)
> -		goto out_hw_stop;
> -
>   	hid_device_io_start(hdev);
>   
>   	init_device(drvdata, UPDATE_INTERVAL_DEFAULT_MS);
> @@ -765,19 +761,10 @@ static int nzxt_smart2_hid_probe(struct hid_device *hdev,
>   	drvdata->hwmon =
>   		hwmon_device_register_with_info(&hdev->dev, "nzxtsmart2", drvdata,
>   						&nzxt_smart2_chip_info, NULL);
> -	if (IS_ERR(drvdata->hwmon)) {
> -		ret = PTR_ERR(drvdata->hwmon);
> -		goto out_hw_close;
> -	}
> +	if (IS_ERR(drvdata->hwmon))
> +		return PTR_ERR(drvdata->hwmon);
>   
>   	return 0;

	return PTR_ERR_OR_ZERO(drvdata->hwmon);

Also, this can be optimized further.

	struct device *hwmon;	// and drop from struct drvdata
	...
	hwmon = devm_hwmon_device_register_with_info(&hdev->dev, "nzxtsmart2", drvdata,
						     &nzxt_smart2_chip_info, NULL);
	
	return PTR_ERR_OR_ZERO(hwmon);

and drop the remove function entirely.

Thanks,
Guenter

> -
> -out_hw_close:
> -	hid_hw_close(hdev);
> -
> -out_hw_stop:
> -	hid_hw_stop(hdev);
> -	return ret;
>   }
>   
>   static void nzxt_smart2_hid_remove(struct hid_device *hdev)
> @@ -785,9 +772,6 @@ static void nzxt_smart2_hid_remove(struct hid_device *hdev)
>   	struct drvdata *drvdata = hid_get_drvdata(hdev);
>   
>   	hwmon_device_unregister(drvdata->hwmon);
> -
> -	hid_hw_close(hdev);
> -	hid_hw_stop(hdev);
>   }
>   
>   static const struct hid_device_id nzxt_smart2_hid_id_table[] = {


