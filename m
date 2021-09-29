Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3040E41CAE8
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 19:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345248AbhI2ROK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 13:14:10 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:40148 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345228AbhI2ROK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Sep 2021 13:14:10 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4HKNFq1cstz96;
        Wed, 29 Sep 2021 19:11:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1632935504; bh=d2MUWMRLtXQKduZj9fkvX3eKtT9ZCiWQ1vARU5+7Rtg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dgy7kAjuAPTstCMGj2MQYnG5k4OtNZa+1RO2mle3ugBeTJIVNg42gbDBs7Rlg2mBY
         nPiA4HUcgXgOT7o941EqMhI9yi2mIY9Um2XIPcraX6OX1RI8wkPJ5Gh1Hgdcuhqh8U
         2Kw3v4N7RJFkZgzrmID1RGV49RgvsA7NK8IqLvCVASDo8MtjegFXkVTvtVxiLpWEVP
         +v8M60KQ1+BJFrM/i1aZmj1Oz0zc5tG1GvmE3r741c4+wgKfI8Mzu6E1o4zlmqUchm
         +qjCoROhVSWxClUTSFyynGh2wxQwMSd4LwXUpICigWqOIAJcpBJIxwMfSyIfwn6yyr
         e0l2rAxvbLcmA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date:   Wed, 29 Sep 2021 19:12:23 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
Cc:     wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        digetx@gmail.com, treding@nvidia.com, s.shtylyov@omp.ru,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v1 1/2] i2c:busses:Register PCI1XXXX adapter to I2C
 subsystem
Message-ID: <YVSed/F9pk8n9O2P@qmqm.qmqm.pl>
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
 <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 29, 2021 at 11:52:14AM +0530, LakshmiPraveen Kopparthi wrote:
> Register the adapter to the I2C subsystem. Also the power management
> routines are added.
[...]
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
> @@ -0,0 +1,616 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Microchip PCI1XXXX I2C adapter driver for PCIe Switch
> + * which has I2C controller in one of its downstream functions
> + *
> + * * Copyright 2020-2021 Microchip Technology, Inc
> + *
> + * Author: LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
> + */

Is there a datasheet you can link to? Some register bits have cryptic names
that might not be understandable without the DS.

[...]
> +#define BAR0    0
> +#define BAR1    1
> +#define BAR2    2
> +#define BAR3    3

Those don't add much value and only BAR0 is actually used.

[...]
> +#define SMB_CORE_CTRL_ESO		(0x40)
> +#define SMB_CORE_CTRL_FW_ACK		(0x10)

Those parentheses are not needed.

[...]
> +#define I2C_FOD_EN		(0x10)
> +#define I2C_PULL_UP_EN		(0x08)
> +#define I2C_PULL_DOWN_EN	(0x04)
> +#define I2C_INPUT_EN		(0x02)
> +#define I2C_OUTPUT_EN		(0x01)

I guess the HW can do pull-ups, but the driver doesn't support that. Is it
on purpose?

[...]
> +#define PCI1XXXX_I2C_TIMEOUT	(msecs_to_jiffies(1000))

Define the timeout (in ms) and add msecs_to_jiffies() at the use site 
where needed. But... it doesn't seem to be used?

