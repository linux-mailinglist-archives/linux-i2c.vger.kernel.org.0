Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5998451C
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2019 09:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbfHGHEb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 03:04:31 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:44378 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727173AbfHGHEb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Aug 2019 03:04:31 -0400
Received: by mail-yb1-f195.google.com with SMTP id q203so733034ybg.11;
        Wed, 07 Aug 2019 00:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ESF14Tj/Iz5q41yFZf19ms0Um+JiDKtApGa5yGw41/8=;
        b=gncW6+eU9mpF8r/ERuH+qecrfewjtuxt1iR6lwRBsa0/sgqMRTJgLXgSXizexNUPZA
         PiUh+rzf1sOxvnpDyRxEk162QXSsIszHrg15j3E5hT3/S05uckMK8pH2NFyDi2NwFiEf
         UdEI8WfWLCy71AFzmh3QMRIbFIrsaSX6SUeq6zeaDWwgB8tMBAjB1LypgMR5VBq5T0jn
         0Palw89cRWLatrWR1toQUa3vc2S2STVoR7y/UEXDHoKM6HoFOeRzJCB1w90TmL27ql23
         AANxYTMrbnVvu7ZwNzvAaT2C7DV+RuLOEkhRLdDfrOF/iMy7p92lwe4y3xomL0jAClEC
         dcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=ESF14Tj/Iz5q41yFZf19ms0Um+JiDKtApGa5yGw41/8=;
        b=TZh3tMdjzyKblzF2ZLkGy/TcKkZnnkl5jeFCY8C/fGDM152Xe35UEvsn9U6ORgmNK7
         FT0B7ed4c0Il57tYjDbMePWl10gk6lckSSH8q/qhescGPhhBpItyQ4V1LPDK8b/NjM9d
         Ip30SKkGpD+tSGakZ5158GiOeWvxkvLuqQQNWYwYvnMm0rkSXPoLfdlwG4LSTO3b4UuA
         /w57BoRzpU07sjLxGmTgt/TptdaY0GCHI5UjZI1ocC3JcUGTO3mdMWSebPNuiQNmb9ow
         gXrlF5viKwAvQ/AUPXb2CpK2Nnn7wcjCtS5emtXf2SuRe8VxAtCiCIbrLXm/hxZiJ64j
         gdFw==
X-Gm-Message-State: APjAAAWy0zEdPA+85uxbCjsctjALfWdhPbBO4Z/NQkSolElb+QBSqBFn
        SPGFZpCailkRbdEmDoaJ4iJ24WFE1s0OYn0Uy4o=
X-Google-Smtp-Source: APXvYqwYCCYIEDgWJqgBcRn9OpeBkcbVwa/KTbxdvVd3hBaQMhq/hwLeAFxhGk9gICz9lQKOA23PKccKuXcpqaGjctg=
X-Received: by 2002:a25:4542:: with SMTP id s63mr4994355yba.395.1565161470670;
 Wed, 07 Aug 2019 00:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190805123134.23199-1-huangfq.daxian@gmail.com> <20190807065111.GA17104@localhost.localdomain>
In-Reply-To: <20190807065111.GA17104@localhost.localdomain>
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Date:   Wed, 7 Aug 2019 15:04:19 +0800
Message-ID: <CABXRUiRscm=b0=bS-Dcxr_7bE45vcqv98SzJCBVsO67cgJOByg@mail.gmail.com>
Subject: Re: [PATCH] i2c: avoid sleep in IRQ context
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>, linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Adamski, Krzysztof (Nokia - PL/Wroclaw) <krzysztof.adamski@nokia.com>
=E6=96=BC 2019=E5=B9=B48=E6=9C=887=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=
=8D=882:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Aug 05, 2019 at 08:31:34PM +0800, Fuqian Huang wrote:
> >i2c_pxa_handler -> i2c_pxa_irq_txempty ->
> >i2c_pxa_reset -> i2c_pxa_set_slave -> i2c_pxa_wait_slave
> >
> >As i2c_pxa_handler is an interrupt handler, it will finally
> >calls i2c_pxa_wait_slave which calls msleep.
> >
> >Add in_interrupt check before msleep to avoid sleep
> >in IRQ context.
> >
> >Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> >---
> > drivers/i2c/busses/i2c-pxa.c | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> >diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> >index 2c3c3d6935c0..b35a0e8efcb2 100644
> >--- a/drivers/i2c/busses/i2c-pxa.c
> >+++ b/drivers/i2c/busses/i2c-pxa.c
> >@@ -443,6 +443,8 @@ static int i2c_pxa_wait_slave(struct pxa_i2c *i2c)
> >
> >       show_state(i2c);
> >
> >+      if (in_interrupt())
> >+              return 0;
>
> Sleeping in irq context is not good indeed but if you just return here,
> an error will be printed from i2c_pxa_set_slave() and cleanup of ICR
> will be skipped. Is that ok?
Sorry for this mistake.
Maybe it should be changed to mdelay.
And the new patch is like this:
if (in_interrupt()) {
   mdelay(1);
} else {
   msleep(1);
}
>
> >       while (time_before(jiffies, timeout)) {
> >               if (i2c_debug > 1)
> >                       dev_dbg(&i2c->adap.dev, "%s: %ld: ISR=3D%08x, ICR=
=3D%08x, IBMR=3D%02x\n",
>
