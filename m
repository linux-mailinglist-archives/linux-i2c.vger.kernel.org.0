Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B174496033
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 14:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350668AbiAUN64 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 08:58:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350404AbiAUN64 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jan 2022 08:58:56 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536F7C061574;
        Fri, 21 Jan 2022 05:58:55 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id p15so389257ejc.7;
        Fri, 21 Jan 2022 05:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3RTok0QdcyCLG0X7mCMhhPiWMNqHei85rW/K5CrEw/o=;
        b=ADs5xleOA+pKeVrOklaucBTrNGkWPtFwt1cTQdtIzMxveiG/jvH+r1eSJABLVv+qAr
         gmwOghx9kiY6h3iR5264BODcuJWRBYo8yxJ0N7teBqsuqisMQNyB2RuHOSFu0VIGhUuN
         v6QJfEKw6CT4aDEWFS/zMY0b9j/c04XX/jkmzoe7KrFj9YPXYkxNphHH5DLnkQMip4yf
         0CFvkh8olxe9MlMqPctB4Uul2PafFes63QJUHbocXRCsPUWiA4tUOiJS/AnYjd2YmIWM
         ei5YwKnvMWmQUeSUS9bEiJNIkwGFaBdf3ZEj2yhq3VXxYSGIDaEAsx3P4R35eZfqvAyq
         dN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3RTok0QdcyCLG0X7mCMhhPiWMNqHei85rW/K5CrEw/o=;
        b=jnjV8IY8ZM2Uphyo4hnpkVr2j5MrCKo+lE6Jsrh9BmE+8/WHYNctS6D7StE0NI8gc4
         nrchctRfEBGxMiaGHC5nkg2O3dTE/1807FsIXgDltT6lznotCpubVgii1O1a1hq2wlgX
         fCcOKSChq7xYQvGiU+flOPo2h1NZlDQyFxqEiPUUKyV1OEdBYc8z5Zu0SSPDwdl6HQ9j
         adhUO8MwSIi7ET5qVOPiAoZFmJWR22HiOLS1zQjOkhEGlhVvNm7nAS6dOEmhJG3DadM5
         Keu4zG2c9sO14RqH8QYddQQ3sbmX02I13CZjYB0IGeu6kdUuAHOQKXpo0O5EIeWjrOZV
         mW9w==
X-Gm-Message-State: AOAM531snDu8qsNd5MWcLl8GmIJQ4eay/jyi4w55WQ8XzPnvRkzwSNh9
        8XiHY0ZdPk4OqStNF1HL+UDMh/lD5LbGF1mD4gs=
X-Google-Smtp-Source: ABdhPJwgS44XoAZsEyN0aPREJrMWwUmTQwv6LXrkNP2nK1eaBRYfD3UYWNgLQMsdTtfRM19MNdgSN+nTs3ohFmZ2ZBc=
X-Received: by 2002:a17:907:968c:: with SMTP id hd12mr3362309ejc.639.1642773533713;
 Fri, 21 Jan 2022 05:58:53 -0800 (PST)
MIME-Version: 1.0
References: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com>
 <1642686255-25951-2-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75VeOvXf6twskZp-Y-s8AQEpftA0SOUJfXqO5sJ1FKNKgCA@mail.gmail.com> <DM5PR12MB185082C3D5047815F18F42BCC05B9@DM5PR12MB1850.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB185082C3D5047815F18F42BCC05B9@DM5PR12MB1850.namprd12.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 21 Jan 2022 15:58:17 +0200
Message-ID: <CAHp75Ve=1utwnO-VHmKGta-tuSJN0Hg6rMVjNq1fiEPcApOufg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] device property: Add device_irq_get_byname
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 21, 2022 at 2:29 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> > Thanks, my comments below.
> >
> > > Add device_irq_get_byname() to get an interrupt by name from both the
> > > ACPI table and the Device Tree.
> >
> > This needs to be clarified (it's not and, but or), what about:
> >
> >   Add device_irq_get_byname() to get an interrupt by name from either
> >   ACPI table or Device Tree whichever has it.
> Does 'whichever has it' mean a bit different here? Would it be good like this -?
>
>     Add fwnode_irq_get_byname() to get an interrupt by name from either
>     ACPI table or Device Tree, whichever is used for enumeration.

Yes, your variant is good.

-- 
With Best Regards,
Andy Shevchenko
