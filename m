Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2AC97E1CE4
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Nov 2023 10:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbjKFJDB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Nov 2023 04:03:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbjKFJC7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Nov 2023 04:02:59 -0500
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C063C83;
        Mon,  6 Nov 2023 01:02:56 -0800 (PST)
Received: by mail-yb1-xb44.google.com with SMTP id 3f1490d57ef6-d9a6399cf78so3571874276.0;
        Mon, 06 Nov 2023 01:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699261376; x=1699866176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7NuiKiM94lM3T/xV8tJgikpue3o32DC10v2L+7fqI4=;
        b=CBLQBysActsE9XWLrSOm2f+TeQVt/xGyGkLSj8z2eSmxd18bl45IImgpO/MptqU2XM
         VKHia5apZCkFiGxGQvvt17OSf5LnmeYkP518KUgwVgqUGYyqmGwSOCeWhKt8oLCRMLfw
         g23kGhWB1XZ+kNGpRQ9SfX1d4UT8/ikmXQo8RxKK50WYcnZsebG1XgeaP7QAGPynNmHT
         V8r2g4ipE3CGjWP4FA4ZZnytT26qa88ZL4xhbLzn6dmoWmw8hjK8FyttFycQ3KqP+0Do
         dwH2gBIvdKY0A8MXbYyRkD3oOni4Jpt0sfrnjXAiBpGaJmRw4zEh3xB1Rr4p24uSD/V6
         APRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699261376; x=1699866176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7NuiKiM94lM3T/xV8tJgikpue3o32DC10v2L+7fqI4=;
        b=jUh81VTirTP11bPLN0eQC0JYkUiDD2BQ78CdZ1kKXxidynkdpUskgYV3K/mkzier+s
         8V21UGdLUfCkVZNAu9hhZuQzNc4VaNPmpjHlDx0Uu5VtEw2kaxwsxBYEU/H5jTTxz/wA
         dNxeGREXsoB9HK9RRoGLa4cK7LiazSnHXMNU98TWgi1hnLSaKOg7L0RrfEusPtIktzNp
         4rEFOohnC3IP7MrWuAtULb4WsbOEfnXQnEGzBXMW8EqlSeApyVOLXEx1bxlN2/SEjo1t
         KvmqmWuz8hwGKgyd/gVLPIw6hXkZlNtKFHO50sHboucdGKEwOS+puEjU1Zdb4LuMZGAL
         VC5Q==
X-Gm-Message-State: AOJu0YwiTIBnSh4XCn4CBgIPqCnfFtvFitqgUd1c+V4u4JaXTlTODq5X
        2ZMcgZWl2YJXk9B+un3dMgvtWVi0usGjGSm1F/w=
X-Google-Smtp-Source: AGHT+IFCmK+CfRH22Zs+cCwRBhKVb3zb55f5P9yWsBHH/SsIwU2tnicoT/W2yzPoXr2Fx9c1jyvUsBokJY27gALuNeM=
X-Received: by 2002:a5b:906:0:b0:da0:8955:34f7 with SMTP id
 a6-20020a5b0906000000b00da0895534f7mr6617723ybq.23.1699261375967; Mon, 06 Nov
 2023 01:02:55 -0800 (PST)
MIME-Version: 1.0
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
 <20231023081158.10654-4-Huangzheng.Lai@unisoc.com> <20231024212003.rfakablxfst5nxba@zenone.zhora.eu>
In-Reply-To: <20231024212003.rfakablxfst5nxba@zenone.zhora.eu>
From:   huangzheng lai <laihuangzheng@gmail.com>
Date:   Mon, 6 Nov 2023 17:02:44 +0800
Message-ID: <CAAA1NbaNPzr_ZQa2h_e-kBcxYFPm30=4yC93_o0Sz5e5f8q3Xw@mail.gmail.com>
Subject: Re: [PATCH V2 3/7] i2c: sprd: Use global variables to record I2C
 ack/nack status instead of local variables
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,


On Wed, Oct 25, 2023 at 5:20=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Huangzheng,
>
> On Mon, Oct 23, 2023 at 04:11:54PM +0800, Huangzheng Lai wrote:
> > We found that when the interrupt bit of the I2C controller is cleared,
> > the ack/nack bit is also cleared at the same time. After clearing the
> > interrupt bit in sprd_i2c_isr(), incorrect ack/nack information will be
> > obtained in sprd_i2c_isr_thread(), resulting in incorrect communication
> > when nack cannot be recognized. To solve this problem, we used a global
> > variable to record ack/nack information before clearing the interrupt
> > bit instead of a local variable.
> >
> > Fixes: 8b9ec0719834 ("i2c: Add Spreadtrum I2C controller driver")
> > Cc: <stable@vger.kernel.org> # v4.14+
> > Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> > ---
> >  drivers/i2c/busses/i2c-sprd.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
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
>
> So that you are telling me that this is not racy because we won't
> receive any irq until we pull the ack down. Am I understanding
> correctly?
>
> But if this patch is fixing an unstable ack flag, how can I
> believe this won't end up into a race?
>

In fact, the ack flag is not unstable. However, the ack state on the
hardware will
reset as the interrupt state is cleared, nd there are some unexpected coupl=
ing
relationships on the hardware.We need to obtain and save the ack flag befor=
e
clearing the interrupt state.

> >       struct completion complete;
> >       struct reset_control *rst;
> >       u8 *buf;
> > @@ -119,6 +120,7 @@ static void sprd_i2c_clear_ack(struct sprd_i2c *i2c=
_dev)
> >  {
> >       u32 tmp =3D readl(i2c_dev->base + I2C_STATUS);
> >
> > +     i2c_dev->ack_flag =3D 0;
> >       writel(tmp & ~I2C_RX_ACK, i2c_dev->base + I2C_STATUS);
> >  }
> >
> > @@ -393,7 +395,6 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, voi=
d *dev_id)
> >  {
> >       struct sprd_i2c *i2c_dev =3D dev_id;
> >       struct i2c_msg *msg =3D i2c_dev->msg;
> > -     bool ack =3D !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
>
> Where exactly did you see the ack going to '0', here in the
> thread or in handler?
>

After function sprd_i2c_irq() is executed, the ack state bit in the
hardware will be reset to the default ack.
When the slave nack, the ack flag obtained in the thread is incorrect,
which can cause
the i2c driver to mistakenly believe that the transmission was successful.

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
> >  {
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
>
> this clear_start() is called both here and in the thread, why?
>

When it is determined here that there is no remaining i2c data or slave nac=
k,
clear_start() is called for stopping i2c controller transmission.
In the thread, clear_start() is called because all i2c data
reads/writes are completed.

> Andi
>
> >               sprd_i2c_clear_irq(i2c_dev);
> >       }
> > --
> > 2.17.1
> >
