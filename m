Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E30628DDD5
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 21:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbfHNTVb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 15:21:31 -0400
Received: from mout.gmx.net ([212.227.17.21]:60081 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728128AbfHNTVb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 15:21:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565810462;
        bh=d++ldL5SUC49z8++j07OgZlhrKCwugADIKUc2KAPYKQ=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=YIYzHdQ9HOuEI2ceKDjtlQRa1UDtDc5tcUqULOz+souydaPKIqWUyAyhv/G2PuQm4
         mQziR78L30hz4qHh3OEEsUJYSKSmPcSBNIq02+pAp/+Ir55o+BHCme7iNx6Eo4HvIU
         7ogKNTFyxae1UfNAjZEnk9VYWGeL8gMAsk5MNaNA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.106]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LZzY9-1ihVj92KA1-00lkpt; Wed, 14
 Aug 2019 21:21:02 +0200
Subject: Re: [PATCH V2 09/13] dt-bindings: arm: Convert BCM2835 board/soc
 bindings to json-schema
To:     Rob Herring <robh+dt@kernel.org>
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
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
 <1565713248-4906-10-git-send-email-wahrenst@gmx.net>
 <CAL_Jsq+01vXQpf_ZuAvetWvcGLhK4EiiB1qFqhRkM3PQWAzdsA@mail.gmail.com>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <f9acf678-854d-720d-3c84-d9a05766c02e@gmx.net>
Date:   Wed, 14 Aug 2019 21:21:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+01vXQpf_ZuAvetWvcGLhK4EiiB1qFqhRkM3PQWAzdsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:/I3kDilaSmvTywo6Y0PtWIRiL9BDzfqMeNJs/p2nee9NhkwKYgv
 QZsM5sLRt9l1mpgZGVxcxqx3LWRTzaDl3VEuf6QV6JpXliVZ4f/KjDf9P619DiStmVrcRr3
 TfIfSyj8u3kfEHbGF208jVV1t6lCDlhaK1SRbysS0X3ehzZ3oqcAZ0tNQnjc0oaypnziYd+
 XQCvmJ97G25h65hMxPRgg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fs0wjMQYF5o=:r85/xzGI12wsXXkjV16o5A
 pYzfFmyt3dmifUkAu1ewZ7TN+rmaL/oyaj7gHS/n+sjs2dFbG2uMmYWQUUZT3CvbhDPk5BKqT
 /sQV4Ykf52+APUfU1QfX0kOSA4taJwzfZUpG6XZMaaFJW5nFb7BppDQVaBUmSdY4MLodCQAgk
 jKemp1YPE/xfzC1fpPiGuBCSkJUfXPT5GXPdh2rSNzWl2i4IuLUe3bef8h0x+Z7/+89S04kq/
 m90BDkUu1cS7DO34RzaaKUGXLQkX3u99ERj1fO4FOYTl6ghKNFPJBiSjFOKJuCPJEs+2qJwJo
 VCJ0jndWjlcQDPJyEOAHNnv6HWRJLYJQKyTvkGATzfsrYjCtVllAZzjTNwDTizJObEyKSty75
 yhLK5udhv7Jhbk6aLn8QJzXa3I5omF5sZUjGVS9Je+Bxrza+j1IMeKZwssWgWznyCF+/JdAmd
 dLdrT3Ub4BtbAN19lKF82OcF75IGgRxHv61mch3R0NQyPakYyKHsIN3eUtrAsS4S28sFBD9Fh
 6PmzVpvJSrVA5B79ar5phl6igfrhReuoDysmxCpOpvkpctn7KFP3TlhH0cfeigoYzMqDuaNOV
 nmTyS3D3L1Xsi5BSyAClZv1M9l+KUx4J39Mn4dnVJlSChnIFzvG31UA6E8Xok8sbKtim9L53Z
 w+WR+NJkECeoKfoFGvkpTkbIwl4vBpHk8YU5+t/1bSezI8E4TmgxglmTajLDCf5CSscaG+HG8
 hqFDPGbGZYwo6IWxSrh8m2AdXOjWDo+SNg5LoeUjHPZ+mbO5Ev0SpsBd4kMf/C5P8zls2vIt2
 tDox7zWANFY8YOeSptyVAqJa+8QDO3upTFYOxzHbiyLAPlMYlIv9oxgVTYRG3b+AytV7ovGTT
 DIseyEBuL6DStPa9UGuzBE+ka7HfZdk0aYr1+bU39ZYixyYAoO5VQwfp0NZt+5tcJn1FZNHNE
 Ryma0tRnQ1wesqvB6qLxAdTRye6S1hs9kPPRxc5vpXfffSHr1m0foafLqduzCrvnw5D8GeRDm
 KoswhjH1uo87fvYBnAgZ1siqkwOLlOpUaXUXoFybkiScEWZk6/Xv2I7HAmLSV/HfFYPj4Z08h
 GkzzhxfdKLvFy8dQMq2gD9dsu4UzYpmKgmonKAOzsOb5VZs2Wfqo9aSAY3SlawAt9YsUUg+O+
 WPOt6mGLZ2iknTTT8BYbXGRKD3a0wvZNHRZqe71rg2Zk9cIUuIxe1TY/MuRyI9L+Xa5uYSbC2
 k2KcbTYrvdHjVMUlLIKGAWPk0KDNbExVJUTjDDaX0I+gnEWbapkiRzaMnkOM=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

