Return-Path: <linux-i2c+bounces-6193-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F58A96C014
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 16:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 735FB1C24F6D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663F61E0B9C;
	Wed,  4 Sep 2024 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqUGIEeT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534601E1314;
	Wed,  4 Sep 2024 14:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725459478; cv=none; b=S17k0fc4vQLrliu0IaK2XIaMKejM2/QmUB6oOnDpCWyywh4BpH2CwNWLlHh4XSD/crL1TGlU07T8eAbsRi76P6wcN+sC4X3UidoX3omzqdC2vD7BtsDrm/rLvtTDc1zbyBgQfiYYs4SmgYaTzLG+yiJCWD0ecFLV3i6ZfMqayCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725459478; c=relaxed/simple;
	bh=J/8YioB2/3mAp3pQ3UcghFPKXV+gh7LzADv/1iTmgZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jmuMT6BZLJBXtb+Yw97x6KBRlls5CH5C3sf9KDAM+JMs+m/iaek0WYJOoT/GvuVq8wrfSieT8ngTFIhSMXPLrepeeXZW8PB45mvoD/gNV05C917hhtgV/T0cyaY+mpsGtU12+t6BBHiQaW97XmdWDZvEAwNXIXWTqQOEITtbHgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqUGIEeT; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7143165f23fso5284049b3a.1;
        Wed, 04 Sep 2024 07:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725459474; x=1726064274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kIMuklvD8MNTKO3tSiXELL8Zr3YK8FdHsyTMRJ2iD9w=;
        b=NqUGIEeTLZcMfTRTnA5hDhGTAslQCWa+Kgf5ke9EtwfnKPp01vdMZQ7Ac/V4atqZke
         hFmeLdifusgJiOOzTG1HTT6/Hd49SykrAIiehMjcNwrVCUg4b3RPcVMVOli92OKGmc86
         B+/3J3iXlkdS7ezLF5oWbD/9Q0XXBDS6PsB0PKbdUPx7m2KrNFS1czok6l+a/2NJNNPJ
         3Ve/NKSK5+Wi+DhtTkzHau3u3O2F8c8moXSEKoIqK8hzjkgWtSpGSl7LDfz3E2Y+vnRS
         oeJdpDckpAOxgAsjSYeyte+U6p6YSXjhiUZH1VZVK383PrwoVxqqlffeZHwYOmDtgNIC
         pNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725459474; x=1726064274;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIMuklvD8MNTKO3tSiXELL8Zr3YK8FdHsyTMRJ2iD9w=;
        b=msa63bE+wJgTOhquxLEn7VVs0VhRuIsmvwlH4w+iU7+dyeBxixwTt9Xo9W3pj6/jqe
         Sm6ydZN7CkceLLFh6SaUoPjLy1aKTMNhOCnnVoQZQS/JRBHcxeJ/HUnIt/HitQnTi5mG
         pAQWN86PS5YjzHcn2GGy7HAx54wQ35TOJZlMNBVsP9xVtKEQJxQsX1fEZkxdBc3YEtbS
         GYn2jWfJGexk0YUjt4oZ1efin0/sIdbwXa+77Vcz2LK5zmkJFpldZHEU7u4BbwqPpCdF
         8RRwJZsi/j1bZToQ6b0RQ3epsDaXYf2p7GF3QDCiLC3DbO+JMiWkxhakPTeJYghZu4lU
         sA9A==
X-Forwarded-Encrypted: i=1; AJvYcCU3i6T2INCdaGGA2+NDyga35zHLyr8rsoL7AQ7QSlZngbV6E6KjyzYJIGlvEoysHpHGoSrynmSrIXw+Xg==@vger.kernel.org, AJvYcCWH4VwEoFR1mRhbNb3QM16D1AEKI/0YP2n/O6YLhOISgoyA014dfelpvgRjWC+LU0eH/Zf26HG9wyn0@vger.kernel.org
X-Gm-Message-State: AOJu0YwNQ5Td7BnJM11t3xXm61/gCs/K5djaImNpaXGtA3quMxEyXa2b
	IGfQJDHUw2EWG+SRT0beymXFSazzIfP1hg22PkCZ9DSzPRlWbjCF
