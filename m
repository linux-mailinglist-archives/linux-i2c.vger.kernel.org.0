Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837DB2403E2
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Aug 2020 11:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgHJJTy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 05:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgHJJTx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Aug 2020 05:19:53 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 682E5C061756;
        Mon, 10 Aug 2020 02:19:53 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k13so4447983plk.13;
        Mon, 10 Aug 2020 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LG+fIp5OZ25It71Wra3d8yfu2prbPEMG5KpZ0CWWGCc=;
        b=Ax7gqxfGIMFUTMwsQKBmRknt4QVEZlySJYJG1TRzYusE6XvTmcOEpv8tKf3kBk00cX
         ElKMU+sWP7NxGBs4dvW8mIRqLwbUtKRX8tsgz+Qt/3N0vKNZ2cqqW0W4fiReomKI9khn
         RKk8brgclZZsgdpuvH9NCvFkSy90nsuhWs/maKtp9738zFm47LNjKZmdDuOjxnDi6m4c
         5jNvE+Z45Iqj9ky3pLQpBzps3ZU5/6Yfg7MBZL1yshWFIXSjeUolc+B+NytARzbwpdhC
         8wyxvA6qwoJXixTxoyeBMnT+MZ8r+4pvM8u1uo3KJH6hj/+oa8hNfZaQX56qIBx/wNZ/
         xi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LG+fIp5OZ25It71Wra3d8yfu2prbPEMG5KpZ0CWWGCc=;
        b=erNu6tuQZPM6o7Bk8rW4KkuLe6yP/tFva4pCwmW0AL/oh2A4Odhd4o1M37GDpyxPj6
         VFxzf2hJQEXpmTDB7QR9xBsWCv68vAiUPblMk3NrX3rYi7q/P7ffZHs1U4Es73Ah8Zxc
         2s3fUghDsYRm3BNUO2+XuXqosCromFsvvfTPCPxOC1U7zM4RF/6Q63DoRbSI4KZTGwxd
         4TdwemoqbATXgPeDP9HYQEdCNojq7ZMx0znJvJEyMFHCXCrkmC2nQeaYG/EoaiooOW0q
         Ud+ewB9fok/T3zqXaVvx2vbr3bQop0dWVKXuMGRL/U9gRbNocM2WPWtSebLwMAVKwHUL
         +QLQ==
X-Gm-Message-State: AOAM5325Mdu60tOlNt1tJLT2nvUfZgz8bA1aITiX1EL2x60vfyFCHeP+
        FosnMjclhkKvKFXrCbcbqZA=
X-Google-Smtp-Source: ABdhPJx7x4fvEeZF1zvMGSiHBSqpbplJv6jIiVbs9RahcOYpDup1KSq1TWn/T1OM81CeqnCBgD6+oA==
X-Received: by 2002:a17:90b:a45:: with SMTP id gw5mr25112629pjb.80.1597051192832;
        Mon, 10 Aug 2020 02:19:52 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
        by smtp.gmail.com with ESMTPSA id x12sm7776750pff.48.2020.08.10.02.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 02:19:52 -0700 (PDT)
Date:   Mon, 10 Aug 2020 14:48:19 +0530
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
        Tomoya MORINAGA <tomoya.rohm@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2 2/2] i2c: eg20t: use generic power management
Message-ID: <20200810091819.GA6615@gmail.com>
References: <20200805193616.384313-3-vaibhavgupta40@gmail.com>
 <20200807202321.GA753887@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200807202321.GA753887@bjorn-Precision-5520>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 07, 2020 at 03:23:21PM -0500, Bjorn Helgaas wrote:
> [+cc Jean for i801 question below]
> 
> On Thu, Aug 06, 2020 at 01:06:16AM +0530, Vaibhav Gupta wrote:
> > Drivers using legacy power management .suspen()/.resume() callbacks
> > have to manage PCI states and device's PM states themselves. They also
> > need to take care of standard configuration registers.
> > 
> > Switch to generic power management framework using a single
> > "struct dev_pm_ops" variable to take the unnecessary load from the driver.
> > This also avoids the need for the driver to directly call most of the PCI
> > helper functions and device power state control functions, as through
> > the generic framework PCI Core takes care of the necessary operations,
> > and drivers are required to do only device-specific jobs.
> > 
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> 
> s/.suspen/.suspend/ above
> 
> These both look right to me.
> 
> Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> Looking at neighboring drivers, it looks like some already use generic
> PM but have unnecessary PCI code, e.g., amd_mp2_pci_suspend().
> Probably already on your list.
Yes :)
> 
> Also, i801_suspend() looks suspicious because it writes SMBHSTCFG, but
> I don't see anything corresponding in i801_resume().
I will look into it.

Thanks
Vaibhav Gupta
> 
> > ---
> >  drivers/i2c/busses/i2c-eg20t.c | 36 +++++++---------------------------
> >  1 file changed, 7 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
> > index eb41de22d461..843b31a0f752 100644
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
> >  	void __iomem *p = adap_info->pch_data[0].pch_base_address;
> >  
> > @@ -872,31 +871,13 @@ static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
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
> > -	pci_disable_device(pdev);
> > -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> > -
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
> > -
> > -	if (pci_enable_device(pdev) < 0) {
> > -		pch_pci_err(pdev, "pch_i2c_resume:pci_enable_device FAILED\n");
> > -		return -EIO;
> > -	}
> > +	struct adapter_info *adap_info = dev_get_drvdata(dev);
> >  
> >  	for (i = 0; i < adap_info->ch_num; i++)
> >  		pch_i2c_init(&adap_info->pch_data[i]);
> > @@ -905,18 +886,15 @@ static int pch_i2c_resume(struct pci_dev *pdev)
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