Am 13.08.19 um 19:22 schrieb Rob Herring:
> On Tue, Aug 13, 2019 at 10:21 AM Stefan Wahren <wahrenst@gmx.net> wrote:
>> Convert the BCM2835/6/7 SoC bindings to DT schema format using json-sch=
ema.
>> All the other Broadcom boards are maintained by Florian Fainelli.
>>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> Acked-by: Eric Anholt <eric@anholt.net>
>> ---
>>  .../devicetree/bindings/arm/bcm/bcm2835.yaml       | 46 ++++++++++++++=
+
>>  .../devicetree/bindings/arm/bcm/brcm,bcm2835.txt   | 67 --------------=
--------
>>  2 files changed, 46 insertions(+), 67 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/bcm2835.y=
aml
>>  delete mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,bcm2=
835.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/D=
ocumentation/devicetree/bindings/arm/bcm/bcm2835.yaml
>> new file mode 100644
>> index 0000000..1a4be26
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
>> @@ -0,0 +1,46 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/bcm/bcm2835.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Broadcom BCM2711/BCM2835 Platforms Device Tree Bindings
>> +
>> +maintainers:
>> +  - Eric Anholt <eric@anholt.net>
>> +  - Stefan Wahren <wahrenst@gmx.net>
>> +
>> +properties:
>> +  $nodename:
>> +    const: '/'
>> +  compatible:
>> +    oneOf:
>> +      - description: BCM2835 based Boards
>> +        items:
>> +          - enum:
>> +              - raspberrypi,model-a
>> +              - raspberrypi,model-a-plus
>> +              - raspberrypi,model-b
>> +              - raspberrypi,model-b-i2c0  # Raspberry Pi Model B (no P=
5)
>> +              - raspberrypi,model-b-rev2
>> +              - raspberrypi,model-b-plus
>> +              - raspberrypi,compute-module
>> +              - raspberrypi,model-zero
>> +              - raspberrypi,model-zero-w
>> +          - const: brcm,bcm2835
>> +
>> +      - description: BCM2836 based Boards
>> +        items:
>> +          - enum:
>> +              - raspberrypi,2-model-b
> Don't you need brcm,bcm2836 here?
>
>> +
>> +      - description: BCM2837 based Boards
>> +        items:
>> +          - enum:
>> +              - raspberrypi,3-model-a-plus
>> +              - raspberrypi,3-model-b
>> +              - raspberrypi,3-model-b-plus
>> +              - raspberrypi,3-compute-module
>> +              - raspberrypi,3-compute-module-lite
> Don't you need brcm,bcm2837 here?
>
> Please run 'dtbs_check' and make sure there aren't warnings (in the root=
 node).

thanks, after addressing your comments the root node doesn't have
warnings anymore.

Beside that there a lot of other warnings:

=C2=A0 DTC=C2=A0=C2=A0=C2=A0=C2=A0 arch/arm/boot/dts/bcm2711-rpi-4-b.dt.ya=
ml
=C2=A0 CHECK=C2=A0=C2=A0 arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
arm-pmu: compatible: ['arm,cortex-a72-pmu', 'arm,armv8-pmuv3'] is too long
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
arm-pmu: compatible: Additional items are not allowed ('arm,armv8-pmuv3'
was unexpected)

I think the schema is a little bit too strict by prohibit a fallback
compatible.

/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
serial@7e201800: Additional properties are not allowed
('arm,primecell-periphid' was unexpected)

In the old txt version this was an allowed property.

/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
firmware: $nodename:0: 'firmware' does not match
'^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
firmware: '#address-cells' is a required property
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
firmware: '#size-cells' is a required property
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
firmware: 'ranges' is a required property

I suggest to fix this by removing the "simple-bus".

/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
serial@7e201a00: Additional properties are not allowed
('arm,primecell-periphid' was unexpected)
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
gpio@7e200000: 'pinctrl-0' is a dependency of 'pinctrl-names'

This could be fixed by removing pinctrl-names.

/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
serial@7e201600: Additional properties are not allowed
('arm,primecell-periphid' was unexpected)
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
gic400@40041000: $nodename:0: 'gic400@40041000' does not match
'^interrupt-controller(@[0-9a-f,]+)*$'

I will rename gic400 to interrupt-controller.

/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
serial@7e201400: Additional properties are not allowed
('arm,primecell-periphid' was unexpected)
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
serial@7e201000: compatible: ['brcm,bcm2835-pl011', 'arm,pl011',
'arm,primecell'] is not valid under any of the given schemas
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
serial@7e201000: Additional properties are not allowed ('bluetooth',
'arm,primecell-periphid' were unexpected)
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
sd_io_1v8_reg: states:0: [1800000, 1, 3300000, 0] is too long
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
sd_io_1v8_reg: states:0: Additional items are not allowed (3300000, 0
were unexpected)

No idea what is wrong here

/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml: clocks:
#size-cells:0:0: 0 is not one of [1, 2]
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml: clocks:
$nodename:0: 'clocks' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$=
'
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml: clocks:
clock@3:reg:0: [3] is too short
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml: clocks:
clock@4:reg:0: [4] is too short
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml: clocks:
'ranges' is a required property
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
clock@3: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
/home/stefan/torvalds/arch/arm/boot/dts/bcm2711-rpi-4-b.dt.yaml:
clock@4: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'

This could be fixed by avoiding a simple-bus for the fixed clocks.

Stefan

>
> Rob
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
