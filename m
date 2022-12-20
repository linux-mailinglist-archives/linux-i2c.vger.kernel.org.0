Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E67D651FE5
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 12:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbiLTLrl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 06:47:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiLTLrk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 06:47:40 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F349B15A2C;
        Tue, 20 Dec 2022 03:47:38 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id s5so17047120edc.12;
        Tue, 20 Dec 2022 03:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ANkEK2a22lW9dvnfGLj43UaNRf7fTpTnz2/IWWrYDOs=;
        b=KVCjN75cRfFGrEPvEcfVZIGGUOsWCkCb2AGrSnmF8oJivAG5eTgz0asihcnf4PSQwn
         VDisB7cx9lvP7fPzIdIbB2Cec7j5Gm+dWFsVhyrF1mz4o6TlpSSoUml/Vu6X3QWXzk+e
         9Z/2VbplFdrZehsUhiVr4u7sQEAhLA7IKP+jxEwG2LAOzbztYzB47VQtv8g7LMFaAYBi
         9z2W851SR5i1JjpBj+I9Xhh4yGlOcK6hlQOfCAywaF2qm/IztMIGoed8JW2c8MG+Anba
         zFYlp2QpR/7J22wHq/2DWn5WAsqzNbBWATLqcWftVq4WPBdqkslHUMQ9EAGjJDUUL7b/
         vNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANkEK2a22lW9dvnfGLj43UaNRf7fTpTnz2/IWWrYDOs=;
        b=k8scTNU6TIfPGDEa5IEiNU7GuGyXQXCdpH0f5agiIfHJLQSiBf3/1/EXLOxK9Jmf2j
         OaBazFwpBsfXP7tWO0/MmnNyISB+XgK4Vhe4C1i0pbILjnjjkH9Uk+SM+RurklZD26Dk
         aT5HXLZxNfeYHv4RaQieYg1zv83bKjj2Rt0DwzfRVd5YJuQsStyYVgWbOclsLITsU7/R
         S+03jBFPjwub8AOGc3ErEEPWahv27w2O+PAxVvoaiRfEoHNgxPgKgZrs59WSTIXUEKYD
         +o4lC9nn30HH/suvhEfnhpfUL5JMJQEZjyJ1s41BQC+Rbbprso83aEuZBtHt88LevluU
         kddg==
X-Gm-Message-State: ANoB5pkS9NrcY14Dsi29H2JSsnYACxkmanCV597OpbLcDfBNBw1lq4FZ
        CUaKb8O63/7v3Gt+c1p2PrQojn9vZL+EMVYXSCMm+WopEp2iGQ==
X-Google-Smtp-Source: AA0mqf724aq1bzthh+2VkOkrFAK2VplBWViFLKo/lMUM/ifaqHW0JTdfQ8WYHiBqAmZXKuz8pzmsUF/HBaHH+/+G23Q=
X-Received: by 2002:aa7:d34b:0:b0:46a:914c:9bc9 with SMTP id
 m11-20020aa7d34b000000b0046a914c9bc9mr59925861edr.418.1671536857368; Tue, 20
 Dec 2022 03:47:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1671451604.git.zhoubinbin@loongson.cn> <d44eb07245020431f98fd08e0c05b6926fb31b24.1671451604.git.zhoubinbin@loongson.cn>
 <Y6BhRsPAU30Dqbdv@smile.fi.intel.com>
