Return-Path: <linux-i2c+bounces-10615-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3525A9AD31
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 14:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FDFA464145
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 12:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E3D22579B;
	Thu, 24 Apr 2025 12:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8Fy6G/n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CD122D780;
	Thu, 24 Apr 2025 12:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745497337; cv=none; b=dMmaUT0A7uKFX1GIXDCs/pUa2rdVZFYUq102PYIj3hUT2IXgptCtZu+x27ss+hrPIlqmCUVqyAMpl1ITPpevmO15KePcoM0/7gL4h+qFf2UT5hGLBcgvQ1LCFgwgr874a/iDabK0lPXYvKXcR2Kmbw/pE8MJ7xkOwD6wWOlDYHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745497337; c=relaxed/simple;
	bh=bSCjs6XPL95daq1tu5pbrBQ5N+yhoPGC4JD2X/nk4RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZBe6GKHD7l2JVmPrZe8DyEjPidFau9JY5H4bzLZFkk/OLB1R/mQ5u5I987DSsWPGZG5PEmVId7K+yvBzYdXeiEAZ3TjRMFhPqLYU4RjGpb7eXyMVgFGFkz+DdimedF3F5KzQyEP6MfYF4zETZe1dt/ElOSO11DoFh8oddi29D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8Fy6G/n; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso666467a91.2;
        Thu, 24 Apr 2025 05:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745497335; x=1746102135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Yulca+m6eU+aKvuvRmaHz5EfITL98i0LZdidD7dFvFo=;
        b=P8Fy6G/nytp4ewBfEK5xnFqzY0hbKOKeoMd/j9Nxgk8mYsaZ/5yqh3poxiYRbfUfIk
         uuNahTJHX2oFYUUZUilZp2WSZSKj3U5LTiaLskZxh67ElTtG5UnP8BPna1Muk1pIXcNe
         /bJLu1M4Za9sG1cUCl9orC8/He/7uS6ZKtyDoVDjQG4rxHwoZ6GIIpXscJjJaMRtgQuF
         cxA6nPhrxoZu/4V5kfMPySf6rNPycQR1RjAJoR43mb8EOm58AAlBSOCSP2QNfSXt8Bq/
         pG9Os/RXyr63akyLACHfn850tmh2m592IXf0mkx4dmry1iNf764T0Qd0bjrYvc7oFh2n
         TS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745497335; x=1746102135;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yulca+m6eU+aKvuvRmaHz5EfITL98i0LZdidD7dFvFo=;
        b=gyi1oKbLH80mNpAKnBiWUIPIofF91gq44GGjXaCqLWIVPOOOPO2hhnXYBJtkFMvSz+
         76lwYIyIriWB8i5MvBw50k/jt9b27AXrK2S8dpf8r9jZMA3K0+cFvB86iMFzED75IMc1
         EGsjKtsFZr1sNskS2f9huhjLKjDIj52wUqRv1G68YOsZ1eHja+BfXk9PCrIJknPr0i9G
         sYIUei16CiXRQQXsJo3s2trqXXbi4gXNY7Pq2aJhj78v/3r3Z7r3Q1V/lVHIHsH4xf74
         usST6RcLdMPZmr1Kpxejx0sxZ7DM1tUfnc4zzfpgzCXPxaxSWDu1++aKTWBeuBbbHb0F
         qBmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+9h5WMY0QpjSDYUMAEOf13c7kJGqNju14b1aw/TtGtQoxmz9e5kpwVuadvK1eUjfM8I7zgnsmx8JIe6bb@vger.kernel.org, AJvYcCWCP6zgwlEe882y4O67R5dKelFU7/rOQPl6+RXBHFt6rKPEojfRPhhxZmnqdY4ngvioFIbL/cV+YlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXCJ0/3t3hTWYsCy27HHhccpo+8oSFPQiRJdmxL7x1FYIazQc+
	zu1imW18sPgqUEjEmusRkRAhv53JpazSNSkwV01KdKOVDqDzYL7h
X-Gm-Gg: ASbGnctxi1AsyN2A/5bDQKeP6Q1+ec+sxZs5O5CFxciWoNRkre4QIVAEeeI/ItnzykM
	JSvGRMyJtYAataDKivbXuqywyq84Ci2rUPJCEe2zieQxZkL3gpPWwHNN4U3tNd3HjIZUelhqJA0
	N8RNvZklRKauadBgAus3YMK86miVW/atPI8AYdTi/e80mtQ+dgcIFeMqV0gQEk/uEi/CvDLXA/a
	1PPGrgF5BGPugyoiezt7krIcQtI9JAc47XIBV+4cI6ZYkyYsKUsSDOt1KqqRb6N1X+3zN8CcENg
	FRrzxsqkzPDT6VAAcEK2McwAn4/1sxwl6ffx63w+byqBEph23xixeuT64jQS86Wj2HW+NhvH6xg
	oSTA1ciNXHz7UQQ==
