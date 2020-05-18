Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC05B1D7CAD
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 17:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgERPU0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 11:20:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:57988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727063AbgERPU0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 May 2020 11:20:26 -0400
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1BE2F20709;
        Mon, 18 May 2020 15:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589815225;
        bh=tSws2kjDhXaAFNWN68OWyjCdK+4AcxFyLFLzGGQxyNU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kZz+KHtEmx4LXcyztl4rmU2EAXazJQFb7E8mHywQvhoHn1/5wVi5TmH9zFMDLS4W/
         MiKmt+x10Jms6pej2MZzFDOjkYSYEcoSMNblOS5IKOq3bv9ecuPNIZRnnJBSu7GCXv
         mI5P/vnVxOyhBlbFI4Ezj8NA2S5v8JeiuE3LjRFQ=
Received: by mail-ot1-f42.google.com with SMTP id x22so4751556otq.4;
        Mon, 18 May 2020 08:20:25 -0700 (PDT)
X-Gm-Message-State: AOAM532AXu2+ODHrVl/USjh57gFEjBKY3Xj6/SQBQi8niO4Abx/WAKpk
        JP4+SsdoEdntaT89YyW0M+vGxKJxzww1f7hjMQ==
X-Google-Smtp-Source: ABdhPJzAqhRdGybXpwpC/ZOQ7F9CQ8eOmJxxxyRMv1ENHmR6X3dhaIAFrOd3PP9Ko0YHK3CdCi+5NlS47TBiLzZklxs=
X-Received: by 2002:a9d:5c8a:: with SMTP id a10mr8596315oti.129.1589815224353;
 Mon, 18 May 2020 08:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200317093922.20785-1-lkundrak@v3.sk> <20200317093922.20785-29-lkundrak@v3.sk>
 <20200327195520.GA2235@bogus> <20200517193451.GG1695525@furthur.local>
In-Reply-To: <20200517193451.GG1695525@furthur.local>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 18 May 2020 09:20:13 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+oQSk=xGBiQ73SyGggo=gBOmH6xvTv1QBAUfbnt42E0A@mail.gmail.com>
Message-ID: <CAL_Jsq+oQSk=xGBiQ73SyGggo=gBOmH6xvTv1QBAUfbnt42E0A@mail.gmail.com>
Subject: Re: [PATCH 28/28] dt-bindings: usb: Convert ehci-mv to json-schema
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, May 17, 2020 at 1:34 PM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> On Fri, Mar 27, 2020 at 01:55:20PM -0600, Rob Herring wrote:
> > On Tue, Mar 17, 2020 at 10:39:22AM +0100, Lubomir Rintel wrote:
> > > A straightforward conversion of the ehci-mv binding to DT schema format
> > > using json-schema.
> > >
> > > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > > ---
> > >  .../devicetree/bindings/usb/ehci-mv.txt       | 23 -------
> > >  .../bindings/usb/marvell,pxau2o-ehci.yaml     | 60 +++++++++++++++++++
> > >  2 files changed, 60 insertions(+), 23 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/usb/ehci-mv.txt
> > >  create mode 100644 Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/ehci-mv.txt b/Documentation/devicetree/bindings/usb/ehci-mv.txt
> > > deleted file mode 100644
> > > index 335589895763e..0000000000000
> > > --- a/Documentation/devicetree/bindings/usb/ehci-mv.txt
> > > +++ /dev/null
> > > @@ -1,23 +0,0 @@
> > > -* Marvell PXA/MMP EHCI controller.
> > > -
> > > -Required properties:
> > > -
> > > -- compatible: must be "marvell,pxau2o-ehci"
> > > -- reg: physical base addresses of the controller and length of memory mapped region
> > > -- interrupts: one EHCI controller interrupt should be described here
> > > -- clocks: phandle list of usb clocks
> > > -- clock-names: should be "USBCLK"
> > > -- phys: phandle for the PHY device
> > > -- phy-names: should be "usb"
> > > -
> > > -Example:
> > > -
> > > -   ehci0: usb-ehci@d4208000 {
> > > -           compatible = "marvell,pxau2o-ehci";
> > > -           reg = <0xd4208000 0x200>;
> > > -           interrupts = <44>;
> > > -           clocks = <&soc_clocks MMP2_CLK_USB>;
> > > -           clock-names = "USBCLK";
> > > -           phys = <&usb_otg_phy>;
> > > -           phy-names = "usb";
> > > -   };
> > > diff --git a/Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml b/Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml
> > > new file mode 100644
> > > index 0000000000000..189025ef1e92e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml
> > > @@ -0,0 +1,60 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> >
> > Same license comment.
>
> I wrote that binding document and chose that license.

Okay, but please make it GPL-2.0-only instead of or-later. If everyone
was attentive to licensing picking their own variations would be fine,
but they aren't and just copy-n-paste. So there's 2 choices
GPL-2.0-only (for converted bindings) or (GPL-2.0-only OR
BSD-2-Clause) for new or re-licensed bindings.

Rob
