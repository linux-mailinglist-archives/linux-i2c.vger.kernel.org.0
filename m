Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334291E4927
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 18:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389858AbgE0QDj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 12:03:39 -0400
Received: from mga17.intel.com ([192.55.52.151]:50970 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389795AbgE0QDj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 12:03:39 -0400
IronPort-SDR: p0mqiEHTgTlaRFuuPyx1/dBRvnN5lyjBviCdX3gO7l9jGODZMc7QH+ict/vNkF6KYCMYPRZSdX
 lQevNH/BD1Sw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 09:03:37 -0700
IronPort-SDR: x1pZvTwORTN5bLYBpVQrFLE6Dk3x9Ny1cLDQ6UDdPDjBtXeXTz9Uw1iuRPK8c3SxOMGIRxkMl6
 p+Ro3FWXICAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="302145230"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 27 May 2020 09:03:34 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdyWn-009FwM-8P; Wed, 27 May 2020 19:03:37 +0300
Date:   Wed, 27 May 2020 19:03:37 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 08/11] i2c: designware: Convert driver to using regmap
 API
Message-ID: <20200527160337.GL1634618@smile.fi.intel.com>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527153046.6172-9-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527153046.6172-9-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 06:30:43PM +0300, Serge Semin wrote:
> Seeing the DW I2C driver is using flags-based accessors with two
> conditional clauses it would be better to replace them with the regmap
> API IO methods and to initialize the regmap object with read/write
> callbacks specific to the controller registers map implementation. This
> will be also handy for the drivers with non-standard registers mapping
> (like an embedded into the Baikal-T1 System Controller DW I2C block, which
> glue-driver is a part of this series).
> 
> As before the driver tries to detect the mapping setup at probe stage and
> creates a regmap object accordingly, which will be used by the rest of the
> code to correctly access the controller registers. In two places it was
> appropriate to convert the hand-written read-modify-write and
> read-poll-loop design patterns to the corresponding regmap API
> ready-to-use methods.
> 
> Note the regmap IO methods return value is checked only at the probe
> stage. The rest of the code won't do this because basically we have
> MMIO-based regmap so non of the read/write methods can fail (this also
> won't be needed for the Baikal-T1-specific I2C controller).

...

> +	struct regmap_config map_cfg = {
> +		.reg_bits = 32,
> +		.val_bits = 32,
> +		.reg_stride = 4,
> +		.disable_locking = true,
> +		.reg_read = dw_reg_read,
> +		.reg_write = dw_reg_write,

> +		.max_register = DW_IC_COMP_TYPE

Perhaps leave comma here as well.

> +	};

...

> +	/*
> +	 * Note we'll check the return value of the regmap IO accessors only
> +	 * at the probe stage. The rest of the code won't do this because
> +	 * basically we have MMIO-based regmap so non of the read/write methods
> +	 * can fail.
> +	 */
> +	dev->map = devm_regmap_init(dev->dev, NULL, dev, &map_cfg);
> +	if (IS_ERR(dev->map)) {
> +		dev_err(dev->dev, "Failed to init the registers map\n");

> +		return PTR_ERR(dev->map);
> +	}
> +
>  	return 0;

	return PTR_ERR_OR_ZERO(dev->map);

-- 
With Best Regards,
Andy Shevchenko


