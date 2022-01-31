Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AECE64A419A
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 12:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359260AbiAaLEw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 06:04:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358321AbiAaLDn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 06:03:43 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F16C1C061757;
        Mon, 31 Jan 2022 03:03:12 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id d10so41845996eje.10;
        Mon, 31 Jan 2022 03:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lHhE3f5URE6BLjfBVO6YxPD3S6EHHoqiVeEIRI6+PoI=;
        b=KNkDYzpvSqX1Odi3cvkvqIEeL0A/pUO7cJYMojQCL8/uuchS1Z3Cd3kx4HgWsgrevF
         7Lfl/FSUrK9gAmwvohd3YVJMBjaqiKPRttf+ziroIbi9RDAVHoyUWdLq2lsAHf0+qmqC
         QtFTCZqKy30F9PvblZkTOydxZq6S+sK9Wr5sBRzi7phPD7/wlW7CiRApc8kXTHzIfJRC
         fB2354cIW4Ex9qUEPY9Ex3TqpA4F71EnoHdLVWcuponITJBciLbZkTYGGQm9cG/PgqIB
         vnF+GxB1KBORJEibk/eVCQH8Saqik4RNl2WpjauSLuNEH4Y+hTr68MYC9koc+yt8lGqN
         Ptgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lHhE3f5URE6BLjfBVO6YxPD3S6EHHoqiVeEIRI6+PoI=;
        b=78EmMDpYyKGIxVMSNlJpWNN4iX5LTbUrLeEMLnszLd+flwnGfxwFnAqgUS7qfKt1Q4
         X+HVvDsNg/92vEa7LrEDWso5rjOPvmDGoTf8xxJWO7+rZTrbD+XGgiUTxthRKJFwzhxc
         BHPNGoUyc8BKKvelv1W5b5Ja7eiAOhyVBq7ZxsHVz056Neitcet/+MST3HBFW65WG4Gr
         c467wjSr+Y07I1wgXXRGzkp+//EwnY8RZV6wDPhHSgOL+Gx+7r77J5uOBZKuKtfnbbZf
         U9xgWmyO9emT+HiSUZ/yElzxYlVIjOQsoKTTAvwFnEo83ZJqWI8CsuftlFxennaIZ9Aw
         JInA==
X-Gm-Message-State: AOAM532vQPZttCjj8KjRZhgbmMX9fHcZbbeIA8RQ0+BGTN5ttrcNpEo8
        UURiGWgOnMmi1SSE2LT4pQLzuCezxe9wahR+bS8=
X-Google-Smtp-Source: ABdhPJy9nbmDPwmRP19l8CyQvoKmS1hmhX5vpMG/XY8VWbP5NgRvaCq0yVxBiwggc5Tpp7wsdYV3aNbBay2m+cnGZGs=
X-Received: by 2002:a17:906:c14d:: with SMTP id dp13mr17044132ejc.132.1643626991447;
 Mon, 31 Jan 2022 03:03:11 -0800 (PST)
MIME-Version: 1.0
References: <20220130184130.176646-1-terry.bowman@amd.com>
In-Reply-To: <20220130184130.176646-1-terry.bowman@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 31 Jan 2022 13:01:35 +0200
Message-ID: <CAHp75VdOLDCMzS+uRxLY1=0CX8tD4sfkeE6=5Sk2quNTn8z12A@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] i2c: piix4: Replace cd6h/cd7h port I/O accesses
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

On Sun, Jan 30, 2022 at 8:41 PM Terry Bowman <terry.bowman@amd.com> wrote:
>
> This series changes the piix4_smbus driver's cd6h/cd7h port I/O accesses
> to use MMIO instead. This is necessary because cd6h/cd7h port I/O may be
> disabled on later AMD processors.
>
> This series includes patches with MMIO accesses to register
> FCH::PM::DECODEEN. The same register is also accessed by the sp5100_tco
> driver.[1] Synchronization to the MMIO register is required in both
> drivers.
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
> using MMIO. This is necessary because the driver accesses register
> FCH::PM::DECODEEN during initialization and only available using MMIO on
> later AMD processors.
>
> The eighth patch updates the SMBus port selection to support MMIO. This is
> required because port selection control resides in the
> FCH::PM::DECODEEN[smbus0sel] and is only accessible using MMIO on later AMD
> processors.
>
> The ninth patch enables the EFCH MMIO functionality added earlier in this
> series. The SMBus controller's PCI revision ID is used to check if EFCH
> MMIO is supported by HW and should be enabled in the driver.

I'm not against the series, but I am still concerned that we are using
_p IO without clear understanding why. With cleaning them up, this can
be simpler and cleaner.

For the i2c patches:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
if it helps somebody.

> Based on v5.16.

v5.17-rc2 is out :-)

>
> Testing:
>   Tested on family 19h using:
>     i2cdetect -y 0
>     i2cdetect -y 2
>
>   - Results using v5.16 and this pachset applied. Below
>     shows the devices detected on the busses:
>
>     # i2cdetect -y 0
>          0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>     00:                         -- -- -- -- -- -- -- --
>     10: 10 11 -- -- -- -- -- -- 18 -- -- -- -- -- -- --
>     20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     30: 30 -- -- -- -- 35 36 -- -- -- -- -- -- -- -- --
>     40: -- -- -- -- -- -- -- -- -- -- 4a -- -- -- -- --
>     50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     70: -- -- -- 73 -- -- -- --
>     # i2cdetect -y 2
>          0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>     00:                         -- -- -- -- -- -- -- --
>     10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     40: -- -- -- -- -- -- -- -- -- -- -- -- 4c -- -- --
>     50: -- 51 -- -- 54 -- -- -- -- -- -- -- -- -- -- --
>     60: 60 -- -- 63 -- -- 66 -- -- -- -- 6b -- -- 6e --
>     70: 70 71 72 73 74 75 -- 77
>
>   Also tested using sp5100_tco submitted series listed below.[1]
>   I applied the sp5100_tco v4 series and ran:
>     cat  >> /dev/watchdog
>
> [1] sp5100_tco v4 patchset is in process but not sent yet. Below is v3
>     upstream review:
> Link: https://lore.kernel.org/linux-watchdog/20220118202234.410555-1-terry.bowman@amd.com/
>
> Changes in v4:
>  - Changed request_muxed_mem_region() macro to request_mem_region_muxed()
>    in patch 1. (Andy Shevchenko)
>  - Removed unnecessary newline where possible in calls to
>    request_muxed_region() in patch 2. (Terry Bowman)
>  - Changed piix4_sb800_region_setup() to piix4_sb800_region_request().
>    Patch 3. (Jean Delvare)
>  - Reordered piix4_setup_sb800() local variables from longest name length
>    to shortest name length. Patch 4. (Terry Bowman)
>  - Changed piix4_sb800_region_request() and piix4_sb800_region_release() by
>    adding early return() to remove 'else' improving readability. Patch 6.
>    (Terry Bowman)
>  - Removed iowrite32(ioread32(...), ...). Unnecessary because MMIO is
>    already enabled. (Terry Bowman)
>  - Refactored piix4_sb800_port_sel() to simplify the 'if' statement using
>    temp variable. Patch 8. (Terry Bowman)
>  - Added mmio_cfg.use_mmio assignment in piix4_add_adapter(). This is
>    needed for calls to piix4_sb800_port_sel() after initialization during
>    normal operation. Patch 9. (Terry Bowman)
>
> Changes in v3:
>  - Added request_muxed_mem_region() patch (Wolfram, Guenter)
>  - Reduced To/Cc list length. (Andy)
>
> Changes in v2:
>  - Split single patch. (Jean Delvare)
>  - Replace constant 2 with SB800_PIIX4_SMB_MAP_SIZE where appropriate.
>    (Jean Delvare)
>  - Shorten SB800_PIIX4_FCH_PM_DECODEEN_MMIO_EN name length to
>    SB800_PIIX4_FCH_PM_DECODEEN_MMIO. (Jean Delvare)
>  - Change AMD_PCI_SMBUS_REVISION_MMIO from 0x59 to 0x51. (Terry Bowman)
>  - Change piix4_sb800_region_setup() to piix4_sb800_region_request().
>    (Jean Delvare)
>  - Change 'SMB' text in  logging to 'SMBus' (Jean Delvare)
>  - Remove unnecessary NULL assignment in piix4_sb800_region_release().
>    (Jean Delvare)
>  - Move 'u8' variable definitions to single line. (Jean Delvare)
>  - Hardcode piix4_setup_sb800_smba() return value to 0 since it is always
>    0. (Jean Delvare)
>
> Terry Bowman (9):
>   kernel/resource: Introduce request_mem_region_muxed()
>   i2c: piix4: Replace hardcoded memory map size with a #define
>   i2c: piix4: Move port I/O region request/release code into functions
>   i2c: piix4: Move SMBus controller base address detect into function
>   i2c: piix4: Move SMBus port selection into function
>   i2c: piix4: Add EFCH MMIO support to region request and release
>   i2c: piix4: Add EFCH MMIO support to SMBus base address detect
>   i2c: piix4: Add EFCH MMIO support for SMBus port select
>   i2c: piix4: Enable EFCH MMIO for Family 17h+
>
>  drivers/i2c/busses/i2c-piix4.c | 207 ++++++++++++++++++++++++++-------
>  include/linux/ioport.h         |   2 +
>  2 files changed, 164 insertions(+), 45 deletions(-)
>
> --
> 2.30.2



-- 
With Best Regards,
Andy Shevchenko
