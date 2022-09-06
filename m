Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A08B5AEF43
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Sep 2022 17:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiIFPtO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Sep 2022 11:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233550AbiIFPsU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Sep 2022 11:48:20 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95117883C1;
        Tue,  6 Sep 2022 07:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662476306; x=1694012306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+SNXQQW5PQbfXWhgvv3wu0uuNTP0Y8hkmSWJkIlRHaI=;
  b=jTDLYfh1ID8rRSrwgBCcMar3sUIiuMVBceCJ69W+5EaSDy52yDUcYhi1
   VhFG5xYuHKe+ZoMUm2NcHYfm+OmJFb1BGYwsCqJ2r9xsPI7/eMk16GO35
   WLvZNpS80sJb2M93YQbGr/nPqNn5FwGMhyST+Hc4SaW6GmOQQAIese4o4
   vXAYClGfywS/JvFyqZNoxurcw4ZjIS1rK2Wa4CjPfnIdPEWYfKr9dc7vW
   rBGOHfNGX6PiBYLWSNdwnlBw1+BnrTtCOgPz/YMqrMH+bKOBwawjy2tPw
   EDn+YW6jZXJ1V0MyWCbvVOY9cpXg1lXrZUdSCB3aKnQMSll3TwfaOE0ZK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="382909710"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="382909710"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 07:58:25 -0700
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="647256044"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 07:58:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oVa1q-009AHd-2J;
        Tue, 06 Sep 2022 17:58:18 +0300
Date:   Tue, 6 Sep 2022 17:58:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org, krzk@kernel.org, jarkko.nikula@linux.intel.com,
        robh@kernel.org, semen.protsenko@linaro.org, sven@svenpeter.dev,
        jsd@semihalf.com, rafal@milecki.pl, olof@lixom.net, arnd@arndb.de,
        UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v3 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Message-ID: <YxdgCmj+Xr23V4v/@smile.fi.intel.com>
References: <20220906102057.679839-1-tharunkumar.pasumarthi@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906102057.679839-1-tharunkumar.pasumarthi@microchip.com>
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

On Tue, Sep 06, 2022 at 03:50:57PM +0530, Tharun Kumar P wrote:
> Microchip pci1xxxx is an unmanaged PCIe3.1a Switch for Consumer,
> Industrial and Automotive applications. This switch has multiple
> downstream ports. In one of the Switch's Downstream port, there
> is a multifunction endpoint for peripherals which includes an I2C
> host controller. The I2C function in the endpoint operates at 100KHz,
> 400KHz and 1 MHz and has buffer depth of 128 bytes.
> This patch provides the I2C controller driver for the I2C function
> of the switch.

No serious problems found. I think next version would be good enough.

...

+ bits.h

> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/i2c-smbus.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>

+ types.h

...

> +static void pci1xxxx_i2c_buffer_write(struct pci1xxxx_i2c *i2c, u8 slaveaddr,
> +				      u8 transferlen, unsigned char *buf)
> +{
> +	void __iomem *bp;
> +
> +	bp = i2c->i2c_base;
> +	if (slaveaddr) {
> +		writeb(slaveaddr, bp + SMBUS_MST_BUF);
> +		if (buf)
> +			memcpy_toio(bp + SMBUS_MST_BUF + 1, buf, transferlen);
> +	} else {
> +		if (buf)
> +			memcpy_toio(bp + SMBUS_MST_BUF, buf, transferlen);
> +	}

So, basically it's like this:

	void __iomem *bp = i2c->i2c_base + SMBUS_MST_BUF;

	if (slaveaddr)
		writeb(slaveaddr, bp++);

	if (buf)
		memcpy_toio(bp, buf, transferlen);

> +}

...

> +static void pci1xxxx_i2c_reset_counters(struct pci1xxxx_i2c *i2c)
> +{
> +	void __iomem *bp;

In all these helpers do like above:

	void __iomem *bp = i2c->i2c_base + SMBUS_CONTROL_REG_OFF;

It will unload code from duplicating noise.

> +	u8 regval;
> +
> +	bp = i2c->i2c_base;
> +	regval = readb(bp + SMBUS_CONTROL_REG_OFF);
> +	regval |= CTL_RESET_COUNTERS;
> +	writeb(regval, bp + SMBUS_CONTROL_REG_OFF);
> +}

