Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 860EE23F3BA
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 22:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgHGUXY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 16:23:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:55216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbgHGUXX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Aug 2020 16:23:23 -0400
Received: from localhost (130.sub-72-107-113.myvzw.com [72.107.113.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C24172074D;
        Fri,  7 Aug 2020 20:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596831803;
        bh=eZ11znaZyBQszlg13DinqaMSmiV/14OwQJjM/YVoM+c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=Q+hpo1S9CCaw7/RboOmuRIq5Ozpy9Hdj0Hf44V38d2eDCxlcW+VH8u6vVQkYUeyUl
         flExzj3W5bnBE9Ff7v7xOJyfdoYbK1r0jQE8q9j1KEkFK6giGkFBUL2hekm9yOMFLn
         8o2cIPiustbpSOxrNK9i+etfjHb3UYpZEsZSk0U0=
Date:   Fri, 7 Aug 2020 15:23:21 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Vaibhav Gupta <vaibhavgupta40@gmail.com>
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
Message-ID: <20200807202321.GA753887@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200805193616.384313-3-vaibhavgupta40@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[+cc Jean for i801 question below]

On Thu, Aug 06, 2020 at 01:06:16AM +0530, Vaibhav Gupta wrote:
> Drivers using legacy power management .suspen()/.resume() callbacks
> have to manage PCI states and device's PM states themselves. They also
> need to take care of standard configuration registers.
> 
> Switch to generic power management framework using a single
> "struct dev_pm_ops" variable to take the unnecessary load from the driver.
> This also avoids the need for the driver to directly call most of the PCI
> helper functions and device power state control functions, as through
> the generic framework PCI Core takes care of the necessary operations,
> and drivers are required to do only device-specific jobs.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

s/.suspen/.suspend/ above

These both look right to me.

Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>

Looking at neighboring drivers, it looks like some already use generic
PM but have unnecessary PCI code, e.g., amd_mp2_pci_suspend().
Probably already on your list.

Also, i801_suspend() looks suspicious because it writes SMBHSTCFG, but
I don't see anything corresponding in i801_resume().

> ---
>  drivers/i2c/busses/i2c-eg20t.c | 36 +++++++---------------------------
>  1 file changed, 7 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
> index eb41de22d461..843b31a0f752 100644
> --- a/drivers/i2c/busses/i2c-eg20t.c
> +++ b/drivers/i2c/busses/i2c-eg20t.c
> @@ -846,11 +846,10 @@ static void pch_i2c_remove(struct pci_dev *pdev)
>  	kfree(adap_info);
>  }
>  
> -#ifdef CONFIG_PM
> -static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused pch_i2c_suspend(struct device *dev)
>  {
> -	int ret;
>  	int i;
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct adapter_info *adap_info = pci_get_drvdata(pdev);
>  	void __iomem *p = adap_info->pch_data[0].pch_base_address;
>  
> @@ -872,31 +871,13 @@ static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
>  		ioread32(p + PCH_I2CSR), ioread32(p + PCH_I2CBUFSTA),
>  		ioread32(p + PCH_I2CESRSTA));
>  
> -	ret = pci_save_state(pdev);
> -
> -	if (ret) {
> -		pch_pci_err(pdev, "pci_save_state\n");
> -		return ret;
> -	}
> -
> -	pci_disable_device(pdev);
> -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> -
>  	return 0;
>  }
>  
> -static int pch_i2c_resume(struct pci_dev *pdev)
> +static int __maybe_unused pch_i2c_resume(struct device *dev)
>  {
>  	int i;
> -	struct adapter_info *adap_info = pci_get_drvdata(pdev);
> -
> -	pci_set_power_state(pdev, PCI_D0);
> -	pci_restore_state(pdev);
> -
> -	if (pci_enable_device(pdev) < 0) {
> -		pch_pci_err(pdev, "pch_i2c_resume:pci_enable_device FAILED\n");
> -		return -EIO;
> -	}
> +	struct adapter_info *adap_info = dev_get_drvdata(dev);
>  
>  	for (i = 0; i < adap_info->ch_num; i++)
>  		pch_i2c_init(&adap_info->pch_data[i]);
> @@ -905,18 +886,15 @@ static int pch_i2c_resume(struct pci_dev *pdev)
>  
>  	return 0;
>  }
> -#else
> -#define pch_i2c_suspend NULL
> -#define pch_i2c_resume NULL
> -#endif
> +
> +static SIMPLE_DEV_PM_OPS(pch_i2c_pm_ops, pch_i2c_suspend, pch_i2c_resume);
>  
>  static struct pci_driver pch_pcidriver = {
>  	.name = KBUILD_MODNAME,
>  	.id_table = pch_pcidev_id,
>  	.probe = pch_i2c_probe,
>  	.remove = pch_i2c_remove,
> -	.suspend = pch_i2c_suspend,
> -	.resume = pch_i2c_resume
> +	.driver.pm = &pch_i2c_pm_ops,
>  };
>  
>  module_pci_driver(pch_pcidriver);
> -- 
> 2.27.0
> 
