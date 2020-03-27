Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA50195ED2
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 20:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbgC0TaD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 15:30:03 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:42237 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgC0TaD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 15:30:03 -0400
Received: by mail-il1-f194.google.com with SMTP id f16so9852713ilj.9;
        Fri, 27 Mar 2020 12:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+6juMdOF3ml8+Ae5THAMDkYKsZSA6LWpaypcZCb56iM=;
        b=OqvAH8vt9xXb1IuAqhdnmQwHP7jEnye1A5ZQ8PHVjwpxtGkeV/841Nelp5HB08gT5Q
         8VZPRbX2u2Pf3Yx8orwcMwQHIbCA49FTcYfkPEhvcH2zeW2fEQ7aDSf4EufP4wRioPJ/
         IkfEiXvie6b4krztzXHU8nxo/2hpydM+INAVHbDiWhykss4Th04nWJOuuFUYsN24zCai
         3sV3sN+yyoEp0o2OOdLsD0/SJXn/exvqicfHZBqbGLbTB+IEnhF+Vy8tjtDn+5daOZLb
         YAN8qYt3Sr8Qfp3znPPKCJK6Q+MHYfkem8uL837vc6dbmC1Eio0E0PwinYhSHx9bQjMu
         B6Uw==
X-Gm-Message-State: ANhLgQ3iL35AHN2QLIwUd8lbGrujFZb0QDTDy2msMHX3PZo4/+nhJD/v
        I4FplbzeHfIoDliKIMfZsw==
X-Google-Smtp-Source: ADFU+vvcvzixXoT9nuU+25JCfDW/ewtABsf4WS3snntWAxPLhxgn9dzSKHh0huzUaaVDWcxFw7Rv9Q==
X-Received: by 2002:a92:8c45:: with SMTP id o66mr732857ild.236.1585337401543;
        Fri, 27 Mar 2020 12:30:01 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id j9sm2181862ilc.4.2020.03.27.12.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 12:30:00 -0700 (PDT)
Received: (nullmailer pid 1841 invoked by uid 1000);
        Fri, 27 Mar 2020 19:29:59 -0000
Date:   Fri, 27 Mar 2020 13:29:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lubomir Rintel <lkundrak@v3.sk>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
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
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-media@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
        linux-rtc@vger.kernel.org,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 21/28] dt-bindings: gpio: Convert mrvl-gpio to json-schema
Message-ID: <20200327192959.GB8577@bogus>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-22-lkundrak@v3.sk>
 <CACRpkdaEnODObC7emg2M7Ayn_JkeLuc3HpV4VhJcwaZ+=sDLcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaEnODObC7emg2M7Ayn_JkeLuc3HpV4VhJcwaZ+=sDLcg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 27, 2020 at 11:04:00AM +0100, Linus Walleij wrote:
> Hi Lubomir!
> 
> Excellent work! Just nitpicks:
> 
> On Tue, Mar 17, 2020 at 10:40 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> 
> > +++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
> > @@ -0,0 +1,173 @@
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/mrvl-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Marvell PXA GPIO controller
> 
> This binding is lacking a license. Please use the dual GPL+BSD license
> tag.

That is preferred, but should only be dual if you have rights on the old 
binding file or get relicensing permissions.

> 
> > +maintainers:
> > +  - devicetree@vger.kernel.org
> 
> I don't know if Robert Jarzmik is in on maintaining this, would you accept
> it Robert?
> 
> Yours,
> Linus Walleij
