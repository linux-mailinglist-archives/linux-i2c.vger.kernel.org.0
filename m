Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF37422138
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 10:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbhJEIwl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Oct 2021 04:52:41 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:41715 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232834AbhJEIwh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Oct 2021 04:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1633423847; x=1664959847;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZZxNg7wIJcLhOWGzprsW/5W5VMzKGaPFPvifncZEUOc=;
  b=nb2sg887OSjnUhKDpUwIBgeS5p256INNU1h8asMhaWP49k1Oq/qXXrWI
   yIgwp8ORzFA/HMAnzKw8os9mX8Z54j9supwj/uPija3D20LeUJUNFfLY9
   Ercos6Yvth0GL8PmwBg1qc2nDO6Y7FUfrwfcSdco8puifVZuCFSURexHT
   5wh3T1dvuAFIDv58ox5zQ4QSP3/S4l7F4lnQoV6kDmDl78ZbtwcKhidyO
   kF89qrZepR5LxCBZjVP1fSy0Xtha2KuH+nGxJgore/+fUZV4z/Z11jB3l
   tTloLmiNuxJBOJJWC5QjPC9J08NnHTWU3lQNsRkIyRb560s2fI6z8OZTm
   w==;
IronPort-SDR: LXA30ooT7fRJZ0KacV18Ug9rTWYWahvTHYjolcneh7v/iW/3IAqGObyaUrterGbNSz2kjvxhBA
 i7QntsqX0N+e01lvb/S1+qiquC8tR+aM22igGPloKkPAP+W8N1EJn7T92NFeDxzjvLaK2/DWYw
 d4e09+qILbZO0su8JgHPc8Bmwp4UWYN9Vwjv0sCBoCZF2NHEYTzOaGH1ulkPqnKACR6mU7KT1r
 TjPKSFBi/bMeu5amHiUuoNz/gfOylgcb4Zy79lJnh+LBBj7hVPVBSlpSn593yaNZpqSwVlHpfl
 fNnAcjG0QbBHCTQQ40rQqTDh
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; 
   d="scan'208";a="139067968"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Oct 2021 01:50:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 5 Oct 2021 01:50:45 -0700
Received: from CHE-LT-I41642.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 5 Oct 2021 01:50:42 -0700
Message-ID: <683a7136ec818d01420a5c2cbf43e13498d82740.camel@microchip.com>
Subject: Re: [PATCH v1 1/2] i2c:busses:Register PCI1XXXX adapter to I2C
 subsystem
From:   LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     <UNGLinuxDriver@microchip.com>, <wsa@kernel.org>,
        <andriy.shevchenko@linux.intel.com>, <treding@nvidia.com>,
        <mirq-linux@rere.qmqm.pl>, <s.shtylyov@omp.ru>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date:   Tue, 5 Oct 2021 14:20:40 +0530
In-Reply-To: <d39e99ff-6498-e532-e833-1c65861d566f@gmail.com>
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
         <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
         <d39e99ff-6498-e532-e833-1c65861d566f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 2021-09-29 at 10:18 +0300, Dmitry Osipenko wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> 29.09.2021 09:22, LakshmiPraveen Kopparthi пишет:
> 
> Change title of the patch to:
> 
> "i2c: busses: Add driver for PCI1XXXX adapter"

Ok. I will change it.

> 
> ...
> > +#define SMB_CORE_CTRL_ESO            (0x40)
> > +#define SMB_CORE_CTRL_FW_ACK         (0x10)
> 
> Parentheses are not needed here.

ok. Got it.

> 
> 
> > +#define PCI1XXXX_I2C_TIMEOUT (msecs_to_jiffies(1000))
> 
> And here.

ok. Got it.

