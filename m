Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A5F1DCFA3
	for <lists+linux-i2c@lfdr.de>; Thu, 21 May 2020 16:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbgEUOXm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 May 2020 10:23:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:4101 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727807AbgEUOXm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 21 May 2020 10:23:42 -0400
IronPort-SDR: cCzJlrA9V2rloUAvxuzr5wUdpvZNmCm722Z4mcUs7OtIKazlq3JEQ95AIp6qKTDovsrV3Gq+7M
 S3c3PhPoFqwg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2020 07:23:41 -0700
IronPort-SDR: HJwr70oF8r+qmhLkXdAqGrFwTDZR+Uh1JWVRI1suhxl+UzDLL/Fl2/k3MnYyHkfNDm743d3dr5
 u5ECfTDgt3EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,417,1583222400"; 
   d="scan'208";a="253985670"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 21 May 2020 07:23:38 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jbm6m-0082sf-QV; Thu, 21 May 2020 17:23:40 +0300
Date:   Thu, 21 May 2020 17:23:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     ofery@google.com, brendanhiggins@google.com,
        avifishman70@gmail.com, tmaimon77@gmail.com, kfting@nuvoton.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, wsa@the-dreams.de,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200521142340.GM1634618@smile.fi.intel.com>
References: <20200521110910.45518-1-tali.perry1@gmail.com>
 <20200521110910.45518-3-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521110910.45518-3-tali.perry1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 21, 2020 at 02:09:09PM +0300, Tali Perry wrote:
> Add Nuvoton NPCM BMC I2C controller driver.

Thanks. My comments below.
After addressing them, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +	/* Frequency larger than 1 MHZ is not supported */

1 MHZ -> 1MHz

...

> +#ifdef CONFIG_DEBUG_FS

Again, why is this here?

Have you checked debugfs.h for !CONFIG_DEBUG_FS case?

> +/* i2c debugfs directory: used to keep health monitor of i2c devices */
> +static struct dentry *npcm_i2c_debugfs_dir;
> +
> +static void i2c_init_debugfs(struct platform_device *pdev, struct npcm_i2c *bus)
> +{
> +	struct dentry *d;
> +
> +	if (!npcm_i2c_debugfs_dir)
> +		return;
> +
> +	d = debugfs_create_dir(dev_name(&pdev->dev), npcm_i2c_debugfs_dir);
> +	if (IS_ERR_OR_NULL(d))
> +		return;
> +
> +	debugfs_create_u64("ber_cnt", 0444, d, &bus->ber_cnt);
> +	debugfs_create_u64("nack_cnt", 0444, d, &bus->nack_cnt);
> +	debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
> +	debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
> +	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
> +
> +	bus->debugfs = d;
> +}

> +#else
> +static void i2c_init_debugfs(struct platform_device *pdev, struct npcm_i2c *bus)
> +{
> +}

This is completely redundant.

> +#endif

...

> +#ifdef CONFIG_DEBUG_FS

Ditto.

> +static int __init npcm_i2c_init(void)
> +{
> +	struct dentry *dir;
> +
> +	dir = debugfs_create_dir("i2c", NULL);
> +	if (IS_ERR_OR_NULL(dir))
> +		return 0;
> +
> +	npcm_i2c_debugfs_dir = dir;
> +	return 0;
> +}
> +
> +static void __exit npcm_i2c_exit(void)
> +{
> +	debugfs_remove_recursive(npcm_i2c_debugfs_dir);
> +}
> +
> +module_init(npcm_i2c_init);
> +module_exit(npcm_i2c_exit);
> +#endif

...

> +MODULE_VERSION("0.1.3");

Module version is defined by kernel commit hash. But it's up to you and
subsystem maintainer to decide.

-- 
With Best Regards,
Andy Shevchenko


