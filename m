Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3CC823CD36
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 19:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbgHERWy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 13:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728114AbgHERVa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 13:21:30 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C497FC06179E;
        Wed,  5 Aug 2020 10:21:21 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id 2so4877693pjx.5;
        Wed, 05 Aug 2020 10:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ClBxmhMDW8/EvqLNuXj7OToao++oyiDhHUE3TT7mBds=;
        b=psVRPR/sQ1D/EHzTjCqfMm49Kjs6jS5auCQQBuWbaa1ukcEDyAan+MKT7yZoc3sepE
         EoqGblTTU4cr4TCQeCPp/im62vToSQLewk0u5eMCamxeSnJNHMpiCoReUYZSxzRPngu1
         1PUQ+MMFRGpA4CUuOiUzBNwZaxXTTuUauYeD2V3wKoQZwQ7bwQ8+2biTqpaPDNAgq8Rz
         5+au1GfTD1+3fTUoK7IALQA/eUtFt+9W3E4iMiikKnnsD0Xhfw9N22U86G3kYHDISlAt
         o20tsTlfuuPQMKS2NMPO7rIyuXCOUHGemsNKMwJoCsjOrAoekgzG9GyjBezv50GGVbjT
         sX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ClBxmhMDW8/EvqLNuXj7OToao++oyiDhHUE3TT7mBds=;
        b=eBSff30Fgum2ByIJIpAIwRA1yDLjWVFuwpIm309ALtnqwi9p6p0zLngy9SuGAitH3z
         PFxH4/IqjO+/v2QjDJRnwev68H0M045uG73NVAVgGNuDbP9JIlo3n2pM8goKbQX4ejjE
         1+P2uMMLYAklYg+keU96X/k2UFIWTF4fFxqiFmmDDLq0Y/GY5kgreRk32XY36bAvTUVn
         XrVdjgzW1WWu6qZ+QfQ8dYnZ0p9AYdqZfST11cLbA+PU7bPsnhlA4xC4asPreWr0yBym
         py2oGSrQUKx5z6qjqQIdrCg015kSXKTg4mW5Bd0LNKXFCXMkQEP77A2fbRKhPxkPkFWl
         FMxA==
X-Gm-Message-State: AOAM533Iaqj1Ri62BfxZqEE73xoz+Tz2bDPszB9sUFZMvAAuuvNrIyjs
        qPyF7Fg3Kgfk9hqkI6mApec=
X-Google-Smtp-Source: ABdhPJxzb/HUa4PssPf3WyZJk2/9fO9KwC5LbUHExxDSZz5HT6M3KGkwkKCGNwW8SVIKjQvLhzHLAw==
X-Received: by 2002:a17:902:8495:: with SMTP id c21mr4240892plo.82.1596648081145;
        Wed, 05 Aug 2020 10:21:21 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
        by smtp.gmail.com with ESMTPSA id d24sm4850758pfq.72.2020.08.05.10.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 10:21:20 -0700 (PDT)
Date:   Wed, 5 Aug 2020 22:49:37 +0530
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
Message-ID: <20200805171937.GA85392@gmail.com>
References: <20200805162154.GA3179@gmail.com>
 <20200805165611.GA516242@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200805165611.GA516242@bjorn-Precision-5520>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 05, 2020 at 11:56:11AM -0500, Bjorn Helgaas wrote:
