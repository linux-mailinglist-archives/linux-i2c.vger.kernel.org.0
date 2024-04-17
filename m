Return-Path: <linux-i2c+bounces-2991-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCA38A79E1
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 02:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54B551C210A3
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 00:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC6CEBE;
	Wed, 17 Apr 2024 00:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvB9P4mZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A5CEA4;
	Wed, 17 Apr 2024 00:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713313970; cv=none; b=imRlNAY8vPycG8LFJ3Y34xqPawkwjBhAnzBuVB1rzEb3IFs1wqQ5WHZc/zke28ZNflajToFZuzOqU8PG9XdX76D79qHj472pNFDOdu0N5pkR1aY8mFdD/y75sxvRUemouHPvCDpOeU7hCggFzrBA02/j3TD2VNMn8eMZPHTjFnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713313970; c=relaxed/simple;
	bh=NvGi+FNlytUml+cmQJqRuDecT3sUWEHb8pFeNB/SQyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1x9l5DwmFIFKXJJbIMNQ3JMpJqdc0neI+CcqIpKcMub5B9+MtWykUs1S371y2tOKZ0tFIAsbnloBntM2vheYpJ3yFsfyk3ARJSydGO/KUoc2Ji5YSxx2+9n/r2znQvteQlQgAsqglLJOYT6cgJYMAdvxNFrCwsPvRXt8nLnaR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvB9P4mZ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ee13f19e7eso3777579b3a.1;
        Tue, 16 Apr 2024 17:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713313968; x=1713918768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBLXmCe5xgYwBncJSh75UqOijAj7P8rNoETI4uyFWB4=;
        b=DvB9P4mZwgKa0TBhpwv1aR7TapZ83d2T9jWZAbs43x0d7lVEGxswdkBKDwu6F+hae8
         TDRFf4VQE7+UlZ+USJEezkKb+SgQvaRgi/5J5ZJUo6xjKXAkfSktOfbyWA8Egu2G7QHy
         X54DejV4Xf7moMy1bafTYdQPQ/mf3DnfQPRbO/c9r7gpS0RgSNPSHuLfWliOLmXi2EZ0
         hGLWtQARspZ1WQ3K5H50KDxzQgiuYlTe+pxROofMl0jLAeSdtZS0BmYyVDrvNVdhtCFh
         8+9Qv4aNROVTMpvMTK4bVlFfxnK3vhUjisa4K1SguYN9PjtwIOFVK1CR2yaqW6LEzb2P
         r2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713313968; x=1713918768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBLXmCe5xgYwBncJSh75UqOijAj7P8rNoETI4uyFWB4=;
        b=uXXQbAy/CH7nJ37wcFm+bd463eF7/uUwmv+H5PIADMpVwv5v9TbcFSZgM+W7hZ+U+O
         fBjTTZ8BI83Y3HK53cLcJiZCiF9t5Q6Oy1uFQynd3PGtGp5Rk2VMahCagxqOGxSoFH13
         DwV6LGaNnJTty1trXbuIijFI/pGGKaND0v/zo6xOWDlDeBxUKZd/IueRDvIMm9wJWyIv
         2m7WYyey8hv4rXZJmCIELeEb0SXm1oKeZrQ4+kwLZi9bIeI0w6IrAKkBustm4EXEOV4E
         LAZlr9cTS50ZL9PLV9Jwx/RkezzoJJ8QFfTgQTahiC50LcHuMzBnLpO6qwcVHLrn0I0j
         SzTw==
X-Forwarded-Encrypted: i=1; AJvYcCWYV0z8ibHEyVxtc0do/7r8xca7Z2jh1lQet+MFgidZSP29IbIIi0R8S4R28yUFr/5rMLV69UF5RZ1dEQW3p0SaIwCvbcigTNyzQgnJhMPmOJUHT2unIi5SSyQ/ysbkeQ678QJBYpa56XACjvvrWHRuWLG4lAJ1MRKozt4vLhOhasIgA7/3CeTkcwf22Oe/s19FY+ouIm9zR1wazUq5Sw==
X-Gm-Message-State: AOJu0Yyphdsexm/Evzv+q23xu8mRK15ZrmRe5KksrNXCIoVU8+ckVBmx
	mocUQwjA6xYeiOw/Rjr2V3Cm2HRGXoZS+p9YTOg+gSr74tPW8kcw
