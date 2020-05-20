Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580F51DB014
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 12:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgETKYy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 06:24:54 -0400
Received: from mga12.intel.com ([192.55.52.136]:3048 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgETKYy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 06:24:54 -0400
IronPort-SDR: 1jc4ByAPkSWJ0uDGtwtfLJ2D+xpUfdyFxAtjyIIrvqQ25RBxghZjJsaggaPuXsmqhvRN4sHpN+
 O74FsrGVzodw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 03:24:53 -0700
IronPort-SDR: Nhksymg73kKZB1ULTIzriSwEHijsFG3lboDHBnmMS2BN0DW2yzcwXvhIDWAJqgHL4zldive+jM
 9zD0x8K4JzHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,413,1583222400"; 
   d="scan'208";a="264633133"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 20 May 2020 03:24:49 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jbLu8-007omv-GV; Wed, 20 May 2020 13:24:52 +0300
Date:   Wed, 20 May 2020 13:24:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     ofery@google.com, brendanhiggins@google.com,
        avifishman70@gmail.com, tmaimon77@gmail.com, kfting@nuvoton.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, wsa@the-dreams.de,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200520102452.GP1634618@smile.fi.intel.com>
References: <20200520095113.185414-1-tali.perry1@gmail.com>
 <20200520095113.185414-3-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520095113.185414-3-tali.perry1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 20, 2020 at 12:51:12PM +0300, Tali Perry wrote:
> Add Nuvoton NPCM BMC I2C controller driver.

...

> +#ifdef CONFIG_DEBUG_FS

Why?!

> +#include <linux/debugfs.h>
> +#endif


...

> +/* Status of one I2C module */
> +struct npcm_i2c {
> +	struct i2c_adapter adap;

> +	struct device *dev;

Isn't it adap.dev->parent?

> +};

...

> +static void npcm_i2c_master_abort(struct npcm_i2c *bus)
> +{
> +	/* Only current master is allowed to issue a stop condition */

> +	if (npcm_i2c_is_master(bus)) {

	if (!npcm_i2c_is_master(bus))
		return;

?

> +		npcm_i2c_eob_int(bus, true);
> +		npcm_i2c_master_stop(bus);
> +		npcm_i2c_clear_master_status(bus);
> +	}
> +}

...

> +/* SDA status is set - TX or RX, master */
> +static void npcm_i2c_irq_handle_sda(struct npcm_i2c *bus, u8 i2cst)
> +{
> +	u8 fif_cts;

> +	if (bus->state == I2C_IDLE) {
> +		if (npcm_i2c_is_master(bus)) {

	if (a) {
		if (b) {
			...
		}
	}

==

	if (a && b) {
		...
	}

Check whole code for such pattern.

> +		}
> +
> +	/* SDA interrupt, after start\restart */
> +	} else {
> +		if (NPCM_I2CST_XMIT & i2cst) {
> +			bus->operation = I2C_WRITE_OPER;
> +			npcm_i2c_irq_master_handler_write(bus);
> +		} else {
> +			bus->operation = I2C_READ_OPER;
> +			npcm_i2c_irq_master_handler_read(bus);
> +		}
> +	}
> +}

...


> +	}
> +

+ /* 1MHz */ ?

> +	else if (bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {

> +	}
> +
> +	/* Frequency larger than 1 MHZ is not supported */
> +	else
> +		return -EINVAL;

...

> +	// master and slave modes share a single irq.

It's again being inconsistent with comment style. Choose one and fix all
comments accordingly (SPDX is another story, though)

...

> +static int i2c_debugfs_get(void *data, u64 *val)
> +{
> +	*val = *(u64 *)(data);
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(i2c_debugfs_ops, i2c_debugfs_get, NULL, "0x%02llx\n");

Why not to use debugfs_create_u64(), or how is it called?

> +static void i2c_init_debugfs(struct platform_device *pdev, struct npcm_i2c *bus)
> +{
> +	if (!npcm_i2c_debugfs_dir)
> +		return;
> +

> +	if (!pdev || !bus)
> +		return;

How is it possible?

> +	bus->debugfs = debugfs_create_dir(dev_name(&pdev->dev),
> +					  npcm_i2c_debugfs_dir);
> +	if (IS_ERR_OR_NULL(bus->debugfs)) {
> +		bus->debugfs = NULL;
> +		return;
> +	}

	struct dentry *d;

	d = create(...);
	if (IS_ERR_OR_NULL(d))
		return;

	bus->... = d;

> +
> +	debugfs_create_file("ber_count", 0444, bus->debugfs,
> +			    &bus->ber_count,
> +			    &i2c_debugfs_ops);
> +
> +	debugfs_create_file("rec_succ_count", 0444, bus->debugfs,
> +			    &bus->rec_succ_count,
> +			    &i2c_debugfs_ops);
> +
> +	debugfs_create_file("rec_fail_count", 0444, bus->debugfs,
> +			    &bus->rec_fail_count,
> +			    &i2c_debugfs_ops);
> +
> +	debugfs_create_file("nack_count", 0444, bus->debugfs,
> +			    &bus->nack_count,
> +			    &i2c_debugfs_ops);
> +
> +	debugfs_create_file("timeout_count", 0444, bus->debugfs,
> +			    &bus->timeout_count,
> +			    &i2c_debugfs_ops);
> +}

...

> +#ifdef CONFIG_DEBUG_FS

Why?!

> +	i2c_init_debugfs(pdev, bus);
> +#endif

...

> +#ifdef CONFIG_DEBUG_FS

Ditto.

> +	debugfs_remove_recursive(bus->debugfs);
> +#endif

> +static int __init npcm_i2c_init(void)
> +{

> +	npcm_i2c_debugfs_dir = debugfs_create_dir("i2c", NULL);

You didn't compile this with !CONFIG_DEBUG_FS?

> +	if (IS_ERR_OR_NULL(npcm_i2c_debugfs_dir)) {
> +		pr_warn("i2c init of debugfs failed\n");
> +		npcm_i2c_debugfs_dir = NULL;
> +	}

See above for the better pattern. Why do you need noisy warning? What does it
say to user? Can they use device or not?

> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


