Return-Path: <linux-i2c+bounces-7724-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0E79B93DD
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 16:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E842FB216FD
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 15:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C5C1AAE09;
	Fri,  1 Nov 2024 14:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0Yo/xoB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA561A76C7;
	Fri,  1 Nov 2024 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730473198; cv=none; b=OcTz/rDK94vDf0fkIDW7/4Wm/mHZVfYw3qA80H+AWfRM6vDnwku9f6304fiS1DqxWid3Y4Ukpa+wApRQ5mehimfhOqsoKPgofLRQ1iHPCNIRXnQ9+Qm08C7p7syyqSkSXqA1ORjzgM3p7fua5YtXxGBkVQxvvEdmkIA8+mTiFeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730473198; c=relaxed/simple;
	bh=3bMwQVXOgP3wNeVR1dq0E85K3PeuAuQVja79ikYM2XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9Ha1JdH1LRsoDQPhe5c4csOP77MtTRgeAh2+dDNej+UAbJqEyQ3WRKVn2RHk1i/uAl1sQ8ACbqwcUKrMKmwRGrg1YJmfOh+iWRUXF0uPmgxmyDvdx07gk/Ic6wwJaBBB8/3s/p3JH7YyDE6c42L0ZYv/oHZo38LTpU1WI9TfnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0Yo/xoB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20caea61132so18142745ad.2;
        Fri, 01 Nov 2024 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730473196; x=1731077996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9eGIngRauW1UIGfd9PdLFIGiBeWYjimj/krraQmp0L0=;
        b=l0Yo/xoBNjKNO7d1EgmkFS66RNKyimKWmC8Ui2z85tm4/7oWXGNTWaq7YGE1FsX44W
         VZYHYZ4IoQmiK8Onq/+E95IboRX57zNIrbXggienIRXKH3UcLappt8+5PApEGykaMw7I
         +JngFu1slAKG/GfXxQMHLtV/SWbr9zZjvmh7j77AX7Vlkr2PPUkVoYKOD5Ljv5WS/aYe
         zQIW+tx4q1ScvIoPvpOEh+o0Y/zS42wAaofeCghrM89VshDDe4hnkxeZZKRrjziYCJ9n
         AmIoDCxn8w5gv5NHNGtQc8CUfbVWRY7eQL8+kw+hyAK8AtW5qO2XegXo2mDPrZnx2tuX
         eXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730473196; x=1731077996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9eGIngRauW1UIGfd9PdLFIGiBeWYjimj/krraQmp0L0=;
        b=gSB9SyW7ieUAf5vOVIWKdL6fomzSEWk9KlHjOkDw+gi4qQ4H4/8lSPFSQsbyZ9ddo0
         cSeA8H81JnrSpCnk331c6pBGuVwWmnm1JNKSI33aR53+flwtwA2mzaOPUhBVxv6gnIpl
         LXnyEo0yDSU8szYc6EfOmmCAJoxV79zCOnXzzwwS/bJY9YP3P+5uL7EVMS/VyKDN6EKL
         GtIBFAtMs6Ypxf6MjcffmEqd7XbRROc0hWsRrK1ad8bbnxJ4t5Al8mtuuIIitbdfXoU4
         h9erOySE/E/zpccQ6MJbXj960dXEEP55whB9xDZ+CWA6jqL2sdBf4GZv58BSN7MjJiPG
         Q4PA==
X-Forwarded-Encrypted: i=1; AJvYcCUNzNg9ot+AzFhttjEqdm503ayXuKNQTe8RRwQXFfzK32cSXXhcFn4UJpXQtFk5S+L272BDPr5AjLjD@vger.kernel.org, AJvYcCVhmSI9gIyxaev+Cm3ZxCIut1/WWDc7D3BA5kXoOrOKaBTdDi+GjqeIBZgWs4SwHksGOUXWCOXDQeLd@vger.kernel.org, AJvYcCWSTcyrdOcITNFluqd0q9N4/TxrBOvsIAPTHZOCa+Wpa+XMoANY+WsEAP8r4jD3oNO1bUmwWGDN/tvWYUKh@vger.kernel.org, AJvYcCXFEOTzNnexWUbYAUWPBaxMrQK1Es5S/y8bfjd2UvxSplsvlyIwzGRA3vDmZWOmMzXz6/ZakgDEKMEz7E0=@vger.kernel.org, AJvYcCXe2XoqjebOciOnJaOXK+wFFATcIK6r8BMb1AqnIzK6vOiRBigqzAFyT8ATR0DLGdJt1jRY2jLtPiHM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt/y8udTTw7O68Q4npJwf/chxuDgiUMGyE2MYOG2+jj2Ppo/dF
	/RiQi/EWFQp4NdNyYTmducnxsrn05AcAUF2NcAVujoNher7Ndg3t
