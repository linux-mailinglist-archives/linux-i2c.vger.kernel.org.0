Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60112425804
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Oct 2021 18:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241523AbhJGQf5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Oct 2021 12:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233594AbhJGQf4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Oct 2021 12:35:56 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54D6C061570;
        Thu,  7 Oct 2021 09:34:02 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id g10so24625450edj.1;
        Thu, 07 Oct 2021 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1JFfk6QlY62fswdZpgxJiSavTDroR4RC0QS2ZH6Jyew=;
        b=CtPXImfI3RvlZMJEHX+2WnTPErgzjVt6NOMRegDqOYhmsCnbyPlwAH99ElasNaq8Vu
         0pdIH0tIcX9oXusIngx2wNLk9WJV8Go2PP/DIx8W9QyyNlRRRww4GrgZtfowZIJbhfs3
         GN62Zb6wZ8Nlx8CUsS0KTBXUGGk4NCYp+tsyZUbm7eubsNQ/syrRQukdbTiTr/pfFYzU
         n5p5eRZQ7H+iUMtiNN1UD5xOI65oW4VyxUS9Y3iQM6APoo7XhXzeEaaJGT3wfjkJyHt2
         pqH16E9dmpIrfUKGwZlI6G3nlOfbuoxoB74Z1AAjNz5CCrpnrWkkt3rAULpDVaYneK8Q
         zxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1JFfk6QlY62fswdZpgxJiSavTDroR4RC0QS2ZH6Jyew=;
        b=zV0j+JGyGZFGOi/a+dQ6NB7FQNRCYFHk2Ivy1YNtXU2ryUHrRVW2B5One36sVvmXQB
         mjq4dRoM7/Wnhyn3cnxp0KMye0uyUYEPiae/drTSC/hGgBFHld954vYUo4WRSkpjY0MF
         USxBVs4L26x4ZvgjLP/zParRSpi2OUoba+torOLVf3BNh5FPGTCLvxgrRWhzBEEvocZQ
         xJ+f46T9DwjFZCc6rDuywX8EY8KuHs9RFjgWyR+WCSSg32+Pt0d139UXkxkuPw4dgqPx
         kUC5cYj7YK+XWHDvorhNOGFjlNHFZZe/hM6qsDCvwVUUWy7lOWTo2f4QsE7QbaIJNYVr
         bg1g==
X-Gm-Message-State: AOAM531GNy9Ex1ZFQ/8qne3LCDoZLJAm+RBn7flY/4bPRCnidQ4FgpAz
        AcFJ1XBTISPooktCQADAfOC/W2xsHVMokkSWYCI=
X-Google-Smtp-Source: ABdhPJy3Xghtyx+iq8ggKN0cubKDnXgy8Kliqsk+OMmA1iB2u7o9Gr480rzgG0Wjq2GIEYueSgSjkbBLkXD/RkYnxXU=
X-Received: by 2002:a17:906:1707:: with SMTP id c7mr6472177eje.377.1633624434693;
 Thu, 07 Oct 2021 09:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
 <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
 <d39e99ff-6498-e532-e833-1c65861d566f@gmail.com> <683a7136ec818d01420a5c2cbf43e13498d82740.camel@microchip.com>
 <55bf986d-ea29-f067-ea39-14eaab0d519a@gmail.com>
In-Reply-To: <55bf986d-ea29-f067-ea39-14eaab0d519a@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 7 Oct 2021 19:33:18 +0300
Message-ID: <CAHp75Vffte=NckQZ2e2fXsF33QOaKkksB2OxjWRi6gnngujtcg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] i2c:busses:Register PCI1XXXX adapter to I2C subsystem
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Wolfram Sang <wsa@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        s.shtylyov@omp.ru, linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 7, 2021 at 7:25 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 05.10.2021 11:50, LakshmiPraveen Kopparthi =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
> >> Why i2c->freq is fixed to I2C_MAX_FAST_MODE_FREQ in
> >> pci1xxxx_i2c_init()?
> > This is the default frequency at which the adapter shall operate. This
> > driver is targeted for x86,X64 platforms. Could you please suggest a
> > way to configure the freqeuncy?
>
> For x86 it should come somewhere from ACPI info presumably, but I'm not
> ACPI expert. Andy may have more insight.
>
> At least you could add a clarifying comment to the code, telling why
> freq is fixed to the standard speed.

Since it's a host controller adapter driver we have to choose
something it will operate by default. In ACPI the peripheral may ask
for higher or lower speed and in i2c_acpi_find_bus_speed() [1] we
decide at which speed it should be.

[1]: https://elixir.bootlin.com/linux/latest/source/drivers/i2c/i2c-core-ac=
pi.c#L331

--=20
With Best Regards,
Andy Shevchenko
