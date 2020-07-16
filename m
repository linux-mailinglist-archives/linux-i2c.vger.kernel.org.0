Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 772CE222980
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 19:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729579AbgGPRT3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 13:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729533AbgGPRT2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 13:19:28 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43A8C061755
        for <linux-i2c@vger.kernel.org>; Thu, 16 Jul 2020 10:19:27 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id j11so8772443ljo.7
        for <linux-i2c@vger.kernel.org>; Thu, 16 Jul 2020 10:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bPbXwwYWyet5Kf6gV4HyZCVuYdSTHiTLHNtCwYMlFTo=;
        b=dsZ2q5RSVCFI3KsQRstQ0D3jAOV7yGWHXz52xAjtYsg+LkGGeyOdT+AVmFM4u574a5
         TXxs1z65QBUjbcFhnBCXuGjoF5xKxgTbY5Gp1PwcMDfg42XYzh2E4emUWXXhP8iodhb1
         29nzU8YaCQ1J2UdYaBJn+M5xNgLpSYFIVwec0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bPbXwwYWyet5Kf6gV4HyZCVuYdSTHiTLHNtCwYMlFTo=;
        b=HOkSNsLkNLKgCKmM2iL/RlA073cPuFmnDcBcZy70W4tHwGObnRpjGYfx2fmhKoHf04
         a08QSv8qT8RP/ehRtA97i8apDVEdbZMDptb78Xxm8gBpq+dUaPn+1TG3H+Md4Ybcoc5m
         /l1NaSVMmcIpF3yB01czZykN9RWgDA85y696kzv7r37tyF4JK/eKISR0JXgD/5IRYwYh
         i3/3QoxDLJp/kDpBefoWm2rWWra1A3j4qnq2Uw2j6H2nufz5GH4ptw6y8I08FvW98sPo
         5prGFySvfMBN+y+3j1Jt+4hDm4tI5Q6RsclM88TsTbWo0cFXeINvsW1JpMNtjP6fshCi
         r6CQ==
X-Gm-Message-State: AOAM530yCcKVox7rvhSvLTCA9Anu1nQsXmSOe4QPm35Flbba+6MmaTSU
        eX5WokoGitqrcntB8Q2SnQBq5iI9SCcuT5gsZrV4gg==
X-Google-Smtp-Source: ABdhPJwGxLT2usBO4lXx7qp+6gAfGOmZ7j1wJh2qMJgfgQJkTnzJ6n1LfM0au7+6CVfcEM/4fxXXeErgijZltfHxE84=
X-Received: by 2002:a2e:9f13:: with SMTP id u19mr2393590ljk.427.1594919965973;
 Thu, 16 Jul 2020 10:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200716080836.2279-1-rayagonda.kokatanur@broadcom.com>
 <20200716080836.2279-3-rayagonda.kokatanur@broadcom.com> <CAHp75VeXBCqEhfna2mQaHv7bZKOrj+A6KkbCrMAfM=X9+boDjA@mail.gmail.com>
In-Reply-To: <CAHp75VeXBCqEhfna2mQaHv7bZKOrj+A6KkbCrMAfM=X9+boDjA@mail.gmail.com>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Thu, 16 Jul 2020 22:49:14 +0530
Message-ID: <CAHO=5PEMou=a7Kqc=_ZJ8V9FQ=dHA0cJkkojdq91NBsO1Dp3TQ@mail.gmail.com>
Subject: Re: [PATCH V1 2/2] i2c: iproc: add slave pec support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Robert Richter <rrichter@marvell.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Thu, Jul 16, 2020 at 3:44 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Jul 16, 2020 at 11:14 AM Rayagonda Kokatanur
> <rayagonda.kokatanur@broadcom.com> wrote:
> >
> > Iproc supports PEC computation and checking in both Master
> > and Slave mode.
> >
> > This patch adds support for PEC in slave mode.
>
> ...
>
> > -#define S_RX_PEC_ERR_SHIFT           29
> > +#define S_RX_PEC_ERR_SHIFT           28
> > +#define S_RX_PEC_ERR_MASK            0x3
> > +#define S_RX_PEC_ERR                 0x1
>
> This needs to be explained in the commit message, in particular why
> this change makes no regression.

I didn't get what do you mean by "no regression", please elaborate.

>
> ...
>
> > +static int bcm_iproc_smbus_check_slave_pec(struct bcm_iproc_i2c_dev *iproc_i2c,
> > +                                          u32 val)
> > +{
> > +       u8 err_status;
>
> > +       int ret = 0;
>
> Completely redundant variable.
>
> > +       if (!iproc_i2c->en_s_pec)
> > +               return ret;
>
> return 0;
>
> > +       err_status = (u8)((val >> S_RX_PEC_ERR_SHIFT) & S_RX_PEC_ERR_MASK);
>
> Why casting?
>
> > +       if (err_status == S_RX_PEC_ERR) {
> > +               dev_err(iproc_i2c->device, "Slave PEC error\n");
>
> > +               ret = -EBADMSG;
>
> return ...
>
> > +       }
> > +
> > +       return ret;
>
> return 0;
>
> > +}
>
> ...
>
> > +                       if (rx_status == I2C_SLAVE_RX_END) {
> > +                               int ret;
> > +
> > +                               ret = bcm_iproc_smbus_check_slave_pec(iproc_i2c,
> > +                                                                     val);
>
> One line looks better.

Yes, but to have 80 char per line, I have to do this.
>
> > +                               if (!ret)
>
> Why not positive conditional?

Thank you for your review.
Will fix all above.

Best regards,
Rayagonda

>
> > +                                       i2c_slave_event(iproc_i2c->slave,
> > +                                                       I2C_SLAVE_STOP, &value);
> > +                               else
> > +                                       i2c_slave_event(iproc_i2c->slave,
> > +                                                       I2C_SLAVE_PEC_ERR,
> > +                                                       &value);
> > +                       }
>
> --
> With Best Regards,
> Andy Shevchenko
