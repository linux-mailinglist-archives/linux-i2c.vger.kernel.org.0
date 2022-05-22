Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 828B5530163
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 08:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbiEVG4w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 02:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbiEVG4v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 02:56:51 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 422B03A734;
        Sat, 21 May 2022 23:56:48 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id t12so5797009vkt.5;
        Sat, 21 May 2022 23:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=qDo9UUCdw4SMj2aM3ERRiVJpDYvO4JgoJi8WdLoZ0lU=;
        b=dl7Ft5A/2X6nUPIBbpqjdW58KNi+xMUoc3zBFTctHHzVONK2CleyYzTWzBi/tDqjiU
         ngBC6pjX9j2B8a4/cHW3x51cqt96agpMOEbL25qEyOhW8WoeaIi4CaqNhxFMoknQqmgX
         Hb92DxvrvrrhyWTQvtBtnpikiCAPoxZYtU0r1Er+KQ7pW9Di4NzF3qO/EB3Fgv6DRroc
         tdToxaiNPp9FWXeYERnMhDVYlPxaO29Q4rdHUVWACuFXi7QauT/ZgeUE6UXika1MryAS
         w+yaEXyIB1vEU7MFvH4ifImAxayMZvQFqJ3jRsn1yM+6XxwcfZA/t9Iad9SzKx1Ftvt4
         aMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=qDo9UUCdw4SMj2aM3ERRiVJpDYvO4JgoJi8WdLoZ0lU=;
        b=MPvx5bkpKzBmO5MdmKrPE5RGFFaqBrguKM/JpaxoJqVkUJc3gAqEe9mk5OCRBN8VLE
         PSDWJ6U9QPE8+y0QdoRNJp9dhNcQdd4rvIFUqf6QxfVc9FTlxlkYM4zcxDh5/1my8tQw
         6MvWajGXrfjW0xnGXhaC0ThFixZPi279kGN/Nlsa4ugK0RyptzVolNQXfHKhQd2SEM0B
         /sGqvLBcCbMshFphtUkfxaEv3f58WPNzczAg2gOIAOqlJCTnuq0nzpOoZqVlTci0ADyD
         RDXYGVlSIBDGYbFmKQD0DqnenxJnKy2O/dTzVXX1lgXN7Kcb4G9TMgCGnd4e8/sMTKam
         p9yw==
X-Gm-Message-State: AOAM5339TDhVZDsfUPzFJS7jXu9phK4brhqpF3CjeKGMY6wzuupz6NVr
        D9F48KHuRwpuAL+TZJZWXgcCdIpteCa+CWD1fgch65Yghyp/OA==
X-Google-Smtp-Source: ABdhPJzSFsR0sEXSSM5qtNrvyCk4BshQuchdzAr1Kwogd9LEeS00mSfb8t/DqERH2KTXWr8GoqbKL8OpiYoYlSFsncY=
X-Received: by 2002:a1f:1d11:0:b0:357:733d:a6d with SMTP id
 d17-20020a1f1d11000000b00357733d0a6dmr1374013vkd.26.1653202607265; Sat, 21
 May 2022 23:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com> <20220517101142.28421-9-warp5tw@gmail.com>
 <Yoh/nEYPu++LZSvb@shikoro>
In-Reply-To: <Yoh/nEYPu++LZSvb@shikoro>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Sun, 22 May 2022 09:56:36 +0300
Message-ID: <CAHb3i=uKwe1RdvzQA=oO6zNmEvyA_awx09+C2w8kbRq_NGi54w@mail.gmail.com>
Subject: Re: [PATCH v5 08/10] i2c: npcm: Remove own slave addresses 2:10
To:     Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
        avifishman70@gmail.com, Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org,
        rafal@milecki.pl, sven@svenpeter.dev, jsd@semihalf.com,
        jie.deng@intel.com, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> On Sat, May 21, 2022 at 8:58 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> > NPCM can support up to 10 own slave addresses. In practice, only one
> > address is actually being used. In order to access addresses 2 and above,
> > need to switch register banks. The switch needs spinlock.
> > To avoid using spinlock for this useless feature removed support of SA >=
> > 2. Also fix returned slave event enum.
>
> Is the spinlock contention so high? The code paths do not really look
> like hot paths to me. A bit sad to see this feature go.
>

The module has two seperate banks, accessible with a bit change. The
first one is used
for most of the runtime operations. Second bank is used mostly during init.
Unfortunetly, the first two own slave addresses are in the first bank
and the other
8 are in the second bank.

Every time the module switchs from master to slave mode, those
registers are accessed.
In theory, a spinlock can be used to protect those registers.
In practice, none of our customers use the extra addresses.
In fact they only need one.

The driver also does not allow you to register more then one slave per bus,
so this HW feature was not fully available to begin with.

So when we encounter a deadlock with this spinlock we decided to get rid of this
unused feature and get both a stable fix for the issue + performance benefits.
We work closely with all our customers so we know that this HW
feature is useless to them.

> >  static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
> >       NPCM_I2CADDR1, NPCM_I2CADDR2, NPCM_I2CADDR3, NPCM_I2CADDR4,
> >       NPCM_I2CADDR5, NPCM_I2CADDR6, NPCM_I2CADDR7, NPCM_I2CADDR8,
>
> Why do we keep this array if we drop the support?
>
This array represents the HW so we left it as-is. But I agree it can
be shortened to one\two.

> > @@ -604,8 +602,7 @@ static int npcm_i2c_slave_enable(struct npcm_i2c *bus, enum i2c_addr addr_type,
> >                       i2cctl1 &= ~NPCM_I2CCTL1_GCMEN;
> >               iowrite8(i2cctl1, bus->reg + NPCM_I2CCTL1);
> >               return 0;
> > -     }
> > -     if (addr_type == I2C_ARP_ADDR) {
> > +     } else if (addr_type == I2C_ARP_ADDR) {
>

addr_type type can be one of several options.
The code was
if (addr_type is 1st option)
...
if (addr_type is 2st option)
...
etc.

Adding that else is more accurate, but ommiting this change works as well.

> I might be wrong but this looks like a seperate change?
>
> > @@ -924,11 +918,15 @@ static int npcm_i2c_slave_get_wr_buf(struct npcm_i2c *bus)
> >       for (i = 0; i < I2C_HW_FIFO_SIZE; i++) {
> >               if (bus->slv_wr_size >= I2C_HW_FIFO_SIZE)
> >                       break;
> > -             i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
> > +             if (bus->state == I2C_SLAVE_MATCH) {
> > +                     i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
> > +                     bus->state = I2C_OPER_STARTED;
> > +             } else {
> > +                     i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
> > +             }
> >               ind = (bus->slv_wr_ind + bus->slv_wr_size) % I2C_HW_FIFO_SIZE;
> >               bus->slv_wr_buf[ind] = value;
> >               bus->slv_wr_size++;
> > -             i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
> >       }
> >       return I2C_HW_FIFO_SIZE - ret;
> >  }
> > @@ -976,7 +974,6 @@ static void npcm_i2c_slave_xmit(struct npcm_i2c *bus, u16 nwrite,
> >       if (nwrite == 0)
> >               return;
> >
> > -     bus->state = I2C_OPER_STARTED;
> >       bus->operation = I2C_WRITE_OPER;
>
> This is definately a seperate change!
>

OK, we will move the last two to a separate patch. BTW, this change
appears in the title as well.

But now I'm not sure: if you already apply for-next patches [1:7], and
we change patch [8:10]
do we need to re-submit [1:7]?

> All the best!

Thanks, Wolfram, for your review!
Much appreciated

Tali