X-Google-Smtp-Source: AGHT+IHL9QvB+ygSNvhK0kC6A+7cC7adVGXMbGLJtvCHaZNgtqCH0UbZmcoFxjgZfe8X2SwZholtTg==
X-Received: by 2002:a05:6a21:1805:b0:1c2:94ad:1c67 with SMTP id adf61e73a8af0-1ced04bef17mr14524758637.30.1725459474455;
        Wed, 04 Sep 2024 07:17:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7177859894csm1661311b3a.153.2024.09.04.07.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 07:17:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ce8b5a3c-74fd-421c-8b2c-6670828378da@roeck-us.net>
Date: Wed, 4 Sep 2024 07:17:52 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 17/19] hwmon: (nzxt-kraken2) Use
 devm_hid_hw_start_and_open in kraken2_probe()
To: Li Zetao <lizetao1@huawei.com>, jikos@kernel.org, bentiss@kernel.org,
 michael.zaidman@gmail.com, gupt21@gmail.com, djogorchock@gmail.com,
 rrameshbabu@nvidia.com, bonbons@linux-vserver.org,
 roderick.colenbrander@sony.com, david@readahead.eu, savicaleksa83@gmail.com,
 me@jackdoan.com, jdelvare@suse.com, mail@mariuszachmann.de,
 wilken.gottwalt@posteo.net, jonas@protocubo.io, mezin.alexander@gmail.com
Cc: linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20240904123607.3407364-1-lizetao1@huawei.com>
 <20240904123607.3407364-18-lizetao1@huawei.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240904123607.3407364-18-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/24 05:36, Li Zetao wrote:
> Currently, the nzxt-kraken2 module needs to maintain hid resources
> by itself. Consider using devm_hid_hw_start_and_open helper to ensure
> that hid resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the fail_and_close and fail_and_stop
> lables, and directly return the error code when an error occurs.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>   drivers/hwmon/nzxt-kraken2.c | 23 +++--------------------
>   1 file changed, 3 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/hwmon/nzxt-kraken2.c b/drivers/hwmon/nzxt-kraken2.c
> index 7caf387eb144..aaaf857b42ed 100644
> --- a/drivers/hwmon/nzxt-kraken2.c
> +++ b/drivers/hwmon/nzxt-kraken2.c
> @@ -158,17 +158,9 @@ static int kraken2_probe(struct hid_device *hdev,
>   	/*
>   	 * Enable hidraw so existing user-space tools can continue to work.
>   	 */
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
>   	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "kraken2",
>   							  priv, &kraken2_chip_info,
> @@ -176,16 +168,10 @@ static int kraken2_probe(struct hid_device *hdev,
>   	if (IS_ERR(priv->hwmon_dev)) {
>   		ret = PTR_ERR(priv->hwmon_dev);
>   		hid_err(hdev, "hwmon registration failed with %d\n", ret);
> -		goto fail_and_close;
> +		return ret;
>   	}
>   
>   	return 0;

	struct device *hwmon_dev;	// also drop from struct kraken2_priv_data
	...
	hwmon_dev = devm_hwmon_device_register_with_info(...);
	return PTR_ERR_OR_ZERO(hwmon_dev);

and drop the remove function.

Thanks,
Guenter

> -
> -fail_and_close:
> -	hid_hw_close(hdev);
> -fail_and_stop:
> -	hid_hw_stop(hdev);
> -	return ret;
>   }
>   
>   static void kraken2_remove(struct hid_device *hdev)
> @@ -193,9 +179,6 @@ static void kraken2_remove(struct hid_device *hdev)
>   	struct kraken2_priv_data *priv = hid_get_drvdata(hdev);
>   
>   	hwmon_device_unregister(priv->hwmon_dev);
> -
> -	hid_hw_close(hdev);
> -	hid_hw_stop(hdev);
>   }
>   
>   static const struct hid_device_id kraken2_table[] = {