...

> +static irqreturn_t pci1xxxx_i2c_isr(int irq, void *dev)
> +{
> +	irqreturn_t intr_handled = IRQ_NONE;
> +	struct pci1xxxx_i2c *i2c = dev;
> +	void __iomem *bp;

	void __iomem *bp = i2c->i2c_base + SMBUS_GEN_INT_STAT_REG_OFF;

> +	u16 reg1;
> +	u8 reg3;
> +
> +	bp = i2c->i2c_base;
> +
> +	/*
> +	 *  Read the SMBus interrupt status register to see if the
> +	 *  DMA_TERM interrupt has caused this callback.
> +	 */
> +	reg1 = readw(bp + SMBUS_GEN_INT_STAT_REG_OFF);
> +
> +	if (reg1 & I2C_BUF_MSTR_INTR_MASK) {
> +		reg3 = readb(bp + SMBUS_INTR_STAT_REG_OFF);
> +		if (reg3 & INTR_STAT_DMA_TERM) {
> +			complete(&i2c->i2c_xfer_done);
> +			intr_handled = IRQ_HANDLED;
> +			writeb(INTR_STAT_DMA_TERM, bp + SMBUS_INTR_STAT_REG_OFF);
> +		}
> +		pci1xxxx_ack_high_level_intr(i2c, I2C_BUF_MSTR_INTR_MASK);
> +	}
> +
> +	if (reg1 & SMBALERT_INTR_MASK) {
> +		intr_handled = IRQ_HANDLED;
> +		pci1xxxx_ack_high_level_intr(i2c, SMBALERT_INTR_MASK);
> +	}
> +
> +	return intr_handled;
> +}

...

> +	ret = set_sys_lock(i2c);
> +	if (ret != -EPERM) {
> +		regval = readl(bp + SMB_GPR_REG);
> +		release_sys_lock(i2c);
> +	} else {
> +		/*
> +		 * Configure I2C Fast Mode as default frequency if unable
> +		 * to acquire sys lock.
> +		 */
> +		regval = 0;
> +	}

Why not positive conditional?

	if (ret == -EPERM) {
		...
	} else {
		...
	}

...

> +	/*
> +	 * Enable Pullup for the SMB alert pin which is just used for

pull-up

> +	 * wakeup right now.
> +	 */

...

> +		transferlen = min_t(u16, remainingbytes, (u16)SMBUS_BUF_MAX_SIZE);

min_t (note 't' part) does type casting for you, no need to repeat this.

...

