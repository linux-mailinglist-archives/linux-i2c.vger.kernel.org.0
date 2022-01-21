Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BDC495D91
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 11:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379966AbiAUKRW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 05:17:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238198AbiAUKRQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jan 2022 05:17:16 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476E8C061574;
        Fri, 21 Jan 2022 02:17:15 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id b13so41220796edn.0;
        Fri, 21 Jan 2022 02:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=De3en+T8td6BTws+aSkxiEc0xtw9ycpJk2sfxHvo/e8=;
        b=QuTEhQnQHHLCiUTn33HTA2us6RBdWuBNnjtK8sEockoTbSKy5nQM28WCZh6BD8/loI
         OFEDzVYEoF0nYG7msIFtggMZe1Jv+5gNhyaeMuKA9UyCTdimCAExVf4xmOgENzI5e55h
         l37pIk6lnSK6TPoGczcQRsFcCjwYjazK+Lpue9XMuTzza4JyZROiahGpo2DtVHTg9Esf
         X3ttmFPYq6yRvPcXna9FX7w8m6FI1Oftn/evarH6fN51OtXtNvVHUv0BIxCa+60TYrz/
         cwyNK5nj/N/6Zc16l1YWDQ05JxsPyrE6zLyTDsnTvfE6CfXQW2+cPNXo0XBVTSY40kLF
         5e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=De3en+T8td6BTws+aSkxiEc0xtw9ycpJk2sfxHvo/e8=;
        b=DaFqfecNx8KKJn3iVV4699VjPeNdPOi1FWU23ibc5qpZIYOdRg4buN/Dhx54XkZ79L
         O4XV2CoJhxWyn0HLbdWsI0Ev2u6LGv8ozw+fEDdNQLreUkzZrJM3zukH4UamoBblYMu3
         fbVHrYjbvPVAkjzhkp+i+a6DS5HnsKPalVd2VyyCob4ppp7r/9cWFXbgGcgaf2QT0g5E
         Ruj+6LJv9r+2iBK9W1eAx4L8yKdk0qRcA78XE28ruBzCalEe4pctZtw6Xohp3e0VYa7g
         fDDV/GOEKzm6tcQ/vInnaPCozwdu7DmMQFqIJ8lNVwPCSuGo1zHpef70RXaJb71+ryO/
         rxCQ==
X-Gm-Message-State: AOAM532z2M5L5VJeR9uR9onpeRufkwe25nU7jRekmc2x510uROuAYxjl
        3bH18o0Qyr/N+bF4ZpmoA2rcxYhEzoHLpYqIAfY=
X-Google-Smtp-Source: ABdhPJxPjQZ1sqHbnd0x+z8lh1Oyu4MQM/xg6Mf14FGMOVzkm4QRvNRI8o0/gFUVq+4uFzmuIxvtnbXPTSk2gsIomBc=
X-Received: by 2002:a17:906:7948:: with SMTP id l8mr2737570ejo.636.1642760233787;
 Fri, 21 Jan 2022 02:17:13 -0800 (PST)
MIME-Version: 1.0
References: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com>
 <1642686255-25951-2-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75VeOvXf6twskZp-Y-s8AQEpftA0SOUJfXqO5sJ1FKNKgCA@mail.gmail.com> <DM5PR12MB18504794AD0FB11536F893BEC05B9@DM5PR12MB1850.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB18504794AD0FB11536F893BEC05B9@DM5PR12MB1850.namprd12.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 21 Jan 2022 12:16:37 +0200
Message-ID: <CAHp75VcA5LbukVXxtGu6LeTJSxg2V2NgN-BGt3Ljrw0LO5u-kw@mail.gmail.com>
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

On Fri, Jan 21, 2022 at 11:18 AM Akhil R <akhilrajeev@nvidia.com> wrote:

...

> > > +int device_irq_get_byname(struct device *dev, const char *name);
> >
> > Since we don't have device_irq_get() perhaps we don't need this one right now
> > (just open code it in the caller). This will satisfy Rafael's request.
>
> If to code the same in caller, I guess, it would look like this -
>          irq = fwnode_irq_get_byname(dev_fwnode(adapter->dev.parent),
>                                          "smbus_alert");

Yep, I meant how you point to it in the documentation, e.g.

  The user may call fwnode_irq_get_byname() with the firmware node and
name of the IRQ it wants to retrieve.


> Looks okay to me, but if given an option I would go with device_irq_get_byname().

You see, there was a query from Rafael and I haven't seen an answer
yet. On top there is no such function for fwnode_irq_get() (I mean
device_irq_get() API). It would be harder to push without good
justification why one has the device_ counterpart and the other does
not. Easiest way, as I see it, is to drop it for now.

-- 
With Best Regards,
Andy Shevchenko
