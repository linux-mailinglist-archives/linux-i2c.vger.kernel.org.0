Return-Path: <linux-i2c+bounces-6418-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0A8971FB2
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 18:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4220285AF7
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 16:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2531216DEAA;
	Mon,  9 Sep 2024 16:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/uk15kb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BFE44375;
	Mon,  9 Sep 2024 16:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725901081; cv=none; b=UQTFNIpIb4DO+F+pNKE6IqSo5fzSWCc84oXd55pZ21bHyzUYi1M/8DdGdi81nLwYU9EjXhpoz7ZKB7XcnTkjNo8BKfIRwMQRkm0ia6n0fbtTYAkO8Y2giSI89U5N/tn9RhsmP6IxMzXnZKgTkcI8dWI5g53qkEhqBqeonIQfS88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725901081; c=relaxed/simple;
	bh=NwfNZFJm7MAmFFn0vI8+QnUCiAQ+TlOW8G8Q31/baGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1H1TOK1193ZCp5FJM+i1jvhxL435vwOWZJswfEPjXUW48E2SJkBJuSpH6Ai7gULB0D0Au+PV2ZivF3WArsXzOGbvReGwCRs0A5E/M+OlWAyJPTXYQr6KlhOleUH+2UWTmQUQ9o2TEPvYxDECNFSUgUrm6Rm90gtPf6mmgR2s40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/uk15kb; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2d88c5d76eeso2923326a91.2;
        Mon, 09 Sep 2024 09:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725901079; x=1726505879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyITgwxYNRNakYBoTJ6HtUSzucHeoe8yt0i/ZtTPjqg=;
        b=K/uk15kbXGxVmpK+1yL6Bo3rPojwsvcyjBh/nP9VHWjzBFIyzMb1iv19pdv7LlrdEP
         DxMwgrNyexd0UII8BOBCm88s3t8FB46nZxvwuD4Dci1vmFB9d20UsWJWN3MPCcTCQnKc
         oL1MUUwzGcELCG3gvyMQ3eeHB5/QQe2DJQopc2CSaLjGCUiaJkivaO6JkpAqjeCVxXSN
         UdN1TaZKEUGE2kSC71J09FcZLfgV9+yy66ABw5EAS+1G2k9zy8Wcujf/LqVPqxxKZrHx
         8RZe2Dy6SVoM5GUUw57ENLPTZFvaVyUU6oaGgTrXi+6+oR+4hSVZwDlrDWevApsRsTJr
         S/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725901079; x=1726505879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyITgwxYNRNakYBoTJ6HtUSzucHeoe8yt0i/ZtTPjqg=;
        b=tAc96b2HeVtUjSogZzO27hXyf5tqW1CIffQF3cB+HVP2g64HDojaVd0RxYYjGPxfxL
         HfZABRvKPH/yYrWb4ijfV1k5R+vofksMHzSQJEgXohlDmn1dKoZBaaq9Peq1fGFYpDvm
         A4kpUMkn/068FJ9dVMxOybf6Nq9x+hAFn3ieJa7/aYQVnmK1+9IVma3yl8jRsMOgH4Z+
         ojW/u2UJ5XW92JKMTjBqWJfLMHFH94uJn3aqlWgLROtlEBc9oem6Aoua8K3tkvHLqB1Z
         GazMh3JfBx73hL91BOR0khrh6LAVQm6uYli/ncFbeyIMBv0bgo8hYHir2asexgQo/pkB
         mmSw==
X-Forwarded-Encrypted: i=1; AJvYcCUBD9b+m8p7yRDzW3vwgVpyJAjCerBPIq/xJRIm0gHDM6TIJep2vshkdZsvMrjWSAkGQIG3gK3rU47g@vger.kernel.org, AJvYcCUQetwycTtCmjOs4SB0OYtj2aCP8w3Crx9XDjXvNAhMDU1cQqm94xl+mmj7D5wcgsNTwSGH1bnqgEegcg==@vger.kernel.org, AJvYcCV7HbWg4Tsyxly2M/hhx+GKGe/7TWtFCFWuotHn9ndOyHTWPZRaho3VAU+PI/RDS39iDgszB3hWxZQtITI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwToHXL29v8e1GJ0dANB74rQKGIl6D8Ua4aKG25Rb5jyxp14NJE
	npwXPPMhOsPKrUZvZn7PcHshDvM1xR7PP3h6KyUZsaXH5GIdR1vGgNksIw==
