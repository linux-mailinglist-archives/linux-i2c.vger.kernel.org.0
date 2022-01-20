Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1685B494D0A
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 12:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbiATLcZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 06:32:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbiATLcZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 06:32:25 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D96DBC061574;
        Thu, 20 Jan 2022 03:32:24 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id b13so27561886edn.0;
        Thu, 20 Jan 2022 03:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WwqLFdAqbjzHEvpW1UH/4aQ0iDawRpJsHatZKSEMOk8=;
        b=cPo6jp4f0KIo9GC4MryHnLdBB3d79OC04LySscCUQzgVHJfgRsxvDxRifOMMyXN2YA
         2HangN6G4bO4nSooM8s4WBgTcZek0iITbEU29p7sMmNfZNKTqdF+9ElkC1qG7yP88uxa
         xQYbqNGp15diaAd9PY0pubkt1juVJWACWzjRCP+9rHRHwNlXPwzcKQu8MBrTX3Ln3+Yd
         rbm4K1nrPXeMLfQljPCtLY+QX9+UGPI3DKWT6WGeKylTs/BwjFCRwssodWGezi4rEe1E
         o45RslrdeczWVZjSH1NRdUYijqE6TTW+okrp76moFno6wqtlNOFKCymyCHVCkGp6p5ZB
         rNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WwqLFdAqbjzHEvpW1UH/4aQ0iDawRpJsHatZKSEMOk8=;
        b=PNGn8xzUzewLsY3OP3wVIIfrARFF7Yvfw4dmzP2wjmY4YxVKJSZ9LhG1TjHPqvdVmw
         Don0WMKSf4xjOBdrnyR9Z6g7sVayvKEA4Db+JywjrKXDO2vK+4M4gSTPVV1VH+rihe+P
         chKu7FQj6cd5RDnWylpUcoKlku48NtDI0R+SHTLVddRb1XuXanXykrADffRKDrJANXEC
         Er4o6EIy4obq9WdDt4+RVA0cmY2i0wM16ItBrEvE58pHw7x6nQ+gFtuFv12jX1I6zgqf
         BOoGROaqsNDF5JQAa9kfU5no5g6l0kAhTLOrK1P4X2d8iprGHwTRje8GXMe4P4/4u0YM
         CmTw==
X-Gm-Message-State: AOAM531ThnBVsq5MI+QNR3FF7WCojlpGwWTZId87lXqAQu9D6zDa3qKI
        3ggT+1Hv7XqYQOay95sD1LDZoIiuaEoRKrxsjL7/VGy/OgdZhw==
X-Google-Smtp-Source: ABdhPJwb6RqXpYiaUV3x8IjDCNXLKolMSHKJFWmmgMamNK4UgHoa7a/w+4nlHP/suS2cjf2Pt1JVcTChIVOUEa/jsGo=
X-Received: by 2002:a17:906:8693:: with SMTP id g19mr23021785ejx.579.1642678343371;
 Thu, 20 Jan 2022 03:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20220119230626.31560-1-terry.bowman@amd.com>
In-Reply-To: <20220119230626.31560-1-terry.bowman@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Jan 2022 13:30:40 +0200
Message-ID: <CAHp75VcUVY+51o0DFhvYTjpydfF=L_rTGan74sZRMPDMmXtsQg@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] i2c: piix4: Replace cd6h/cd7h port I/O accesses
 with MMIO accesses
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
        sudheesh.mavila@amd.com,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 20, 2022 at 1:06 AM Terry Bowman <terry.bowman@amd.com> wrote:
>
> This series changes the piix4_smbus driver's cd6h/cd7h port I/O accesses
> to use MMIO instead. This is necessary because cd6h/cd7h port I/O may be
> disabled on later AMD processors.
>
> This series includes patches with MMIO accesses to registers
> FCH::PM::DECODEEN and FCH::PM::ISACONTROL. The same registers are also
> accessed by the sp5100_tco driver.[1] Synchronization to the MMIO
> registers is required in both drivers.
>
> The first patch creates a macro to request MMIO region using the 'muxed'
> retry logic. This is used in patch 6 to synchronize accesses to EFCH MMIO.
>
> The second patch replaces a hardcoded region size with a #define. This is
> to improve maintainability and was requested from v2 review.
>
> The third patch moves duplicated region request/release code into
> functions. This locates related code into functions and reduces code line
> count. This will also make adding MMIO support in patch 6 easier.
>
> The fourth patch moves SMBus controller address detection into a function.
> This is in preparation for adding MMIO region support.
>
> The fifth patch moves EFCH port selection into a function. This is in
> preparation for adding MMIO region support.
>
> The sixth patch adds MMIO support for region requesting/releasing and
> mapping. This is necessary for using MMIO to detect SMBus controller
> address, enable SMBbus controller region, and control the port select.
>
> The seventh patch updates the SMBus controller address detection to support
> using MMIO. This is necessary because the driver accesses registers
> FCH::PM::DECODEEN and FCH::PM::ISACONTOL during initialization and they are
> only available using MMIO on later AMD processors.
>
> The eighth patch updates the SMBus port selection to support MMIO. This is
> required because port selection control resides in the
> FCH::PM::DECODEEN[smbus0sel] and is only accessible using MMIO on later AMD
> processors.
>
> The ninth patch enables the EFCH MMIO functionality added earlier in this
> series. The SMBus controller's PCI revision ID is used to check if EFCH
> MMIO is supported by HW and should be enabled in the driver.

In general looks good to me, but I believe it will be much better if
we agreed on converting driver to use iomap_port() +
ioreadXX()/iowriteXX() (means dropping I/O accessor _p variants for
good). This would make the series cleaner and less invasive.

-- 
With Best Regards,
Andy Shevchenko