[...]
> +struct pci1xxxx_i2c {
> +	struct i2c_adapter adap;
> +	struct device *dev;

I think you can use adap.dev.parent for this.

[...]
> +static irqreturn_t pci1xxxx_i2c_isr(int irq, void *dev)
> +{
> +	struct pci1xxxx_i2c *i2c = dev;
> +	bool intr_handled = false;
> +	unsigned long flags;
> +	u16 regval;
> +	u8 regval1;
> +
> +	spin_lock_irqsave(&i2c->lock, flags);

This is hardirq context, so spin_lock() is enough. But, it looks like nothing
else uses this lock so it's eithier superfluous or missing somewhere else.

> +	/* Mask the interrupt */
> +	regval = readw(i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF);
> +	regval |= (SMBALERT_INTR_MASK | I2C_BUF_MSTR_INTR_MASK);
> +	writew(regval, (i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF));

No need to mask and unmask the interrupt as it will be blocked anyway
until the ISR returns.

> +	/*
> +	 * Read the SMBus interrupt status register to see if the
> +	 * DMA_TERM interrupt has caused this callback
> +	 */
> +	regval = readw(i2c->i2c_base + SMBUS_GEN_INT_STAT_REG_OFF);
> +
> +	if (regval & I2C_BUF_MSTR_INTR_MASK) {
> +		regval1 = readb(i2c->i2c_base + SMBUS_INTR_STAT_REG_OFF);
> +		if (regval1 & INTR_STAT_DMA_TERM) {
> +			complete(&i2c->i2c_xfer_done);
> +			intr_handled = true;
> +			writeb(INTR_STAT_DMA_TERM,
> +			       (i2c->i2c_base + SMBUS_INTR_STAT_REG_OFF));
> +		}
> +		/* ACK the high level interrupt */
> +		writew(I2C_BUF_MSTR_INTR_MASK,
> +		       (i2c->i2c_base + SMBUS_GEN_INT_STAT_REG_OFF));

You already have pci1xxxx_ack_high_level_intr() - why not use or delete it?

> +	}
> +
> +	if (regval & SMBALERT_INTR_MASK) {
> +		intr_handled = true;
> +		/* ACK the high level interrupt */
> +		writew(SMBALERT_INTR_MASK,
> +		       (i2c->i2c_base + SMBUS_GEN_INT_STAT_REG_OFF));

Nothing is done with the interrupt here - why enable it, then?

> +	}
> +
> +	regval = readw(i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF);
> +	/* UnMask the interrupt */
> +	regval &= ~(I2C_BUF_MSTR_INTR_MASK | SMBALERT_INTR_MASK);
> +	writew(regval, (i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF));
> +
> +	spin_unlock_irqrestore(&i2c->lock, flags);
> +
> +	if (intr_handled)
> +		return IRQ_HANDLED;
> +	else
> +		return IRQ_NONE;
> +}
[...]
> +static void pci1xxxx_i2c_set_freq(struct pci1xxxx_i2c *i2c)
> +{
> +	/*
> +	 * The SMB core needs specific values to be set in the BUS_CLK register
> +	 * for the corresponding frequency
> +	 */
> +	switch (i2c->freq) {
> +	case I2C_MAX_STANDARD_MODE_FREQ:
> +		writeb(SR_HOLD_TIME_100KHZ,
> +		       (i2c->i2c_base + SMB_CORE_SR_HOLD_TIME_REG_OFF));
> +		writel(SMB_IDLE_SCALING_100KHZ,
> +		       (i2c->i2c_base + SMB_CORE_IDLE_SCALING_REG_OFF));
> +		writew(BUS_CLK_100KHZ,
> +		       (i2c->i2c_base + SMB_CORE_BUS_CLK_REG_OFF));
> +		writel(CLK_SYNC_100KHZ,
> +		       (i2c->i2c_base + SMB_CORE_CLK_SYNC_REG_OFF));
> +		writel(DATA_TIMING_100KHZ,
> +		       (i2c->i2c_base + SMB_CORE_DATA_TIMING_REG_OFF));
> +		writel(TO_SCALING_100KHZ,
> +		       (i2c->i2c_base + SMB_CORE_TO_SCALING_REG_OFF));
> +		break;
> +
> +	case I2C_MAX_FAST_MODE_PLUS_FREQ:
[...]

Is it necessary to limit the frequencies to the three specified? Can't the
register values be calculated based on the exact frequency requested? It is
sometimes needed to run the bus at a lower frequency due to electrical or
chip design issues.

[...]
> +/*
> + * We could have used I2C_FUNC_SMBUS_EMUL but that includes
> + * SMBUS_QUICK as well.We dnt support SMBUS_QUICK hence the
> + * need for a lengthy funcs callback
> + */

You could say: I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK. But
there are also more missing bits like PEC. BTW, is the hardware
not able to handle zero-sized transfer?

> +static const struct i2c_adapter pci1xxxx_i2c_ops = {
> +	.owner	= THIS_MODULE,
> +	.name	= "Pci1xxxx I2c Adapter",

I2C

> +	.algo	= &pci1xxxx_i2c_algo,
> +};
> 
> +static int pci1xxxx_i2c_suspend(struct device *dev)
> +{
> +	struct pci1xxxx_i2c *i2c = dev_get_drvdata(dev);
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	u32 regval;
> +
> +	i2c_mark_adapter_suspended(&i2c->adap);
> +
> +	pci1xxxx_ack_high_level_intr(i2c, ALL_HIGH_LAYER_INTR);

There should be no active interrupt signals, unless they can wait until
resume for servicing. Either way, acking them blankly looks suspicious.
i2c_mark_adapter_suspended() should guarantee there are no transfers
coming (or being serviced) after it returns.

> +	pci1xxxx_i2c_config_high_level_intr(i2c, ALL_HIGH_LAYER_INTR, false);
> +
> +	/*
> +	 * Enable the PERST_DIS bit to mask the PERST from
> +	 * resetting the core regs
> +	 */
> +	regval = readl(i2c->i2c_base + SMBUS_RESET_REG);
> +	regval |= PERI_SMBUS_D3_RESET_DIS;
> +	writel(regval, i2c->i2c_base + SMBUS_RESET_REG);
> +
> +	return 0;
> +}
> 
> +static int pci1xxxx_i2c_resume(struct device *dev)
> +{
> +	struct pci1xxxx_i2c *i2c = dev_get_drvdata(dev);
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	u32 regval;
> +
> +	i2c_mark_adapter_resumed(&i2c->adap);

This should go at the end, after preparing the HW. BTW, the interrupt
config is not restored.

> +
> +	regval = readl(i2c->i2c_base + SMBUS_RESET_REG);
> +	regval &= ~PERI_SMBUS_D3_RESET_DIS;
> +	writel(regval, i2c->i2c_base + SMBUS_RESET_REG);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(pci1xxxx_i2c_pm_ops, pci1xxxx_i2c_suspend,
> +			 pci1xxxx_i2c_resume);
> +
> +static int pci1xxxx_i2c_probe_pci(struct pci_dev *pdev,
> +				  const struct pci_device_id *ent)
> +{
> +	struct pci1xxxx_i2c *i2c;
> +	int ret;
> +
> +	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;
> +
> +	i2c->dev = &pdev->dev;
> +
> +	pci_set_drvdata(pdev, i2c);
> +	ret = pcim_enable_device(pdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pci_request_regions(pdev, pci_name(pdev));
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * We are getting the base address of the SMB core. SMB core uses
> +	 * BAR0 and 32K is the size here pci_resource_len returns 32K by
> +	 * reading BAR0
> +	 */
> +
> +	i2c->i2c_base = pcim_iomap(pdev, BAR0, pci_resource_len(pdev, BAR0));

pcim_iomap_regions()

> +	if (!i2c->i2c_base) {
> +		ret = -ENOMEM;
> +		goto err_free_region;
> +	}
> +
> +	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
> +	if (ret < 0)
> +		goto err_free_region;
> +
> +	i2c->irq = pci_irq_vector(pdev, 0);

'irq' field doesn't seem to be used past the request_irq(), so maybe can
be removed?

> +	/* Register the isr. we are not using any isr flags here */
> +	ret = devm_request_irq(&pdev->dev, i2c->irq, pci1xxxx_i2c_isr,
> +			       PCI1XXXX_IRQ_FLAGS,
> +			       pci_name(pdev), i2c);
> [...]
> 
> +	pci_set_master(pdev);
> +
> +	init_completion(&i2c->i2c_xfer_done);
> +
> +	spin_lock_init(&i2c->lock);
> +
> +	pci1xxxx_i2c_init(i2c);

This all should be done before request_irq().

> +	i2c->adap = pci1xxxx_i2c_ops;
> +
> +	i2c->adap.class = I2C_CLASS_SPD;
> +	i2c->adap.dev.parent = &pdev->dev;
> +
> +	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
> +		 "MCHP PCI1xxxx i2c adapter at %s", pci_name(pdev));
> +
> +	i2c_set_adapdata(&i2c->adap, i2c);
> +
> +	ret = i2c_add_adapter(&i2c->adap);
> +	if (ret) {
> +		dev_err(&pdev->dev, "i2c add adapter failed = %d\n", ret);
> +		goto err_free_region;
> +	}
> +
> +	return 0;
> +
> +err_free_region:
> +	pci_release_regions(pdev);
> +	return ret;
> +}
[...]

It would be better to have the driver in one patch, than split in two.

Best Regards
Micha³ Miros³aw
