Return-Path: <linux-i2c+bounces-6419-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8FF971FB9
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 18:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 743ED284B62
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 16:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC00C16EB5D;
	Mon,  9 Sep 2024 16:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YthJf+33"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030AB16D9AF;
	Mon,  9 Sep 2024 16:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725901155; cv=none; b=rj1W72P+e18H9oULPHv0lvxQ/HJfjyHd30/8sPSIKSRxqtniENa4zLUqfCp/Q7VvlL/HfPQl6EfhnU/kPcxGcYw9cNhlhqL8jVpg2Q/jvmRP5Zzk2fcDXbkM4+WHxkVHE26xX5nc+nYvUfkUOMzzePAdMw5XuWxyyCaPQBVsWmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725901155; c=relaxed/simple;
	bh=/lVmcypSgqSQN7yfAUsljGt1EvpzWJaLLxp27XqKDDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoM+r7E7C2V9+uuWVHr+e4qtB7xJljji3i38RfY+PpqCrhuqUNXnf/pbzg7tQf1BIf6847jSuRwTk2cZo2effhY+hRJ+lIDngFqVXpPjLrDMpt5anO6jfDaVb+fe03Wd1AscqeLau4qDdfptdSotMMqRVxY71hSJKMHe4oSh+ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YthJf+33; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71798661a52so2768023b3a.0;
        Mon, 09 Sep 2024 09:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725901153; x=1726505953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ny+k/kp/AVx/IrvD9FvKeTWMfd/+vNE/2JpxLD7T3bA=;
        b=YthJf+33xrUGLvJ0NynDELU5e1NZY+dCyenC+jyw91Looa6vyzipnYWUOYiRpG8sUa
         9cdhVmZOm9YbgLf/Yatc2FFxgRKK9OikJwMkM43lJ0yy4hfjSxhZ6amKllB/M1WmxknV
         dsvtu0EdNTbbekQVAzXbqvB0uj10tujdnshH+/pgYkf4sK/5CA42SXJOy+k965S5Zdi4
         v629TUgO3RcnfUnSSDjEMygZqof+C5447ZRalDQU4LkLvs4D2nKBRyE+DEbsvo6Jn6gj
         mq3LGwIKYwNa/SlPmKoXnlPOCN7V8gI6K7f4JJ/MtYZ4Wl2mXb1pGEddmuLjGUXBW3Mm
         L5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725901153; x=1726505953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ny+k/kp/AVx/IrvD9FvKeTWMfd/+vNE/2JpxLD7T3bA=;
        b=UkZlXG4hBVF/g3PzanKac+hRvE1WwfKnG8dpGXEeccoc2LZJQ3LZHigd58Bh9SaTJR
         1fb7jEN5WTDuWy7S96zvu9szKJ2n4NE5H+jp+6+CPZf4XR/d9RopBZP1Uz5xUOQoatQc
         actVE4/xwBRKdz21+NKjDu/FjeaHxLAxvwXq3/guZNB6WJiK6ZAQ0B6b3lzt5stXNY8C
         kYNlWelzOAvTD8GXaaSgobpYriWIvVXR5IYJBOoSQ9u1fWxuDXcLse+6eOuAF+LG8Mox
         7xKOZjA9cQLCWG1ziUtanGp64lbSQMPkJqBCaCwSsIbt/e+dJBCgwvGQqNgWtEPGYni2
         SzTg==
X-Forwarded-Encrypted: i=1; AJvYcCWKqfUgt5U9z3mE2kw70bp9Gm2GxY/Py8cJqtftyKurJXa9Gb/AEZlGvpvw/h0VUf/U1JY1z6I+e54eDg==@vger.kernel.org, AJvYcCWam1VLwNQRBUfJq68+UBtpvmWoTaJ5zqed2YD07XQ0JGuazFe5nz7GTzXlJneIiQ4r15O9wTnqZHG6@vger.kernel.org, AJvYcCXAbv/FvIJ7p332QePO05ZgM4f/JixDr1XRB0D73EI7+M1TWxgZ1gVpdQQCit5JVrcKSc5fNmOgan3vRdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH5vkuREDr0Jv+OafzFL3Ht3CrlB3MVj62zPPqoB9AL/rlzvXc
	B8c5CSPMgVa0P4xV8FDGFWiNWDjlzonX8Ro+Gor1OKVr9B2Q+fpj
X-Google-Smtp-Source: AGHT+IFO5ySC4ToSpGFOlDlEsmGH7cSq2ZS1Qpqa2WXjpyZm36ePKWH9MfpqEmys5qyj++tC4vJVYg==
X-Received: by 2002:a05:6a00:a17:b0:706:aa39:d5c1 with SMTP id d2e1a72fcca58-71907edfb5amr516417b3a.8.1725901153142;
        Mon, 09 Sep 2024 09:59:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d823736421sm3492389a12.15.2024.09.09.09.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 09:59:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 9 Sep 2024 09:59:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Li Zetao <lizetao1@huawei.com>
