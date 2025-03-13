Return-Path: <linux-i2c+bounces-9826-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC80A5F912
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 15:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 575D7174FA8
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 14:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF0B26869D;
	Thu, 13 Mar 2025 14:53:44 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5B1267F66;
	Thu, 13 Mar 2025 14:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741877624; cv=none; b=aQf1mFqt8ivrRDeNYlbB4s1FvsyzIXrPRMWEIh8F3EyHAIE/zPfYnyYZKuCqd2RsqFOmMuDiSkmIBELXMzhBqOFLpuUJPVP7+e87y5+08Z8kbNdtCA7FmWpn/6L1O7lHcFv9HqZY4/95yDLacdXTqwbcMbansqas//UG3smHcOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741877624; c=relaxed/simple;
	bh=ACNhbo+748s6vuL5VPhC2h+iyzbM6KB6vcaUj5kFuz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=or69RkrpQCLc/yyanyMtbplkNOQ8tGzLgpvR0y9IPd8qRThdYxlLvIzM2gSixi0CNAl7Nk0SFG9xPoV6j0/f7liP/+KnehVmTTnU9D7IvXyxIZI6D2kW2Y1JFi+7+OxmlWBwoE9AjZhPi9AJ6hEyyQdEm+N5TCm0wDSXsD2YGxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: AtykRYgXS5yaaAGAfvyNwg==
X-CSE-MsgGUID: qYSYWts8Q1KcbUM2+vYGqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43200705"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="43200705"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 07:53:42 -0700
X-CSE-ConnectionGUID: qZc8nP1dQoe6521K17bSkw==
X-CSE-MsgGUID: QIK1RtelSM+yC++UfV4/yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="120964625"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 07:53:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tsjwF-00000002D0s-2wpD;
	Thu, 13 Mar 2025 16:53:35 +0200
Date: Thu, 13 Mar 2025 16:53:35 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [RFC PATCH v1 2/2] platform: toradex: add preliminary support
 for Embedded Controller
Message-ID: <Z9LxbzJ3zf0RT-JS@smile.fi.intel.com>
References: <20250313144331.70591-1-francesco@dolcini.it>
 <20250313144331.70591-3-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313144331.70591-3-francesco@dolcini.it>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 13, 2025 at 03:43:31PM +0100, Francesco Dolcini wrote:

> Add new platform driver for the Embedded Controller currently used
> in Toradex SMARC iMX8MP and SMARC iMX95.
> It currently provides power-off and restart (reset) handlers.

...

+ array_size.h
+ device.h
+ err.h

> +#include <linux/i2c.h>

+ mod_devicetable,h

> +#include <linux/module.h>
> +#include <linux/reboot.h>
> +#include <linux/regmap.h>

+ types.h

...

> +#define EC_CHIP_ID_REG                  0x00
> +#define EC_VERSION_REG_MAJOR            0x01
> +#define EC_VERSION_REG_MINOR            0x02
> +#define EC_CMD_REG                      0xD0
> +#define EC_REG_MAX                      0xD0
> +
> +#define EC_CHIP_ID_SMARC_IMX95          0x11
> +#define EC_CHIP_ID_SMARC_IMX8MP         0x12
> +
> +#define EC_POWEROFF_CMD                 0x01
> +#define EC_RESET_CMD                    0x02

Can you interleave the register offsets with the values in them, so we can
easily see the relationship?

...

> +struct tdx_ec {

> +	struct i2c_client *client;

Why do you need this? What for?..

> +	struct regmap *regmap;

...note, the device pointer you may retrieve from the regmap.

> +};

...

> +static int tdx_ec_register_power_off_restart(struct device *dev, struct tdx_ec *ec)
> +{
> +	int err;
> +
> +	err = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART,
> +					    SYS_OFF_PRIO_FIRMWARE,
> +					    tdx_ec_restart, ec);
> +	if (err)
> +		return err;

> +	err = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
> +					    SYS_OFF_PRIO_FIRMWARE,
> +					    tdx_ec_power_off, ec);
> +	return err;

	return devm_...

> +}

...

> +static int tdx_ec_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	u8 reg_val[EC_ID_VERSION_LEN];
> +	struct tdx_ec *ec;
> +	int err;
> +
> +	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> +	if (!ec)
> +		return -ENOMEM;
> +
> +	ec->client = client;

> +	i2c_set_clientdata(client, ec);

What for?

> +	ec->regmap = devm_regmap_init_i2c(client, &regmap_config);
> +	if (IS_ERR(ec->regmap))
> +		return PTR_ERR(ec->regmap);
> +
> +	err = regmap_bulk_read(ec->regmap, EC_CHIP_ID_REG, &reg_val, EC_ID_VERSION_LEN);
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "Cannot read id and version registers\n");
> +
> +	dev_info(dev, "Toradex Embedded Controller id %x - Firmware %d.%d\n",

Specifiers are semirandom. Why signed? Why x and not %u?

> +		 reg_val[0], reg_val[1], reg_val[2]);

> +	err = tdx_ec_register_power_off_restart(dev, ec);
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "Cannot register system restart handler\n");
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



