Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B44579E213
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 10:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238724AbjIMI30 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 04:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbjIMI3Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 04:29:25 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF3110C0;
        Wed, 13 Sep 2023 01:29:21 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-49059b1ca83so2392855e0c.2;
        Wed, 13 Sep 2023 01:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694593761; x=1695198561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Es8hOuwIYmcM8r+ve2+bumMbnNue3lPNHT0KgpLrG9U=;
        b=RXQtXAh8uJHJccJPw7SaNVYSRyXJmnYLxondFk5gY2NhTlenvxLnujsnNTS9HWoGN3
         DzJ+9voc18JWqLpXAumyX855SA7iLfyAcpk2IgQG7DnNJiW6phB8a4mJmGVyFZT1I48x
         HBkpNEkRmGpH2TeRJJF3uDFieqhpGhL4vhrBZgqBFW9QSQxcqMF49KVeOXtfed4ur/8F
         bx4s/DPvKxPZyX02O0BcW+7N059Eve1m2cH9Be5p2YqWDDYssSY1Awms1uvxJJSC7Eg1
         pPGc8/Z5lXfcBfoXHKNCarkkQXL1S3Hb1wlGWGUD+xDBYh+hY6HnfboibwbFXPO+d7Dn
         WzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593761; x=1695198561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Es8hOuwIYmcM8r+ve2+bumMbnNue3lPNHT0KgpLrG9U=;
        b=rwjR2gk9N1nDyT0EncLyzUxPmotyzbSimSKsWZfdrPDMdvbWUlOw91tbLPDVwIjvqH
         dkw5oll+1ii8tc5CCtdq5/05SWjuMDN792gflgChGC2QVLYyvrPr2hjEZB4eGpP5RC0Z
         eAiwMbXwEbafVTV0r2TMZMOn/xF/aGGIYu2haAIPiBlSgZsBuijua1/JLKWxUYETjjd1
         kMeZlEiTTU5GVbG+c2EjQM03+NKxDpzjwC2w2WbwKaVKAoGgjTzHoB7OCamZ3SZP70Tn
         gFaOHe5OE0Cnw0ajD6GW/wN29e3b944vdwuFLYHmeVbmEOeCaLKY+pCR3895q1RoRciN
         xtoQ==
X-Gm-Message-State: AOJu0YyEUINRqtt9foOrVG7vcuWvmkiyWksD5wjdykpOB3fbx4vG9Wk9
        WF3NVYnXjZ4pGfh8KTqzvQXbklXZS4mXvXC+iLA=
X-Google-Smtp-Source: AGHT+IHNbUeA9uwBUiBHUY1MBXjNkTE1bdBml3QVvnCnVS3I8Av3J8GoylPYg8GNXJUtkZ1492htIqR61uw6WM0hiLA=
X-Received: by 2002:a05:6102:34d1:b0:44d:3bc0:f0bf with SMTP id
 a17-20020a05610234d100b0044d3bc0f0bfmr1967586vst.8.1694593760967; Wed, 13 Sep
 2023 01:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
 <20230817094520.21286-4-Huangzheng.Lai@unisoc.com> <20230902210513.3xelrcdtynz45p4o@zenone.zhora.eu>
 <CAAA1NbZt84f8vzmPbO_TH6hnvveyaiPhXpwjihRhJAEY9qw_Vg@mail.gmail.com>
In-Reply-To: <CAAA1NbZt84f8vzmPbO_TH6hnvveyaiPhXpwjihRhJAEY9qw_Vg@mail.gmail.com>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Wed, 13 Sep 2023 16:28:44 +0800
Message-ID: <CAAfSe-vwueijaYo2_rw3CO2ghZUN7hzoXEzRYS1gkB5ez2LXqw@mail.gmail.com>
Subject: Re: [PATCH 3/8] i2c: sprd: Use global variables to record IIC
 ack/nack status instead of local variables
To:     huangzheng lai <laihuangzheng@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 13 Sept 2023 at 15:12, huangzheng lai <laihuangzheng@gmail.com> wro=
te:
>
> Hi Chunyan=EF=BC=8C
>
> I don't think it's necessary to clear  i2c_dev->ack_flag in sprd_i2c_clea=
r_ack() . Because every time a new interrupt is triggered, it will retrieve=
 the value of i2c_dev->ack_flag in sprd_i2c_isr and then use it in sprd_i2c=
_isr_thread.

You're assuming that ack_flag is and will be used in sprd_i2c_isr_thread() =
only.

If ack_flag is used to represent the ack/nack bit of interrupt status
register, I think we should clear it as well when clearing ack/nack
bit.

