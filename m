Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB0C48EDE8
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 17:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243267AbiANQS4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 14 Jan 2022 11:18:56 -0500
Received: from mail-0201.mail-europe.com ([51.77.79.158]:36237 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243243AbiANQSz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 11:18:55 -0500
Date:   Fri, 14 Jan 2022 16:18:50 +0000
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
Subject: Re: [PATCH v3 01/15] dt-bindings: soc/microchip: update syscontroller compatibles
Message-ID: <nK7Z7oZFnoE0yhMjColrEPJvSFc7SpHv54Ftu3PJzQjpLA0s1F0Rwa3P5qEQrcFhJVbcUvY3TOFppyaIAS9QX09qg5nPMiilhvOO_W0fmHQ=@conchuod.ie>
In-Reply-To: <20220114151727.2319915-2-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com> <20220114151727.2319915-2-conor.dooley@microchip.com>
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
> The Polarfire SoC is currently using two different compatible string
> prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
> its system controller in order to match the compatible string used in
> the soc binding and device tree
>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  ...larfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} | 6 +++---
>  ...s-controller.yaml => microchip,mpfs-sys-controller.yaml} | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
>  rename Documentation/devicetree/bindings/soc/microchip/{microchip,polarfire-soc-sys-controller.yaml => microchip,mpfs-sys-controller.yaml} (75%)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> similarity index 82%
> rename from Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> rename to Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> index bbb173ea483c..9251c2218c68 100644
> --- a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/mailbox/microchip,polarfire-soc-mailbox.yaml#"
> +$id: "http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#"
>  $schema: "http://devicetree.org/meta-schemas/core.yaml#"
>
>  title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) mailbox controller
> @@ -11,7 +11,7 @@ maintainers:
>
>  properties:
>    compatible:
> -    const: microchip,polarfire-soc-mailbox
> +    const: microchip,mpfs-mailbox
>
>    reg:
>      items:
> @@ -38,7 +38,7 @@ examples:
>        #address-cells = <2>;
>        #size-cells = <2>;
>        mbox: mailbox@37020000 {
> -        compatible = "microchip,polarfire-soc-mailbox";
> +        compatible = "mpfs-mailbox";

Example is wrong, should read "microchip,mpfs-mailbox".

Will resubmit Monday.

>          reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318c 0x0 0x40>;
>          interrupt-parent = <&L1>;
>          interrupts = <96>;

