Return-Path: <linux-i2c+bounces-6194-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 755D096C031
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 16:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 488E0B29100
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C351E0096;
	Wed,  4 Sep 2024 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOwO1TxZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5E61D014A;
	Wed,  4 Sep 2024 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725459630; cv=none; b=n30LvtNX2oGiWQoJ3IvyTLYvLiSjWBSPEsBYdM5L8zM13M+MaVyJ6DKi2I0TyIItdaRIrc6ukVISFsSUriOdky+chMLdB6AdvFZkXqpg5vUtvaWwGmy/Ha4UU8OJBxYOf29eovm+dKbxzsoyO/xHIhbuA0DKaQkUyCsFrgUNTaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725459630; c=relaxed/simple;
	bh=NlJHUT+M3zDIrYDJvouIBEOXpW1aLIm7Vq49+NEFJJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EOgrn3uevlc1jpZLjiaao1WHIlyoMIF2rpRutd6tPmea0J3e11FgYScBfujX5WldEyAIH2KpmwPSW2BaiYkGSSqxKDCxfTZrKgr/XHrnbQgqcpabZ3JxIvnxhPs0mkF80FRhK/Uqb2O//3LvGl9w2YUPR4ToubMSLcmXE3Ksmm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOwO1TxZ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7d4f0181be2so1340391a12.0;
        Wed, 04 Sep 2024 07:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725459628; x=1726064428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8mh+qFo6PV3VOZOTOmXjn4bsf1iOHyrGELUejlwzbKs=;
        b=YOwO1TxZci4+CUe+5KUlyWCpT7nTByXfZIwcXMwhWY9gCwBJErhOiikFBqwdYvexIA
         cLplJxCfXRxadA9qNlNo6uuXZIu6k66/SGJEk8Q+DyFZzyxlFfJbzYjnX73EdklkeYh2
         2WKGW4BdqOlo/JQVzl3oEAAWsw/WVPnq+qankpOQ53/JHknGrL/xXyijX93E8dbwQVH9
         9dMnaNF6hPb5CjYaZN6GZPiSno+DyOvqRK9mT66+6fRwZbmrCpivVnejfK8jYY+MhXMF
         EYaWmRSfiwHvsHUMAUj8v4mx4wCp1mNHSfA7gG3Qht4PNlXpX6zqOezn3wJLaj1e4MbD
         MIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725459628; x=1726064428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mh+qFo6PV3VOZOTOmXjn4bsf1iOHyrGELUejlwzbKs=;
        b=NyHAHGcOk0RATgcc5yauDu84rKp1ZfyE/vFOeKg10s8TVujlfvgxbhwmtBdk1eS8lt
         tKaVGSbZi0itUaO4VaweVAbnYzBkcJyKTAQ7aSMan56xQgSO/0XRBE2eXGZkvL7bHaHr
         6jef206rZz70pI82nTVgXgXO0ZQRTkvvfZwSwFDBiGcCHvKE1RH3XVFol5gQftgh9Dph
         4I1K73605FtYUw8BEmSPBT0pcVjOtDpJ7XVgyXmAy0dJufO2ol7DYEwDFY2mDg77QO7Y
         NFb9O0L+KbU/KdOq8kGo9XgflxYNPsPgHqhHJiCOYmUxxyufeUd3BWB9Y/AlE6DpFjqI
         tSRg==
X-Forwarded-Encrypted: i=1; AJvYcCWT3btZZafIPlRyfMW/FZWTWTV3N3upfPiWXQF+IG2Iml+nEEalMWtccLXXXkZ+AzCxnb5qMarkt7d4fg==@vger.kernel.org, AJvYcCXz0hoVCiHDjYt3ubjU/eUWN3rMbOQRiacL+zzWO+WzNFs6/tfbv14W9DxZ3t/QIHOWNoPi1shVjkJr@vger.kernel.org
X-Gm-Message-State: AOJu0YxLESV6BbcFiRAhyAO8g535zLo8x1v5854okFvsJ52Jc2I0EVUD
	HLPtlkqsYrOESYMzvr6oywK/d/OD9E+aggS6xHE05vD0b8FkY2O3
