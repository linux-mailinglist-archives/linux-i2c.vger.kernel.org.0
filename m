Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3C948EE3A
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 17:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243398AbiANQfQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 14 Jan 2022 11:35:16 -0500
Received: from mail-40136.proton.ch ([185.70.40.136]:16330 "EHLO
        mail-40136.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243394AbiANQfQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 11:35:16 -0500
X-Greylist: delayed 1149 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Jan 2022 11:35:15 EST
Date:   Fri, 14 Jan 2022 16:35:10 +0000
Authentication-Results: mail-4018.proton.ch; dkim=none
To:     conor.dooley@microchip.com
From:   conor dooley <mail@conchuod.ie>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, jassisinghbrar@gmail.com,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
        bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
        atishp@rivosinc.com
Reply-To: conor dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 14/15] riscv: dts: microchip: add new peripherals to icicle kit device tree
Message-ID: <6vH-XrwcUvrBsf_iYIhoEE2BQluly7BTbPn097cV0fh2zo4xKmjsmf8__RoEQWL4XWXOddP8K9kPwpsqbHHPTqhrZbpQw4pl7DXp88MlQqI=@conchuod.ie>
In-Reply-To: <20220114151727.2319915-15-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com> <20220114151727.2319915-15-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.0 required=10.0 tests=ALL_TRUSTED shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add new peripherals to the MPFS, and enable them in the Icicle kit
> device tree:
>
> 2x SPI, QSPI, 3x GPIO, 2x I2C, Real Time Counter, PCIE controller,
> USB host & system controller.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip/microchip-mpfs-icicle-kit.dts   |  53 ++++++
>  .../boot/dts/microchip/microchip-mpfs.dtsi    | 168 ++++++++++++++++++
>  2 files changed, 221 insertions(+)
>
realised i forgot to run checkpatch, will fix the trailing whitespace
