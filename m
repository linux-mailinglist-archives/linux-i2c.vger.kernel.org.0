Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5420B41BFC2
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 09:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244570AbhI2HUb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 03:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244525AbhI2HUa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Sep 2021 03:20:30 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F58C06161C;
        Wed, 29 Sep 2021 00:18:50 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x27so6789605lfu.5;
        Wed, 29 Sep 2021 00:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R+tfSamk+xbGM1kUwi3INWSzJUBxMq0lg5JhR5o2QVs=;
        b=QUpaCu+gz0rnbiRwW472H/VAhl927zOmTbBL9sdVKtZcCzEpdHyxrgrFI1OMWKK8W5
         tTToP64btoSdgv2AbRygE2IeLXwjSV1XDGDmgOv3PJL68zlP4KAOPiO933rImghBJsxC
         59E43YQBCVg902+HuLldfjTpziNKzWgGn/e2A/7gjG1FT9vkNYBhFyagS7uzOubK9VQo
         FYbxdL2SxP1FfBPNEX2tHlS06A18tXZFK8XHA1WvcDuiNQOS/C2Ds5xU0sy7Lx8zJOOz
         LehmIdvJPAIKFlC4FfSGcCtjbKui7KnPSaSmok1KvCI6cE0EPLGnmWC/UA3kHwHDDot6
         2BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R+tfSamk+xbGM1kUwi3INWSzJUBxMq0lg5JhR5o2QVs=;
        b=G3tyn/nscdN4hETsc2e7HDEoluX0qnSsCudDs4FRnV4whYeK6pFfedL3Q3aF+URPtK
         7UEI75WO15T2Cufgx7e4/bOzWOqIhvNCiowxDAQ+/eDzH0pZA3hkRWBBcU1YRyfEdNu3
         ErV1ojphbwQJgdHgJHSeXsR9OvBFyf5/xkZ1NrJmdVohNd/tKdxtammCCyQjUX9A3bJD
         yEW0UfU62VhJ54cmlcppmNtQvQMP6E4gqnDC6fyva12lPUNRvulPoAUxgjnJGXm24KQj
         GUeJx2ca9EN/dvApjI6e1eKsvlOu6bnutzU/F6k4wGD7EXX88arudp7Pjh3KJ5PMbpxl
         FZWA==
X-Gm-Message-State: AOAM531puDGBg4l1YKknbQMWf5Ykw6DCHa2MN77wZcJbhtw8eImEfHCH
        5jFB6w57TK4cSFbI9FPWqpHLyE0wDU4=
X-Google-Smtp-Source: ABdhPJz/ra14fVA5jYTSaPkDMZdvONex7r8kL6s9H+KuFX+MYALoYvjzrRFeMFEKdsyP+voz0HNd9Q==
X-Received: by 2002:a2e:979a:: with SMTP id y26mr4597088lji.107.1632899928452;
        Wed, 29 Sep 2021 00:18:48 -0700 (PDT)
Received: from [192.168.2.145] (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.googlemail.com with ESMTPSA id n22sm172780lji.139.2021.09.29.00.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 00:18:47 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] i2c:busses:Register PCI1XXXX adapter to I2C
 subsystem
To:     LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>,
        wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        treding@nvidia.com, mirq-linux@rere.qmqm.pl, s.shtylyov@omp.ru,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     UNGLinuxDriver@microchip.com
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
 <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d39e99ff-6498-e532-e833-1c65861d566f@gmail.com>
Date:   Wed, 29 Sep 2021 10:18:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

29.09.2021 09:22, LakshmiPraveen Kopparthi пишет:

Change title of the patch to:

"i2c: busses: Add driver for PCI1XXXX adapter"

...
> +#define SMB_CORE_CTRL_ESO		(0x40)
> +#define SMB_CORE_CTRL_FW_ACK		(0x10)

Parentheses are not needed here.


> +#define PCI1XXXX_I2C_TIMEOUT	(msecs_to_jiffies(1000))

And here.

