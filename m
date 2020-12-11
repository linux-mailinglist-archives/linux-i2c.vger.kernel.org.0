Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49422D7D83
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Dec 2020 19:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393092AbgLKR6e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Dec 2020 12:58:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392952AbgLKR6N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Dec 2020 12:58:13 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81FEC0613D3
        for <linux-i2c@vger.kernel.org>; Fri, 11 Dec 2020 09:57:32 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id j140so5247441vsd.4
        for <linux-i2c@vger.kernel.org>; Fri, 11 Dec 2020 09:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=platinasystems-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4bksxVXyraVeH/vaukciGlNCembplpca28pml2zwvZo=;
        b=fOEanG0Sqt1amxqrOs795KMLdoMfZhTniz2AFwOzAmU1PZIPBxfG+oOrFOtGmEmUtx
         SaUeF47rGnO0/gITECyEVdU7oLXOvUBu/Xyk03x+VsNeSvI/6GclCYg29MPUFjHhVfao
         Mq72T0F3ZbIHN5NUBNxNQwDKA/ZQ64+8ENJd90SHNDE4l2UPhbur5HIWCFqkhOwQ7EZR
         ApkpWfd8GQiLl+mIxMyFhYNjMk9mIGDydvOttxtqA7DpARxHGplGCwjSTLFRwS6JVe97
         HBlWJ6IbZz9QxF9FRRQy8nfXP6PMIHMuZFxHh9XGmQ9ZQmq0cs8VVu1dklOwvrKiyqe8
         Z6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4bksxVXyraVeH/vaukciGlNCembplpca28pml2zwvZo=;
        b=Wb5Nim1JcVAfy+FY/slQmbKwVJnFYiFCJ6oUtcbH1BYc+vWikcB9oA4Cl9W6NIN4nv
         1SItP6tsY+jBT8+PAi6dD/yAOEHp3qlaN7Uw6lmMqEGvhF9Nf5zVPeTrSjlofKr9eSDc
         znFyvjMYlcP5nqNWSm5WGACvW71jD2DRQ+bs4rxN2Djlc657LDwIGPP5Mntnjuhjnk7o
         lg6FNtaVhqbyWhS0iXp37RRaFwkSw3CKDOhQdQlxbmx1iFWVXeXZZA6NgoVMHoXy3Bfn
         Z428pv9M/UhUTB8H4onQOyDhPywkfOAhiOnalXhOVHIHyJ6QxnvH7bSmELvI1qFdETmS
         wE/g==
X-Gm-Message-State: AOAM532s2I3GBZcB7ZXged2NgIhqgpurLIfXpLi4ywZnCBRvN8W9I5h/
        nKsmjAGrlQXvLg7fGP4pWhyV6707HuUJaJNuEEnt5Q==
X-Google-Smtp-Source: ABdhPJwMzgUn+aN0NxiG+GDU7esXEln4BCbZDifylqi+ZCM4VujfEE3iZxBltx22ScTz9ndq9JSAZFhlA3LB9SQdzQ4=
X-Received: by 2002:a05:6102:66a:: with SMTP id z10mr14819634vsf.53.1607709451615;
 Fri, 11 Dec 2020 09:57:31 -0800 (PST)
MIME-Version: 1.0
References: <20201111113255.28710-1-biwen.li@oss.nxp.com> <20201202151033.GC874@kunai>
 <CABP=6zZcmsFUVwUaAH7f2-RqFHz71GLDnSfLreUo5GA3Y58HYA@mail.gmail.com>
 <20201209170948.GA2249@kunai> <CABP=6zbKxu7ruGRi59k8+JbX5UB9jfP=C76-Pd4Q39Mc0yOTrA@mail.gmail.com>
 <DB6PR0401MB2438F3FF50B601295BBE7F378FCB0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0401MB2438F3FF50B601295BBE7F378FCB0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