> On Wed, Aug 05, 2020 at 09:51:54PM +0530, Vaibhav Gupta wrote:
> > On Wed, Aug 05, 2020 at 10:28:32AM -0500, Bjorn Helgaas wrote:
> > > On Wed, Aug 05, 2020 at 10:23:31AM -0500, Bjorn Helgaas wrote:
> > > > On Mon, Jul 20, 2020 at 07:30:32PM +0530, Vaibhav Gupta wrote:
> > > > > Drivers using legacy PM have to manage PCI states and device's PM states
> > > > > themselves. They also need to take care of configuration registers.
> > > > > 
> > > > > With improved and powerful support of generic PM, PCI Core takes care of
> > > > > above mentioned, device-independent, jobs.
> > > > > 
> > > > > This driver makes use of PCI helper functions like
> > > > > pci_save/restore_state(), pci_enable/disable_device(),
> > > > > pci_enable_wake() and pci_set_power_state() to do required operations. In
> > > > > generic mode, they are no longer needed.
> > > > > 
> > > > > Change function parameter in both .suspend() and .resume() to
> > > > > "struct device*" type. Use to_pci_dev() and dev_get_drvdata() to get
> > > > > "struct pci_dev*" variable and drv data.
> > > > > 
> > > > > Compile-tested only.
> > > > > 
> > > > > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > > > > ---
> > > > >  drivers/i2c/busses/i2c-eg20t.c | 39 ++++++++--------------------------
> > > > >  1 file changed, 9 insertions(+), 30 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
> > > > > index 73f139690e4e..c0ddc4cc2ce7 100644
> > > > > --- a/drivers/i2c/busses/i2c-eg20t.c
> > > > > +++ b/drivers/i2c/busses/i2c-eg20t.c
> > > > > @@ -846,11 +846,10 @@ static void pch_i2c_remove(struct pci_dev *pdev)
> > > > >  	kfree(adap_info);
> > > > >  }
> > > > >  
> > > > > -#ifdef CONFIG_PM
> > > > > -static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
> > > > > +static int __maybe_unused pch_i2c_suspend(struct device *dev)
> > > > >  {
> > > > > -	int ret;
> > > > >  	int i;
> > > > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > > > >  	struct adapter_info *adap_info = pci_get_drvdata(pdev);
> > > > 
> > > > Why don't you use "adap_info = dev_get_drvdata(dev)" as you did below,
> > > > so you don't need to_pci_dev()?
> > > >
> > Actually, line 870, pch_pci_dbg() again needs "struct pci_dev*" type
> > pointer.  Either way I had to use to_pci_dev(), so defined "pdev"
> > which made less number of required changes in the code.
> 
> OK.  pch_pci_dbg() only needs the pdev in order to *get* the struct
> device *, so it's all sort of in circles.  But it's fine to do as you
> did here.
> 
> > > > >  	void __iomem *p = adap_info->pch_data[0].pch_base_address;
> > > > >  
> > > > > @@ -872,34 +871,17 @@ static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
> > > > >  		ioread32(p + PCH_I2CSR), ioread32(p + PCH_I2CBUFSTA),
> > > > >  		ioread32(p + PCH_I2CESRSTA));
> > > > >  
> > > > > -	ret = pci_save_state(pdev);
> > > > > -
> > > > > -	if (ret) {
> > > > > -		pch_pci_err(pdev, "pci_save_state\n");
> > > > > -		return ret;
> > > > > -	}
> > > > > -
> > > > > -	pci_enable_wake(pdev, PCI_D3hot, 0);
> > > > > -	pci_disable_device(pdev);
> > > > > -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> > > > > +	device_wakeup_disable(dev);
> > > > >  
> > > > >  	return 0;
> > > > >  }
> > > > >  
> > > > > -static int pch_i2c_resume(struct pci_dev *pdev)
> > > > > +static int __maybe_unused pch_i2c_resume(struct device *dev)
> > > > >  {
> > > > >  	int i;
> > > > > -	struct adapter_info *adap_info = pci_get_drvdata(pdev);
> > > > > -
> > > > > -	pci_set_power_state(pdev, PCI_D0);
> > > > > -	pci_restore_state(pdev);
> > > > > +	struct adapter_info *adap_info = dev_get_drvdata(dev);
> > > > >  
> > > > > -	if (pci_enable_device(pdev) < 0) {
> > > > > -		pch_pci_err(pdev, "pch_i2c_resume:pci_enable_device FAILED\n");
> > > > > -		return -EIO;
> > > > > -	}
> > > > > -
> > > > > -	pci_enable_wake(pdev, PCI_D3hot, 0);
> > > > > +	device_wakeup_disable(dev);
> > > > 
> > > > It *looks* wrong to disable wakeup in both suspend and resume.  I
> > > > think the usual pattern is to enable wakeup in suspend and disable it
> > > > in resume.
> > > > 
> > > > But it looks like it's been that way since the driver was added by
> > > > e9bc8fa5df1c ("i2c-eg20t: add driver for Intel EG20T").
> > > > 
> > > > If the device doesn't support wakeup, I would not expect the driver to
> > > > mention wakeup at all.
> > > > 
> > > > In any case, I think it's the right thing for *this* patch to preserve
> > > > the previous wakeup behavior.  Maybe we want a follow-up patch to just
> > > > remove both device_wakeup_disable() calls?
> > > > 
> > We have seen this issue earlier in other drivers too. I remember you even
> > identified and listed them.
> > The PCI core calls, pci_enable_wake(pci_dev, PCI_D0, false). And if the driver
> > does not want to enable-wake on suspend, we discussed and concluded that the
> > calls should be dropped.
> > I am sending v2, to include dropping wakeup call.
> 
> Personally, I think I would do this in two patches, and in the reverse
> order than what I first suggested:
> 
>   1) Drop pci_enable_wake() calls
>   2) Convert to generic PM
> 
> Doing them in that order means patch 2 will be slightly simpler, and
> if there's any issue with removing the wakeup stuff, we can debug it
> in the context of the original PCI PM code we've been using for years
> without muddying the water with the additional generic PM changes.
> 
Yeah, this seems more reasonable.

Thanks
Vaibhav Gupta
> > > > >  	for (i = 0; i < adap_info->ch_num; i++)
> > > > >  		pch_i2c_init(&adap_info->pch_data[i]);
> > > > > @@ -908,18 +890,15 @@ static int pch_i2c_resume(struct pci_dev *pdev)
> > > > >  
> > > > >  	return 0;
> > > > >  }
> > > > > -#else
> > > > > -#define pch_i2c_suspend NULL
> > > > > -#define pch_i2c_resume NULL
> > > > > -#endif
> > > > > +
> > > > > +static SIMPLE_DEV_PM_OPS(pch_i2c_pm_ops, pch_i2c_suspend, pch_i2c_resume);
> > > > >  
> > > > >  static struct pci_driver pch_pcidriver = {
> > > > >  	.name = KBUILD_MODNAME,
> > > > >  	.id_table = pch_pcidev_id,
> > > > >  	.probe = pch_i2c_probe,
> > > > >  	.remove = pch_i2c_remove,
> > > > > -	.suspend = pch_i2c_suspend,
> > > > > -	.resume = pch_i2c_resume
> > > > > +	.driver.pm = &pch_i2c_pm_ops,
> > > > >  };
> > > > >  
> > > > >  module_pci_driver(pch_pcidriver);
> > > > > -- 
> > > > > 2.27.0
> > > > > 
