Return-Path: <linux-i2c+bounces-10614-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DD5A9AD2B
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 14:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94802179955
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 12:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE95622F748;
	Thu, 24 Apr 2025 12:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4l1O8KK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA12B20C024;
	Thu, 24 Apr 2025 12:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745497304; cv=none; b=bW4rU/trJLHU7/WfXRslEa392FDg5r0iz5DmiBTo5XxAEWYfqtEScWMYS5hSsAhDS5wgRmRcVs8cl9hWtiJNXLmr2bWntInkdXMvOcC8tbJsg+Z0gSouTUMX9pKHxCqS1Z04CPDiGxS6dlEDO8enhHbuvDP/0IJyHUNeT8m48po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745497304; c=relaxed/simple;
	bh=Nt9mEstTtnH9gON5qf3nD6dJQU9dAjxdCFBJqOt1meg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tkeHfAQBBha+oKX/KL9dsA7F02oyFnz6smobf18CwN8VgTMC0VCXO0m6//pULaY6DEjodygpkTz4QDRDmSl8lBSIffxeSOBRhdgJvNoCT6yqYKL2bRZLLCOTsT0XvF8aFHaPHe9NSdQa+idEvGKLgkYzTgwSTopo8w/AbJDksRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4l1O8KK; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22409077c06so13941935ad.1;
        Thu, 24 Apr 2025 05:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745497302; x=1746102102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FQTgpnqt+NARRg0RlGh8kn+T3KblvJcbQHCxUBKs500=;
        b=A4l1O8KKOkLyYL9ZOw9/mAQlDJVRH3IUEfoqaqMw4iQ+sVaWQCpte7Of1HvI6iwgrh
         hbqk19vSdAfJQyD2ME0EiMN9SS2NSgvP6W6Ia0U9mwhlZKxgUWvnJPOhvL+NEytSADo6
         FgoRMa0ShUYwr3T0KZIngN5Aaw2MsTfCz5QGnRImaAkH7y/HpDLZAuipTv2dZjvicIht
         Mt/bPmnHG7zgLAQmWv6DD6qEtqY6Db8G+rI0weXQ7JvYBZ8WJIWp58M0pNd83EKW5uGN
         IWq4hNHnI3+iBHnS/fOX9r/fdLABO/SM5SAqM7L8NFc83Y+XrAiYbqJ7m4UeeMGg2+tx
         y6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745497302; x=1746102102;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQTgpnqt+NARRg0RlGh8kn+T3KblvJcbQHCxUBKs500=;
        b=r6CGMGgNI75X0WuUm2QEkViRDvNImBGx8DszGNKlWWHH+8mrjtdrE0ngbJi/oi9evR
         i1mqBfy2xBDFTpueMROGbiICanOnjGx2SL0IsQU4rkQDJHY2NkWvincscWruH8qKMm8t
         o8+G7dbydFqG7qFRa0tQ7zH3hN9sr5HH1nfSN9DnILH451NToDTh1apaWktPmrMr/rON
         tfMvykHzrHuVac9+RtWkWfEolsagXKKoyNYIM+mlNEqeUmbUYkBoMkjvhYT3q41swRAz
         8yrUT7kyCKTEipjxCo60buGMXihIFXZRHuAGDCRV4razqmib1N4JOpnBMjKUiiuYLwmZ
         8Kkw==
X-Forwarded-Encrypted: i=1; AJvYcCWLv7W5TCK6CE7+CP9Gp1Ef2iejvadNd86s2ObS6VSA2fGFh+WfOzoCvlzGOw7Cmbjj5F0Xhox52ocjV1nY@vger.kernel.org, AJvYcCXGArOdg8jNtbaHqQP51qKNeAxU5eR+5nziR42MELOGCYEhZALgNAOz7aVIn3YoMSxGYV/0+wHrvVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxexgFC6+9Q91JvylCijrMPQ2knb5bv/wDcpCqiZDrpJUfT09Hs
	TnwvaQpBRwPLSr0DE7J0rhhTWwpqock9AWe735bv2T+iVLuFXOkZ
