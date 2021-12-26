Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF0347F5EE
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Dec 2021 09:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232454AbhLZIld (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Dec 2021 03:41:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231480AbhLZIlc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Dec 2021 03:41:32 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE7BC06173E;
        Sun, 26 Dec 2021 00:41:32 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id f5so49691516edq.6;
        Sun, 26 Dec 2021 00:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xi9xYQcsiziUA3jzSL6L0tZcb5wkuBpVzMITBHC5IzU=;
        b=kDgYIn+KcY0NwBADWR6qAZKTg3iIvG89cZJ3RYy+xLAqjpLHK3uEaCPKZxykMa2O6G
         KhRL+Qf2kPIm56ZsWrRb3BG64bWQJ7mNzEq7R5r1VNjkklhLvZ2RUnBEspy8oiaKzLty
         II0XrMLra4qgrGbiX50RtcKxK8Mkyp7mCu/VwQpMVsEI/Gg13dOr6a/c/HNvGpiO3LvY
         QvxRuYrxS6SlGVdf8JNjzBccrEThqdoVYNFnN+wKfFZs5ud/tKquhrmlthGayMdlRRIX
         jrd0fwMk2qHEohOu0XcVkY3AbEaoolQ0bv1QF9oCdgO5QqrjpKoMGfZIBsqgyTgcsqhn
         c9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xi9xYQcsiziUA3jzSL6L0tZcb5wkuBpVzMITBHC5IzU=;
        b=cMPMG+iq0xZ1uQAcpKXeLOl4VqtM0A+mg3hSHAzc+admFFf8DVkb9L29+uabDuxUhZ
         JLpEC8YBE3uz4BM3RnitOBKQdHemRjuNumXHfffIb+Q+FDHqZS5sXpi1++/c0QlZbuw/
         6P/RjoGPJArcGIm1vnY3tZ2vFvRXD9RM3qaBZLODw7aacV2QT5JDzBnISDINjrbrKXBt
         qyW8bIs0syOJKDz31K+ZKG4O/Xq/KWxpdvOn4Fjnjkrhm0Ums5OHCsxGf6EyBo6jKPl1
         ZhIpF2syJfLJ7Mqz0Nj1rn/rbDX5F8HjgyB3vKLOKeJRTxKUiXJSHR4yoWIc52mWMuwJ
         uncA==
X-Gm-Message-State: AOAM531rZZsJs558EmprclKeDdUzCET2bU4f8t4YvUo2QKv0OoVplcuS
        +YymSIjF2gf/v5t9FCPjXdvW9lC30yfI026Cqa4=
X-Google-Smtp-Source: ABdhPJwusElNQDAiEWE7i2wUb6uakyx8QU/5+e7Gb+9Kt07j8kfhtcGC4zulrxBd2ayeUscklFt77cV43pDSyYEUs70=
X-Received: by 2002:a17:906:a3c6:: with SMTP id ca6mr10083914ejb.639.1640508090800;
 Sun, 26 Dec 2021 00:41:30 -0800 (PST)
MIME-Version: 1.0
References: <20211221175322.7096-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211221175322.7096-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAHp75VcxCGjPiuQi9w5M3Gv97nj+TQVMdF86TQXi6bxgSTL1mQ@mail.gmail.com> <OSZPR01MB70197F402C7BA0147AD50DF6AA409@OSZPR01MB7019.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB70197F402C7BA0147AD50DF6AA409@OSZPR01MB7019.jpnprd01.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 26 Dec 2021 10:40:54 +0200
Message-ID: <CAHp75VfzzVuVbP41B-02CT3EdEBoDh-Ewj2KAYdw7jdaHmFvzQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Dec 26, 2021 at 1:45 AM Prabhakar Mahadev Lad
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > On Wed, Dec 22, 2021 at 2:41 PM Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

...

> > > +       if (np) {
> >
> > Same comments as per your other patches, i.e.
> > Why is this check here?
> >
> Because the interrupt resource has range of interrupts in one IRQ resource [0]. Let me know if there is any other alternative way to avoid such case.

Shouldn't be fixed in platform_get_irq_optional() to return IRQ by
index for all cases?

> [0] https://elixir.bootlin.com/linux/v5.16-rc6/source/arch/sh/kernel/cpu/sh4a/setup-sh7724.c#L454


-- 
With Best Regards,
Andy Shevchenko
