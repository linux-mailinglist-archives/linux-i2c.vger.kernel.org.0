Return-Path: <linux-i2c+bounces-8087-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9CC9D3CCB
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 14:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B35992849F9
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 13:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D050C1B5338;
	Wed, 20 Nov 2024 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4v0JyRq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1893D1AAE38;
	Wed, 20 Nov 2024 13:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732110750; cv=none; b=Wo8aZ/NdCE9sn6vUpPgN0k2iWtN0IT9XmC/YQ+7ul5DR1qL0S3SlI2eHmezS6oaibIJYTR2+w8ILWrZNZ56KKoWeqj0XDD/kg6xnoSzY9N/CkOOCnCYw3KbBcXEng7YO5epZ8lZumH8EIM1xVrl0Z7A8EzXP/P9S6HF7CAPlhOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732110750; c=relaxed/simple;
	bh=PQrcyJYdhYqVRHp1hFJ6nsEgP+ywNZS0Nb4DS9YUiyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKVDZc3lj/7NI6INANoBGyhSKONNlx6odZxoXRgxvktamTXyciL7cAqpbDBGS6OE/7DJu6bFESFrQP65lr23BYq/7maOYGJSJkbzLQEekX8F3MV1LaBeVppqhECQxXC4oz6mnUKvElZTqgXNOrZbT9cChPFGLk4it+8c8M+ipGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4v0JyRq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732110749; x=1763646749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PQrcyJYdhYqVRHp1hFJ6nsEgP+ywNZS0Nb4DS9YUiyk=;
  b=d4v0JyRqzVOpyXBXV6plXgeKV4TLLnAnPIDumP626OEQcFXv58HhQ2na
   rjZfj4mpxcpjwU+Kv8EDBCP8D2GIs2DDlIU9LI9ept6WjkYej9G8buDht
   a/QHEOtTcvsCmMLXzMqmN+nPNgXkzobpfmgWByshyIhdZDan2HOLIDsCc
   WvkW/snUIk5Gr9clGbXQ7//94WMkwHluSp6ZWuWJyua1S1dXK2FTo9bkt
   3e7GO3cR4Lza9qiG/5797w8bqDte/OSROl0qNMq0p/70Uc4YMfCG1QR7C
   SVvkNbX4h/5sCh3s4YZ5AxJPfygnKhm3Kj7K7gvLSl2tVMpMkP/2aZWf/
   w==;
X-CSE-ConnectionGUID: wzH90gTlTYG4/mhsXQ9elA==
X-CSE-MsgGUID: FbB2pMccRpm8dhRi8nYrPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="35950582"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="35950582"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 05:52:29 -0800
X-CSE-ConnectionGUID: ewyTpNRjTmiV5Njm8LNmjg==
X-CSE-MsgGUID: gcsYJZEzQxOLfSRDFTU9kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="94378389"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 05:52:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tDl82-0000000Gj02-0ORK;
	Wed, 20 Nov 2024 15:52:22 +0200
Date: Wed, 20 Nov 2024 15:52:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radu Sabau <radu.sabau@analog.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051,
 adp1055 and ltp8800
Message-ID: <Zz3plZOyMcxn54_h@smile.fi.intel.com>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-3-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241120035826.3920-3-cedricjustine.encarnacion@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 20, 2024 at 11:58:26AM +0800, Cedric Encarnacion wrote:

I would start the commit message with the plain English sentence that describes
the list given below. E.g., "Introduce support for the following components:".

>     ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
>     ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
>     LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC µModule Regulator
> 
> The LTP8800 is a family of step-down μModule regulators that provides
> microprocessor core voltage from 54V power distribution architecture.
> LTP8800 features telemetry monitoring of input/output voltage, input
> current, output power, and temperature over PMBus.

...

>    - Radu Sabau <radu.sabau@analog.com>
>  
> -
>  Description
>  -----------

Stray change.

...

> -This driver supprts hardware monitoring for Analog Devices ADP1050 Digital
> -Controller for Isolated Power Supply with PMBus interface.
> +This driver supports hardware monitoring for Analog Devices ADP1050, ADP1051, and
> +ADP1055 Digital Controller for Isolated Power Supply with PMBus interface.
>  
> -The ADP1050 is an advanced digital controller with a PMBus™
> +The ADP105X is an advanced digital controller with a PMBus™

Can we use small x to make it more visible that it's _not_ the part of the
name, but a glob-like placeholder?

>  interface targeting high density, high efficiency dc-to-dc power
>  conversion used to monitor system temperatures, voltages and currents.

...

> +#if IS_ENABLED(CONFIG_SENSORS_ADP1050_REGULATOR)

Why? Is the data type undefined without this?

> +static const struct regulator_desc adp1050_reg_desc[] = {
> +	PMBUS_REGULATOR_ONE("vout"),
> +};
> +#endif /* CONFIG_SENSORS_ADP1050_REGULATOR */

Note, this can be dropped anyway in order to use PTR_IF() below, if required.

...

> +#if IS_ENABLED(CONFIG_SENSORS_ADP1050_REGULATOR)
> +	.num_regulators = 1,
> +	.reg_desc = adp1050_reg_desc,
> +#endif

Ditto, are the fields not defined without the symbol?

...

>  static int adp1050_probe(struct i2c_client *client)
>  {
> -	return pmbus_do_probe(client, &adp1050_info);
> +	const struct pmbus_driver_info *info;
> +
> +	info = device_get_match_data(&client->dev);

Why not i2c_get_match_data()?

> +	if (!info)
> +		return -ENODEV;
> +
> +	return pmbus_do_probe(client, info);
>  }

...

>  static const struct i2c_device_id adp1050_id[] = {
> -	{"adp1050"},
> +	{ .name = "adp1050", .driver_data = (kernel_ulong_t)&adp1050_info},

Please, split this patch to at least two:
1) Introduce chip_info;
2) add new devices.

> +	{ .name = "adp1051", .driver_data = (kernel_ulong_t)&adp1051_info},
> +	{ .name = "adp1055", .driver_data = (kernel_ulong_t)&adp1055_info},
> +	{ .name = "ltp8800", .driver_data = (kernel_ulong_t)&ltp8800_info},
>  	{}
>  };

-- 
With Best Regards,
Andy Shevchenko



