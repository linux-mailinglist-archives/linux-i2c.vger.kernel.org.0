Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CF42DBB04
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Dec 2020 07:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgLPGG7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Dec 2020 01:06:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbgLPGG7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Dec 2020 01:06:59 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB722C061793;
        Tue, 15 Dec 2020 22:06:18 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id j17so21325399ybt.9;
        Tue, 15 Dec 2020 22:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bQSBU3DldQmZhqs8BiiflDFptJcD7jZrmoWAbiLUJhU=;
        b=bLF8Zg/bSTck1Rd+5n691xW28veCVszy71v2IOmm9GH5VNg1dfDTm9OCbBpZFVHA4W
         69Yqq12T3JRZbfDz6OpYxXIwYkC4NmkDtSvqAN7Hjkv64SOp8L46V2/pir+zj82iLPZT
         qAcwwtT33M9OFI0pZzSA2mVoLf0TaxeXvtXrZUYKRvtL9l6PUAdm29bR8DpWocBY0dGQ
         YgSPzYkqZA75IkfE+uxo82DKz+ULOGI6vWifIJjknmxH7tQJS2WbWJLWXOfdP68BL4Rd
         jTvROBL5CiepbUY8CFor8xkEOfX8Z5FONKNHnOxw0FEWx6VTDFTVfLXc94mpt5cJViQX
         62Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bQSBU3DldQmZhqs8BiiflDFptJcD7jZrmoWAbiLUJhU=;
        b=p8n+4nLSohveKtIaU22FrVrhhOt1+UNXOHsf6maWw2hjZ/txTRXk5Irhlzl1obmzer
         kVjdmLO2i8TR2xGUrQ8sanjMrexPwBF3ISIusLpocURwxP9J+yYvCxY9FJxfVNxoass1
         1bC0puB35G95adkJyL8zP6hMuT8ZcIbFjrsY1IprPJSmp7LvkxzawoWztWrhfC2Tykq8
         HNFekp5ljhPTwyZ0IrU6Dndi9451Gr+dsRwdsRg3EBsqBkDTzsdNnZ0toc5FeXouV9NF
         7dB/2JSwxnc2I1RTsw4+mjC1R2eOPT+5FZ+DaNHFJjpFQJ2F4xg4WSsEXI+eX/4gqPd8
         xt1w==
X-Gm-Message-State: AOAM531/uS+Is9tdAYy4yHtCir8zikpNuRoBwg12E+uPXUQ3Q3S2TeYb
        3Eb/S5wxH1fknnVH+af0sTdETVXzbBfFHzYhTtE=
X-Google-Smtp-Source: ABdhPJwP+8IZQgQaJ80ndOw3XeyHnKwU0qnA27GXZdW4AXYA2almMdZEH9ilfdSzFgKArCUYPf2VEQkSv3iuCI6MrtI=
X-Received: by 2002:a25:be87:: with SMTP id i7mr46897305ybk.332.1608098778261;
 Tue, 15 Dec 2020 22:06:18 -0800 (PST)
MIME-Version: 1.0
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-8-git-send-email-yash.shah@sifive.com> <CAEUhbmURfwMYo6FTuL7TP7daSuhBOOpcZX-mfCxCTVS+QiaHqA@mail.gmail.com>
 <BY5PR13MB44539E6CDB009EFA6AB7CAFA82C50@BY5PR13MB4453.namprd13.prod.outlook.com>
In-Reply-To: <BY5PR13MB44539E6CDB009EFA6AB7CAFA82C50@BY5PR13MB4453.namprd13.prod.outlook.com>
From:   Bin Meng <bmeng.cn@gmail.com>
Date:   Wed, 16 Dec 2020 14:06:07 +0800
Message-ID: <CAEUhbmWrCpKraUpijggkiNXa40OAnN9YJF1iFWnrnrhJZN1joA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive
 FU740-C000 SoC
To:     Yash Shah <yash.shah@openfive.com>
Cc:     "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        Peter Korsgaard <peter@korsgaard.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yash,

On Wed, Dec 16, 2020 at 1:24 PM Yash Shah <yash.shah@openfive.com> wrote:
>
> > -----Original Message-----
> > From: Bin Meng <bmeng.cn@gmail.com>
> > Sent: 10 December 2020 19:05
> > To: Yash Shah <yash.shah@openfive.com>
> > Cc: linux-spi@vger.kernel.org; linux-serial@vger.kernel.org; linux-
> > pwm@vger.kernel.org; linux-i2c@vger.kernel.org; linux-kernel <linux-
> > kernel@vger.kernel.org>; linux-riscv <linux-riscv@lists.infradead.org>;
> > devicetree <devicetree@vger.kernel.org>; open list:GPIO SUBSYSTEM <linux-
> > gpio@vger.kernel.org>; broonie@kernel.org; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>; Albert Ou <aou@eecs.berkeley.edu>;
> > lee.jones@linaro.org; u.kleine-koenig@pengutronix.de; Thierry Reding
> > <thierry.reding@gmail.com>; andrew@lunn.ch; Peter Korsgaard
> > <peter@korsgaard.com>; Paul Walmsley ( Sifive)
> > <paul.walmsley@sifive.com>; Palmer Dabbelt <palmer@dabbelt.com>; Rob
> > Herring <robh+dt@kernel.org>; Bartosz Golaszewski
> > <bgolaszewski@baylibre.com>; Linus Walleij <linus.walleij@linaro.org>
> > Subject: Re: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive FU740-
> > C000 SoC
> >
> > [External Email] Do not click links or attachments unless you recognize the
> > sender and know the content is safe
> >
> > On Tue, Dec 8, 2020 at 3:06 PM Yash Shah <yash.shah@sifive.com> wrote:
> > >
> > > Add initial support for the SiFive FU540-C000 SoC. FU740-C000 is built
> >
> > FU740-C000 Soc
> >
> > > around the SiFIve U7 Core Complex and a TileLink interconnect.
> > >
> > > This file is expected to grow as more device drivers are added to the
> > > kernel.
> > >
> > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > > ---
> > >  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 293
> > > +++++++++++++++++++++++++++++
> > >  1 file changed, 293 insertions(+)
> > >  create mode 100644 arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > >
> > > diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > > b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > > new file mode 100644
> > > index 0000000..eeb4f8c3
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > > @@ -0,0 +1,293 @@
>
> ...
>
> > > +               plic0: interrupt-controller@c000000 {
> > > +                       #interrupt-cells = <1>;
> > > +                       #address-cells = <0>;
> > > +                       compatible = "sifive,fu540-c000-plic",
> > > + "sifive,plic-1.0.0";
> >
> > I don't see bindings updated for FU740 PLIC, like "sifive,fu740-c000-plic"?
>
> That's because it is not required. There won't be any difference in driver code for FU740 plic.

Are there any driver changes for the drivers that have an updated
fu640-c000-* bindings? I don't see them in the linux-riscv list.

>
> ...
>
> > > +               eth0: ethernet@10090000 {
> > > +                       compatible = "sifive,fu540-c000-gem";
> >
> > "sifive,fu740-c000-gem"?
> >
>
> Same reason as above.
>
> Thanks for your review.

Regards,
Bin
