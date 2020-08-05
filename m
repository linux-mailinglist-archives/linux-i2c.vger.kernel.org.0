Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73CAC23D1D0
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 22:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729478AbgHEUGY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 16:06:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:50734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726351AbgHEQev (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 12:34:51 -0400
Received: from localhost (mobile-166-175-186-42.mycingular.net [166.175.186.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B83BD2333D;
        Wed,  5 Aug 2020 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596641314;
        bh=A3fBP2F0oTnzghrQINF7bdDyAwWTRiVsMOyIPbS9fnI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=Jn3hU4c1pYpI0XdlIq4C3LPHy/seX54M6XHzJdjok72coYQfH0cempWUpzwY/1x1C
         GLBitKtQx8rX4Rx4W6NC8Kwwta3z9ctGwV8hdZcT6s9FyVsoV9nSlSpNZ0ehRSakFN
         vFlc8OEtJI2NPZAE1hqWB2ILz853HevbhrOXacCY=
Date:   Wed, 5 Aug 2020 10:28:32 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
        Tomoya MORINAGA <tomoya.rohm@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v1] i2c: eg20t: use generic power management
Message-ID: <20200805152832.GA511823@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200805152331.GA510793@bjorn-Precision-5520>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[update Linus's address, drop Qi's (bounced)]

On Wed, Aug 05, 2020 at 10:23:31AM -0500, Bjorn Helgaas wrote:
> [+cc Tomoya, Linus, Qi, Ben from e9bc8fa5df1c]
> 
> On Mon, Jul 20, 2020 at 07:30:32PM +0530, Vaibhav Gupta wrote:
> > Drivers using legacy PM have to manage PCI states and device's PM states
> > themselves. They also need to take care of configuration registers.
> > 
> > With improved and powerful support of generic PM, PCI Core takes care of
> > above mentioned, device-independent, jobs.
> > 
> > This driver makes use of PCI helper functions like
> > pci_save/restore_state(), pci_enable/disable_device(),
> > pci_enable_wake() and pci_set_power_state() to do required operations. In
> > generic mode, they are no longer needed.
> > 
> > Change function parameter in both .suspend() and .resume() to
> > "struct device*" type. Use to_pci_dev() and dev_get_drvdata() to get
> > "struct pci_dev*" variable and drv data.
> > 
> > Compile-tested only.
> > 
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-eg20t.c | 39 ++++++++--------------------------
> >  1 file changed, 9 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
> > index 73f139690e4e..c0ddc4cc2ce7 100644
> > --- a/drivers/i2c/busses/i2c-eg20t.c
> > +++ b/drivers/i2c/busses/i2c-eg20t.c
> > @@ -846,11 +846,10 @@ static void pch_i2c_remove(struct pci_dev *pdev)
> >  	kfree(adap_info);
> >  }
> >  
> > -#ifdef CONFIG_PM
> > -static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
> > +static int __maybe_unused pch_i2c_suspend(struct device *dev)
> >  {
> > -	int ret;
> >  	int i;
> > +	struct pci_dev *pdev = to_pci_dev(dev);
> >  	struct adapter_info *adap_info = pci_get_drvdata(pdev);
> 
> Why don't you use "adap_info = dev_get_drvdata(dev)" as you did below,
> so you don't need to_pci_dev()?
> 
> >  	void __iomem *p = adap_info->pch_data[0].pch_base_address;
> >  
> > @@ -872,34 +871,17 @@ static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
> >  		ioread32(p + PCH_I2CSR), ioread32(p + PCH_I2CBUFSTA),
> >  		ioread32(p + PCH_I2CESRSTA));
> >  
> > -	ret = pci_save_state(pdev);
> > -
> > -	if (ret) {
> > -		pch_pci_err(pdev, "pci_save_state\n");
> > -		return ret;
> > -	}
> > -
> > -	pci_enable_wake(pdev, PCI_D3hot, 0);
> > -	pci_disable_device(pdev);
> > -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> > +	device_wakeup_disable(dev);
> >  
> >  	return 0;
> >  }
> >  
> > -static int pch_i2c_resume(struct pci_dev *pdev)
> > +static int __maybe_unused pch_i2c_resume(struct device *dev)
> >  {
> >  	int i;
> > -	struct adapter_info *adap_info = pci_get_drvdata(pdev);
> > -
> > -	pci_set_power_state(pdev, PCI_D0);
> > -	pci_restore_state(pdev);
> > +	struct adapter_info *adap_info = dev_get_drvdata(dev);
> >  
> > -	if (pci_enable_device(pdev) < 0) {
> > -		pch_pci_err(pdev, "pch_i2c_resume:pci_enable_device FAILED\n");
> > -		return -EIO;
> > -	}
> > -
> > -	pci_enable_wake(pdev, PCI_D3hot, 0);
> > +	device_wakeup_disable(dev);
> 
> It *looks* wrong to disable wakeup in both suspend and resume.  I
> think the usual pattern is to enable wakeup in suspend and disable it
> in resume.
> 
> But it looks like it's been that way since the driver was added by
> e9bc8fa5df1c ("i2c-eg20t: add driver for Intel EG20T").
> 
> If the device doesn't support wakeup, I would not expect the driver to
> mention wakeup at all.
> 
> In any case, I think it's the right thing for *this* patch to preserve
> the previous wakeup behavior.  Maybe we want a follow-up patch to just
> remove both device_wakeup_disable() calls?
> 
> >  	for (i = 0; i < adap_info->ch_num; i++)
> >  		pch_i2c_init(&adap_info->pch_data[i]);
> > @@ -908,18 +890,15 @@ static int pch_i2c_resume(struct pci_dev *pdev)
> >  
> >  	return 0;
> >  }
> > -#else
> > -#define pch_i2c_suspend NULL
> > -#define pch_i2c_resume NULL
> > -#endif
> > +
> > +static SIMPLE_DEV_PM_OPS(pch_i2c_pm_ops, pch_i2c_suspend, pch_i2c_resume);
> >  
> >  static struct pci_driver pch_pcidriver = {
> >  	.name = KBUILD_MODNAME,
> >  	.id_table = pch_pcidev_id,
> >  	.probe = pch_i2c_probe,
> >  	.remove = pch_i2c_remove,
> > -	.suspend = pch_i2c_suspend,
> > -	.resume = pch_i2c_resume
> > +	.driver.pm = &pch_i2c_pm_ops,
> >  };
> >  
> >  module_pci_driver(pch_pcidriver);
> > -- 
> > 2.27.0
> > 