X-Google-Smtp-Source: AGHT+IH5n/ZZh2DoU+a7VJbyUt1vO8aYjfyw/EZECgwJmqDiMZLGMi8FDkp4msPbNpNfBTL/mKLYkQ==
X-Received: by 2002:a17:90a:4b85:b0:2cf:7388:ad9e with SMTP id 98e67ed59e1d1-2d85616eccamr23756138a91.2.1725459627798;
        Wed, 04 Sep 2024 07:20:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8c5d48a8esm7287873a91.35.2024.09.04.07.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 07:20:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9b0b39c6-21b7-445e-9496-875a7fe5cf6a@roeck-us.net>
Date: Wed, 4 Sep 2024 07:20:25 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 13/19] hwmon: Use devm_hid_hw_start_and_open in
 rog_ryujin_probe()
To: Li Zetao <lizetao1@huawei.com>, jikos@kernel.org, bentiss@kernel.org,
 michael.zaidman@gmail.com, gupt21@gmail.com, djogorchock@gmail.com,
 rrameshbabu@nvidia.com, bonbons@linux-vserver.org,
 roderick.colenbrander@sony.com, david@readahead.eu, savicaleksa83@gmail.com,
 me@jackdoan.com, jdelvare@suse.com, mail@mariuszachmann.de,
 wilken.gottwalt@posteo.net, jonas@protocubo.io, mezin.alexander@gmail.com
Cc: linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20240904123607.3407364-1-lizetao1@huawei.com>
 <20240904123607.3407364-14-lizetao1@huawei.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240904123607.3407364-14-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/24 05:36, Li Zetao wrote:
> Currently, the rog_ryujin module needs to maintain hid resources
> by itself. Consider using devm_hid_hw_start_and_open helper to ensure
> that hid resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the fail_and_close and fail_and_stop
> lables, and directly return the error code when an error occurs.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>   drivers/hwmon/asus_rog_ryujin.c | 29 +++++------------------------
>   1 file changed, 5 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
> index f8b20346a995..da03ba3b4e0f 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c
> @@ -520,23 +520,13 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
>   	}
>   
>   	/* Enable hidraw so existing user-space tools can continue to work */
> -	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> -	if (ret) {
> -		hid_err(hdev, "hid hw start failed with %d\n", ret);
> +	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
> +	if (ret)
>   		return ret;
> -	}
> -
> -	ret = hid_hw_open(hdev);
> -	if (ret) {
> -		hid_err(hdev, "hid hw open failed with %d\n", ret);
> -		goto fail_and_stop;
> -	}
>   
>   	priv->buffer = devm_kzalloc(&hdev->dev, MAX_REPORT_LENGTH, GFP_KERNEL);
> -	if (!priv->buffer) {
> -		ret = -ENOMEM;
> -		goto fail_and_close;
> -	}
> +	if (!priv->buffer)
> +		return -ENOMEM;
>   
>   	mutex_init(&priv->status_report_request_mutex);
>   	mutex_init(&priv->buffer_lock);
> @@ -553,16 +543,10 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
>   	if (IS_ERR(priv->hwmon_dev)) {
>   		ret = PTR_ERR(priv->hwmon_dev);
>   		hid_err(hdev, "hwmon registration failed with %d\n", ret);
> -		goto fail_and_close;
> +		return ret;
>   	}

	struct device *hwmon_dev;

         hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "rog_ryujin",
                                                     priv, &rog_ryujin_chip_info, NULL);
	return PTR_ERR_OR_ZERO(hwmon_dev);

and drop the remove function.

Thanks,
Guenter

>   
>   	return 0;
> -
> -fail_and_close:
> -	hid_hw_close(hdev);
> -fail_and_stop:
> -	hid_hw_stop(hdev);
> -	return ret;
>   }
>   
>   static void rog_ryujin_remove(struct hid_device *hdev)
> @@ -570,9 +554,6 @@ static void rog_ryujin_remove(struct hid_device *hdev)
>   	struct rog_ryujin_data *priv = hid_get_drvdata(hdev);
>   
>   	hwmon_device_unregister(priv->hwmon_dev);
> -
> -	hid_hw_close(hdev);
> -	hid_hw_stop(hdev);
>   }
>   
>   static const struct hid_device_id rog_ryujin_table[] = {


