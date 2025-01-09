Return-Path: <linux-i2c+bounces-9010-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 181C6A07BF5
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 16:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2CD818839AE
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 15:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A3921CFE2;
	Thu,  9 Jan 2025 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJCtEE7Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5744921CA14;
	Thu,  9 Jan 2025 15:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436589; cv=none; b=pLh6sbWqyvQYI28Sydcfqb4d7vokcohJjJfcnnD553zADj3sbPsQUBYex3j4btmRxfc8M797DiAn3LMX1IpE7+xdz3f38uL2xg2CTRAWpDiqzinQ+Gci1aRYNIyLJWZPbkGL5hYKadPZdMIAUMxxaelKJOz7Gpg5OE+MQWxbTwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436589; c=relaxed/simple;
	bh=BAr3+m74Gh91Fgmg4tIOeipVGM2nnkFV+k5gfRbmOQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ut38Y24LoZT5Qte6a3na277/krx7totqZJ/FQzr6kvaPIvir7mqCKDUnvSUlDAKAvSNWNvhCj0keepjfNiv+TB6nlQQ0Z8C0w0YWw3PKaX2Ay5q0gIjiRfk2Bb7VL8cG2O8BMjwxN14DSlPlNaIsM+pJWyrmlur8kJebD9yUii8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJCtEE7Y; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-215770613dbso13167925ad.2;
        Thu, 09 Jan 2025 07:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736436586; x=1737041386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMO+qZUr2e9651wYqz5uA9oLsdfXXLNSEuWj2opd+Ro=;
        b=ZJCtEE7Yw9PHzQxSUI8Ty3g0CzwLRN4+hImaOoJcAoEArzgtZYDNPrz/AJbafWEyS+
         2Wp63yE78scwjVv8rIc86bAckNdWFzMJO7xLPXK3snEIvNZ34WsQqDj6++4kD+zibI0l
         UDr/yX+JOOO48PKwa/3C4ShVvhEDp0Ig69x2AMEH8qaQUIX93wyKhqgFvxHa9azkvSQH
         HC4icJpyVyOdXLHZpMViysMcfb5CeVCn9ANwhoTxWIe7LY+658ozwaoM14Hyk56A6SQd
         KQx8j08TrV1OM+Dp4/Fg4PXnGKNmj16ESw5dcqqyjXwCfprOYmoKfvuhbOV4jaqrLRci
         Tnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436586; x=1737041386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMO+qZUr2e9651wYqz5uA9oLsdfXXLNSEuWj2opd+Ro=;
        b=XDUbYKPbOegIin+6itrGohPTHhV20TLpiIDDKgAeUpH/zYbi+rLKBtaN8xgsQxwt7W
         YZhWJ2wPfX7/R8OPOnoa0IimFAlqxp52q1m6ZVGaYEVQdG1j2FAC5Qop/zFZiSkF3ivk
         GkD07cLIgll3IJbze5svooTAjqwoF+2p26YmfhFsylSPqBV7HHXFLhmkBHJD3PH49YZY
         LAvwwnkZzFi5+KsURkQg82yzetcNlp2oHGgETllHybmGOkkqHFAwz3A5dYUk0H1k6vKt
         Rjir2912tj8oRnxdTLFV14Ee0NwhgGzxzAKqYNEdwuVFnIwU/v4kVaF2IYCLS8ElF55q
         6diQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEe3OA3/+oACRu1klsDCr5qdsFayJj5h4Se2XOfOVSIPWLMegGFaCmMrfL87TrEUuHxTWhCWiz6DrCfFGE@vger.kernel.org, AJvYcCX0SOVI1lixwPq67umG9Xp6Fsp9JPA9kDxgEm49Vkfc51UPdc884jos5H3ygRHnPpWO4I8DJHPEAfc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxo6u4LFa7ujmClA128Ur19T5GYACo5Jp7dTOzrQ0gNx2jZGPC
	DTppAc+oql0Wt7juYLk4H9OKy3pE8JTXFjNWQ5DAxHsWRJPHvKl/e9NaDQ==
X-Gm-Gg: ASbGncubo4/qjHkj34R6DaMk+cWLIZ0V/f/3617Zk2RSwA4AHRHVFU3h0QUA5kj8qbi
	6j5BNf8nfOyGbwQH1TEHthi0Tw0LEWluSSh6jAYvg3Mpg6PFo5W0pVZQvvBpyL7uiio5pjXr6jb
	Eg8aWcGDxttUiFo+ML5ITbJmlyvtlAzuyyfYBRtjAqVwiRsz1wV43ShHXxsHBl3ZLYbiEQInDXn
	G1c2/GwmTzBdG2Jx+OIPP3x/jwRhWQ3xWO565e9iCHo6Nbeyt4MzVmscKvP/XfE3o8eIA==
X-Google-Smtp-Source: AGHT+IGcaOl5ov1x2+OFRyQ0n7dDN8SNMZB+ZvtIEQrST9UioEnFh/ODva5sOuYSx8DFK83itNgxpQ==
X-Received: by 2002:a05:6a00:ac2:b0:729:c7b:9385 with SMTP id d2e1a72fcca58-72d21f27b01mr10756345b3a.6.1736436586603;
        Thu, 09 Jan 2025 07:29:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8164c7sm37381996b3a.4.2025.01.09.07.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:29:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jan 2025 07:29:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: add core-managed per-client directory in debugfs
Message-ID: <a519d066-7325-446c-99ab-87f36a26b850@roeck-us.net>
References: <20250109122112.45810-1-wsa+renesas@sang-engineering.com>
 <20250109122112.45810-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109122112.45810-2-wsa+renesas@sang-engineering.com>

On Thu, Jan 09, 2025 at 01:21:10PM +0100, Wolfram Sang wrote:
> More and more I2C client drivers use debugfs entries and currently they
> need to manage a subdir for their files on their own. This means
> inconsistent naming for these subdirs and they are scattered all over
> the debugfs-tree as well. Not to mention the duplicated code.
> 
> Let the I2C core provide and maintain a proper directory per client.
> 
> Note: It was considered to save the additional pointer in 'struct
> i2c_client' and only provide a subdir when requested via a helper
> function. When sketching this approach, more and more corner cases
> appeared, though, so the current solution with its simple and unabiguous
> code was chosen.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/i2c/i2c-core-base.c | 4 ++++
>  include/linux/i2c.h         | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index b072030a9105..00f171ebc01f 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1015,6 +1015,8 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
>  	if (status)
>  		goto out_remove_swnode;
>  
> +	client->debugfs = debugfs_create_dir(dev_name(&client->dev), adap->debugfs);
> +
>  	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
>  		client->name, dev_name(&client->dev));
>  
> @@ -1058,6 +1060,8 @@ void i2c_unregister_device(struct i2c_client *client)
>  
>  	if (ACPI_COMPANION(&client->dev))
>  		acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev));
> +
> +	debugfs_remove_recursive(client->debugfs);
>  	device_remove_software_node(&client->dev);
>  	device_unregister(&client->dev);
>  }
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 66fb3d6cf686..36de788dc7fe 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -347,6 +347,7 @@ struct i2c_client {
>  	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
>  #endif
>  	void *devres_group_id;		/* ID of probe devres group	*/
> +	struct dentry *debugfs;		/* per-client debugfs dir	*/
>  };
>  #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
>  
> -- 
> 2.45.2
> 

