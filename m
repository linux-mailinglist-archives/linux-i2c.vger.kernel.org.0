Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457B433288B
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Mar 2021 15:26:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhCIO0W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 09:26:22 -0500
Received: from mga09.intel.com ([134.134.136.24]:11437 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230451AbhCIO0O (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Mar 2021 09:26:14 -0500
IronPort-SDR: tjDQhzUvzCeyzPcXOWQ4hNA0+J5X8AaJAe1qSH2y4S7E4j/q2EWl387NdbHCj6vIJktQRl4N11
 43u8gYiCI8OQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="188347674"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="188347674"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 06:26:14 -0800
IronPort-SDR: s9X2yfW6Sqr2H8WznM/Jn/ghIeEeydpD1JuDB1qPWasgwAZedzvPlTr2n6FpJqbVcmYJ77EToE
 /rutnlWYNiMw==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="386240577"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 06:26:12 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lJdJJ-00B540-SS; Tue, 09 Mar 2021 16:26:09 +0200
Date:   Tue, 9 Mar 2021 16:26:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Subject: Re: [PATCH] i2c: add i2c bus driver for amd navi gpu
Message-ID: <YEeFgZSIY5lb2ubP@smile.fi.intel.com>
References: <20210309133147.1042775-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210309133147.1042775-1-Sanket.Goswami@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 09, 2021 at 07:01:47PM +0530, Sanket Goswami wrote:

i2c: -> i2c: designware:
add i2c bus driver -> add a driver
amd -> AMD
gpu -> GPU

in the subject

> Latest AMDGPU NAVI cards have USB Type-C interface which can be accessed
> over I2C.

I didn't get this. You mean that USB traffic over I²C? This sounds insane
for a least. Maybe something else is there and description is not fully
correct?

> The Type-C controller has integrated designware i2c which is

DesignWare

> exposed as a PCI device to the AMD platform.
> 
> Also there exists couple of notable IP problems that are dealt as a
> workaround:
> - I2C transactions work on a polling mode as IP does not generate
> interrupt.
> 
> - I2C reads commands are sent twice to address the IP issues.

Please, read this article: https://chris.beams.io/posts/git-commit/

...

> +#define AMD_UCSI_INTR_EN	0xD

Why it's capitalized?

...

>  #include "i2c-designware-core.h"

+ Blank line

> +#define AMD_TIMEOUT_MSEC_MIN	10000
> +#define AMD_TIMEOUT_MSEC_MAX	11000

Use unit suffix in the definitions.

...

> +static void i2c_dw_configure_bus(struct dw_i2c_dev *i2cd)

Why all this is customized? Why FIFO can't be autodetected?

...

> +/* Initiate and continue master read/write transaction with polling
> + * based transfer routine and write messages into the tx buffer.
> + */

Wrong multi-line comment style.

...

> +static int amd_i2c_dw_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)

Why do you need a custom function for that? Can it be generic and not AMD
specific?

...

> +	/* Enable ucsi interrupt */
> +	if (dev->flags & AMD_NON_INTR_MODE)
> +		regmap_write(dev->map, AMD_UCSI_INTR_REG, AMD_UCSI_INTR_EN);

This is looks like a hack. Why is it here?

...

> +	if (dev->flags & AMD_NON_INTR_MODE)
> +		return amd_i2c_dw_master_xfer(adap, msgs, num);

Ditto.

...

> +int amd_i2c_adap_quirk(struct dw_i2c_dev *amdev)
> +{
> +	struct i2c_adapter *amdap = &amdev->adapter;

> +	int ret;

See below.

> +	if (!(amdev->flags & AMD_NON_INTR_MODE))
> +		return -ENODEV;

> +	return i2c_add_numbered_adapter(amdap);
> +
> +	return ret;

What the second one does?

> +}

...

> +	ret = amd_i2c_adap_quirk(dev);
> +	if (ret != -ENODEV)

This is ugly. Can we run quirk if and only if we have an AMD chip?

> +		return ret;

...

>  #define DRIVER_NAME "i2c-designware-pci"
> +#define AMD_CLK_RATE	100000

Add units.

...

> +/* NAVI-AMD HCNT/LCNT/SDA hold time */
> +static struct dw_scl_sda_cfg navi_amd_config = {
> +	.ss_hcnt = 0x1ae,
> +	.ss_lcnt = 0x23a,
> +	.sda_hold = 0x9,
> +};

(1)

...

> +static int i2c_dw_populate_client(struct dw_i2c_dev *i2cd)
> +{
> +	struct i2c_board_info	*i2c_dw_ccgx_ucsi;
> +	struct i2c_client	*ccgx_client;
> +
> +	i2c_dw_ccgx_ucsi = devm_kzalloc(i2cd->dev, sizeof(*i2c_dw_ccgx_ucsi), GFP_KERNEL);
> +	if (!i2c_dw_ccgx_ucsi)
> +		return -ENOMEM;
> +
> +	strscpy(i2c_dw_ccgx_ucsi->type, "ccgx-ucsi", sizeof(i2c_dw_ccgx_ucsi->type));
> +	i2c_dw_ccgx_ucsi->addr = 0x08;
> +	i2c_dw_ccgx_ucsi->irq = i2cd->irq;
> +
> +	ccgx_client = i2c_new_client_device(&i2cd->adapter, i2c_dw_ccgx_ucsi);
> +	if (!ccgx_client)
> +		return -ENODEV;
> +
> +	return 0;
> +}

This is the same as in nVidia GPU I²C driver. Can you do a preparatory changes
to deduplicate this?

Also why (1) and this can't be instantiated from ACPI / DT?

-- 
With Best Regards,
Andy Shevchenko