Cc: jikos@kernel.org, bentiss@kernel.org, michael.zaidman@gmail.com,
	gupt21@gmail.com, djogorchock@gmail.com,
	roderick.colenbrander@sony.com, savicaleksa83@gmail.com,
	me@jackdoan.com, jdelvare@suse.com, mail@mariuszachmann.de,
	wilken.gottwalt@posteo.net, jonas@protocubo.io,
	mezin.alexander@gmail.com, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next v2 09/15] hwmon: Use devm_hid_hw_start_and_open in
 rog_ryujin_probe()
Message-ID: <580835b6-928e-4cef-b083-1b48caa1c046@roeck-us.net>
References: <20240909012313.500341-1-lizetao1@huawei.com>
 <20240909012313.500341-10-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909012313.500341-10-lizetao1@huawei.com>

On Mon, Sep 09, 2024 at 09:23:07AM +0800, Li Zetao wrote:
> Currently, the rog_ryujin module needs to maintain hid resources
> by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
> resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the fail_and_close and fail_and_stop
> lables, and directly return the error code when an error occurs.
> 
> Further optimization, use devm_hwmon_device_register_with_info to replace
> hwmon_device_register_with_info, the remote operation can be completely
> deleted, and the rog_ryujin_data structure no longer needs to hold
> hwmon device.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Subject should include 'asus_rog_ryujin'. Other than that,

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v1 -> v2:
>   1) Further optimize using devm_hwmon_device_register_with_info
> and remove the .remove operation
>   2) Adjust commit information
> v1:
> https://lore.kernel.org/all/20240904123607.3407364-14-lizetao1@huawei.com/
> 
>  drivers/hwmon/asus_rog_ryujin.c | 47 +++++----------------------------
>  1 file changed, 7 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
> index f8b20346a995..ef0d9b72a824 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c
> @@ -80,7 +80,6 @@ static const char *const rog_ryujin_speed_label[] = {
>  
>  struct rog_ryujin_data {
>  	struct hid_device *hdev;
> -	struct device *hwmon_dev;
>  	/* For locking access to buffer */
>  	struct mutex buffer_lock;
>  	/* For queueing multiple readers */
> @@ -497,6 +496,7 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
>  static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  {
>  	struct rog_ryujin_data *priv;
> +	struct device *hwmon_dev;
>  	int ret;
>  
>  	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
> @@ -520,23 +520,13 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
>  	}
>  
>  	/* Enable hidraw so existing user-space tools can continue to work */
> -	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> -	if (ret) {
> -		hid_err(hdev, "hid hw start failed with %d\n", ret);
> +	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
> +	if (ret)
>  		return ret;
> -	}
> -
> -	ret = hid_hw_open(hdev);
> -	if (ret) {
> -		hid_err(hdev, "hid hw open failed with %d\n", ret);
> -		goto fail_and_stop;
> -	}
>  
>  	priv->buffer = devm_kzalloc(&hdev->dev, MAX_REPORT_LENGTH, GFP_KERNEL);
> -	if (!priv->buffer) {
> -		ret = -ENOMEM;
> -		goto fail_and_close;
> -	}
> +	if (!priv->buffer)
> +		return -ENOMEM;
>  
>  	mutex_init(&priv->status_report_request_mutex);
>  	mutex_init(&priv->buffer_lock);
> @@ -548,31 +538,9 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
>  	init_completion(&priv->cooler_duty_set);
>  	init_completion(&priv->controller_duty_set);
>  
> -	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "rog_ryujin",
> +	hwmon_dev = devm_hwmon_device_register_with_info(&hdev->dev, "rog_ryujin",
>  							  priv, &rog_ryujin_chip_info, NULL);
> -	if (IS_ERR(priv->hwmon_dev)) {
> -		ret = PTR_ERR(priv->hwmon_dev);
> -		hid_err(hdev, "hwmon registration failed with %d\n", ret);
> -		goto fail_and_close;
> -	}
> -
> -	return 0;
> -
> -fail_and_close:
> -	hid_hw_close(hdev);
> -fail_and_stop:
> -	hid_hw_stop(hdev);
> -	return ret;
> -}
> -
> -static void rog_ryujin_remove(struct hid_device *hdev)
> -{
> -	struct rog_ryujin_data *priv = hid_get_drvdata(hdev);
> -
> -	hwmon_device_unregister(priv->hwmon_dev);
> -
> -	hid_hw_close(hdev);
> -	hid_hw_stop(hdev);
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
>  
>  static const struct hid_device_id rog_ryujin_table[] = {
> @@ -586,7 +554,6 @@ static struct hid_driver rog_ryujin_driver = {
>  	.name = "rog_ryujin",
>  	.id_table = rog_ryujin_table,
>  	.probe = rog_ryujin_probe,
> -	.remove = rog_ryujin_remove,
>  	.raw_event = rog_ryujin_raw_event,
>  };
>  
> -- 
> 2.34.1
> 
> 