X-Gm-Gg: ASbGncvrK8niT9Jv7Ayf1D9Z4OytCiKQoSSQy3wrwZeDPxTxnOYW6OfNr4nXlrNC9jV
	+PjYyRRFVyNIXboCIg/WbyExUM9pKkDqCo5GH5jHDJoCwt0Th2W+NV+bCDATvtcby4SKQFC+Rov
	+SlYr9L+ZUJzRCnVh8RjhVkpJtLeCrGY6BNMIDBacpAZ+x2ymYaM1uJqT345REJaPW8TYO36aoL
	CewD/7WUjwaFxK3EL7RSeEjV4SKVZJnPgmEFM6xqAOPqy1TqmI/EY1w0IKOp22PYAsM2WUPXkCe
	7OlDlNWbHy7C63MAv3pqOaQcBk8GfwMV3o2fYYBkJiOurrUgvVvRUDru+4ajjIvKB9OSGDH/+lQ
	A6GzA00n3PF1CCg==
X-Google-Smtp-Source: AGHT+IEvFae6Eie33x9FFpf+iCpGSX/1biKR7yQ0H3hoge6/kFj9vRS2u/8JmKAq86VxQl0T/60Alw==
X-Received: by 2002:a17:903:240d:b0:22d:b2c9:7fd7 with SMTP id d9443c01a7336-22db3c1be1bmr39584215ad.21.1745497301953;
        Thu, 24 Apr 2025 05:21:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221c60sm11668675ad.228.2025.04.24.05.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:21:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f6ee05c8-e762-447a-8909-58f629541b06@roeck-us.net>
Date: Thu, 24 Apr 2025 05:21:40 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: i801: don't instantiate spd5118 if SPD Write
 Disable is set
To: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>,
 Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-for-upstream-i801-spd5118-no-instantiate-v1-0-627398268a1f@canonical.com>
 <20250424-for-upstream-i801-spd5118-no-instantiate-v1-2-627398268a1f@canonical.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250424-for-upstream-i801-spd5118-no-instantiate-v1-2-627398268a1f@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/23/25 20:35, Yo-Jung (Leo) Lin wrote:
> If SPD Write Disable bit in the SMBus is enabled, writing data to
> addresses from 0x50 to 0x57 is forbidden. This may lead to the
> following issues for spd5118 device:
> 
>    1) Writes to the sensor hwmon sysfs attributes will always result
>       in ENXIO.
> 
>    2) System-wide resume, errors may occur during regcache sync,
>       resulting in the following error messages:
> 
>       kernel: spd5118 1-0050: Failed to write b = 0: -6
>       kernel: spd5118 1-0050: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -6
>       kernel: spd5118 1-0050: PM: failed to resume async: error -6
> 
>    3) nvmem won't be usable, because writing to the page selector becomes
>       impossible.
> 
> Also, spd5118 from some manufacturers may set the page to a value != 0

It is the BIOS vendor, not the spd5118 chip vendor.

> after a sensor reset. This will make the sensor not functional unless

board reset

> its MR11 register can be changed, which is impossible due to writes being
> disabled.
> 
> To address these issues, don't instantiate it at all if SPD Write Disable
> bit is set.
> 
> Signed-off-by: Yo-Jung (Leo) Lin <leo.lin@canonical.com>
> ---
>   drivers/i2c/i2c-smbus.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> index 97e833895dd7..cb7ef6a7a174 100644
> --- a/drivers/i2c/i2c-smbus.c
> +++ b/drivers/i2c/i2c-smbus.c
> @@ -378,6 +378,7 @@ void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled)
>   	u16 handle;
>   	u8 common_mem_type = 0x0, mem_type;
>   	u64 mem_size;
> +	bool scan_needed = true;

I'd suggest to name the variable "instantiate", but that is really a nitpick.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

>   	const char *name;
>   
>   	while ((handle = dmi_memdev_handle(slot_count)) != 0xffff) {
> @@ -438,6 +439,7 @@ void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled)
>   	case 0x22:	/* DDR5 */
>   	case 0x23:	/* LPDDR5 */
>   		name = "spd5118";
> +		scan_needed = !write_disabled;
>   		break;
>   	default:
>   		dev_info(&adap->dev,
> @@ -461,6 +463,9 @@ void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled)
>   		addr_list[0] = 0x50 + n;
>   		addr_list[1] = I2C_CLIENT_END;
>   
> +		if (!scan_needed)
> +			continue;
> +
>   		if (!IS_ERR(i2c_new_scanned_device(adap, &info, addr_list, NULL))) {
>   			dev_info(&adap->dev,
>   				 "Successfully instantiated SPD at 0x%hx\n",
> 