X-Google-Smtp-Source: AGHT+IFJV6XaO9ugF55WOE9V5wx/QZRvczx+bhWTlXqEzysfABS2WlJPihoaAQfK4h8sO7bqmkBTPg==
X-Received: by 2002:a17:903:22ce:b0:20c:a692:cf1e with SMTP id d9443c01a7336-2111af5aa61mr49596165ad.43.1730473195830;
        Fri, 01 Nov 2024 07:59:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057f5872sm22280565ad.295.2024.11.01.07.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:59:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 1 Nov 2024 07:59:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 2/6] hwmon: (pmbus/core) improve handling of write
 protected regulators
Message-ID: <228997a3-fd6e-4028-a822-1507d43bcf84@roeck-us.net>
References: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
 <20241024-tps25990-v3-2-b6a6e9d4b506@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024-tps25990-v3-2-b6a6e9d4b506@baylibre.com>

On Thu, Oct 24, 2024 at 08:10:36PM +0200, Jerome Brunet wrote:
> Writing PMBus protected registers does succeed from the smbus perspective,
> even if the write is ignored by the device and a communication fault is
> raised. This fault will silently be caught and cleared by pmbus irq if one
> has been registered.
> 
> This means that the regulator call may return succeed although the
> operation was ignored.
> 
> With this change, the operation which are not supported will be properly
> flagged as such and the regulator framework won't even try to execute them.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/hwmon/pmbus/pmbus.h      |  4 ++++
>  drivers/hwmon/pmbus/pmbus_core.c | 35 ++++++++++++++++++++++++++++++++++-
>  include/linux/pmbus.h            | 14 ++++++++++++++
>  3 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index d605412a3173b95041524285ad1fde52fb64ce5a..ddb19c9726d62416244f83603b92d81d82e64891 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -487,6 +487,8 @@ struct pmbus_driver_info {
>  /* Regulator ops */
>  
>  extern const struct regulator_ops pmbus_regulator_ops;
> +int pmbus_regulator_init_cb(struct regulator_dev *rdev,
> +			    struct regulator_config *config);
>  
>  /* Macros for filling in array of struct regulator_desc */
>  #define PMBUS_REGULATOR_STEP(_name, _id, _voltages, _step, _min_uV)  \
> @@ -501,6 +503,7 @@ extern const struct regulator_ops pmbus_regulator_ops;
>  		.n_voltages = _voltages,			\
>  		.uV_step = _step,				\
>  		.min_uV = _min_uV,				\
> +		.init_cb = pmbus_regulator_init_cb,		\
>  	}
>  
>  #define PMBUS_REGULATOR(_name, _id)   PMBUS_REGULATOR_STEP(_name, _id, 0, 0, 0)
> @@ -516,6 +519,7 @@ extern const struct regulator_ops pmbus_regulator_ops;
>  		.n_voltages = _voltages,			\
>  		.uV_step = _step,				\
>  		.min_uV = _min_uV,				\
> +		.init_cb = pmbus_regulator_init_cb,		\
>  	}
>  
>  #define PMBUS_REGULATOR_ONE(_name)   PMBUS_REGULATOR_STEP_ONE(_name, 0, 0, 0)
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 085a4dc91d9bad3d2aacdd946b74a094ea9ae458..7bdd8f2ffcabc51500437182f411e9826cd7a55d 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2721,8 +2721,21 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>  	if (!(data->flags & PMBUS_NO_WRITE_PROTECT)) {
>  		ret = _pmbus_read_byte_data(client, 0xff, PMBUS_WRITE_PROTECT);
>  
> -		if (ret > 0 && (ret & PB_WP_ANY))
> +		switch (ret) {

This changes semantics. The mask for PB_WP_ANY was there explicitly to
avoid situations where vendors set more than those bits for whatever
reason. With this change, write protect status will no longer be
recognized for such devices.

Yes, I know, "the standard says", but standard violations are common
with PMBus devices. That is the whole point of all those callbacks.

Long story short, please do not make changes like this. "ret" still needs
to be masked.

Guenter

