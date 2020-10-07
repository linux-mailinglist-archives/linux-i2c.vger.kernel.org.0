Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEC0B2855C2
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Oct 2020 03:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgJGBDS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Oct 2020 21:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbgJGBDR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Oct 2020 21:03:17 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4F65C061755;
        Tue,  6 Oct 2020 18:03:15 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d23so146167pll.7;
        Tue, 06 Oct 2020 18:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FbVt6UIsanorUvecNc8pgO4I7nA5/YzrR4KBsZs3/tw=;
        b=rJLKmtpwxzsaHKtX12nq3eP9neu2dOXEPi6LomqB2knE6KHEDjpS2vUrKJtGSZmd01
         7ezWLLISEJuqEQ8aBgOjVvVwuIROWJaVvqWMDhdkIrMnEJj3xWoT+mLh9Gs8gEuP17Q2
         UgfknJPVfYtwgcFCoBnLf1OmUFSxA0fdjd+qay5y6bkYLt8ainoMJawHK24rtd7lPeI2
         jVsq0CkG7qufIYkkx+FdQj1K8q292mstggL5gEg1P6qasdKVPWKLR/DK34HZkI0mADY7
         HUlcFEZ59O0+agAIIrpY+D6Sh+41M2ydy4oYO2vKHgH/8RKm2d5YK6721Lon3s9UNXTV
         sAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FbVt6UIsanorUvecNc8pgO4I7nA5/YzrR4KBsZs3/tw=;
        b=mLHdeMJ96LIMGCmXnpYzThEi5CTZxZfd0BaTCBO0+uplXdqTwG/kbAS1Setx++HJ30
         JsnmwNFFGHMpbFpG5sdEcLEInQtY8uw0TZbSNjtqFTrG8pctr9tSWzBVVHBKSLDTLEAa
         WR/EVHw5LU9pMBHt0h/U0th7AtMW5y28uTUjf3kfFSIGRwUM4dfPl1Bcb6SPMBgmmS+/
         V4atMQpOe5KdzkC0wnlEZcAqSSBx4GKYOkpuhIHNcG7K/4hWONIXgiqGwZYZ1EMj6WY2
         VS4LHGozwvpyyqBeUtXvjgydgAZCtF88iEQ1Dw1O5kHpf18EZu3S+iyCR1Jq2QVbMN/Y
         +Kkg==
X-Gm-Message-State: AOAM530Myx9cWc+xiUcCDZVsM+vUEDPC2eTRsslIpCXvGufMpfCX0bH7
        K6LIp1PVfuEBa7xC4iBkVU9yU2XD1EvDMw==
X-Google-Smtp-Source: ABdhPJzVLf6DlrNk5/q9fRno4e12My/InOM1G44QmO8+GKR2G8WgtPD5wnjL1TK4h+y4iW9ZX7bL0Q==
X-Received: by 2002:a17:90b:692:: with SMTP id m18mr667588pjz.182.1602032595239;
        Tue, 06 Oct 2020 18:03:15 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id fa2sm213768pjb.51.2020.10.06.18.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 18:03:14 -0700 (PDT)
Date:   Tue, 6 Oct 2020 18:03:08 -0700
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
Subject: Re: [PATCH 1/4] dt-bindings: Add missing 'unevaluatedProperties'
Message-ID: <20201007010308.GP1009802@dtor-ws>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005183830.486085-2-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 05, 2020 at 01:38:27PM -0500, Rob Herring wrote:
> This doesn't yet do anything in the tools, but make it explicit so we can
> check either 'unevaluatedProperties' or 'additionalProperties' is present
> in schemas.
> 
> 'unevaluatedProperties' is appropriate when including another schema (via
> '$ref') and all possible properties and/or child nodes are not
> explicitly listed in the schema with the '$ref'.
> 
> This is in preparation to add a meta-schema to check for missing
> 'unevaluatedProperties' or 'additionalProperties'. This has been a
> constant source of review issues.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

For input:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry
