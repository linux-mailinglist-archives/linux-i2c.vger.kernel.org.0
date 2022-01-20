Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78412494CF0
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 12:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbiATL26 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 06:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbiATL25 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 06:28:57 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FACCC061574;
        Thu, 20 Jan 2022 03:28:56 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id cx27so27485995edb.1;
        Thu, 20 Jan 2022 03:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J6y8+5t4F/LCJNkfdsMp+nnf4MqRvaxiESOJ3ybHvPw=;
        b=SgM/dH91ICYCcYnNb7IV7V9oZriDjfwDicuk18lZoWa9vZ443JLUFhz7kHA/QhnRy/
         z0ZVYdQ97Va0dWHdG+GQmk42q+HD3QxHjGfSb837/DI7t7RzBB3FC3iJ5KXWeUHMSctd
         XW+5vGorvITDJ25N3m/wgEuo9FAkRArEGAdrUWyuJm74v9JicIi/30KomqfPDJPMdTNS
         lzfmg0xGQt0FYaDBilNDX3LdKdBTZk/kTN2jT1PZRX1XCP3MZ0lbRta/dGV0O5PwTcb3
         omVUPKMyidUyav4bjNXiRh/nqj9aSrKoBrzH2p+D5qQxm6L9T6Q4748yDNBIEsz5Mfzu
         2OgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J6y8+5t4F/LCJNkfdsMp+nnf4MqRvaxiESOJ3ybHvPw=;
        b=6ARQwdt/wCtA/YbzTGgUq7YmZfjewtq+oSnG9+Q8d5TvRTfdi8RXK+BYEVq5jBQOF6
         WB3Fu4OkZGUZ5wjeqlivVu69JDOEghNVTIKAPBWkGdQbkz470K5rZPDcDoK0KYVTHiYd
         pcK3Te8fZ8iMuDUsd3lnAUBaNUbQ8v/nZlML3k+xdsH+xE7JRp4KKXTsyZJHYb25D0pc
         YJTI0BUdQiV6k20s5rm9yR3h1kZAWbBfn+nn93C730V4kce/0mXd70xnrkegbbm5mb2V
         SMwfrXX83WzCuhIizTyvPNRcbYqCMEe7dwNlDLQtniBIIwz6KHIVdt/sPD5b7yUaS7B+
         DBwQ==
X-Gm-Message-State: AOAM5337v4b3New8SZpdGU6WBhIsyOjUbhRmdMQZfaQQkzbJI9a6aWp9
        EKMhLJIRM3I9UBS7mIirHXZEHh/ql5x80oxYs4o=
X-Google-Smtp-Source: ABdhPJzEt+GzgW0s3PWtot4l1D1Q1PRworkf99qw3GztE5q26pmtd20jAkRtxsynk4b6ltxK3m9ph/MsG6QZbgn/qBk=
X-Received: by 2002:a17:907:948d:: with SMTP id dm13mr3986568ejc.497.1642678135077;
 Thu, 20 Jan 2022 03:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20220119230626.31560-1-terry.bowman@amd.com> <20220119230626.31560-8-terry.bowman@amd.com>
In-Reply-To: <20220119230626.31560-8-terry.bowman@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Jan 2022 13:27:12 +0200
Message-ID: <CAHp75VdtnOuBK1ctkjO59vujopCrQ+MQ_LyBB+Mi2HJk4HaJuQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] i2c: piix4: Add EFCH MMIO support to SMBus base
 address detect
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

On Thu, Jan 20, 2022 at 1:07 AM Terry Bowman <terry.bowman@amd.com> wrote:
>
> The EFCH SMBus controller's base address is determined using details in
> FCH::PM::DECODEEN[smbusasfiobase] and FCH::PM::DECODEEN[smbusasfioen].
> This code also writes to FCH::PM::ISACONTROL[mmioen] to enable MMIO
> decoding. These register fields were accessed using cd6h/cd7h port I/O.
> cd6h/cd7h port I/O is no longer available in later AMD processors.
> Change base address detection to use MMIO instead of port I/O cd6h/cd7h.

...

> +       if (mmio_cfg.use_mmio) {

> +               iowrite32(ioread32(mmio_cfg.addr + 4) | SB800_PIIX4_FCH_PM_DECODEEN_MMIO,
> +                         mmio_cfg.addr + 4);

Can you split this to three lines (with the help of a temporary variable)?

> +               smba_en_lo = ioread8(mmio_cfg.addr);
> +               smba_en_hi = ioread8(mmio_cfg.addr + 1);

This makes me wonder if we can replace these two by defining

  u16 smba_en;

(below also may be easily adjusted for it).

> +       } else {
> +               outb_p(smb_en, SB800_PIIX4_SMB_IDX);
> +               smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
> +               outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
> +               smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
> +       }
>
>         piix4_sb800_region_release(&PIIX4_dev->dev, &mmio_cfg);

-- 
With Best Regards,
Andy Shevchenko
