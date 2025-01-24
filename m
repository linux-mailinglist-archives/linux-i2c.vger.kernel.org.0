Return-Path: <linux-i2c+bounces-9191-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31286A1BA3B
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 17:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DB00188FD79
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8DA18E057;
	Fri, 24 Jan 2025 16:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBCHMy40"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A3CDF58;
	Fri, 24 Jan 2025 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737735795; cv=none; b=kNHqV2C0szGUUnNtIuwpIONzVWf3Sr/tzfGpQyL3Xjy12f6D+fLq9RbEotMNPawyxoTYgh7BrtG7LHSoKdvJ518Q00a9NGyl4Z4LHvGJOR14XRrpFMHzw4EoYGVHyoS5HV3lT0/SRP20YCsrXcIZLf77CgFf2jOzkimW5d1vEQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737735795; c=relaxed/simple;
	bh=7ROf5X1kkkn8cYrBiuVKHlgFOAINugS1KRr6VcCft5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDVNCMl+G8VbKsemTIB4vLppSN5qcSb/OUUjQVr7WBXLjt+/G/6o2FtID4jifRm1CA+TPpNmoHnxIw9Td3WPUhpZHW/AMhCvq2g8HX/nnbDxssN7PLnRquGaB4FkXGFQ1gyZyP+sqk0nf6xukRMya7JDZK4CnRPp+LWKgITkYdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBCHMy40; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737735794; x=1769271794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7ROf5X1kkkn8cYrBiuVKHlgFOAINugS1KRr6VcCft5w=;
  b=RBCHMy40JLi+p9uU+W24uiNfleDmGQiMB/6ILwG0Jjgq9pNrUFZaXWB1
   1APNBTbvewoY4QLG7Tpz6rABqFLeT3THX0yVe21pOSmv3c12p1eEnLXgW
   Hdcs+2HOubY5aBM/6oQ6l6CZHMDlwPzXFgkq/e2MGA7QpkkCpsg2naWEU
   /zDOSeJ/PkwxVDmyZmqXt9LYZPL2fHg/GxMuzjXMJOvdqd8t/lsiLBOGC
   KSPkwjX9Z8WE0S2+vBrv/RiI//+S999ojSixo0D0rS6s9/NeUU6FlEcLz
   lehUryuaaObHbr5494oRN7d5GqE+N2y3dOfOVVVfFguybuxkIEUZU+Waa
   Q==;
X-CSE-ConnectionGUID: enhnYXFPT7GtC7XiZyWYMw==
X-CSE-MsgGUID: EKX1MsOOSneZTOBCxI9t7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="60739782"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="60739782"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 08:23:14 -0800
X-CSE-ConnectionGUID: fRvFk+MbSNO24Rr97pSusg==
X-CSE-MsgGUID: Vw9OGhDXTr+G80KinyJWnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="108350103"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 08:23:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tbMSY-00000004rj1-2tYB;
	Fri, 24 Jan 2025 18:23:06 +0200
Date: Fri, 24 Jan 2025 18:23:06 +0200
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
Subject: Re: [PATCH v4 2/3] hwmon: (pmbus/adp1050): Add support for adp1051,
 adp1055 and ltp8800
Message-ID: <Z5O-avYZkWsD-Vka@smile.fi.intel.com>
References: <20250124151746.1130-1-cedricjustine.encarnacion@analog.com>
 <20250124151746.1130-3-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124151746.1130-3-cedricjustine.encarnacion@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 24, 2025 at 11:17:45PM +0800, Cedric Encarnacion wrote:
> Introduce hardware monitoring support for the following devices:
> 
>     ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
>     ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
>     LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC µModule Regulator
> 
> The ADP1051 and ADP1055 are similar digital controllers for high
> efficiency DC-DC power conversion while the LTP8800 is a family of
> step-down μModule regulators that provides microprocessor core voltage
> from 54V power distribution architecture. All of the above components
> features telemetry monitoring of input/output voltage, input current,
> output power, and temperature over PMBus.

...

>  static const struct i2c_device_id adp1050_id[] = {
> -	{"adp1050"},
> +	{ .name = "adp1050", .driver_data = (kernel_ulong_t)&adp1050_info},
> +	{ .name = "adp1051", .driver_data = (kernel_ulong_t)&adp1051_info},
> +	{ .name = "adp1055", .driver_data = (kernel_ulong_t)&adp1055_info},
> +	{ .name = "ltp8800", .driver_data = (kernel_ulong_t)&ltp8800_info},

Seems like missing inner trailing space.

>  	{}
>  };

...

>  static const struct of_device_id adp1050_of_match[] = {
> -	{ .compatible = "adi,adp1050"},
> +	{ .compatible = "adi,adp1050", .data = &adp1050_info},
> +	{ .compatible = "adi,adp1051", .data = &adp1051_info},
> +	{ .compatible = "adi,adp1055", .data = &adp1055_info},
> +	{ .compatible = "adi,ltp8800", .data = &ltp8800_info},

Ditto.

>  	{}
>  };

-- 
With Best Regards,
Andy Shevchenko