> 
> ...
> > +static irqreturn_t pci1xxxx_i2c_isr(int irq, void *dev)
> > +{
> > +     struct pci1xxxx_i2c *i2c = dev;
> > +     bool intr_handled = false;
> > +     unsigned long flags;
> > +     u16 regval;
> > +     u8 regval1;
> > +
> > +     spin_lock_irqsave(&i2c->lock, flags);
> 
> Interrupt is disabled in ISR, this lock does nothing.


Ok. But there are some registers that are read and updated in the ISR
and in the foreground.
I will add the lock for these register access.
 
> 
> > +     /* Mask the interrupt */
> > +     regval = readw(i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF);
> > +     regval |= (SMBALERT_INTR_MASK | I2C_BUF_MSTR_INTR_MASK);
> > +     writew(regval, (i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF));
> 
> writew(regval, (parentheses not needed here));
> 
> Similar for all other places in the code.

ok.Got it.

> 
> > +     /*
> > +      * Read the SMBus interrupt status register to see if the
> > +      * DMA_TERM interrupt has caused this callback
> > +      */
> > +     regval = readw(i2c->i2c_base + SMBUS_GEN_INT_STAT_REG_OFF);
> > +
> > +     if (regval & I2C_BUF_MSTR_INTR_MASK) {
> > +             regval1 = readb(i2c->i2c_base +
> > SMBUS_INTR_STAT_REG_OFF);
> > +             if (regval1 & INTR_STAT_DMA_TERM) {
> > +                     complete(&i2c->i2c_xfer_done);
> > +                     intr_handled = true;
> > +                     writeb(INTR_STAT_DMA_TERM,
> > +                            (i2c->i2c_base +
> > SMBUS_INTR_STAT_REG_OFF));
> > +             }
> > +             /* ACK the high level interrupt */
> > +             writew(I2C_BUF_MSTR_INTR_MASK,
> > +                    (i2c->i2c_base + SMBUS_GEN_INT_STAT_REG_OFF));
> > +     }
> > +
> > +     if (regval & SMBALERT_INTR_MASK) {
> > +             intr_handled = true;
> > +             /* ACK the high level interrupt */
> > +             writew(SMBALERT_INTR_MASK,
> > +                    (i2c->i2c_base + SMBUS_GEN_INT_STAT_REG_OFF));
> > +     }
> > +
> > +     regval = readw(i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF);
> > +     /* UnMask the interrupt */
> > +     regval &= ~(I2C_BUF_MSTR_INTR_MASK | SMBALERT_INTR_MASK);
> > +     writew(regval, (i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF));
> > +
> > +     spin_unlock_irqrestore(&i2c->lock, flags);
> > +
> > +     if (intr_handled)
> > +             return IRQ_HANDLED;
> > +     else
> > +             return IRQ_NONE;
> 
> return intr_handled ? IRQ_HANDLED : IRQ_NONE;
> 
> Or turn intr_handled into "irqreturn_t ret" and return it directly.

Ok. Got it.

> 
> ...> +static void pci1xxxx_i2c_set_freq(struct pci1xxxx_i2c
> *i2c)
> > +{
> > +     /*
> > +      * The SMB core needs specific values to be set in the
> > BUS_CLK register
> > +      * for the corresponding frequency
> > +      */
> > +     switch (i2c->freq) {
> 
> Why i2c->freq is fixed to I2C_MAX_FAST_MODE_FREQ in
> pci1xxxx_i2c_init()?

This is the default frequency at which the adapter shall operate. This
driver is targeted for x86,X64 platforms. Could you please suggest a
way to configure the freqeuncy?
  
> 
> ...
> > +static void pci1xxxx_i2c_init(struct pci1xxxx_i2c *i2c)
> > +{
> > +     i2c->freq = I2C_MAX_FAST_MODE_FREQ;
> ...
> 
> > +static u32 pci1xxxx_i2c_get_funcs(struct i2c_adapter *adap)
> > +{
> > +     return (I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING
> > +             | I2C_FUNC_SMBUS_BLOCK_PROC_CALL
> > +             | I2C_FUNC_SMBUS_READ_BYTE |
> > I2C_FUNC_SMBUS_WRITE_BYTE
> > +             | I2C_FUNC_SMBUS_READ_BYTE_DATA
> > +             | I2C_FUNC_SMBUS_WRITE_BYTE_DATA
> > +             | I2C_FUNC_SMBUS_READ_WORD_DATA
> > +             | I2C_FUNC_SMBUS_WRITE_WORD_DATA
> > +             | I2C_FUNC_SMBUS_PROC_CALL |
> > I2C_FUNC_SMBUS_READ_BLOCK_DATA
> > +             | I2C_FUNC_SMBUS_WRITE_BLOCK_DATA);
> > +}
> The 'or' should be on the right side and parentheses are not needed.

ok.Got it.

> 
> ...
> > +static int pci1xxxx_i2c_resume(struct device *dev)> +{
> > +     struct pci1xxxx_i2c *i2c = dev_get_drvdata(dev);
> > +     struct pci_dev *pdev = to_pci_dev(dev);
> > +     u32 regval;
> > +
> > +     i2c_mark_adapter_resumed(&i2c->adap);
> > +
> > +     regval = readl(i2c->i2c_base + SMBUS_RESET_REG);
> > +     regval &= ~PERI_SMBUS_D3_RESET_DIS;
> > +     writel(regval, i2c->i2c_base + SMBUS_RESET_REG);
> 
> Adapter is resumed after register is written.

Ok. I will change it. 

> 
> > +     return 0;
> > +}
> > +
> > +static SIMPLE_DEV_PM_OPS(pci1xxxx_i2c_pm_ops,
> > pci1xxxx_i2c_suspend,
> > +                      pci1xxxx_i2c_resume);
> > +
> > +static int pci1xxxx_i2c_probe_pci(struct pci_dev *pdev,
> > +                               const struct pci_device_id *ent)
> > +{
> ...
> > +     pci1xxxx_i2c_init(i2c);
> > +
> > +     i2c->adap = pci1xxxx_i2c_ops;
> > +
> > +     i2c->adap.class = I2C_CLASS_SPD;
> > +     i2c->adap.dev.parent = &pdev->dev;
> > +
> > +     snprintf(i2c->adap.name, sizeof(i2c->adap.name),
> > +              "MCHP PCI1xxxx i2c adapter at %s", pci_name(pdev));
> > +
> > +     i2c_set_adapdata(&i2c->adap, i2c);
> > +
> > +     ret = i2c_add_adapter(&i2c->adap);
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "i2c add adapter failed = %d\n",
> > ret);
> > +             goto err_free_region;
> 
> pci1xxxx_i2c_shutdown()?

Ok.Understood.Will add it.
> 
> > +     }
> > +
> > +     return 0;
> > +
> > +err_free_region:
> > +     pci_release_regions(pdev);
> > +     return ret;
> > +}
> > +
> > +static void pci1xxxx_i2c_shutdown(struct pci1xxxx_i2c *i2c)
> > +{
> > +     pci1xxxx_i2c_config_padctrl(i2c, false);
> > +     pci1xxxx_i2c_configure_core_reg(i2c, false);
> > +}
> > +
> > +static void pci1xxxx_i2c_remove_pci(struct pci_dev *pdev)
> > +{
> > +     struct pci1xxxx_i2c *i2c = pci_get_drvdata(pdev);
> > +
> > +     pci1xxxx_i2c_shutdown(i2c);
> > +     i2c_del_adapter(&i2c->adap);
> > +}
> > +
> > +static const struct pci_device_id pci1xxxx_i2c_pci_id_table[] = {
> > +     { PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI12000_I2C_PID) },
> > +     { PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11010_I2C_PID) },
> > +     { PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11101_I2C_PID) },
> > +     { PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11400_I2C_PID) },
> > +     { PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11414_I2C_PID) },
> > +     {0, }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(pci, pci1xxxx_i2c_pci_id_table);
> > +
> > +static struct pci_driver pci1xxxx_i2c_pci_driver = {
> > +     .name           = DRV_NAME,
> 
> Assign name directly, DRV_NAME unneeded.

ok.Got it.



