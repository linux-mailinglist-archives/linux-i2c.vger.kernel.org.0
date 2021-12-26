Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F72747F65E
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Dec 2021 11:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhLZKDt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Dec 2021 05:03:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbhLZKDt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Dec 2021 05:03:49 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF574C06173E;
        Sun, 26 Dec 2021 02:03:48 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id y130so11412434ybe.8;
        Sun, 26 Dec 2021 02:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PcIdhYGtAe5wiGEmCP4ZpgqtofQF1fYABhObn5o2LIM=;
        b=Tqi139SclsNTIfh4oyAGZJUQASq4/f+eBNWk4N0vBVBjYr1fJoIf2MChB6Lq+bBEwy
         HVAPn8ipsSddzr4zed1Lxj95XO6FIqYvyTyhmsnT3Gwpgl1oJex9Nkg3W9BY1aRfChzc
         RE54WE8HqPET/SGIWXPuCiZmmCyhJq2shQGFATYOtS0rDKEjDcUkiNH7JDrt6QInoaeT
         7RN0NqHa8EMOUIjdg6uxQ0WEMmoRBm7CMhe55mm9i4QBLZhKLaCILdp4nyMEuwhb2HOk
         NKCzpoenct8cl3AwHn8Pqcl8MF19YQqn11zN9PcbJVGB/LHK1QMmJ43ztW+zzlEWrufz
         u2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PcIdhYGtAe5wiGEmCP4ZpgqtofQF1fYABhObn5o2LIM=;
        b=pUKDouBNnMpNOosDwI/5rUmf2z6gnCOlHExdXu3xNaFC/55Jgbs2OqUBZ0vrSJ65tK
         UBF5PfTZAu3ChgPA8EOJrMAhyR6ywVvwECn+kMJwSAMiUIl4HrfZuBptkzhliw8cJAqa
         OMkfMeSyCXgmD3T/TjmkoggarVGQKRZ2KN6WuEPRohWSThnpsWA7Z4UujsOyA9BEBafo
         32I8MYZz+q6+3bRquGCsXCBuf6k4XFWtrnUO58oZPqD8lp/G/6SIFmdvBTWN9E9hTVP+
         9waB4XfAXhkGaZbRHQcTa3Fh4GpY2MqBtUaHDayZKpsKqpEejQKAHl/uv+jkNdfq0gxk
         +sRg==
X-Gm-Message-State: AOAM531gCvW4dddjwjO90jAJO5I4NN/jPF0bN+sAx0XlASBjWNQvUe5V
        aXMcOBPX++PhHScsaHLA/mVGmtWMhpGMy8Hcpg8=
X-Google-Smtp-Source: ABdhPJy5eauPTYjIdf+IeTzl2CnArYlq43PzOJd+NA5Yj14nbn8+5xGo3U9BQ3S8h4SL1usNm3g+exbbRtvb7xqb6f0=
X-Received: by 2002:a25:98c4:: with SMTP id m4mr16123099ybo.613.1640513028115;
 Sun, 26 Dec 2021 02:03:48 -0800 (PST)
MIME-Version: 1.0
References: <20211221175322.7096-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211221175322.7096-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAHp75VcxCGjPiuQi9w5M3Gv97nj+TQVMdF86TQXi6bxgSTL1mQ@mail.gmail.com>
 <OSZPR01MB70197F402C7BA0147AD50DF6AA409@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <CAHp75VfzzVuVbP41B-02CT3EdEBoDh-Ewj2KAYdw7jdaHmFvzQ@mail.gmail.com>
In-Reply-To: <CAHp75VfzzVuVbP41B-02CT3EdEBoDh-Ewj2KAYdw7jdaHmFvzQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 26 Dec 2021 10:03:22 +0000
Message-ID: <CA+V-a8vPfRK66BFgO9tQ8kBxC5OkXawmK_5shVMgq+NS97QfaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Dec 26, 2021 at 8:41 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Dec 26, 2021 at 1:45 AM Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > On Wed, Dec 22, 2021 at 2:41 PM Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> ...
>
> > > > +       if (np) {
> > >
> > > Same comments as per your other patches, i.e.
> > > Why is this check here?
> > >
> > Because the interrupt resource has range of interrupts in one IRQ resource [0]. Let me know if there is any other alternative way to avoid such case.
>
> Shouldn't be fixed in platform_get_irq_optional() to return IRQ by
> index for all cases?
>
Sorry, I don't get you here. Wasn't your earlier comment for np check?

Cheers,
Prabhakar
