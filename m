Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D241723D27F
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 22:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgHEUN0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 16:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgHEQXc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 12:23:32 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9D5C0086A2;
        Wed,  5 Aug 2020 09:23:31 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t11so5687650plr.5;
        Wed, 05 Aug 2020 09:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IeRsxVSY253Dl1UryHxPoWgaYMLY3iT3hncn20nrsEQ=;
        b=hkzPp96SNBY8LoUvt2W1bUig34IOWher6jbEXQfq1b3RD7ZlI6Afo4fuG2q8yyhEiK
         tJmO/TFFHzTHeIr6pay/PgJgm4kKweKK3hgCMyGkIOjXCpZ9ddn0R9zMcxQBvWzbIL0V
         /Op54Ocm3KxoSgX4+eHZX8LB8hXxw4EnTHE3G7r6W2YfiydL/KnnFsdjwfhNI7E9JI5Q
         xe1t419Qw44UAfDEaf1VuBBG7pOR1mOOD2JXVnatY6smyrREhdRUM9M/9WdaPtatYqEa
         WZL1wQ00vlqeMLmVneqr0P+USzxG9l3Ie4oTWVHPUbePCQnnqCndQhx7E8VwvmDGfKKG
         tvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IeRsxVSY253Dl1UryHxPoWgaYMLY3iT3hncn20nrsEQ=;
        b=VrKkoSe7LCAX8pDh+HwGlXgCxWOKWqa8wPKtSLGt925kCo2rMRD+g6dI2tAR3Eog7m
         PFS/b4H2Qn3gJU1KvunmZkJP9hIBnwW8lwmhHHmv4xVVoQNT0MDWIZtMDQaQVPzJ2EyB
         No4+EAX0kuF7TApooByr2VINGboFK2acTqKO5bM6+gqr504IOhsIfOyC128LYsA6/B54
         ZgRXxNaFpqW+d6Rk1Vqjm6vnA0hHATX8BQyP9sgA3ZQ36csXq7idVzxjk5Vuu1cgKLwe
         SqK6TPS3WysaEOPJ+3mFE9sgbGpBYEi9yCN9EyPoYtfhJ420XNfIU86/KNWuGizfmwrL
         XaHg==
X-Gm-Message-State: AOAM533OFfqRWgj299ULU6b+DXUyq6cvDTpalKwNXjOWfcgb2LaCLGqT
        BpM/uWBjiGcQyHCPVwjSZ9A=
X-Google-Smtp-Source: ABdhPJyF+fa9fDEaevgKFX7Ga5Bf/Qae+ENKw81F0F1ZsY+x6a9bOPt4CcgeVGvHuq4hmBnfyiZQdw==
X-Received: by 2002:a17:90a:f290:: with SMTP id fs16mr4032872pjb.35.1596644609948;
        Wed, 05 Aug 2020 09:23:29 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
        by smtp.gmail.com with ESMTPSA id y196sm4244977pfc.202.2020.08.05.09.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 09:23:29 -0700 (PDT)
Date:   Wed, 5 Aug 2020 21:51:54 +0530
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
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
Message-ID: <20200805162154.GA3179@gmail.com>
References: <20200805152331.GA510793@bjorn-Precision-5520>
 <20200805152832.GA511823@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200805152832.GA511823@bjorn-Precision-5520>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 05, 2020 at 10:28:32AM -0500, Bjorn Helgaas wrote:
> [update Linus's address, drop Qi's (bounced)]
> 
> On Wed, Aug 05, 2020 at 10:23:31AM -0500, Bjorn Helgaas wrote:
> > [+cc Tomoya, Linus, Qi, Ben from e9bc8fa5df1c]
> > 
> > On Mon, Jul 20, 2020 at 07:30:32PM +0530, Vaibhav Gupta wrote:
> > > Drivers using legacy PM have to manage PCI states and device's PM states
> > > themselves. They also need to take care of configuration registers.
> > > 
> > > With improved and powerful support of generic PM, PCI Core takes care of
> > > above mentioned, device-independent, jobs.
> > > 
> > > This driver makes use of PCI helper functions like
> > > pci_save/restore_state(), pci_enable/disable_device(),
> > > pci_enable_wake() and pci_set_power_state() to do required operations. In
> > > generic mode, they are no longer needed.
> > > 
> > > Change function parameter in both .suspend() and .resume() to
> > > "struct device*" type. Use to_pci_dev() and dev_get_drvdata() to get
> > > "struct pci_dev*" variable and drv data.
> > > 
> > > Compile-tested only.
> > > 
> > > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > > ---
> > >  drivers/i2c/busses/i2c-eg20t.c | 39 ++++++++--------------------------
> > >  1 file changed, 9 insertions(+), 30 deletions(-)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
> > > index 73f139690e4e..c0ddc4cc2ce7 100644
> > > --- a/drivers/i2c/busses/i2c-eg20t.c
> > > +++ b/drivers/i2c/busses/i2c-eg20t.c
> > > @@ -846,11 +846,10 @@ static void pch_i2c_remove(struct pci_dev *pdev)
> > >  	kfree(adap_info);
> > >  }
> > >  
> > > -#ifdef CONFIG_PM
> > > -static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
> > > +static int __maybe_unused pch_i2c_suspend(struct device *dev)
> > >  {
> > > -	int ret;
> > >  	int i;
> > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > >  	struct adapter_info *adap_info = pci_get_drvdata(pdev);
> > 
> > Why don't you use "adap_info = dev_get_drvdata(dev)" as you did below,
> > so you don't need to_pci_dev()?
> >
Actually, line 870, pch_pci_dbg() again needs "struct pci_dev*" type pointer.
Either way I had to use to_pci_dev(), so defined "pdev" which made less number
of required changes in the code.
> > >  	void __iomem *p = adap_info->pch_data[0].pch_base_address;
> > >  
> > > @@ -872,34 +871,17 @@ static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
> > >  		ioread32(p + PCH_I2CSR), ioread32(p + PCH_I2CBUFSTA),
> > >  		ioread32(p + PCH_I2CESRSTA));
> > >  
> > > -	ret = pci_save_state(pdev);
> > > -
> > > -	if (ret) {
> > > -		pch_pci_err(pdev, "pci_save_state\n");
> > > -		return ret;
> > > -	}
> > > -
> > > -	pci_enable_wake(pdev, PCI_D3hot, 0);
> > > -	pci_disable_device(pdev);
> > > -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> > > +	device_wakeup_disable(dev);
> > >  
> > >  	return 0;
> > >  }
> > >  
> > > -static int pch_i2c_resume(struct pci_dev *pdev)
> > > +static int __maybe_unused pch_i2c_resume(struct device *dev)
> > >  {
> > >  	int i;
> > > -	struct adapter_info *adap_info = pci_get_drvdata(pdev);
> > > -
> > > -	pci_set_power_state(pdev, PCI_D0);
> > > -	pci_restore_state(pdev);
> > > +	struct adapter_info *adap_info = dev_get_drvdata(dev);
> > >  
> > > -	if (pci_enable_device(pdev) < 0) {
> > > -		pch_pci_err(pdev, "pch_i2c_resume:pci_enable_device FAILED\n");
> > > -		return -EIO;
> > > -	}
> > > -
> > > -	pci_enable_wake(pdev, PCI_D3hot, 0);
> > > +	device_wakeup_disable(dev);
> > 
> > It *looks* wrong to disable wakeup in both suspend and resume.  I
> > think the usual pattern is to enable wakeup in suspend and disable it
> > in resume.
> > 
> > But it looks like it's been that way since the driver was added by
> > e9bc8fa5df1c ("i2c-eg20t: add driver for Intel EG20T").
> > 
> > If the device doesn't support wakeup, I would not expect the driver to
> > mention wakeup at all.
> > 
> > In any case, I think it's the right thing for *this* patch to preserve
> > the previous wakeup behavior.  Maybe we want a follow-up patch to just
> > remove both device_wakeup_disable() calls?
> > 
We have seen this issue earlier in other drivers too. I remember you even
identified and listed them.
The PCI core calls, pci_enable_wake(pci_dev, PCI_D0, false). And if the driver
does not want to enable-wake on suspend, we discussed and concluded that the
calls should be dropped.
I am sending v2, to include dropping wakeup call.

Thanks
Vaibhav Gupta
> > >  	for (i = 0; i < adap_info->ch_num; i++)
> > >  		pch_i2c_init(&adap_info->pch_data[i]);
> > > @@ -908,18 +890,15 @@ static int pch_i2c_resume(struct pci_dev *pdev)
> > >  
> > >  	return 0;
> > >  }
> > > -#else
> > > -#define pch_i2c_suspend NULL
> > > -#define pch_i2c_resume NULL
> > > -#endif
> > > +
> > > +static SIMPLE_DEV_PM_OPS(pch_i2c_pm_ops, pch_i2c_suspend, pch_i2c_resume);
> > >  
> > >  static struct pci_driver pch_pcidriver = {
> > >  	.name = KBUILD_MODNAME,
> > >  	.id_table = pch_pcidev_id,
> > >  	.probe = pch_i2c_probe,
> > >  	.remove = pch_i2c_remove,
> > > -	.suspend = pch_i2c_suspend,
> > > -	.resume = pch_i2c_resume
> > > +	.driver.pm = &pch_i2c_pm_ops,
> > >  };
> > >  
> > >  module_pci_driver(pch_pcidriver);
> > > -- 
> > > 2.27.0
> > > 
