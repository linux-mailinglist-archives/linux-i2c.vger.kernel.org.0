Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D625C5A9F5F
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Sep 2022 20:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbiIASrn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Sep 2022 14:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234057AbiIASrh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Sep 2022 14:47:37 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB2A7F0B8;
        Thu,  1 Sep 2022 11:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662058045; x=1693594045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1WMCjEyHaC+wtyRq4u2T3mWuHuAU/JtguUjyVOcbWWc=;
  b=BxAYypORPz0scx/pgHudlGHAdOvdMdvLKw5CBbNQfhtjE+QHEQK/JW30
   ZLoKVdvIS3sYJfDvFxvfUVU6KACC1gLcBlDVXhIM4WMwzLtLtv6gg2BA3
   AftDJUE0AYBG0GPSLtQXuUhDORtSrJag0GHUujUfnHFGw0bNNLLLrWK1Z
   tacCeA9SS9J+psLM1CtiU5tlBWAOHZIeJx605aJ7HOpUJ/Vl1/yXmMluF
   44lMiXQZs0lsuiOF99gFol10P/Uwlt4YIoXI8kgxWDy+R9Z1NnCZwKarS
   qLOoaD1e5Hf75//hwCRRaeyU0jRmaljd3lIhMVk3IoOKoyKjM3aeqFila
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="359758947"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="359758947"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 11:47:25 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="563576409"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 11:47:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oTpDi-00708r-0C;
        Thu, 01 Sep 2022 21:47:18 +0300
Date:   Thu, 1 Sep 2022 21:47:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org, krzk@kernel.org, jarkko.nikula@linux.intel.com,
        robh@kernel.org, semen.protsenko@linaro.org, sven@svenpeter.dev,
        jsd@semihalf.com, rafal@milecki.pl, olof@lixom.net, arnd@arndb.de,
        UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v2 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Message-ID: <YxD+NTWok2vkYos/@smile.fi.intel.com>
References: <20220901013626.2213100-1-tharunkumar.pasumarthi@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901013626.2213100-1-tharunkumar.pasumarthi@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 01, 2022 at 07:06:26AM +0530, Tharun Kumar P wrote:
> Microchip pci1xxxx is an unmanaged PCIe3.1a Switch for Consumer,
> Industrial and Automotive applications. This switch has multiple
> downstream ports. In one of the Switch's Downstream port, there
> is a multifunction endpoint for peripherals which includes an I2C
> host controller. The I2C function in the endpoint operates at 100KHz,
> 400KHz and 1 MHz and has buffer depth of 128 bytes.
> This patch provides the I2C controller driver for the I2C function
> of the switch.

...

> +#define SMB_IDLE_SCALING_100KHZ		((FAIR_IDLE_DELAY_100KHZ_TICKS << 16) | \
> +					FAIR_BUS_IDLE_MIN_100KHZ_TICKS)

This kind of indentation harder to read than

#define SMB_IDLE_SCALING_100KHZ		\
	((FAIR_IDLE_DELAY_100KHZ_TICKS << 16) | FAIR_BUS_IDLE_MIN_100KHZ_TICKS)

Ditto for other similar cases.

...

> +/*

If it's a kernel doc, make it kernel doc.

> + * struct pci1xxxx_i2c - private structure for the I2C controller
> + * @i2c_xfer_done: used for synchronisation between foreground & isr
> + * @i2c_xfer_in_progress: boolean to indicate whether a transfer is in
> + *				progress or not
> + * @adap: I2C adapter instance
> + * @i2c_base: pci base address of the I2C controller
> + * @freq: frequency of I2C transfer
> + * @flags: internal flags to store transfer conditions
> + */

...

> +static int set_sys_lock(void __iomem *addr)

Why not to take pointer to your private structure and offset instead of address
and calc the address here?

...

> +static int release_sys_lock(void __iomem *addr)

Ditto.

...

> +static void pci1xxxx_i2c_buffer_write(struct pci1xxxx_i2c *i2c, u8 slaveaddr,
> +				      u8 transferlen, unsigned char *buf)
> +{
> +	if (slaveaddr) {
> +		writeb(slaveaddr, i2c->i2c_base + SMBUS_MST_BUF);
> +		if (buf)
> +			memcpy_toio((i2c->i2c_base + SMBUS_MST_BUF + 1), buf, transferlen);
> +	} else {
> +		if (buf)
> +			memcpy_toio((i2c->i2c_base + SMBUS_MST_BUF), buf, transferlen);
> +	}

Why do you need buf checks? Is your code can shoot itself in the foot?

> +}

...

> +		regval &= ~(intr_msk);

> +		regval |= (I2C_INPUT_EN | I2C_OUTPUT_EN);

> +		regval |= (I2C_INPUT_EN | I2C_OUTPUT_EN);

And in a plenty places you add extra parentheses. Reread your code and drop
them and in some cases (I will show below an example) move code to shorter
amount of LoCs.

...

> +		regval &=  ~(I2C_INPUT_EN | I2C_OUTPUT_EN);

Extra space.

...

> +	pci1xxxx_i2c_config_high_level_intr(i2c, (I2C_BUF_MSTR_INTR_MASK),
> +					    true);

Why parentheses? Why it can't be one line?
There are more examples like this. Fix them all.

...

> +			if (i2c->flags & I2C_FLAGS_SMB_BLK_READ)
> +				pci1xxxx_i2c_set_readm(i2c, true);

> +

We don't need useless blank lines.

> +		} else {
> +			pci1xxxx_i2c_set_count(i2c, 0, 0, transferlen);
> +
> +			pci1xxxx_i2c_config_asr(i2c, false);
> +
> +			pci1xxxx_i2c_clear_flags(i2c);
> +
> +			pci1xxxx_i2c_set_transfer_dir(i2c, I2C_DIRN_READ);
> +		}

...

> +		if (i2c->flags & I2C_FLAGS_SMB_BLK_READ) {

> +			buf[0] = readb(i2c->i2c_base +
> +				      SMBUS_MST_BUF);

Why not on one line?

> +			read_count = buf[0];
> +			memcpy_fromio(&buf[1], (i2c->i2c_base +
> +						SMBUS_MST_BUF + 1),
> +						read_count);
> +		} else {
> +			memcpy_fromio(&buf[count], (i2c->i2c_base +
> +						SMBUS_MST_BUF), transferlen);
> +		}

These accessors may copy from 1 to 4 bytes at a time. Does your hardware
supports this kind of accesses?


...

> +static int pci1xxxx_i2c_suspend(struct device *dev)
> +{
> +	struct pci1xxxx_i2c *i2c = dev_get_drvdata(dev);
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	u32 regval;
> +
> +	i2c_mark_adapter_suspended(&i2c->adap);
> +
> +	while ((i2c->i2c_xfer_in_progress))
> +		msleep(20);

Each long sleep (20 ms is quite long) has to be explained. But this entire loop
looks like a band-aid of lack of IRQ or so. Why do you need to poll?

> +	pci1xxxx_i2c_config_high_level_intr(i2c,
> +					    SMBALERT_WAKE_INTR_MASK,
> +					    true);
> +
> +	/*
> +	 * Enable the PERST_DIS bit to mask the PERST from
> +	 * resetting the core registers
> +	 */
> +	regval = readl(i2c->i2c_base + SMBUS_RESET_REG);
> +	regval |= PERI_SMBUS_D3_RESET_DIS;
> +	writel(regval, i2c->i2c_base + SMBUS_RESET_REG);
> +	/* Enable PCI wake in the PMCSR register */
> +	device_set_wakeup_enable(dev, TRUE);
> +	pci_wake_from_d3(pdev, TRUE);
> +
> +	return 0;
> +}

...

> +	pci_wake_from_d3(pdev, FALSE);

What's FALSE and why false can't be used?

...

> +static SIMPLE_DEV_PM_OPS(pci1xxxx_i2c_pm_ops, pci1xxxx_i2c_suspend,
> +			 pci1xxxx_i2c_resume);

Use new macro which starts with DEFINE prefix.

...

> +	/*
> +	 * We are getting the base address of the SMB core. SMB core uses
> +	 * BAR0 and size is 32K

Missed period.

> +	 */

> +

Useless blank line.

> +	ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
> +	if (ret < 0)
> +		return -ENOMEM;

> +	i2c->i2c_base =	pcim_iomap_table(pdev)[0];
> +
> +	init_completion(&i2c->i2c_xfer_done);
> +
> +	pci1xxxx_i2c_init(i2c);

Here you need to wrap pci1xxxx_i2c_shutdown() to be devm_. See below.

> +	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
> +	if (ret < 0) {
> +		pci1xxxx_i2c_shutdown(i2c);
> +		return ret;
> +	}
> +
> +	/* Register the isr. We are not using any isr flags here. */
> +	ret = devm_request_irq(&pdev->dev, pci_irq_vector(pdev, 0),

With

	struct device *dev = &pdev->dev;

you may have some lines of code neater and shorter.

> +			       pci1xxxx_i2c_isr, PCI1XXXX_IRQ_FLAGS,
> +			       pci_name(pdev), i2c);
> +	if (ret) {
> +		pci1xxxx_i2c_shutdown(i2c);
> +		return ret;
> +	}
> +
> +	i2c->adap = pci1xxxx_i2c_ops;
> +	i2c->adap.class = I2C_CLASS_SPD;
> +	i2c->adap.dev.parent = &pdev->dev;
> +
> +	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
> +		 "MCHP PCI1xxxx i2c adapter at %s", pci_name(pdev));
> +
> +	i2c_set_adapdata(&i2c->adap, i2c);
> +
> +	ret = devm_i2c_add_adapter(&pdev->dev, &i2c->adap);
> +	if (ret) {
> +		dev_err(&pdev->dev, "i2c add adapter failed = %d\n", ret);

> +		pci1xxxx_i2c_shutdown(i2c);

You can't mix devm_ and non-devm_ in such manner. It's asking for troubles at
->remove() or unbind stages.

> +		return ret;

After fixing above, convert the error messages to use

	return dev_err_probe(...);

pattern.

> +	}

...

> +static void pci1xxxx_i2c_remove_pci(struct pci_dev *pdev)
> +{
> +	struct pci1xxxx_i2c *i2c = pci_get_drvdata(pdev);
> +
> +	pci1xxxx_i2c_shutdown(i2c);
> +}

This will be gone.

-- 
With Best Regards,
Andy Shevchenko


