Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6232855C8
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Oct 2020 03:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbgJGBE6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Oct 2020 21:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbgJGBE5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Oct 2020 21:04:57 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05310C061755;
        Tue,  6 Oct 2020 18:04:57 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f19so347028pfj.11;
        Tue, 06 Oct 2020 18:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0/bWrGoCkUT1XKG15S3LcPCeuj/9H6SulVmeatRXh2o=;
        b=o3Pwy5wYAD2KjHFxqx8zJn29Vs5mbvXSBjNxI6P7OabTpsU/U0SGpYd4FsvkK/Ndjy
         o6haFaQLhrlga1BZAonVWdmnYb32RwDlKDv1iNZSfD0mkYhL6AlLSFycnS+oYFh7ZUp1
         TkX5mqfIN4mnxWvwmM0DfqKMDy+og8IZ+jNqBte63Si7LyqSrYcSS5VQLfQgB80bmtjl
         SLVjNURG8b+QRtDeh3cy+5wKhP+/ucXDk7OVxpSlq1MvLPkb9wEBt0slTTHRiZnkT43r
         0Da6jEuUUaW5qy0DOhRMGh0Fme25JQoAZtM8rFDZY+jZY5w1aTzbtncjcS61sVCE0zAC
         N0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0/bWrGoCkUT1XKG15S3LcPCeuj/9H6SulVmeatRXh2o=;
        b=a1G6fi1EodDtoVqkE/ZT2MnTfw0f2v/KMbVKBUpDm+H0nyJo6IMNpfa4xf0hApNsX1
         aGWNwS08gSEgXttXhYrR42K4tTGJd/VuXoRBbLtVhrewU6jloBUPZJZ+1uwelYC2ethb
         zzK2ZRdBzJKbY3EdHRSJlRr3P7YO16rQEJi1QXF0L3RuLxdbXJAmBSKrTnEX+kF1R3zq
         z2RCdow+vBfYQYCIbnH4sHRbJNIYS3yhQbJroWbyCubaxyea5SeuQ+ov/JzW7JQSzNz/
         7atR/dTqzRirDFdE2VQDvJLmRow1iJXBHRBTBahZA2V0WcFIBd807CpanfCMKmXgO8Zx
         sWbg==
X-Gm-Message-State: AOAM530ox5GdVqIrBjAmv6bpsb1PtVtM9IjCvT623EvKyVDR+nZwbeoN
        +xQBnXXcJSkVO2ckoaxGuTz9orqvXvpUGg==
X-Google-Smtp-Source: ABdhPJwHBE/6svDofq3JI1Nvl9AaFlg1oX0F7Zhinc7Yx4XbSqxrhmfr8wUc0v2ZFV5xqE5jZ9MdIA==
X-Received: by 2002:aa7:9e4a:0:b029:152:54d1:bffa with SMTP id z10-20020aa79e4a0000b029015254d1bffamr663621pfq.6.1602032696538;
        Tue, 06 Oct 2020 18:04:56 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id o62sm458923pfb.172.2020.10.06.18.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 18:04:55 -0700 (PDT)
Date:   Tue, 6 Oct 2020 18:04:49 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andrew Lunn <andrew@lunn.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, dmaengine@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jens Axboe <axboe@kernel.dk>,
        Jonathan Cameron <jic23@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Richard Weinberger <richard@nod.at>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
Message-ID: <20201007010449.GQ1009802@dtor-ws>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-5-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 05, 2020 at 01:38:30PM -0500, Rob Herring wrote:
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

For input:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry
