Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFAA726DD5A
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 15:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbgIQN7s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 09:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbgIQN6l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 09:58:41 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66AFEC061221;
        Thu, 17 Sep 2020 06:47:03 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id l126so1247867pfd.5;
        Thu, 17 Sep 2020 06:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=55M23fIBKyr8UknSe2QfC4lOvamfuOO1MWAAx+e2vC0=;
        b=d1IoCVWcyMIae2dHO+3iOQHxRR4m0uArjTaX6mrc4c34FypS7dws0gW1ni3PaOAcJI
         5F3N1oadIQGe8N84j+w/ts9RBg1hZdnJykLj4U+U726H9pXleBq3XXg5B3LGa5QQj6/k
         +MG7Tzs+qg6Ry4OvdtOyW5IIjA07jTCwq0xw6sGHNls8zsnZNG06i0flA2h7lyy55QF7
         j3wcak7sdHaCWs8LUuEx0ETdy9nF5oVFr9zWzF4RA0WQTGncifRLYJtkNw55znA5NreY
         TxR/9RQLJGKJ8J+mSnGFoUStPWnJljpqXI+ZIGOUbhs4GK3XX+LUD4HTxrWs7o6SIig1
         qykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=55M23fIBKyr8UknSe2QfC4lOvamfuOO1MWAAx+e2vC0=;
        b=GEHzHvKtvyiRgUT5mO3KxZb8gn+USQHZxrf5xWHjdOBPG4i1AYPN7gKI5fCqyJjiut
         uFPKcyiy/e27FF1vLl31tUwLd/dULFA3RqQ3lGkgsqQhdnyymUcSmTcAoi+F5XUKbhcz
         5lzn/i1Uahzmt18VQs0AQo/D8JKK7iaoms81odlWcoqyjDUCr9AbowCeR+mFsSfTVdI/
         fFxFAbLxs1oDAMApS/F7RovkdhEGiBkYuwL7Dptfh5QMFumXW6ESnrQYts8d/sGkg65Z
         rWKq/FG4eEGwNP4302BwruZdRSPnBdZBxTWuQD1eAEEd5XHmptMa82SoiW/PN+66ij/v
         oHKw==
X-Gm-Message-State: AOAM530Rq08hGTFdf31tyaEhmFsls2cTJxCN9ZU9keOXLfDeZt6DwzDG
        eAhvErPA3HBZdoN0z1Lb2y6EGku7wVk+YRo8KGw=
X-Google-Smtp-Source: ABdhPJx46s/q6mEolYXQuE3gnUPpUwExXCVWjupcaUxMbF59YWDoirDqB7ORt9sBZOva8UO/Ch+v/+PuMDfYZVJVUjM=
X-Received: by 2002:a63:d648:: with SMTP id d8mr22523973pgj.4.1600350422955;
 Thu, 17 Sep 2020 06:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200908224006.25636-1-digetx@gmail.com> <20200908224006.25636-15-digetx@gmail.com>
 <20200917123755.GO3515672@ulmo>
In-Reply-To: <20200917123755.GO3515672@ulmo>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 17 Sep 2020 16:46:45 +0300
Message-ID: <CAHp75VeWq_GzJ_yZag2yceuUDqPiMRWEa4XNYT5uPwXCzrsb7g@mail.gmail.com>
Subject: Re: [PATCH v7 14/34] i2c: tegra: Clean up probe function
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 17, 2020 at 3:37 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> On Wed, Sep 09, 2020 at 01:39:46AM +0300, Dmitry Osipenko wrote:

...

> > +     ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
> > +                            IRQF_NO_SUSPEND, dev_name(&pdev->dev),
> > +                            i2c_dev);
> > +     if (ret)
> > +             return ret;
>
> Is it safe to install the interrupt handler at this point? What if,
> perhaps because some bootloader didn't properly quiesce the I2C
> controller, an interrupt triggers immediately after this?

It\s easy to check with debug shared IRQ, but here IRQ is not shared...
So, with a hack into the code and enabled debug it will be achievable to test.

And you probably meant that IRQ triggers *before* the handler is in place?

-- 
With Best Regards,
Andy Shevchenko
