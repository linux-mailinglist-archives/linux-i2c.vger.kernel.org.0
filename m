Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1E72CC032
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 16:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbgLBO7J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 09:59:09 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:34174 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727415AbgLBO7J (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 09:59:09 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kkTaJ-009sny-Sv; Wed, 02 Dec 2020 15:58:23 +0100
Date:   Wed, 2 Dec 2020 15:58:23 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Yash Shah <yash.shah@sifive.com>
Cc:     linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        broonie@kernel.org, gregkh@linuxfoundation.org,
        aou@eecs.berkeley.edu, lee.jones@linaro.org,
        u.kleine-koenig@pengutronix.de, thierry.reding@gmail.com,
        peter@korsgaard.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
        robh+dt@kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, sachin.ghadi@sifive.com
Subject: Re: [PATCH 1/4] dt-bindings: riscv: Update DT binding docs to
 support SiFive FU740 SoC
Message-ID: <20201202145823.GC2324545@lunn.ch>
References: <1606896236-62780-1-git-send-email-yash.shah@sifive.com>
 <1606896236-62780-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606896236-62780-2-git-send-email-yash.shah@sifive.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> index 6b25a80..1966b2c 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> @@ -3,9 +3,11 @@ Device tree configuration for i2c-ocores
>  Required properties:
>  - compatible      : "opencores,i2c-ocores"
>                      "aeroflexgaisler,i2cmst"
> -                    "sifive,fu540-c000-i2c", "sifive,i2c0"
> +                    "sifive,<chip>-i2c", "sifive,i2c0"

Please make this a full list. At some point, this file will get turned
into yaml, at which point substitution like this will need
expanding. It is better to do that now.

     Andrew