X-Google-Smtp-Source: AGHT+IFXpZgHULLuOHM11N6PHcuaja6jV0Vu39kPdBy7RbGfZrXTKlg2RMU950iDGPfOjness90bnw==
X-Received: by 2002:a05:6a00:1902:b0:6ec:fdcd:18eb with SMTP id y2-20020a056a00190200b006ecfdcd18ebmr14704468pfi.21.1713313968475;
        Tue, 16 Apr 2024 17:32:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e15-20020aa798cf000000b006ea6ca5295bsm9442494pfm.164.2024.04.16.17.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 17:32:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Apr 2024 17:32:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH 2/2] hwmon: pmbus: adm1275: add adm1281 support
Message-ID: <b36db2c0-db31-4304-8e58-aa358ab811c5@roeck-us.net>
References: <20240417000722.919-1-jose.sanbuenaventura@analog.com>
 <20240417000722.919-3-jose.sanbuenaventura@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417000722.919-3-jose.sanbuenaventura@analog.com>

On Wed, Apr 17, 2024 at 08:07:22AM +0800, Jose Ramon San Buenaventura wrote:
> Adding support for adm1281 which is similar to adm1275
> 
> ADM1281 has STATUS_CML read support which is also being added.
> 
> Signed-off-by: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
> ---
>  Documentation/hwmon/adm1275.rst | 14 +++++++++++---
>  drivers/hwmon/pmbus/Kconfig     |  4 ++--
>  drivers/hwmon/pmbus/adm1275.c   | 27 +++++++++++++++++++++++++--
>  3 files changed, 38 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm1275.rst
> index 804590eea..467daf8ce 100644
> --- a/Documentation/hwmon/adm1275.rst
> +++ b/Documentation/hwmon/adm1275.rst
> @@ -43,6 +43,14 @@ Supported chips:
>  
>      Datasheet: www.analog.com/static/imported-files/data_sheets/ADM1278.pdf
>  
> +  * Analog Devices ADM1281
> +
> +    Prefix: 'adm1281'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/adm1281.pdf
> +
>    * Analog Devices ADM1293/ADM1294
>  
>      Prefix: 'adm1293', 'adm1294'
> @@ -58,10 +66,10 @@ Description
>  -----------
>  
>  This driver supports hardware monitoring for Analog Devices ADM1075, ADM1272,
> -ADM1275, ADM1276, ADM1278, ADM1293, and ADM1294 Hot-Swap Controller and
> +ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294 Hot-Swap Controller and
>  Digital Power Monitors.
>  
> -ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1293, and ADM1294 are hot-swap
> +ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294 are hot-swap
>  controllers that allow a circuit board to be removed from or inserted into
>  a live backplane. They also feature current and voltage readback via an
>  integrated 12 bit analog-to-digital converter (ADC), accessed using a
> @@ -144,5 +152,5 @@ temp1_highest		Highest observed temperature.
>  temp1_reset_history	Write any value to reset history.
>  
>  			Temperature attributes are supported on ADM1272 and
> -			ADM1278.
> +			ADM1278, and ADM1281.
>  ======================= =======================================================
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 557ae0c41..9c1d0d7d5 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -51,8 +51,8 @@ config SENSORS_ADM1275
>  	tristate "Analog Devices ADM1275 and compatibles"
>  	help
>  	  If you say yes here you get hardware monitoring support for Analog
> -	  Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1293,
> -	  and ADM1294 Hot-Swap Controller and Digital Power Monitors.
> +	  Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1281,
> +	  ADM1293, and ADM1294 Hot-Swap Controller and Digital Power Monitors.
>  
>  	  This driver can also be built as a module. If so, the module will
>  	  be called adm1275.
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index e2c61d6fa..6c3e8840f 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -18,7 +18,7 @@
>  #include <linux/log2.h>
>  #include "pmbus.h"
>  
> -enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm1294 };
> +enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1281, adm1293, adm1294 };
>  
>  #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
>  #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
> @@ -101,6 +101,7 @@ struct adm1275_data {
>  	bool have_pin_max;
>  	bool have_temp_max;
>  	bool have_power_sampling;
> +	bool have_status_cml;
>  	struct pmbus_driver_info info;
>  };
>  
> @@ -469,6 +470,22 @@ static int adm1275_read_byte_data(struct i2c_client *client, int page, int reg)
>  				ret |= PB_VOLTAGE_UV_WARNING;
>  		}
>  		break;
> +	case PMBUS_STATUS_CML:
> +		if (!data->have_status_cml)
> +			return -ENXIO;
> +
> +		ret = pmbus_read_byte_data(client, page, PMBUS_STATUS_BYTE);
> +		if (ret < 0)
> +			break;

You'll have to explain why this additional status byte read
is necessary (while it isn't necessary for all other chips supporting
PMBUS_STATUS_CML).

Thanks,
Guenter

