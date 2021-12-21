Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2513847C9DB
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 00:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237769AbhLUXux convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 21 Dec 2021 18:50:53 -0500
Received: from mail-4022.proton.ch ([185.70.40.22]:32844 "EHLO
        mail-4022.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237244AbhLUXux (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Dec 2021 18:50:53 -0500
Date:   Tue, 21 Dec 2021 23:50:47 +0000
Authentication-Results: mail-4018.proton.ch; dkim=none
To:     Rob Herring <robh@kernel.org>
From:   conor dooley <mail@conchuod.ie>
Cc:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jassisinghbrar@gmail.com,
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
        atish.patra@wdc.com
Reply-To: conor dooley <mail@conchuod.ie>
Subject: Re: [PATCH v2 03/17] dt-bindings: soc/microchip: make systemcontroller a mfd
Message-ID: <YfGEPBe6qV6ieFoD_Xk-rEkBwvyWlVDCxk1PNycMfHsRYK1zMpawiDI25G1EZorczGJGj8e-epWgPs_UB8_-DP4keo1ivgfrLOXJNliFRxE=@conchuod.ie>
In-Reply-To: <YcIVFZSqt/JSuk3J@robh.at.kernel.org>
References: <20211217093325.30612-1-conor.dooley@microchip.com> <20211217093325.30612-4-conor.dooley@microchip.com> <YcIVFZSqt/JSuk3J@robh.at.kernel.org>
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


On Tuesday, December 21st, 2021 at 17:55, Rob Herring <robh@kernel.org> wrote:

>On Fri, Dec 17, 2021 at 09:33:11AM +0000, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Make the system controller on the Polarfire SoC
>> a "simple,mfd" so that the services can be child
>> nodes of the system controller node.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../microchip,mpfs-sys-controller.yaml        | 33 +++++++++++++++++--
>>  1 file changed, 30 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/>Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>> index f699772fedf3..014cb44b8f31 100644
>> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>> @@ -13,13 +13,34 @@ description: |
>>    The PolarFire SoC system controller is communicated with via a mailbox.
>>    This document describes the bindings for the client portion of that mailbox.
>>
>> -
>>  properties:
>>    mboxes:
>>      maxItems: 1
>>
>>    compatible:
>> -    const: microchip,mpfs-sys-controller
>> +    items:
>> +      - const: microchip,mpfs-sys-controller
>> +      - const: simple-mfd
>
>'simple-mfd' means there is zero dependency on the parent for the child
>nodes. Isn't 'mboxes' a dependency?

I suppose it is. I was going off what had been done for the bcm2835
firmware for the rpi its also a mailbox providing "services".
(arm/bcm/raspberrypi,bcm2835-firmware.yaml)
>
>> +
>> +  hwrandom:
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: microchip,mpfs-rng
>> +
>> +    required:
>> +      - compatible
>> +
>> +  sysserv:
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: microchip,mpfs-generic-service
>> +
>> +    required:
>> +      - compatible
>
>There's not really any need to have child nodes which have no resources.
>The driver for microchip,mpfs-sys-controller can create child devices.

I am assuming by this you mean say, take a list of boolean properties and
convert those into child devices? There's a fairly decent number of services
provided by the system controller and these children just represent the
subset that we've implemented so far.

Conor
>
>Rob

