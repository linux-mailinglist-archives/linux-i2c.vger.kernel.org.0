Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67567649EFC
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Dec 2022 13:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbiLLMli (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Dec 2022 07:41:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiLLMlh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Dec 2022 07:41:37 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9517D2C6;
        Mon, 12 Dec 2022 04:41:36 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id n20so27687429ejh.0;
        Mon, 12 Dec 2022 04:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZ1+FTz6THqoLC6T/CKvtdHItNt+Tzp/zkXabSBeUI4=;
        b=bWw1vqE1rEW7MBgaQ7GYtWIelGCZwH1cfjWYNpl0oSky8DxJLjOyQ8/cgzPmRKOmWJ
         PpUoaXYHLabKrny4l8sFlm/oQlr2PIC2FXJJeieubyN3t2EYIqFOBhHN0EPMl9tq7LHt
         zTbftbPsrtkZHVxkpfpXlhrncWFuDIZDjmvLVu787VVFlfFvAFcKG/FC9ArYh4wITq1f
         86+9XejMCiE2yeWP7PfuaUu7mY8FfKatWK73Xtq71E68JRtSF57yIGOwOFHx8cSs+gDt
         qngqx5Al5FNq14+YC6the+xDSQM/o/xBFZHdJHloktcXo8gesLJ57UY/aonQvhbtYeDV
         g6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZ1+FTz6THqoLC6T/CKvtdHItNt+Tzp/zkXabSBeUI4=;
        b=rl5fFxRLlrGeRd9ZkIczq9ljM7blBdvqmkuu5SeU6+hzk0zE9ngLrHgkb/CxFT4ECh
         tTF16cRgNY5x9+zXckAvig84FzVGTUyisaxX3dTYRN7q0lgdzSaPKgRioqyKnMOVNirm
         YVIe478zECgxCsgTDLfvTXj6mRGTnK8BVAAs2Ec022c+QwMnAtk+lgoUA2TI8ESIr1a/
         mmSQm37pUir+oblVbo/3YIMxuVeCgaxhJtwFa8EXt6AV2UrxeRahz4/1NmU+HgpH3EXy
         8XFVCsd3D4FYOUrKxzhxxRtYp/NR8VeyGT9sb3tYgTkkQiHnweCaDeF3YrF2FiDhnIau
         Z5ew==
X-Gm-Message-State: ANoB5placomki06w9OpnZOXpLaKz7SQ2U36CkMNM8ADkTKNZWojIYV+o
        /0TrrNRUWoEvOLmI0x3DM0ujp7DlSdJ8LOczeW8F9S5I5lw310aY
X-Google-Smtp-Source: AA0mqf6itySe4F146leiFtIFWms7m6ZRhzdtky15s88XZYz/wzWTvUVvQrdNGd9vq8Vlw7wH0jQTzpqd4iwN46UVeLQ=
X-Received: by 2002:a17:906:882:b0:7ad:e161:b026 with SMTP id
 n2-20020a170906088200b007ade161b026mr77134343eje.760.1670848895016; Mon, 12
 Dec 2022 04:41:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1670293176.git.zhoubinbin@loongson.cn> <e088e2ffaef1492adc09b7cdbde0afcea2eeb8b2.1670293176.git.zhoubinbin@loongson.cn>
 <Y49ei1fpEawXvGQB@smile.fi.intel.com> <7bc31b2d-6687-5823-6950-cdedb8105db5@loongson.cn>
 <Y5b4olYjynDuJekT@smile.fi.intel.com>
In-Reply-To: <Y5b4olYjynDuJekT@smile.fi.intel.com>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Mon, 12 Dec 2022 20:41:21 +0800
Message-ID: <CAMpQs4LQ-Z729nJ49i1FmseaWdELbYELJRjteJwEodFOGq8FeA@mail.gmail.com>
Subject: Re: [PATCH V5 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy:

On Mon, Dec 12, 2022 at 5:47 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Dec 08, 2022 at 04:55:39PM +0800, Binbin Zhou wrote:
> > =E5=9C=A8 2022/12/6 23:23, Andy Shevchenko =E5=86=99=E9=81=93:
> > > On Tue, Dec 06, 2022 at 11:16:56AM +0800, Binbin Zhou wrote:
>
> ...
>
> > > > +/*
> > > > + * The I2C controller has a fixed I2C bus frequency by default, bu=
t to
> > > > + * be compatible with more client devices, we can obtain the set I=
2C
> > > > + * bus frequency from ACPI or FDT.
> > > > + */
> > > > +static void ls2x_i2c_adjust_bus_speed(struct ls2x_i2c_priv *priv)
> > > > +{
> > > > + u16 val =3D 0x12c; /* Default value of I2C divider latch register=
 */
> > > Besides comment better to be placed on top of the commented line, the=
 value
> > > is better to have its own definition where you place the comment and =
elaborate
> > > what it means in practice (The clock frequency is changed?  Bus speed=
 is
> > > different?)
> >
> > Ok, I'll put this comment on a separate line.
> >
> > The LS2X I2C supports STANDARD_MODE and FAST_MODE, so the maximum bus
> > frequency is 400kHz.
> > "0x12c" is our empirical value after experimentation and represents 33K=
Hz.
> >
> > Also, I think the better way is:
> >
> > @@ -53,6 +53,15 @@
> >  #define LS2X_CTR_IEN           BIT(6) /* Enable i2c interrupt */
> >  #define LS2X_CTR_MST           BIT(5) /* 0: Slave mode 1: Master mode =
*/
> >
> > +/* The PCLK clock frequency input from the LPB bus */
> > +#define LS2X_I2C_PCLK_FREQ     (50 * HZ_PER_MHZ)
> > +/*
> > + * The LS2X I2C controller supports standard mode and fast mode,
> > + * so the maximum bus frequency is 400kHz.
> > + * The '33KHz' is our empirical value after experimentation.
> > + */
> > +#define LS2X_I2C_FREQ_STD      (33 * HZ_PER_KHZ)
> > +
> >  struct ls2x_i2c_priv {
> >         struct i2c_adapter      adapter;
> >         struct device           *dev;
> > @@ -231,17 +240,19 @@ static irqreturn_t ls2x_i2c_irq_handler(int this_=
irq,
> > void *dev_id)
> >   */
> >  static void ls2x_i2c_adjust_bus_speed(struct ls2x_i2c_priv *priv)
> >  {
> > -       u16 val =3D 0x12c; /* Default value of I2C divider latch regist=
er */
> >         struct i2c_timings *t =3D &priv->i2c_t;
> >         u32 acpi_speed =3D i2c_acpi_find_bus_speed(priv->dev);
> >
> >         i2c_parse_fw_timings(priv->dev, t, false);
> >
> >         if (acpi_speed || t->bus_freq_hz)
> > -               val =3D 10 * HZ_PER_MHZ / max(t->bus_freq_hz, acpi_spee=
d) - 1;
> > +               t->bus_freq_hz =3D max(t->bus_freq_hz, acpi_speed);
> > +       else
> > +               t->bus_freq_hz =3D LS2X_I2C_FREQ_STD;
> >
> > -       /* Set LS2X I2C frequency */
> > -       writel(val, priv->base + I2C_LS2X_PRER_LO);
> > +       /* Calculate and set LS2X I2C frequency */
>
> > +       writel((LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1),
>
> Fine with me, but drop unneeded parentheses.
>
> > +              priv->base + I2C_LS2X_PRER_LO);
> >  }
>
> > > > + struct i2c_timings *t =3D &priv->i2c_t;
> > > > + u32 acpi_speed =3D i2c_acpi_find_bus_speed(priv->dev);
> > > > +
> > > > + i2c_parse_fw_timings(priv->dev, t, false);
> > > > +
> > > > + if (acpi_speed || t->bus_freq_hz)
> > > > +         val =3D 10 * HZ_PER_MHZ / max(t->bus_freq_hz, acpi_speed)=
 - 1;
> > > > +
> > > > + /* Set LS2X I2C frequency */
> > > > + writel(val, priv->base + I2C_LS2X_PRER_LO);
> > > > +}
>
> ...
>
> > > > + r =3D devm_request_irq(dev, irq, ls2x_i2c_irq_handler,
> > > > +                      IRQF_SHARED, "ls2x-i2c", priv);
> > > > + if (r < 0)
> > > > +         return dev_err_probe(dev, r, "Unable to request irq %d\n"=
, irq);
> > > You requested IRQ without filling all data structures. Is it fine? Ha=
ve you
> > > checked that with CONFIG_DEBUG_SHIRQ being enabled?
> >
> > Sorry, I don't quite understand what you mean by "without filling all d=
ata
> > structures", I need call ls2x_i2c_reginit(priv) before it ?
>
> When you register an IRQ handler (which is that call) it needs to be prep=
ared
> to handle interrupt immediately. Which means that your data structures ha=
s to
> be filled properly. If you can guarantee that with the current code, fine=
 then.

Emm. If so, I think it might be safer to put ls2x_i2c_reginit() in
front of it, since the bus frequency needs to be set correctly.

>
> > I see that other i2c drivers request interrupts at about the same time =
as I
> > do.
> >
> > I tested it with CONFIG_DEBUG_SHIRQ and no exceptions were reported.
>
> Good. And you removed and reinserted module?
>
> At least this helps to detect some of the potential issues.

Yes, all of these seem normal.

>
> ...
>
> > > > + r =3D devm_i2c_add_adapter(dev, adap);
> > > > + if (r)
> > > > +         return dev_err_probe(dev, r, "Failure adding adapter\n");
> > > > +
> > > > + return 0;
> > > > +}
> > > Looking at the above...
> > >
> > > > +static int ls2x_i2c_remove(struct platform_device *pdev)
> > > > +{
> > > > + struct ls2x_i2c_priv *priv =3D platform_get_drvdata(pdev);
> > > > +
> > > > + i2c_del_adapter(&priv->adapter);
> > > ...are you sure this is correct?
> >
> > When we use devm_i2c_add_adapter(), the adapter will be auto deleted on
> > driver detach.
> >
> > So I just drop the ls2x_i2c_remove() ?
>
> Correct.
>
> > > > + return 0;
> > > > +}
>
> ...
>
> > > > +static int ls2x_i2c_suspend(struct device *dev)
> > > > +{
> > > > + struct ls2x_i2c_priv *priv =3D dev_get_drvdata(dev);
> > > > + priv->suspended =3D 1;
> > > No protection needed?
.> >
> > Actually this variable is not used elsewhere, maybe it is useless, I wi=
ll
> > try to remove it and add some necessary actions in the suspend/rusume
> > callbacks, such as disable i2c interrupts, to ensure integrity.
>
> Is your interrupt a wake source? It might be that you will need a special
> handling of it.

No. It isn't a wake source.
I think it is enough to clear the interrupt enable bit in the control regis=
ter.
As follows:
writeb(readb(priv->base + I2C_LS2X_CTR) & ~LS2X_CTR_IEN,
               priv->base + I2C_LS2X_CTR);

Thanks.
Binbin


>
> > > > + return 0;
> > > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