From:   Kevin Herbert <kph@platinasystems.com>
Date:   Fri, 11 Dec 2020 09:57:19 -0800
Message-ID: <CABP=6zahhQSXwG2MzR+ry9h8MCRqjyS=ysdvF1UYuejZd-0RkQ@mail.gmail.com>
Subject: Re: [EXT] Re: [v10] i2c: imx: support slave mode for imx I2C driver
To:     Biwen Li <biwen.li@nxp.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Biwen Li (OSS)" <biwen.li@oss.nxp.com>,
        Leo Li <leoyang.li@nxp.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks for the tip. I attempted to see if the register was implemented
on the i.mx6, and it doesn't appear to be. I'll reach out to my FAE. I
found the datasheet and the register definitely isn't documented
there.

I was thinking of a patch that would keep track of state, and
synthesize the I2C_SLAVE_STOP on the next interrupt if it was a new
transaction. Does this seem too hacky to you? What are your thoughts?

Thanks,
Kevin

Thanks,
Kevin


On Wed, Dec 9, 2020 at 6:16 PM Biwen Li <biwen.li@nxp.com> wrote:
>
> Hi Kevin,
>
>
>
> After enabling idle interrupts, the i2c register will generate an idle in=
terrupts(whatever read or write) when i2c bus enter idle status. Then get I=
2C_SLAVE_STOP event.
>
> But don=E2=80=99t have the IBIC register(Maybe it=E2=80=99s a hidden regi=
ster) in imx. You can query about the AE of imx about this.
>
> static void i2c_imx_enable_bus_idle(struct imx_i2c_struct *i2c_imx)
>
> {
>
>         if (is_vf610_i2c(i2c_imx)) {
>
>                 unsigned int temp;
>
>
>
>                 temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_IBIC);
>
>                 temp |=3D IBIC_BIIE;
>
>                 imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_IBIC);
>
>         }
>
> }
>
>
>
> Best Regards,
>
> Biwen Li
>
> From: Kevin Herbert <kph@platinasystems.com>
> Sent: 2020=E5=B9=B412=E6=9C=8810=E6=97=A5 1:18
> To: Wolfram Sang <wsa@the-dreams.de>; Kevin Herbert <kph@platinasystems.c=
om>; Biwen Li (OSS) <biwen.li@oss.nxp.com>; Leo Li <leoyang.li@nxp.com>; li=
nux@rempel-privat.de; kernel@pengutronix.de; shawnguo@kernel.org; s.hauer@p=
engutronix.de; festevam@gmail.com; Aisheng Dong <aisheng.dong@nxp.com>; Cla=
rk Wang <xiaoning.wang@nxp.com>; o.rempel@pengutronix.de; linux-i2c@vger.ke=
rnel.org; linux-kernel@vger.kernel.org; Jiafei Pan <jiafei.pan@nxp.com>; Xi=
aobo Xie <xiaobo.xie@nxp.com>; linux-arm-kernel@lists.infradead.org; Biwen =
Li <biwen.li@nxp.com>
> Subject: [EXT] Re: [v10] i2c: imx: support slave mode for imx I2C driver
>
>
>
> Caution: EXT Email
>
> Even on an operation like writing a byte, I get I2C_SLAVE_WRITE_REQUESTED=
 followed by I2C_SLAVE_WRITE_RECEIVED, but no I2C_SLAVE_STOP. If I do a I2C=
 write of multiple bytes, I get I2c_SLAVE_WRITE_REQUESTED followed by multi=
ple I2C_SLAVE_WRITE_RECEIVED.
>
>
>
> Kevin
>
>
>
> On Wed, Dec 9, 2020 at 9:10 AM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Wed, Dec 09, 2020 at 09:03:50AM -0800, Kevin Herbert wrote:
> > What is the protocol for the I2C_SLAVE_STOP event? I am working on my o=
wn
> > backend, and I've only tried it with this i.mx driver, and I do not rec=
eive
> > I2C_SLAVE_STOP at the end of every I2C transaction. It was my expectati=
on
> > I'd receive this event at the end of every frame. In my testing, I've n=
ever
> > received this event at all.
> >
> > Where are the I2C registers on the i.mx documented? My board is an i.mx=
6sx.
>
> Hmm, from a glimpse, it looks the STOP event is only sent after a write
> and not after a read? Does this match your findings?