X-Google-Smtp-Source: AGHT+IFcV4FuNlgbz/ATyisKjhjG9aGCjKQOW/LrsGz+qu4YNdFdiCluDIiWZwBqs4puEe8OhBwMDA==
X-Received: by 2002:a17:90a:f011:b0:2d8:c7fb:340a with SMTP id 98e67ed59e1d1-2dad51363dcmr10472533a91.38.1725901079431;
        Mon, 09 Sep 2024 09:57:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadbffd992sm6903480a91.14.2024.09.09.09.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 09:57:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 9 Sep 2024 09:57:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Li Zetao <lizetao1@huawei.com>
Cc: jikos@kernel.org, bentiss@kernel.org, michael.zaidman@gmail.com,
	gupt21@gmail.com, djogorchock@gmail.com,
	roderick.colenbrander@sony.com, savicaleksa83@gmail.com,
	me@jackdoan.com, jdelvare@suse.com, mail@mariuszachmann.de,
	wilken.gottwalt@posteo.net, jonas@protocubo.io,
	mezin.alexander@gmail.com, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next v2 08/15] hwmon: (aquacomputer_d5next) Use
 devm_hid_hw_start_and_open in aqc_probe()
Message-ID: <e4d26100-1a3b-465a-98d9-f2e63a52a47c@roeck-us.net>
References: <20240909012313.500341-1-lizetao1@huawei.com>
 <20240909012313.500341-9-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909012313.500341-9-lizetao1@huawei.com>

On Mon, Sep 09, 2024 at 09:23:06AM +0800, Li Zetao wrote:
> Currently, the aquacomputer_d5next module needs to maintain hid resources
> by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
> resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the fail_and_close and fail_and_stop
> lables, and directly return the error code when an error occurs.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v1 -> v2: Adjust commit information
> v1:
> https://lore.kernel.org/all/20240904123607.3407364-13-lizetao1@huawei.com/
> 
>  drivers/hwmon/aquacomputer_d5next.c | 39 +++++++----------------------
>  1 file changed, 9 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
> index 8e55cd2f46f5..9b66ff0fe6e1 100644
> --- a/drivers/hwmon/aquacomputer_d5next.c
> +++ b/drivers/hwmon/aquacomputer_d5next.c
> @@ -1556,14 +1556,10 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
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
> -		goto fail_and_stop;
> -
>  	switch (hdev->product) {
>  	case USB_PRODUCT_ID_AQUAERO:
>  		/*
> @@ -1577,10 +1573,8 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		 * they present. The two other devices have the type of the second element in
>  		 * their respective collections set to 1, while the real device has it set to 0.
>  		 */
> -		if (hdev->collection[1].type != 0) {
> -			ret = -ENODEV;
> -			goto fail_and_close;
> -		}
> +		if (hdev->collection[1].type != 0)
> +			return -ENODEV;
>  
>  		priv->kind = aquaero;
>  
> @@ -1740,10 +1734,8 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		 * Choose the right Leakshield device, because
>  		 * the other one acts as a keyboard
>  		 */
> -		if (hdev->type != 2) {
> -			ret = -ENODEV;
> -			goto fail_and_close;
> -		}
> +		if (hdev->type != 2)
> +			return -ENODEV;
>  
>  		priv->kind = leakshield;
>  
> @@ -1865,30 +1857,20 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	priv->name = aqc_device_names[priv->kind];
>  
>  	priv->buffer = devm_kzalloc(&hdev->dev, priv->buffer_size, GFP_KERNEL);
> -	if (!priv->buffer) {
> -		ret = -ENOMEM;
> -		goto fail_and_close;
> -	}
> +	if (!priv->buffer)
> +		return -ENOMEM;
>  
>  	mutex_init(&priv->mutex);
>  
>  	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, priv->name, priv,
>  							  &aqc_chip_info, NULL);
>  
> -	if (IS_ERR(priv->hwmon_dev)) {
> -		ret = PTR_ERR(priv->hwmon_dev);
> -		goto fail_and_close;
> -	}
> +	if (IS_ERR(priv->hwmon_dev))
> +		return PTR_ERR(priv->hwmon_dev);
>  
>  	aqc_debugfs_init(priv);
>  
>  	return 0;
> -
> -fail_and_close:
> -	hid_hw_close(hdev);
> -fail_and_stop:
> -	hid_hw_stop(hdev);
> -	return ret;
>  }
>  
>  static void aqc_remove(struct hid_device *hdev)
> @@ -1897,9 +1879,6 @@ static void aqc_remove(struct hid_device *hdev)
>  
>  	debugfs_remove_recursive(priv->debugfs);
>  	hwmon_device_unregister(priv->hwmon_dev);
> -
> -	hid_hw_close(hdev);
> -	hid_hw_stop(hdev);
>  }
>  
>  static const struct hid_device_id aqc_table[] = {
> -- 
> 2.34.1
> 
> 

