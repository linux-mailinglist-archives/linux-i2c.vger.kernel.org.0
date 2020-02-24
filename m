Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 790F016AD73
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 18:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbgBXRad (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 12:30:33 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:38564 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbgBXRad (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Feb 2020 12:30:33 -0500
Received: by mail-il1-f193.google.com with SMTP id f5so8413928ilq.5;
        Mon, 24 Feb 2020 09:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SKj57E8UaKSzcr5YZePGtfiP1UB+Fu3gym2CoICZfHk=;
        b=M4ZViU/9h3Z6JjGtIU3UxjU+RHzCZ9+DjaoBCgJTI1glOFKFQ+LDnU8i4iyTFkdcjP
         EAOkuBDaaTKfppOeOqKrBblOA6SgnQI64RFELJ+Rc06MX6K2K778F1zk+EedbH1dV7+W
         fcn0iJxHQVaHyC2p2xTYBcgDbrfWErrBPmVRoeftMPQkwD126cNlwBMdQ3UXdgo+mehf
         KXK9xV4Q4yRREwGDZvYvZcrMGo+p4kW74LPJKW1bImxR0DAV5UM5FIj3I1TKhxmjlOu7
         irpMjCg/R5qTrP9AYzSlaLUzwzgrPkCWGkpdhxd+/seohPk0yKaWVopaJtg0g1krFDxK
         0zjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SKj57E8UaKSzcr5YZePGtfiP1UB+Fu3gym2CoICZfHk=;
        b=ht5Bz+/MykOjK6jimFauaiG9ELOfhdG10H00bTAnYiQNSxKYxUUv/6Xzs20Emk+ea0
         sTpR0L5pxzAkE6MKE6v6ptPr7SkjBQI9e/JbxxffUQvvdsUnwEq1RoXSRJaldhbDWu7L
         eutoM25tSVI+wsF6XhUvOCpFyCX59XZOV8xVXImgJFOvmK3JRdC+Lk8aG1CKyXTD6OjO
         tGIINa5zOdOC25SeEiLH0ZZO7mC40twVh0Fv0JykVAKPW4V2YLBkhGNjYC+vSq2XuSXq
         iNyFF6qOqOQMDB5Zl1bqc2CvJ5lt15bvtFR2WpgyXjg9cXewehVMmiNAWP/Izdw+gblf
         m5Jg==
X-Gm-Message-State: APjAAAW4B7jQvpPyq0skzyDrpbkTu0NoO5ahDlQcajPoeAkRXGzm/oVk
        93y/LOHT2QA5qJN7ZQ9Rxe6P0LkSHKqBgi35FGA=
X-Google-Smtp-Source: APXvYqxd9lL1OgyFEkdy2Qzj4Dk2yTwPFtckG9T0XASSlIkyyGL7t5TDIFJhsrj9l/n/RJCex6W2aSpuDJ1r9ndHDyc=
X-Received: by 2002:a05:6e02:f0f:: with SMTP id x15mr59682046ilj.298.1582565432229;
 Mon, 24 Feb 2020 09:30:32 -0800 (PST)
MIME-Version: 1.0
References: <CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com>
 <1bdbac08-86f8-2a57-2b0d-8cd2beb2a1c0@roeck-us.net> <CAM1AHpSKFk9ZosQf=k-Rm2=EFqco7y4Lpfb7m07r=j_uJd4T0A@mail.gmail.com>
 <85356d1a-f90d-e94d-16eb-1071d4e94753@roeck-us.net> <CAM1AHpSpEFshpUGxKdhLV3XuThQg_XVaPgOWzvrTv6YtzHyO+A@mail.gmail.com>
 <bec1f81c-09a8-ba48-c6c4-5d9b340f7c0b@roeck-us.net> <20200224101800.GJ2667@lahna.fi.intel.com>
 <20200224103731.GA10400@smile.fi.intel.com> <20200224105121.GK2667@lahna.fi.intel.com>
 <20200224112740.GL2667@lahna.fi.intel.com>
In-Reply-To: <20200224112740.GL2667@lahna.fi.intel.com>
From:   Martin Volf <martin.volf.42@gmail.com>
Date:   Mon, 24 Feb 2020 18:30:21 +0100
Message-ID: <CAM1AHpQW_=vvcjXHa8UOrdOohABm0sE2UPr4sfK2AtfWHsm4Ag@mail.gmail.com>
Subject: Re: [regression] nct6775 does not load in 5.4 and 5.5, bisected to b84398d6d7f90080
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 24, 2020 at 12:27 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Mon, Feb 24, 2020 at 12:51:25PM +0200, Mika Westerberg wrote:
> > > I'm wondering if
> > >
> > >             pci_dev_is_present(...);
> > >
> > > returns false here.
> >
> > Well that might also be the case since lspci shows this:
> >
> > 00:1f.0 ISA bridge: Intel Corporation Z390 Chipset LPC/eSPI Controller (rev 10)
> > 00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)
> > 00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 10)
> >
> > PMC is 1f.2 and not present here. However, it may be that the PMC is
> > still there it just does not "enumerate" because its devid/vendorid are
> > set to 0xffff. Similar hiding was done for the P2SB bridge.
>
> Actually I think this is the case here.
>
> I don't know the iTCO_wdt well enough to say if it could live without
> the ICH_RES_IO_SMI. It looks like this register is used to disable SMI
> generation but not sure how well it works if it is left to BIOS to
> configure. I suppose these systems should use WDAT instead.
>
> Martin, can you try the below patch?
>
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index ba87305f4332..c16e5ad08641 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1593,7 +1593,7 @@ i801_add_tco_cnl(struct i801_priv *priv, struct pci_dev *pci_dev,
>  static void i801_add_tco(struct i801_priv *priv)
>  {
>         u32 base_addr, tco_base, tco_ctl, ctrl_val;
> -       struct pci_dev *pci_dev = priv->pci_dev;
> +       struct pci_dev *pmc_dev, *pci_dev = priv->pci_dev;
>         struct resource tco_res[3], *res;
>         unsigned int devfn;
>
> @@ -1620,7 +1620,12 @@ static void i801_add_tco(struct i801_priv *priv)
>          * Power Management registers.
>          */
>         devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 2);
> -       pci_bus_read_config_dword(pci_dev->bus, devfn, ACPIBASE, &base_addr);
> +       pmc_dev = pci_get_slot(pci_dev->bus, devfn);
> +       if (!pmc_dev) {
> +               dev_info(&pci_dev->dev, "PMC device disabled, not enabling iTCO\n");
> +               return;
> +       }
> +       pci_read_config_dword(pmc_dev, ACPIBASE, &base_addr);
>
>         res = &tco_res[ICH_RES_IO_SMI];
>         res->start = (base_addr & ~1) + ACPIBASE_SMI_OFF;
> @@ -1630,15 +1635,17 @@ static void i801_add_tco(struct i801_priv *priv)
>         /*
>          * Enable the ACPI I/O space.
>          */
> -       pci_bus_read_config_dword(pci_dev->bus, devfn, ACPICTRL, &ctrl_val);
> +       pci_read_config_dword(pmc_dev, ACPICTRL, &ctrl_val);
>         ctrl_val |= ACPICTRL_EN;
> -       pci_bus_write_config_dword(pci_dev->bus, devfn, ACPICTRL, ctrl_val);
> +       pci_write_config_dword(pmc_dev, ACPICTRL, ctrl_val);
>
>         if (priv->features & FEATURE_TCO_CNL)
>                 priv->tco_pdev = i801_add_tco_cnl(priv, pci_dev, tco_res);
>         else
>                 priv->tco_pdev = i801_add_tco_spt(priv, pci_dev, tco_res);
>
> +       pci_dev_put(pmc_dev);
> +
>         if (IS_ERR(priv->tco_pdev))
>                 dev_warn(&pci_dev->dev, "failed to create iTCO device\n");
>  }

Hello,

with the patch applied, the sensors are working, dmesg says:
...
[    2.804423] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    2.804478] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    2.804491] i801_smbus 0000:00:1f.4: PMC device disabled, not enabling iTCO
...
[    2.826373] nct6775: Enabling hardware monitor logical device mappings.
[    2.826447] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
...

and there is no "002e-0031" line in /proc/ioports.

Martin
