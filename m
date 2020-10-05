Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02362840DF
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Oct 2020 22:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729752AbgJEUdM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Oct 2020 16:33:12 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38591 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727262AbgJEUdL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Oct 2020 16:33:11 -0400
Received: by mail-wr1-f66.google.com with SMTP id n18so3235090wrs.5;
        Mon, 05 Oct 2020 13:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ARrZ6TB7yXMqpP/+XXhswWetXRSqYRU5CXxzWSIwqA0=;
        b=RnCaTAeLda2g7G5fRy5G6tkS7At6V0s/RegwR9VguJioedEtQIJdw6BNLKEK/gUGRD
         AkEB4uPGf3i+LyEsLWBdPb5/DcD/BL7glr7/Kqr+DhNf5J4HVWo+7n/mUse3ZY7S8gLr
         SHGy1GGZG4l1bH3MKOMzvgNvPk3l3MBNeR7Y1bb6OaZSo1FyocBeFTq/+g75HfHcPlAJ
         YK98UWQ/irYlWEDTjRo3FB2draI8v8Bup47C8o/AQoRtLLLd80xga6C8A5u2LgihGqQU
         qGI2giLr060foyPTuSrxFAiFXpeO56x9qKG9Y0Sv744sQiomDaBHzfaDshfnctRB0WHO
         JAyA==
X-Gm-Message-State: AOAM530bXKyLIBGo4JH1pO7bUr+EogsTQovm/K5mNjfX4q1FlBuPhS96
        KJez1DDXkXTZaW5NrlElQGo=
X-Google-Smtp-Source: ABdhPJweyRYGmXLqO/tcc/k2HRzuAg/v1oLgLOtbvTUusAAWSCQYB/uOgoLBn7Xz9zdrfu5geKiRqw==
X-Received: by 2002:a5d:4682:: with SMTP id u2mr1245871wrq.254.1601929986334;
        Mon, 05 Oct 2020 13:33:06 -0700 (PDT)
Received: from kozik-lap ([194.230.155.194])
        by smtp.googlemail.com with ESMTPSA id c14sm1265048wrm.64.2020.10.05.13.33.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Oct 2020 13:33:05 -0700 (PDT)
Date:   Mon, 5 Oct 2020 22:33:00 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andrew Lunn <andrew@lunn.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, dmaengine@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jens Axboe <axboe@kernel.dk>,
        Jonathan Cameron <jic23@kernel.org>,
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
Subject: Re: [PATCH 2/4] dt-bindings: Use 'additionalProperties' instead of
 'unevaluatedProperties'
Message-ID: <20201005203300.GB23742@kozik-lap>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-3-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201005183830.486085-3-robh@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 05, 2020 at 01:38:28PM -0500, Rob Herring wrote:
> In cases where we don't reference another schema, 'additionalProperties'
> can be used instead. This is preferred for now as 'unevaluatedProperties'
> support isn't implemented yet.
> 
> In a few cases, this means adding some missing property definitions of
> which most are for SPI bus properties. 'unevaluatedProperties' is not going
> to work for the SPI bus properties anyways as they are evaluated from the
> parent node, not the SPI child node.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