BTW, please make sure your email is plain-text mode so that people can
receive from the mail list, and do not top-post again.

Thanks,
Chunyan

>
> On Sun, Sep 3, 2023 at 5:05=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org>=
 wrote:
>>
>> Hi Huangzheng,
>>
>> On Thu, Aug 17, 2023 at 05:45:15PM +0800, Huangzheng Lai wrote:
>> > We found that when the interrupt bit of the IIC controller is cleared,
>> > the ack/nack bit is also cleared at the same time. After clearing the
>> > interrupt bit in sprd_i2c_isr(), incorrect ack/nack information will b=
e
>> > obtained in sprd_i2c_isr_thread(), resulting in incorrect communicatio=
n
>> > when nack cannot be recognized. To solve this problem, we used a globa=
l
>> > variable to record ack/nack information before clearing the interrupt
>> > bit instead of a local variable.
>> >
>> > Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
>>
>> Is this a fix? Then please consider adding
>>
>> Fixes: 8b9ec0719834 ("i2c: Add Spreadtrum I2C controller driver")
>> Cc: <stable@vger.kernel.org> # v4.14+
>>
>> > ---
>> >  drivers/i2c/busses/i2c-sprd.c | 10 +++++-----
>> >  1 file changed, 5 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sp=
rd.c
>> > index 066b3a9c30c8..549b60dd3273 100644
>> > --- a/drivers/i2c/busses/i2c-sprd.c
>> > +++ b/drivers/i2c/busses/i2c-sprd.c
>> > @@ -85,6 +85,7 @@ struct sprd_i2c {
>> >       struct clk *clk;
>> >       u32 src_clk;
>> >       u32 bus_freq;
>> > +     bool ack_flag;
>>
>> smells a bit racy... however we are in the same interrupt cycle.
>>
>> Do you think we might need a spinlock around here?
>>
>> >       struct completion complete;
>> >       struct reset_control *rst;
>> >       u8 *buf;
>> > @@ -384,7 +385,6 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, vo=
id *dev_id)
>> >  {
>> >       struct sprd_i2c *i2c_dev =3D dev_id;
>> >       struct i2c_msg *msg =3D i2c_dev->msg;
>> > -     bool ack =3D !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
>> >       u32 i2c_tran;
>> >
>> >       if (msg->flags & I2C_M_RD)
>> > @@ -400,7 +400,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, vo=
id *dev_id)
>> >        * For reading data, ack is always true, if i2c_tran is not 0 wh=
ich
>> >        * means we still need to contine to read data from slave.
>> >        */
>> > -     if (i2c_tran && ack) {
>> > +     if (i2c_tran && i2c_dev->ack_flag) {
>> >               sprd_i2c_data_transfer(i2c_dev);
>> >               return IRQ_HANDLED;
>> >       }
>> > @@ -411,7 +411,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, vo=
id *dev_id)
>> >        * If we did not get one ACK from slave when writing data, we sh=
ould
>> >        * return -EIO to notify users.
>> >        */
>> > -     if (!ack)
>> > +     if (!i2c_dev->ack_flag)
>> >               i2c_dev->err =3D -EIO;
>> >       else if (msg->flags & I2C_M_RD && i2c_dev->count)
>> >               sprd_i2c_read_bytes(i2c_dev, i2c_dev->buf, i2c_dev->coun=
t);
>> > @@ -428,7 +428,6 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev=
_id)
>> >  {
>> >       struct sprd_i2c *i2c_dev =3D dev_id;
>> >       struct i2c_msg *msg =3D i2c_dev->msg;
>> > -     bool ack =3D !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
>> >       u32 i2c_tran;
>> >
>> >       if (msg->flags & I2C_M_RD)
>> > @@ -447,7 +446,8 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev=
_id)
>> >        * means we can read all data in one time, then we can finish th=
is
>> >        * transmission too.
>> >        */
>> > -     if (!i2c_tran || !ack) {
>> > +     i2c_dev->ack_flag =3D !(readl(i2c_dev->base + I2C_STATUS) & I2C_=
RX_ACK);
>>
>> there is a question from Chunyan here.
>>
>> I like more
>>
>>         val =3D readl(...);
>>         i2c_dev->ack_flag =3D !(val & I2C_RX_ACK);
>>
>> a matter of taste, your choice.
>>
>> Andi
>>
>> > +     if (!i2c_tran || !i2c_dev->ack_flag) {
>> >               sprd_i2c_clear_start(i2c_dev);
>> >               sprd_i2c_clear_irq(i2c_dev);
>> >       }
>> > --
>> > 2.17.1
>> >
