Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC791D7C72
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 17:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgERPMn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 11:12:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:54646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727006AbgERPMn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 May 2020 11:12:43 -0400
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07E4A20829;
        Mon, 18 May 2020 15:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589814762;
        bh=dO9YjGF0kdoL59wVAf+rje4P49jqt2DfelCQOylyKm8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yNF+yfVAeFQMpLHtTEg/mBuUAIyi6eddO8njkr7cCuoDmnfKzKRN2bgSlfY8WGDPp
         NecNnyR7FDytdeZKU1SChLzssy1kO9KZBlqC62EWkBXTzRjC4tMv81NDjyXuK15yo7
         68vBCV5zLOgPlHOrZspfOCCfzYohvQ82fdSd+a2Q=
Received: by mail-ot1-f43.google.com with SMTP id h7so1341204otr.3;
        Mon, 18 May 2020 08:12:41 -0700 (PDT)
X-Gm-Message-State: AOAM532NXYa0g/eHLe7AhlPNtmG0v3xaPCzm2Kuljl7tNOzmkPGAGEcC
        2rKFHTRAlwEJ+DxlTv58JZqtqe8A/JMaMgCp5Q==
X-Google-Smtp-Source: ABdhPJyQRYI7STGbFM0dbDIo+LF/W1t5qFW6kvAtsbyNb2Q4a8f+z8rZVSClUUUZRpR5wmZ8DpKwvFijTFVBXXU61NU=
X-Received: by 2002:a9d:1441:: with SMTP id h59mr12778609oth.192.1589814761175;
 Mon, 18 May 2020 08:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200317093922.20785-1-lkundrak@v3.sk> <20200317093922.20785-26-lkundrak@v3.sk>
 <20200327194902.GA24914@bogus> <20200517192557.GE1695525@furthur.local>
In-Reply-To: <20200517192557.GE1695525@furthur.local>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 18 May 2020 09:12:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK9feRB6WtPY_-ebbW4AWAxDZG-kfpxnRyVCqX2hO=DgQ@mail.gmail.com>
Message-ID: <CAL_JsqK9feRB6WtPY_-ebbW4AWAxDZG-kfpxnRyVCqX2hO=DgQ@mail.gmail.com>
Subject: Re: [PATCH 25/28] dt-bindings: rtc: Convert sa1100-rtc to json-schema
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

On Sun, May 17, 2020 at 1:26 PM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> On Fri, Mar 27, 2020 at 01:49:02PM -0600, Rob Herring wrote:
> > On Tue, Mar 17, 2020 at 10:39:19AM +0100, Lubomir Rintel wrote:
> > > Convert the sa1100-rtc binding to DT schema format using json-schema.
> > >
> > > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > > ---
> > >  .../devicetree/bindings/rtc/sa1100-rtc.txt    | 17 ------
> > >  .../devicetree/bindings/rtc/sa1100-rtc.yaml   | 55 +++++++++++++++++++
> > >  2 files changed, 55 insertions(+), 17 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/rtc/sa1100-rtc.txt
> > >  create mode 100644 Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/rtc/sa1100-rtc.txt b/Documentation/devicetree/bindings/rtc/sa1100-rtc.txt
> > > deleted file mode 100644
> > > index 968ac820254bb..0000000000000
> > > --- a/Documentation/devicetree/bindings/rtc/sa1100-rtc.txt
> > > +++ /dev/null
> > > @@ -1,17 +0,0 @@
> > > -* Marvell Real Time Clock controller
> > > -
> > > -Required properties:
> > > -- compatible: should be "mrvl,sa1100-rtc"
> > > -- reg: physical base address of the controller and length of memory mapped
> > > -  region.
> > > -- interrupts: Should be two. The first interrupt number is the rtc alarm
> > > -  interrupt and the second interrupt number is the rtc hz interrupt.
> > > -- interrupt-names: Assign name of irq resource.
> > > -
> > > -Example:
> > > -   rtc: rtc@d4010000 {
> > > -           compatible = "mrvl,mmp-rtc";
> > > -           reg = <0xd4010000 0x1000>;
> > > -           interrupts = <5>, <6>;
> > > -           interrupt-names = "rtc 1Hz", "rtc alarm";
> > > -   };
> > > diff --git a/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml b/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
> > > new file mode 100644
> > > index 0000000000000..53a8b72df9f34
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
> > > @@ -0,0 +1,55 @@
> >
> > License
>
> The original file lacked one. Should I just go with GPL-2.0?

Yes, that is what files in the kernel with no license default to. Or
figure out the authors and get permission to dual-license.

Rob