In-Reply-To: <Y6BhRsPAU30Dqbdv@smile.fi.intel.com>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Tue, 20 Dec 2022 19:47:25 +0800
Message-ID: <CAMpQs4KcskSZdezVdNk9Q8UFYA3rFJm8CguiTRLdmffqkZ9FCg@mail.gmail.com>
Subject: Re: [PATCH V7 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
To:     Andy Shevchenko <andy@kernel.org>
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

On Mon, Dec 19, 2022 at 9:04 PM Andy Shevchenko <andy@kernel.org> wrote:
>
> On Mon, Dec 19, 2022 at 08:28:33PM +0800, Binbin Zhou wrote:
> > This I2C module is integrated into the Loongson-2K SoCs and Loongson
> > LS7A bridge chip.
>
> Almost there, see my comments below (note, you have ~1w of time before this
> can be applied anyway, so take you time for carefully addressing comments,
> (re-)testing, etc.).
>
> ...
>
> > @@ -888,6 +888,17 @@ config I2C_OWL
> >         Say Y here if you want to use the I2C bus controller on
> >         the Actions Semiconductor Owl SoC's.
> >
> > +config I2C_LS2X
>
> I believe in Latin alphabet L goes before O...

Sorry, I will fix it.

>
> > +     tristate "Loongson LS2X I2C adapter"
> > +     depends on MACH_LOONGSON64 || COMPILE_TEST
> > +     help
> > +       If you say yes to this option, support will be included for the
> > +       I2C interface on the Loongson-2K SoCs and Loongson LS7A bridge
> > +       chip.
> > +
> > +       This driver can also be built as a module. If so, the module
> > +       will be called i2c-ls2x.
> > +
> >  config I2C_PASEMI
> >       tristate "PA Semi SMBus interface"
> >       depends on PPC_PASEMI && PCI
>
> ...
>
> >  obj-$(CONFIG_I2C_MXS)                += i2c-mxs.o
> >  obj-$(CONFIG_I2C_NOMADIK)    += i2c-nomadik.o
> >  obj-$(CONFIG_I2C_NPCM)               += i2c-npcm7xx.o
> > +obj-$(CONFIG_I2C_LS2X)               += i2c-ls2x.o
>
> ...and even before n and m.
>
> >  obj-$(CONFIG_I2C_OCORES)     += i2c-ocores.o
> >  obj-$(CONFIG_I2C_OMAP)               += i2c-omap.o
> >  obj-$(CONFIG_I2C_OWL)                += i2c-owl.o
>
> ...
>
> > +static int ls2x_i2c_xfer_one(struct i2c_adapter *adap,
> > +                          struct i2c_msg *msg, bool stop)
> > +{
> > +     int ret;
> > +     bool is_read = msg->flags & I2C_M_RD;
> > +     struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
> > +
> > +     /* Contains steps to send start condition and address */
> > +     ret = ls2x_i2c_start(adap, msg);
> > +     if (!ret) {
> > +             if (is_read)
> > +                     ret = ls2x_i2c_rx(adap, msg->buf, msg->len);
> > +             else
> > +                     ret = ls2x_i2c_tx(adap, msg->buf, msg->len);
>
> > +             if (!ret && stop)
> > +                     ret = ls2x_i2c_stop(adap);
>
> So, we will send stop here...
>
> > +     }
>
> > +     if (ret == -ENXIO)
> > +             ls2x_i2c_stop(adap);
>
> ...and if it fails, we send it again here. Is it okay?

First of all, I think the logic here is fine:
In the first case, stop is called when the last msg is transmitted successfully;
In the second case, stop is called when there is a NOACK during the
transmission;
In the third case, init is called when other errors occur during the
transmission, such as TIMEOUT.

The key point is that the current implementation of the stop function
is probably imperfect, it directly ignores the NOACK. The more
reasonable method would be to judge by LS2X_SR_BUSY(bus busy state).
The basic idea: if the i2c bus is detected as idle within the timeout
range of the stop command issued, the stop command is considered
successful, otherwise -ETIMEDOUT is returned.

As follows:
 static int ls2x_i2c_stop(struct i2c_adapter *adap)
 {
-       int ret = ls2x_i2c_send_byte(adap, LS2X_CR_STOP);
+       u8 value;
+       struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);

-       return (ret == -ENXIO) ? 0 : ret;
+       writeb(LS2X_CR_STOP, priv->base + I2C_LS2X_CR);
+       return readl_poll_timeout(priv->base + I2C_LS2X_SR,
+                                 value, !(value & LS2X_SR_BUSY),
+                                 100, jiffies_to_usecs(adap->timeout));
 }

Now, in the case you mentioned above, the last msg transmission is
completed and the stop command is sent. If the stop command fails, it
will only return -ETIMEDOUT and call ls2x_i2c_init().

Of course, I will use tools like i2c-tools to do more tests.

Thanks for the detailed review.

Binbin

>
> > +     else if (ret < 0)
> > +             ls2x_i2c_init(priv);
> > +
> > +     return ret;
> > +}
>
> ...
>
> > +             ret = ls2x_i2c_xfer_one(adap, msg, msg == (emsg - 1));
>
> Too many parentheses, isn't it?
>
> > +             if (ret)
> > +                     return ret;
>
> ...
>
> > +     r = devm_request_irq(dev, irq, ls2x_i2c_isr, IRQF_SHARED, "ls2x-i2c",
> > +                          priv);
>
> Everywhere else you use 'ret', why is 'r' here?


>
> > +     if (r < 0)
> > +             return dev_err_probe(dev, r, "Unable to request irq %d\n", irq);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
