Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D111F8E119
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2019 01:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729237AbfHNXGt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 19:06:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:41234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727848AbfHNXGt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 19:06:49 -0400
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C9E521743;
        Wed, 14 Aug 2019 23:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565824007;
        bh=Osh2kIuzBECV/4S+fO2LBnSrGcK/tQ0alxa/uWeuFQc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nm/3Un5cw9DqG26s8lndjrQy4y2i5O4k9Le+Va9KzaVBLHkQWa5BePc6YLarGxMDd
         l1r9kj3JqmTIe30/oF8+XWBDoo73fGcBKRp/gU6ABiTymb+WxoeX6P37zn2u6G2fRC
         t4g3qxD1yzo9RzZ3u9caxTeU2xPr2kTmyVFD+6m0=
Received: by mail-qk1-f172.google.com with SMTP id 201so445852qkm.9;
        Wed, 14 Aug 2019 16:06:47 -0700 (PDT)
X-Gm-Message-State: APjAAAXX0bEHrjDIUs10CrgsZN8/pr5JzOsMmJ5oLEUhzSuTxl0X1AvV
        uUuHIC7TSmEFJ1SARCepsDrwjIVLcBlbDjOCNw==
X-Google-Smtp-Source: APXvYqwIIiPLiCSpGiUOEsKR6pt4CN+4KUYglGKUJR5D8HxVpco/SEBiFVf0WJecJv6krnzu3KPOTMEHV9O3FwuOBSs=
X-Received: by 2002:a37:6944:: with SMTP id e65mr1447045qkc.119.1565824006678;
 Wed, 14 Aug 2019 16:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
 <1565713248-4906-10-git-send-email-wahrenst@gmx.net> <CAL_Jsq+01vXQpf_ZuAvetWvcGLhK4EiiB1qFqhRkM3PQWAzdsA@mail.gmail.com>
 <f9acf678-854d-720d-3c84-d9a05766c02e@gmx.net>
In-Reply-To: <f9acf678-854d-720d-3c84-d9a05766c02e@gmx.net>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 14 Aug 2019 17:06:35 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+=0Jvz+xx8sn9v_Q-WYCn5fACBhwSGORcMNXXxocCkpQ@mail.gmail.com>
Message-ID: <CAL_Jsq+=0Jvz+xx8sn9v_Q-WYCn5fACBhwSGORcMNXXxocCkpQ@mail.gmail.com>
Subject: Re: [PATCH V2 09/13] dt-bindings: arm: Convert BCM2835 board/soc
 bindings to json-schema
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Eric Anholt <eric@anholt.net>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 14, 2019 at 1:21 PM Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi Rob,
>
> Am 13.08.19 um 19:22 schrieb Rob Herring:
> > On Tue, Aug 13, 2019 at 10:21 AM Stefan Wahren <wahrenst@gmx.net> wrote:
> >> Convert the BCM2835/6/7 SoC bindings to DT schema format using json-schema.
> >> All the other Broadcom boards are maintained by Florian Fainelli.
> >>
> >> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> >> Acked-by: Eric Anholt <eric@anholt.net>
> >> ---
> >>  .../devicetree/bindings/arm/bcm/bcm2835.yaml       | 46 +++++++++++++++
> >>  .../devicetree/bindings/arm/bcm/brcm,bcm2835.txt   | 67 ----------------------
> >>  2 files changed, 46 insertions(+), 67 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
> >>  delete mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
> >> new file mode 100644
> >> index 0000000..1a4be26
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
> >> @@ -0,0 +1,46 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/arm/bcm/bcm2835.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Broadcom BCM2711/BCM2835 Platforms Device Tree Bindings
> >> +
> >> +maintainers:
> >> +  - Eric Anholt <eric@anholt.net>
> >> +  - Stefan Wahren <wahrenst@gmx.net>
> >> +
> >> +properties:
> >> +  $nodename:
> >> +    const: '/'
> >> +  compatible:
> >> +    oneOf:
> >> +      - description: BCM2835 based Boards
> >> +        items:
> >> +          - enum:
> >> +              - raspberrypi,model-a
> >> +              - raspberrypi,model-a-plus
> >> +              - raspberrypi,model-b
> >> +              - raspberrypi,model-b-i2c0  # Raspberry Pi Model B (no P5)
> >> +              - raspberrypi,model-b-rev2
> >> +              - raspberrypi,model-b-plus
> >> +              - raspberrypi,compute-module
> >> +              - raspberrypi,model-zero
> >> +              - raspberrypi,model-zero-w
> >> +          - const: brcm,bcm2835
> >> +
> >> +      - description: BCM2836 based Boards
> >> +        items:
> >> +          - enum:
> >> +              - raspberrypi,2-model-b
> > Don't you need brcm,bcm2836 here?
> >
> >> +
> >> +      - description: BCM2837 based Boards
> >> +        items:
> >> +          - enum:
> >> +              - raspberrypi,3-model-a-plus
> >> +              - raspberrypi,3-model-b
> >> +              - raspberrypi,3-model-b-plus
> >> +              - raspberrypi,3-compute-module
> >> +              - raspberrypi,3-compute-module-lite
> > Don't you need brcm,bcm2837 here?
> >
> > Please run 'dtbs_check' and make sure there aren't warnings (in the root node).
>
> thanks, after addressing your comments the root node doesn't have
> warnings anymore.
>
> Beside that there a lot of other warnings:
>
>   DTC     arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml
>   CHECK   arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> arm-pmu: compatible: ['arm,cortex-a72-pmu', 'arm,armv8-pmuv3'] is too long
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> arm-pmu: compatible: Additional items are not allowed ('arm,armv8-pmuv3'
> was unexpected)
>
> I think the schema is a little bit too strict by prohibit a fallback
> compatible.