...
> +static irqreturn_t pci1xxxx_i2c_isr(int irq, void *dev)
> +{
> +	struct pci1xxxx_i2c *i2c = dev;
> +	bool intr_handled = false;
> +	unsigned long flags;
> +	u16 regval;
> +	u8 regval1;
> +
> +	spin_lock_irqsave(&i2c->lock, flags);

Interrupt is disabled in ISR, this lock does nothing.

> +	/* Mask the interrupt */
> +	regval = readw(i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF);
> +	regval |= (SMBALERT_INTR_MASK | I2C_BUF_MSTR_INTR_MASK);
> +	writew(regval, (i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF));

writew(regval, (parentheses not needed here));

Similar for all other places in the code.

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
> +	}
> +
> +	if (regval & SMBALERT_INTR_MASK) {
> +		intr_handled = true;
> +		/* ACK the high level interrupt */
> +		writew(SMBALERT_INTR_MASK,
> +		       (i2c->i2c_base + SMBUS_GEN_INT_STAT_REG_OFF));
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

return intr_handled ? IRQ_HANDLED : IRQ_NONE;

Or turn intr_handled into "irqreturn_t ret" and return it directly.

...
> +static void pci1xxxx_i2c_configure_core_reg(struct pci1xxxx_i2c *i2c, bool enable)
> +{
> +	u8 regval;
> +	u8 regval1;

u8 reg1, reg3;

...> +static void pci1xxxx_i2c_set_freq(struct pci1xxxx_i2c *i2c)
> +{
> +	/*
> +	 * The SMB core needs specific values to be set in the BUS_CLK register
> +	 * for the corresponding frequency
> +	 */
> +	switch (i2c->freq) {

Why i2c->freq is fixed to I2C_MAX_FAST_MODE_FREQ in pci1xxxx_i2c_init()?

...
> +static void pci1xxxx_i2c_init(struct pci1xxxx_i2c *i2c)
> +{
> +	i2c->freq = I2C_MAX_FAST_MODE_FREQ;
...

> +static u32 pci1xxxx_i2c_get_funcs(struct i2c_adapter *adap)
> +{
> +	return (I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING
> +		| I2C_FUNC_SMBUS_BLOCK_PROC_CALL
> +		| I2C_FUNC_SMBUS_READ_BYTE | I2C_FUNC_SMBUS_WRITE_BYTE
> +		| I2C_FUNC_SMBUS_READ_BYTE_DATA
> +		| I2C_FUNC_SMBUS_WRITE_BYTE_DATA
> +		| I2C_FUNC_SMBUS_READ_WORD_DATA
> +		| I2C_FUNC_SMBUS_WRITE_WORD_DATA
> +		| I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_READ_BLOCK_DATA
> +		| I2C_FUNC_SMBUS_WRITE_BLOCK_DATA);
> +}
The 'or' should be on the right side and parentheses are not needed.

...
> +static int pci1xxxx_i2c_resume(struct device *dev)> +{
> +	struct pci1xxxx_i2c *i2c = dev_get_drvdata(dev);
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	u32 regval;
> +
> +	i2c_mark_adapter_resumed(&i2c->adap);
> +
> +	regval = readl(i2c->i2c_base + SMBUS_RESET_REG);
> +	regval &= ~PERI_SMBUS_D3_RESET_DIS;
> +	writel(regval, i2c->i2c_base + SMBUS_RESET_REG);

Adapter is resumed after register is written.

> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(pci1xxxx_i2c_pm_ops, pci1xxxx_i2c_suspend,
> +			 pci1xxxx_i2c_resume);
> +
> +static int pci1xxxx_i2c_probe_pci(struct pci_dev *pdev,
> +				  const struct pci_device_id *ent)
> +{
...
> +	pci1xxxx_i2c_init(i2c);
> +
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

pci1xxxx_i2c_shutdown()?

> +	}
> +
> +	return 0;
> +
> +err_free_region:
> +	pci_release_regions(pdev);
> +	return ret;
> +}
> +
> +static void pci1xxxx_i2c_shutdown(struct pci1xxxx_i2c *i2c)
> +{
> +	pci1xxxx_i2c_config_padctrl(i2c, false);
> +	pci1xxxx_i2c_configure_core_reg(i2c, false);
> +}
> +
> +static void pci1xxxx_i2c_remove_pci(struct pci_dev *pdev)
> +{
> +	struct pci1xxxx_i2c *i2c = pci_get_drvdata(pdev);
> +
> +	pci1xxxx_i2c_shutdown(i2c);
> +	i2c_del_adapter(&i2c->adap);
> +}
> +
> +static const struct pci_device_id pci1xxxx_i2c_pci_id_table[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI12000_I2C_PID) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11010_I2C_PID) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11101_I2C_PID) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11400_I2C_PID) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11414_I2C_PID) },
> +	{0, }
> +};
> +
> +MODULE_DEVICE_TABLE(pci, pci1xxxx_i2c_pci_id_table);
> +
> +static struct pci_driver pci1xxxx_i2c_pci_driver = {
> +	.name		= DRV_NAME,

Assign name directly, DRV_NAME unneeded.
