Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2F74939F7
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 12:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347023AbiASLy6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 06:54:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346033AbiASLy6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 06:54:58 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B85C061574;
        Wed, 19 Jan 2022 03:54:57 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id j23so4884016edp.5;
        Wed, 19 Jan 2022 03:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PS6rF1/qC7hs4eJz9gJcqA6Dx/xMCX3EO5vU88DfZZc=;
        b=M7CPAyDLJkK51lli8eGjFkvNRTyy8qp3E++q68zhCMEl86F8fz18sa0Yx7gGvlOIoX
         yPFtEjvq0TbGkGBVu02onAkQI6LBbYynWWfkRyy+d2U4Tc03AAW1ysx2pA1Coer3Dg0T
         DFIuCMs+GHVrkJ469lLT8f/wSbYP7HSYAqOBPS6RXjvqdy3ngibKBIgy/291aNvKeAiv
         uwOtASk4ZQhAZXtbsVrEnQ5LlQSD4/Hy4RAUh5xAeM7W8uZ6Aj12ugMfZg9kDRFfVMWT
         oJfEI4iGB8yGaRaIy5BD3RCcSnPSIQkbrdpmfw4OSE9l6Z2BvkSNF5MO73+cC+ufgEpk
         kY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PS6rF1/qC7hs4eJz9gJcqA6Dx/xMCX3EO5vU88DfZZc=;
        b=YhEFx4/de4oBebjLG6XRMi5wjAaeZpsErANTilzM1leNmUpmv8g1MMujzky7v7xVNs
         aAhOs08wfGQ8XFgD8M8WsQRGqpkjn569FQcM7efP3qpqkZwuAyx1c7SVIJ4aGmUYpQfx
         5fYXLx4VDGtL+J1BL8hqrn293G0cZOZoM2EX/nJ1PFULpJX9suVyGZyE186psB/S1pnD
         xftWWVAFkyOn7dmJm6rTQFC7GjA4E8OrOb06LGQG4ZENPMZIK64Br8rJEDe4jjLEIhvs
         5Bh3g6eBiNbgcPackuMs/uNS2bTg83paRoZhtXYRhdpAKiK7N0Z3m4Ng6oXSaH304vSd
         61vg==
X-Gm-Message-State: AOAM533RHu8PnN3FOAyCHurJTacZwGsp6RTTX4DaZU11QWaB3MEqLeNp
        9wmSNaQAv/Vqa4vZBdbt3AlxVd6h9jVoqwer9b+s2wz9YClbwQ==
X-Google-Smtp-Source: ABdhPJwcCyUxQdrXrMBzu5TYLkAIRDj9GnezxNnu4HntlsC0d3wCBQImpqxaj+4/OZU4XNNp4Rz3aGe6kdVP/nVTdJM=
X-Received: by 2002:a50:c388:: with SMTP id h8mr24181980edf.218.1642593295904;
 Wed, 19 Jan 2022 03:54:55 -0800 (PST)
MIME-Version: 1.0
References: <20220118202234.410555-1-terry.bowman@amd.com> <20220118202234.410555-3-terry.bowman@amd.com>
In-Reply-To: <20220118202234.410555-3-terry.bowman@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 19 Jan 2022 13:53:13 +0200
Message-ID: <CAHp75VdBFN+QMJpYDp8ytGGrBKYyjxU8u=Xrn44Lc3UGLPRQOA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] Watchdog: sp5100_tco: Refactor MMIO base address initialization
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Robert Richter <rrichter@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 18, 2022 at 10:23 PM Terry Bowman <terry.bowman@amd.com> wrote:
>
> Combine MMIO base address and alternate base address detection. Combine
> based on layout type. This will simplify the function by eliminating
> a switch case.
>
> Move existing request/release code into functions. This currently only
> supports port I/O request/release. The move into a separate function
> will make it ready for adding MMIO region support.

...

> To: Guenter Roeck <linux@roeck-us.net>
> To: linux-watchdog@vger.kernel.org
> To: Jean Delvare <jdelvare@suse.com>
> To: linux-i2c@vger.kernel.org
> To: Wolfram Sang <wsa@kernel.org>
> To: Andy Shevchenko <andy.shevchenko@gmail.com>
> To: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Robert Richter <rrichter@amd.com>
> Cc: Thomas Lendacky <thomas.lendacky@amd.com>

Same comment to all your patches.

...

> +static int __sp5100_tco_prepare_base(struct sp5100_tco *tco,
> +                                    u32 mmio_addr,
> +                                    const char *dev_name)
> +{
> +       struct device *dev = tco->wdd.parent;

> +       int ret = 0;

Not really used variable.

> +       if (!mmio_addr)
> +               return -ENOMEM;
> +
> +       if (!devm_request_mem_region(dev, mmio_addr,
> +                                   SP5100_WDT_MEM_MAP_SIZE,
> +                                   dev_name)) {
> +               dev_dbg(dev, "MMIO address 0x%08x already in use\n",
> +                       mmio_addr);
> +               return -EBUSY;
> +       }
> +
> +       tco->tcobase = devm_ioremap(dev, mmio_addr,
> +                                   SP5100_WDT_MEM_MAP_SIZE);
> +       if (!tco->tcobase) {
> +               dev_dbg(dev, "MMIO address 0x%08x failed mapping.\n",
> +                       mmio_addr);

> +               devm_release_mem_region(dev, mmio_addr,
> +                                       SP5100_WDT_MEM_MAP_SIZE);

Why? If it's a short live mapping, do not use devm.

> +               return -ENOMEM;
> +       }

> +       dev_info(dev, "Using 0x%08x for watchdog MMIO address\n",
> +                mmio_addr);

Unneeded noise.

> +       return ret;

On top of above it's a NIH devm_ioremap_resource().

> +}


...

> +       int ret = 0;

Redundant assignment.

...

> +       /* Check MMIO address conflict */
> +       ret = __sp5100_tco_prepare_base(tco, mmio_addr, dev_name);

> +
> +       /* Check alternate MMIO address conflict */

Unify this with the previous comment.

> +       if (ret)
> +               ret = __sp5100_tco_prepare_base(tco, alt_mmio_addr,
> +                                               dev_name);

...

> +               if (alt_mmio_addr & ((SB800_ACPI_MMIO_DECODE_EN |
> +                                     SB800_ACPI_MMIO_SEL) !=
> +                                    SB800_ACPI_MMIO_DECODE_EN)) {

The split looks ugly. Consider to use temporary variables or somehow
rearrange the condition that it doesn't break in the middle of the one
logical token.

> +                       alt_mmio_addr &= ~0xFFF;

Why capital letters?

> +                       alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
> +               }

...

> +               if (!(alt_mmio_addr & (((SB800_ACPI_MMIO_DECODE_EN |
> +                                      SB800_ACPI_MMIO_SEL)) !=
> +                     SB800_ACPI_MMIO_DECODE_EN))) {

Ditto.

> +                       alt_mmio_addr &= ~0xFFF;

Ditto.

> +                       alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;

...

Okay, I see this is the original code like this... Perhaps it makes
sense to reshuffle them (indentation-wise) at the same time and
mention this in the changelog.

...

>         release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);

Is it still needed? I have no context to say if devm_iomap() and this
are not colliding, please double check the correctness.

-- 
With Best Regards,
Andy Shevchenko