IIRC, Will Deacon said there wasn't any point to fallbacks as every
cpu has its own list of events. Or if we want a fallback, then add it
to the schema.

>
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> serial@7e201800: Additional properties are not allowed
> ('arm,primecell-periphid' was unexpected)
>
> In the old txt version this was an allowed property.

You really need an override? Haven't seen that in a while. We can drop
'additionalProperties: false' in the pl011 schema.

>
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> firmware: $nodename:0: 'firmware' does not match
> '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> firmware: '#address-cells' is a required property
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> firmware: '#size-cells' is a required property
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> firmware: 'ranges' is a required property
>
> I suggest to fix this by removing the "simple-bus".

Probably. 'firmware' doesn't sound like a bus.

>
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> serial@7e201a00: Additional properties are not allowed
> ('arm,primecell-periphid' was unexpected)
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> gpio@7e200000: 'pinctrl-0' is a dependency of 'pinctrl-names'
>
> This could be fixed by removing pinctrl-names.
>
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> serial@7e201600: Additional properties are not allowed
> ('arm,primecell-periphid' was unexpected)
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> gic400@40041000: $nodename:0: 'gic400@40041000' does not match
> '^interrupt-controller(@[0-9a-f,]+)*$'
>
> I will rename gic400 to interrupt-controller.
>
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> serial@7e201400: Additional properties are not allowed
> ('arm,primecell-periphid' was unexpected)
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> serial@7e201000: compatible: ['brcm,bcm2835-pl011', 'arm,pl011',
> 'arm,primecell'] is not valid under any of the given schemas
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> serial@7e201000: Additional properties are not allowed ('bluetooth',
> 'arm,primecell-periphid' were unexpected)
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> sd_io_1v8_reg: states:0: [1800000, 1, 3300000, 0] is too long
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> sd_io_1v8_reg: states:0: Additional items are not allowed (3300000, 0
> were unexpected)
>
> No idea what is wrong here

The schema is stricter about <> groupings is my guess. Looks like this
should be 2 entries with 2 cells each.

> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml: clocks:
> #size-cells:0:0: 0 is not one of [1, 2]
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml: clocks:
> $nodename:0: 'clocks' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml: clocks:
> clock@3:reg:0: [3] is too short
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml: clocks:
> clock@4:reg:0: [4] is too short
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml: clocks:
> 'ranges' is a required property
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> clock@3: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
> /home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
> clock@4: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
>
> This could be fixed by avoiding a simple-bus for the fixed clocks.

Right, they are not a bus.

Rob