X-Google-Smtp-Source: AGHT+IEf+g6RCzlARg1Io5ebiLE6UKn/eFApuJ0yjpVjeaWVFeQKDcD4ntpMlS8kvvePvW8tq70T1A==
X-Received: by 2002:a17:90b:3a05:b0:2fe:68a5:d84b with SMTP id 98e67ed59e1d1-309ed26ca10mr3248290a91.1.1745497335330;
        Thu, 24 Apr 2025 05:22:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef14a358sm1195971a91.46.2025.04.24.05.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:22:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b6f7c310-562a-494e-a1da-05a28666e1f0@roeck-us.net>
Date: Thu, 24 Apr 2025 05:22:13 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: smbus: pass write disabling bit to spd
 instantiating function
To: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>,
 Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-for-upstream-i801-spd5118-no-instantiate-v1-0-627398268a1f@canonical.com>
 <20250424-for-upstream-i801-spd5118-no-instantiate-v1-1-627398268a1f@canonical.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250424-for-upstream-i801-spd5118-no-instantiate-v1-1-627398268a1f@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/23/25 20:35, Yo-Jung (Leo) Lin wrote:
> Some SMBus controllers may restrict writes to addresses where SPD
> sensors may reside. This may lead to some SPD sensors not functioning
> correctly, and might need extra handling. Pass this extra context to
> i2c_register_spd() so that it could be handled accordingly.
> 
> Signed-off-by: Yo-Jung (Leo) Lin <leo.lin@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/i2c/busses/i2c-i801.c  | 6 ++++--
>   drivers/i2c/busses/i2c-piix4.c | 2 +-
>   drivers/i2c/i2c-smbus.c        | 2 +-
>   include/linux/i2c-smbus.h      | 4 ++--
>   4 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 48e1af544b75..95619eb5e798 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1180,7 +1180,8 @@ static void i801_probe_optional_targets(struct i801_priv *priv)
>   #ifdef CONFIG_I2C_I801_MUX
>   	if (!priv->mux_pdev)
>   #endif
> -		i2c_register_spd(&priv->adapter);
> +		i2c_register_spd(&priv->adapter,
> +				 !!(priv->original_hstcfg & SMBHSTCFG_SPD_WD));
>   }
>   #else
>   static void __init input_apanel_init(void) {}
> @@ -1283,7 +1284,8 @@ static int i801_notifier_call(struct notifier_block *nb, unsigned long action,
>   		return NOTIFY_DONE;
>   
>   	/* Call i2c_register_spd for muxed child segments */
> -	i2c_register_spd(to_i2c_adapter(dev));
> +	i2c_register_spd(to_i2c_adapter(dev),
> +			 !!(priv->original_hstcfg & SMBHSTCFG_SPD_WD));
>   
>   	return NOTIFY_OK;
>   }
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index dd75916157f0..085d121a88f6 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -971,7 +971,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
>   	 * This would allow the ee1004 to be probed incorrectly.
>   	 */
>   	if (port == 0)
> -		i2c_register_spd(adap);
> +		i2c_register_spd(adap, false);
>   
>   	*padap = adap;
>   	return 0;
> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> index 7d40e7aa3799..97e833895dd7 100644
> --- a/drivers/i2c/i2c-smbus.c
> +++ b/drivers/i2c/i2c-smbus.c
> @@ -372,7 +372,7 @@ EXPORT_SYMBOL_GPL(i2c_free_slave_host_notify_device);
>    *  - Only works on systems with 1 to 8 memory slots
>    */
>   #if IS_ENABLED(CONFIG_DMI)
> -void i2c_register_spd(struct i2c_adapter *adap)
> +void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled)
>   {
>   	int n, slot_count = 0, dimm_count = 0;
>   	u16 handle;
> diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
> index ced1c6ead52a..57bb3154eb47 100644
> --- a/include/linux/i2c-smbus.h
> +++ b/include/linux/i2c-smbus.h
> @@ -44,9 +44,9 @@ static inline void i2c_free_slave_host_notify_device(struct i2c_client *client)
>   #endif
>   
>   #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_DMI)
> -void i2c_register_spd(struct i2c_adapter *adap);
> +void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled);
>   #else
> -static inline void i2c_register_spd(struct i2c_adapter *adap) { }
> +static inline void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled) { }
>   #endif
>   
>   #endif /* _LINUX_I2C_SMBUS_H */
> 


