Return-Path: <linux-i2c+bounces-3000-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BDF8A877D
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 17:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9FC92818F6
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 15:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AD61474C1;
	Wed, 17 Apr 2024 15:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHnWeXsg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED53142625;
	Wed, 17 Apr 2024 15:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713367504; cv=none; b=hBwftHdpZK9BYc39HWvfkzm/JpClBPNBdsbYgjhOaxdkygmXQxW09j03K+AHkrox6YEgClU1toLlUkadmv1wbu0jPjsYjveyCGLN2783rHgKr9nOCPvQ7mLrZwnnXDNVQGbXBKoPxX4GdL9uEguPQYauAm7MvFE1E9ye/u20ky0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713367504; c=relaxed/simple;
	bh=GbEV6DcWZot6KJSDPPnWX8lMsWU0TcGngMUSJ4shjiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNi21QJSKriOv5e5MjZpho05VIN5d3jTvsvYAW1xWhHWuakUyjqgOAKQ4LH3CqAIfGwOkGnkz/j7uWA9/9yf3tA8lRf63pDXR1r/2jl6grO3FjtPLmYe9pRloIzI+6en/QTA+YQP/nMYTe6rJa3nrFNtw3hn6p8OAc2l/P8JXeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHnWeXsg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e3c9300c65so50253225ad.0;
        Wed, 17 Apr 2024 08:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713367502; x=1713972302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cmvhx+Oul5Xx3UUXy/kPtEtIBtMlVAQYlRqaqkPQiQ0=;
        b=VHnWeXsgJ0juYQYR4iM9d6DVYvEFRNzK8fI1gEJuCj+/a6WlW/QjjqN6Lv1tmMVGFd
         lwQvE7qGd0/QD+OZLiL7SiZWAee91iHWS+tQN/mlqNXGnwFXOYsrtMj5+JX4AgMC6+CS
         GQBuAnffxcrpgfc5TqLEY/D6mqTz1kVJYUEKU+ueYW0baidpRz56WpeM2KQaw9P/UwFk
         4064IpQpedCeyl/wGfM40twy2uzqjTjFYx6MdFufvWLPUAMxzpcrKV1VhyADKMJABr2t
         nJakyGIvUd9CDf6c5TsbZHzaPVtTR8jzXglM5lEKfLjR/azhEilWE/To+ixwTRPeGtps
         IPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713367502; x=1713972302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmvhx+Oul5Xx3UUXy/kPtEtIBtMlVAQYlRqaqkPQiQ0=;
        b=o/ODnLGbISEXfxaaurYq7IYTIy9oug1A9VguU63X1aaxQ19h0fdtceU7uNaLCcFE/L
         egPTYOTZcJhT7HDfAzGEIptCsf4RFoq2UH31GBq9wqvYX+bUEb3PNAPAxaCpuGVuQiBp
         sP7BhqOXxaKE7L/bVGeqEF6vokj/YpSj262yMNUVWMGAN/nYcHq5YjQDwsndF6uBxijA
         6gXqegl3u1gKwaQEcOT4LiYx/ieW3oVZTgvSVtYNmwfUBu4SNbzxImImaHNMux1IVH2W
         82GiLBv4xW6FpFzmu6wNDeiV5dyBMa0X4DP2ltglUmyz/Slz0OtEhmClTniNtav3ujje
         2xkw==
X-Forwarded-Encrypted: i=1; AJvYcCUu7AKCyePBeRcib7agd6UaOwcImXkPm3VVPo0Av7LbwstvQmn3YtQMUMJFXXz6+lKoYfRYw7tyWDIY4bE8GJijeW108u67etUon8yk+AiBXXIfD+UXNZxyfjvPlc8CsLUvVLQYbts1JLvjNndfhVgg2FdeoZWplptMfqMw5bKZSdEvTPrDvSl8wewcSF20W7VeVyG7CrXzm53vmqiC1g==
X-Gm-Message-State: AOJu0Yxwja7jETS+xTdaIhgmiVVc0y8G3SgKWdyF7dcKLuS8iZJJgmGa
	RbI9PHpecnhuvBO889KX7nXxflHY+v2vO9I22tSZSqyrKrZJdY/l
X-Google-Smtp-Source: AGHT+IE7+zSbCFlNgD0i133Rt+SrZ/QhS0z5wU3Ww+NagxvK2QRzQcThaxpimlXKlWkgkvrKbO2VoA==
X-Received: by 2002:a17:902:c1c5:b0:1e4:4b50:1b0a with SMTP id c5-20020a170902c1c500b001e44b501b0amr16719098plc.44.1713367501624;
        Wed, 17 Apr 2024 08:25:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902e5c200b001e446fe6843sm11678463plf.79.2024.04.17.08.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 08:25:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 17 Apr 2024 08:24:59 -0700
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
Message-ID: <62f878f4-a4fb-4e3c-8eec-d1be5ba165a4@roeck-us.net>
References: <20240417000722.919-1-jose.sanbuenaventura@analog.com>
 <20240417000722.919-3-jose.sanbuenaventura@analog.com>
 <b36db2c0-db31-4304-8e58-aa358ab811c5@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b36db2c0-db31-4304-8e58-aa358ab811c5@roeck-us.net>

