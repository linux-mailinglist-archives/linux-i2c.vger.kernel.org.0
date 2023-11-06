Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC107E1909
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Nov 2023 04:01:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjKFDBi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Nov 2023 22:01:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjKFDBi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Nov 2023 22:01:38 -0500
Received: from mail-yw1-x1142.google.com (mail-yw1-x1142.google.com [IPv6:2607:f8b0:4864:20::1142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41427FB;
        Sun,  5 Nov 2023 19:01:35 -0800 (PST)
Received: by mail-yw1-x1142.google.com with SMTP id 00721157ae682-5a7b91faf40so46817897b3.1;
        Sun, 05 Nov 2023 19:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699239694; x=1699844494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Jje0H66GMvsDYkAJt7nCvqkXoAtSiM8mrUnS4P9J1s=;
        b=h4Pg422VgnMN0TUrNMdfFiEM32FFaRVooNilajubPz1JAhO+brt7devqYpZIK/JRh4
         nmh8dk3lW8HBMFPn4aiFfYc01i3UYdlEwEjmKnGc9GCq7Jh/rnu/q2DWAkX1iFQpcQlp
         QEf/QCgrjP3BFNgThFad4Psg78F4WA0WzpH6tE5FarAA/5YB7hxYIeOzg1NIfGbzTGz/
         tT91u1w7mMrBWn03RpDBiajyxhxeaXmC/xr8W9dQJmxWK5a12d8f7CPupv/Z1Z+N+Dnm
         8VM2iWHx45ysX2sO5rroAV4aeK9HdbSUAIsNDmCv0JeOQDENtVX9jfIN005VynULfQ5H
         A3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699239694; x=1699844494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Jje0H66GMvsDYkAJt7nCvqkXoAtSiM8mrUnS4P9J1s=;
        b=lggYe/TZJC6ZJPEjnUQEe6IFhIQMKAzllvhZv8sdM6sDUUtzOXF9fqv2vurcXOL0vP
         zfNiCWcoxhwtpAfV9ialtZ2mr6mX4ebPJQnJI0FoYlhxAH7xz4pPwfW2jEdKwkILYFDU
         bsbeMzP90vue6+4+Wk81ICaN7ciyOL5EbNNaKNM2ngHxPyc3i86afX4LxlJnbEtYyHVy
         s9egUsG8Otrt4lHezJh1GZWtL+oaHwkNSY8qPXPtOQbFjDDpBMlp44Uj46hqghief1Lk
         LRywZ6yVMQcXBgvBXXEAxc5bKKm5oGsLxrp8vScL36xaQEwGf1cv/St9VZUCPS8SrIW8
         rtAg==
X-Gm-Message-State: AOJu0Yw1nDmzUG65L68KCUiPd1l9jDFwKlTRPIX8ih2Y/BTF3PTADRXy
        qnW3kY3xB32pnTYFMdOS9C8Mq0WatgLgLKn2Pag=
X-Google-Smtp-Source: AGHT+IHGK0NlBjQC9kwH/5eYeIeZw2x+GeR2l+/NoC4qzTVh9yS3wVC6nFn44zWU0caEdww/xh+hnTYZHmUxoK5VRww=
X-Received: by 2002:a25:dcc4:0:b0:da0:c4f5:d5fd with SMTP id
 y187-20020a25dcc4000000b00da0c4f5d5fdmr26536327ybe.54.1699239694421; Sun, 05
 Nov 2023 19:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
 <20231023081158.10654-4-Huangzheng.Lai@unisoc.com> <27d2f363-e24a-736a-9c4e-cff79ff958e0@linux.alibaba.com>
In-Reply-To: <27d2f363-e24a-736a-9c4e-cff79ff958e0@linux.alibaba.com>
From:   huangzheng lai <laihuangzheng@gmail.com>
Date:   Mon, 6 Nov 2023 11:01:23 +0800
Message-ID: <CAAA1Nba1meC0YzsXATgBrLJaP-Aep-Ub0-C1m4_RD3LpTV7aiw@mail.gmail.com>
Subject: Re: [PATCH V2 3/7] i2c: sprd: Use global variables to record I2C
 ack/nack status instead of local variables
To:     Baolin Wang <baolin.wang@linux.alibaba.com>
Cc:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 23, 2023 at 7:32=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 10/23/2023 4:11 PM, Huangzheng Lai wrote:
> > We found that when the interrupt bit of the I2C controller is cleared,
> > the ack/nack bit is also cleared at the same time. After clearing the
> > interrupt bit in sprd_i2c_isr(), incorrect ack/nack information will be
> > obtained in sprd_i2c_isr_thread(), resulting in incorrect communication
> > when nack cannot be recognized. To solve this problem, we used a global
>
> This is a hardware bug?
>

Yes.

> > variable to record ack/nack information before clearing the interrupt
> > bit instead of a local variable.
> >
> > Fixes: 8b9ec0719834 ("i2c: Add Spreadtrum I2C controller driver")
> > Cc: <stable@vger.kernel.org> # v4.14+
> > Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> > ---
> >   drivers/i2c/busses/i2c-sprd.c | 11 ++++++-----
> >   1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-spr=
d.c
> > index aa602958d4fd..dec627ef408c 100644
> > --- a/drivers/i2c/busses/i2c-sprd.c
> > +++ b/drivers/i2c/busses/i2c-sprd.c
> > @@ -85,6 +85,7 @@ struct sprd_i2c {
> >       struct clk *clk;
> >       u32 src_clk;
> >       u32 bus_freq;
> > +     bool ack_flag;
> >       struct completion complete;
> >       struct reset_control *rst;
> >       u8 *buf;
> > @@ -119,6 +120,7 @@ static void sprd_i2c_clear_ack(struct sprd_i2c *i2c=
_dev)
> >   {
> >       u32 tmp =3D readl(i2c_dev->base + I2C_STATUS);
> >
> > +     i2c_dev->ack_flag =3D 0;
> >       writel(tmp & ~I2C_RX_ACK, i2c_dev->base + I2C_STATUS);
> >   }
> >
> > @@ -393,7 +395,6 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, voi=
d *dev_id)
> >   {
> >       struct sprd_i2c *i2c_dev =3D dev_id;
> >       struct i2c_msg *msg =3D i2c_dev->msg;
> > -     bool ack =3D !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
>
> Before this patch, we will re-read the ack bit form the register, but
> now we just read it in sprd_i2c_isr(). Is it possible that we will miss
> the ack bit?
>

Yes, we will miss the 'ack' bit after clear 'irq' bit.

> >       u32 i2c_tran;
> >
> >       if (msg->flags & I2C_M_RD)
> > @@ -409,7 +410,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, voi=
d *dev_id)
> >        * For reading data, ack is always true, if i2c_tran is not 0 whi=
ch
> >        * means we still need to contine to read data from slave.
> >        */
> > -     if (i2c_tran && ack) {
> > +     if (i2c_tran && i2c_dev->ack_flag) {
> >               sprd_i2c_data_transfer(i2c_dev);
> >               return IRQ_HANDLED;
> >       }
> > @@ -420,7 +421,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, voi=
d *dev_id)
> >        * If we did not get one ACK from slave when writing data, we sho=
uld
> >        * return -EIO to notify users.
> >        */
> > -     if (!ack)
> > +     if (!i2c_dev->ack_flag)
> >               i2c_dev->err =3D -EIO;
> >       else if (msg->flags & I2C_M_RD && i2c_dev->count)
> >               sprd_i2c_read_bytes(i2c_dev, i2c_dev->buf, i2c_dev->count=
);
> > @@ -437,7 +438,6 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_=
id)
> >   {
> >       struct sprd_i2c *i2c_dev =3D dev_id;
> >       struct i2c_msg *msg =3D i2c_dev->msg;
> > -     bool ack =3D !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
> >       u32 i2c_tran;
> >
> >       if (msg->flags & I2C_M_RD)
> > @@ -456,7 +456,8 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_=
id)
> >        * means we can read all data in one time, then we can finish thi=
s
> >        * transmission too.
> >        */
> > -     if (!i2c_tran || !ack) {
> > +     i2c_dev->ack_flag =3D !(readl(i2c_dev->base + I2C_STATUS) & I2C_R=
X_ACK);
> > +     if (!i2c_tran || !i2c_dev->ack_flag) {
> >               sprd_i2c_clear_start(i2c_dev);
> >               sprd_i2c_clear_irq(i2c_dev);
> >       }