> +		if ((count + transferlen >= total_len) &&
> +				(i2c->flags & I2C_FLAGS_STOP)) {

Broken indentation (align ( under ( in the second line)

> +			pci1xxxx_i2c_set_clear_FW_ACK(i2c, false);
> +			pci1xxxx_i2c_send_start_stop(i2c, 0);
> +		} else {
> +			pci1xxxx_i2c_set_clear_FW_ACK(i2c, true);
> +		}

...

> +		time_left = wait_for_completion_timeout
> +				(&i2c->i2c_xfer_done,

Why this on a separate line? Join them together.

> +				msecs_to_jiffies(PCI1XXXX_I2C_TIMEOUT_MS));
> +		if (time_left == 0) {
> +			/* Reset the I2C core to release the bus lock. */
> +			pci1xxxx_i2c_init(i2c);
> +			retval = -ETIMEDOUT;
> +			goto cleanup;
> +		}

...

> +		if (i2c->flags & I2C_FLAGS_SMB_BLK_READ) {
> +			buf[0] = readb(bp + SMBUS_MST_BUF);
> +			read_count = buf[0];
> +			memcpy_fromio(&buf[1], bp + SMBUS_MST_BUF + 1, read_count);
> +		} else {
> +			memcpy_fromio(&buf[count], bp + SMBUS_MST_BUF, transferlen);
> +		}

Hmm... count in the second case because we may not write all in one transfer?

...

> +	for (count = 0; count < total_len; count += transferlen) {
> +		/*
> +		 * Before start of any transaction clear the existing
> +		 * START/STOP conditions.
> +		 */
> +		writeb(0x00, bp + SMB_CORE_CMD_REG_OFF1);

0x00 --> 0

(below as well)

> +		pci1xxxx_i2c_clear_flags(i2c);
> +		remainingbytes = total_len - count;
> +
> +		/* If it is the starting of the transaction send START. */
> +		if (count == 0) {
> +			pci1xxxx_i2c_send_start_stop(i2c, 1);
> +
> +			/* -1 for the slave address. */
> +			transferlen = min_t(u16, (u16)SMBUS_BUF_MAX_SIZE - 1,
> +					  remainingbytes);

No castings.

> +			pci1xxxx_i2c_buffer_write(i2c, slaveaddr,
> +						  transferlen, &buf[count]);
> +			/*
> +			 * The actual number of bytes written on the I2C bus
> +			 * is including the slave address.
> +			 */
> +			actualwritelen = transferlen + 1;
> +		} else {
> +			transferlen = min_t(u16, (u16)SMBUS_BUF_MAX_SIZE,
> +					  remainingbytes);

Ditto.

> +			pci1xxxx_i2c_buffer_write(i2c, 0x00, transferlen, &buf[count]);
> +			actualwritelen = transferlen;
> +		}
> +
> +		pci1xxxx_i2c_set_count(i2c, actualwritelen, actualwritelen, 0x00);
> +
> +		/*
> +		 * Send STOP only when I2C_FLAGS_STOP bit is set in the flags and
> +		 * only for the last transaction.
> +		 */
> +		if (remainingbytes <= transferlen &&
> +				(i2c->flags & I2C_FLAGS_STOP))

Indentation needs to be fixed.

> +			pci1xxxx_i2c_send_start_stop(i2c, 0);
> +
> +		pci1xxxx_i2c_start_DMA(i2c);
> +
> +		/*
> +		 * Wait for the DMA_TERM interrupt.
> +		 */
> +		time_left = wait_for_completion_timeout(&i2c->i2c_xfer_done,
> +				msecs_to_jiffies(PCI1XXXX_I2C_TIMEOUT_MS));
> +		if (time_left == 0) {
> +			/* Reset the I2C core to release the bus lock. */
> +			pci1xxxx_i2c_init(i2c);
> +			retval = -ETIMEDOUT;
> +			goto cleanup;
> +		}
> +
> +		regval = readb(bp + SMB_CORE_COMPLETION_REG_OFF3);
> +		if (regval & COMPLETION_MNAKX) {

> +			writeb(COMPLETION_MNAKX, i2c->i2c_base +
> +						SMB_CORE_COMPLETION_REG_OFF3);

			writeb(COMPLETION_MNAKX,
			       i2c->i2c_base + SMB_CORE_COMPLETION_REG_OFF3);

looks better.

> +			retval = -ETIMEDOUT;
> +			goto cleanup;
> +		}
> +	}

...

> +static const struct i2c_adapter pci1xxxx_i2c_ops = {
> +	.owner	= THIS_MODULE,
> +	.name	= "Pci1xxxx I2C Adapter",

Wouldn't PCI1xxxx look better?

> +	.algo	= &pci1xxxx_i2c_algo,
> +};

...

> +	device_set_wakeup_enable(dev, TRUE);
> +	pci_wake_from_d3(pdev, TRUE);

What's TRUE? Why true can't be used?

...

> +	struct pci1xxxx_i2c *i2c;
> +	struct device *dev;
> +	int ret;
> +
> +	dev = &pdev->dev;

The idea is when we 100% know that the dereference is okay and can't fail, we
move assignments like this to the definition block above, otherwise, when an
additional check is needed, we keep the assignment closer to its first user
(conditional).

> +	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;

...

> +	/*
> +	 * We are getting the base address of the SMB core. SMB core uses
> +	 * BAR0 and size is 32K.
> +	 */
> +	ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
> +	if (ret < 0)

> +		return -ENOMEM;

What's wrong with

		return ret;

?

-- 
With Best Regards,
Andy Shevchenko


