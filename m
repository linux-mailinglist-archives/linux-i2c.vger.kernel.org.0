Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8317B48C7B9
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 16:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354858AbiALP5Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 10:57:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348170AbiALP5X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jan 2022 10:57:23 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4768FC06173F;
        Wed, 12 Jan 2022 07:57:23 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id o6so11826807edc.4;
        Wed, 12 Jan 2022 07:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=01FQ6VRzty6iGaHSe+9xP+mXqTdBfUe9WYR3sCX2PJ8=;
        b=n0msJA6X0ppZR03mdOoeAM+A0+soyqdTWb/lknh2u/D2lNm0CBZikICBKnDp/d4TUB
         qXpkUXM0GBAkGVaS8s1nkS9r2FgepScTNmlEnk+OQuSre/hPVj0FbHVDN2JhkrN6fXpH
         o5LVwjpmJbIcFy7w/EVR6AYzjEJWEeIfKqQQXGpBt++jCo4dpaaZl1xlLVJPqXuDqcux
         ADe1wvhihDRyXYn62PFZm7BE55or7CB9bcXJdXecmt2n+hLJwuYBazRT46oe+FfbM49v
         9g6udzDYb+cHpvfGKBeuhjKpLiODpkHA/HQAPN4sgBc8kwsp/0yzYZ9qgXUfMDs0nzWP
         emMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=01FQ6VRzty6iGaHSe+9xP+mXqTdBfUe9WYR3sCX2PJ8=;
        b=Zy7czSCk1M86r/L/4sn7TCvW27TrXwxuDggV73N4O7EaPjcRziv+XCDy0HcNiBEatm
         Er5K0DyNuEw5YQ2uNFmHGbyLx0m6qNGceqVeSOo2vHXQH39saFl5wzGs4fsThx8ppCmE
         H+4FeWjMPEYb5ekfcq3/skmG4l88gjnzKJ5WA1eIbMuXjL1OyDp0uTNYg69w73UX6RyX
         7vNjKkw4ZrADfAwmHUMRQwSKWgNWZhm9gpXiHQYeExjEmmJf/JuW/XegDnLce+sDYN21
         0gHwZtMhblZP/WADTH8ycfu91g5BPhT1Fh0WAAOtTFzw/nDDCIqWjWjkv9Zh6rx7QOJj
         +SRw==
X-Gm-Message-State: AOAM533HWvDaVkhNxf4TDhOmcl6sUvuAqXk1QNe8An68FhBcerjt21R3
        gu+8Ug1knOnEH4T7OmkZaTsthWZKln3//wd3sww=
X-Google-Smtp-Source: ABdhPJx73qaKX2Qdc1KaoCotkHbaSbvtvnaeA7oTzhb6uMCee+RfZAMikG70wAq/2aqjVxEUZivej7yJAyZowmumwvM=
X-Received: by 2002:a17:907:968c:: with SMTP id hd12mr260755ejc.639.1642003041845;
 Wed, 12 Jan 2022 07:57:21 -0800 (PST)
MIME-Version: 1.0
References: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 12 Jan 2022 17:55:35 +0200
Message-ID: <CAHp75Vdh6znawYhpiU9ra5Nu3mLu_TbpLW_gtBezjASX4TF6Qg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Enable named interrupt smbus-alert for ACPI
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 12, 2022 at 4:14 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> I2C - SMBus core drivers use named interrupts to support smbus_alert.
> As named interrupts are not available for ACPI based systems, it was
> required to change the i2c bus controller driver if to use smbus alert.
> These patches provide option for named interrupts in ACPI and  make the
> implementation similar to DT. This will enable use of interrupt named
> 'smbus-alert' in ACPI as well which will be taken during i2c adapter
> register.

Most of my comments are regarding spelling and documentation.
The code looks almost good enough. That said, if maintainers will be
okay, I'm sure the next version will be upstream-ready.

Thanks!

-- 
With Best Regards,
Andy Shevchenko