On Tue, Apr 16, 2024 at 05:32:46PM -0700, Guenter Roeck wrote:
> On Wed, Apr 17, 2024 at 08:07:22AM +0800, Jose Ramon San Buenaventura wrote:
> > Adding support for adm1281 which is similar to adm1275
> > 
> > ADM1281 has STATUS_CML read support which is also being added.
> > 
> > Signed-off-by: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
> > ---
> >  Documentation/hwmon/adm1275.rst | 14 +++++++++++---
> >  drivers/hwmon/pmbus/Kconfig     |  4 ++--
> >  drivers/hwmon/pmbus/adm1275.c   | 27 +++++++++++++++++++++++++--
> >  3 files changed, 38 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm1275.rst
> > index 804590eea..467daf8ce 100644
> > --- a/Documentation/hwmon/adm1275.rst
> > +++ b/Documentation/hwmon/adm1275.rst
> > @@ -43,6 +43,14 @@ Supported chips:
> >  
> >      Datasheet: www.analog.com/static/imported-files/data_sheets/ADM1278.pdf
> >  
> > +  * Analog Devices ADM1281
> > +
> > +    Prefix: 'adm1281'
> > +
> > +    Addresses scanned: -
> > +
> > +    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/adm1281.pdf
> > +
> >    * Analog Devices ADM1293/ADM1294
> >  
> >      Prefix: 'adm1293', 'adm1294'
> > @@ -58,10 +66,10 @@ Description
> >  -----------
> >  
> >  This driver supports hardware monitoring for Analog Devices ADM1075, ADM1272,
> > -ADM1275, ADM1276, ADM1278, ADM1293, and ADM1294 Hot-Swap Controller and
> > +ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294 Hot-Swap Controller and
> >  Digital Power Monitors.
> >  
> > -ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1293, and ADM1294 are hot-swap
> > +ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294 are hot-swap
> >  controllers that allow a circuit board to be removed from or inserted into
> >  a live backplane. They also feature current and voltage readback via an
> >  integrated 12 bit analog-to-digital converter (ADC), accessed using a
> > @@ -144,5 +152,5 @@ temp1_highest		Highest observed temperature.
> >  temp1_reset_history	Write any value to reset history.
> >  
> >  			Temperature attributes are supported on ADM1272 and
> > -			ADM1278.
> > +			ADM1278, and ADM1281.
> >  ======================= =======================================================
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index 557ae0c41..9c1d0d7d5 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -51,8 +51,8 @@ config SENSORS_ADM1275
> >  	tristate "Analog Devices ADM1275 and compatibles"
> >  	help
> >  	  If you say yes here you get hardware monitoring support for Analog
> > -	  Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1293,
> > -	  and ADM1294 Hot-Swap Controller and Digital Power Monitors.
> > +	  Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1281,
> > +	  ADM1293, and ADM1294 Hot-Swap Controller and Digital Power Monitors.
> >  
> >  	  This driver can also be built as a module. If so, the module will
> >  	  be called adm1275.
> > diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> > index e2c61d6fa..6c3e8840f 100644
> > --- a/drivers/hwmon/pmbus/adm1275.c
> > +++ b/drivers/hwmon/pmbus/adm1275.c
> > @@ -18,7 +18,7 @@
> >  #include <linux/log2.h>
> >  #include "pmbus.h"
> >  
> > -enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm1294 };
> > +enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1281, adm1293, adm1294 };
> >  
> >  #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
> >  #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
> > @@ -101,6 +101,7 @@ struct adm1275_data {
> >  	bool have_pin_max;
> >  	bool have_temp_max;
> >  	bool have_power_sampling;
> > +	bool have_status_cml;
> >  	struct pmbus_driver_info info;
> >  };
> >  
> > @@ -469,6 +470,22 @@ static int adm1275_read_byte_data(struct i2c_client *client, int page, int reg)
> >  				ret |= PB_VOLTAGE_UV_WARNING;
> >  		}
> >  		break;
> > +	case PMBUS_STATUS_CML:
> > +		if (!data->have_status_cml)
> > +			return -ENXIO;
> > +
> > +		ret = pmbus_read_byte_data(client, page, PMBUS_STATUS_BYTE);
> > +		if (ret < 0)
> > +			break;
> 
> You'll have to explain why this additional status byte read
> is necessary (while it isn't necessary for all other chips supporting
> PMBUS_STATUS_CML).
> 

After looking more into the existing PMBus code and into this patch,
I really fail to understand why the above change would be needed.
The PMBus core code already reads the status register to check if
there is a communication error. I fail to see why it would be necessary
to do it again, and why it would be necessary to change behavior for
the other chips supported by this driver.

Guenter

