Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23981C084C
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2019 17:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbfI0PGX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Sep 2019 11:06:23 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:45867 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbfI0PGX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Sep 2019 11:06:23 -0400
Received: by mail-io1-f65.google.com with SMTP id c25so17064807iot.12
        for <linux-i2c@vger.kernel.org>; Fri, 27 Sep 2019 08:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XPC+nIjew0iTqiVnsUuOIA6zrMVDeRWmWqmZPK0+k80=;
        b=QGJ7oEl7Nh7cZcOdbiAu9TJGowf/sOF4sjc62i4FSgMk8gfRVYd8NCl5ZLd9/DAlt0
         zYknYocjlFeL++THBId6DuWZpaTK/vUPPqpzke8MkBg5RZylHBfZ8XuqdhiK1rWlNdjX
         BBvnfhDyIH4OjXpWGxPEAuXnPLztWnR8bcbJGZmMXD1/hjxEySRiAyoJdK+zZuoPzK4l
         Gf0LEgrxP+X1OyJGR7Z2S8R/Z71plVRV5YO30GSpKunC5c/8onPWNqnsy3UDqtS1W+mN
         V00DwStSL3jKKr72kC11WilgZlqWV/PdvAhrC9Vb18d3NKktvhaAPWl3uFzYKA4ODDEQ
         hS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XPC+nIjew0iTqiVnsUuOIA6zrMVDeRWmWqmZPK0+k80=;
        b=IpAE+Y7VuJfQAHMEDBm0rFK5IvmrB5LOxgH20p6mrpPSTa8o74VBBuJCxtb7Uwu2vU
         nma1mehuEckyoAOnvfOLrErZDRFazCwqZbAfQ+d6Oai5tkAKS7igVuNmEY/VwAVXP2Zs
         hljHq4Q7CL7VW9w6Vj1b4OalcMh8Xie/t4KPBXpF7kK7g1DDEpY/4Uv6x6eRDMW0NBCr
         gcOdVE6vj6DN+6SSqhq0Oi5eGus0/qMxT6xlHfbx72maDUAHuTzKkmbS9eAhIt18A5T5
         90P8+pGvRuFb5xbdLWEgWgtqI7P6NDnlwpZnHRv2Da2FrGF+fNQgJQd81gSNLMjDCyuH
         Iacw==
X-Gm-Message-State: APjAAAVg8Akfpkd+brieyTKo99EdkrtF4HRsxzK4NF3pfl7ZNPA4NZZC
        zgDBe+RI3ZNdP3LDBp/MXyqrwO/XwJSk9n3y2SmpBA==
X-Google-Smtp-Source: APXvYqxGwqrtKYe+togh6kJeyUF+saASbccKsCL5SAQ3NuX/QJFF2nRQZx33348xyos1e1+1jq5HvGLyi1uCTqcfyNM=
X-Received: by 2002:a02:b156:: with SMTP id s22mr8324721jah.102.1569596781873;
 Fri, 27 Sep 2019 08:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190927134220.8734-1-robh@kernel.org>
In-Reply-To: <20190927134220.8734-1-robh@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 27 Sep 2019 17:06:09 +0200
Message-ID: <CAMRc=MctTVh99vE+dfd25ienWEjtMNwrM200f1im--fx9ALo7Q@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: at24: convert the binding document to yaml
To:     Rob Herring <robh@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Peter Rosin <peda@axentia.se>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pt., 27 wrz 2019 o 15:42 Rob Herring <robh@kernel.org> napisa=C5=82(a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Convert the binding document for at24 EEPROMs from txt to yaml. The
> compatible property uses a regex pattern to address all the possible
> combinations of "vendor,model" strings.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> [robh: rework compatible schema, fix missing allOf for $ref, fix errors i=
n example]
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v4:
> - Add a $nodename definition
>
> - Turns out the compatible schema is too complex for generating a 'select=
'
> schema and only a small subset where getting validated. So we need a
> custom 'select' schema. This in turn fixes the issue with the nxp,se97b
> binding.

Thanks again!

>
> Now we get a different set of errors checking Arm dts files (omitting
> a bunch of node name ones):
>

> arch/arm/boot/dts/at91-dvk_som60.dt.yaml: eeprom@57: compatible: ['giante=
c,gt24c32a', 'atmel,24c32'] is not valid under any of the given schemas

This is because nobody bothered adding 'giantec,gt24c32a' to previous
.txt bindings. I'll add this in a follow-up patch.

> arch/arm/boot/dts/am3874-iceboard.dt.yaml: at24cs01@5f: compatible: ['atm=
el,24cs01'] is not valid under any of the given schemas
> arch/arm/boot/dts/am3874-iceboard.dt.yaml: at24cs08@5c: compatible: ['atm=
el,24cs08'] is not valid under any of the given schemas
>

These look fine at first glance, I'm not sure what the problem here
is. I'll take a look at these as soon as I can.

Bart

> These all look to be real.
> ---
>  .../devicetree/bindings/eeprom/at24.txt       |  90 +---------
>  .../devicetree/bindings/eeprom/at24.yaml      | 164 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 166 insertions(+), 90 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/eeprom/at24.yaml
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Document=
ation/devicetree/bindings/eeprom/at24.txt
> index 22aead844d0f..c94acbb8cb0c 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.txt
> +++ b/Documentation/devicetree/bindings/eeprom/at24.txt
> @@ -1,89 +1 @@
> -EEPROMs (I2C)
> -
> -Required properties:
> -
> -  - compatible: Must be a "<manufacturer>,<model>" pair. The following <=
model>
> -                values are supported (assuming "atmel" as manufacturer):
> -
> -                "atmel,24c00",
> -                "atmel,24c01",
> -                "atmel,24cs01",
> -                "atmel,24c02",
> -                "atmel,24cs02",
> -                "atmel,24mac402",
> -                "atmel,24mac602",
> -                "atmel,spd",
> -                "atmel,24c04",
> -                "atmel,24cs04",
> -                "atmel,24c08",
> -                "atmel,24cs08",
> -                "atmel,24c16",
> -                "atmel,24cs16",
> -                "atmel,24c32",
> -                "atmel,24cs32",
> -                "atmel,24c64",
> -                "atmel,24cs64",
> -                "atmel,24c128",
> -                "atmel,24c256",
> -                "atmel,24c512",
> -                "atmel,24c1024",
> -                "atmel,24c2048",
> -
> -                If <manufacturer> is not "atmel", then a fallback must b=
e used
> -                with the same <model> and "atmel" as manufacturer.
> -
> -                Example:
> -                        compatible =3D "microchip,24c128", "atmel,24c128=
";
> -
> -                Supported manufacturers are:
> -
> -                "catalyst",
> -                "microchip",
> -                "nxp",
> -                "ramtron",
> -                "renesas",
> -                "rohm",
> -                "st",
> -
> -                Some vendors use different model names for chips which a=
re just
> -                variants of the above. Known such exceptions are listed =
below:
> -
> -                "nxp,se97b" - the fallback is "atmel,24c02",
> -                "renesas,r1ex24002" - the fallback is "atmel,24c02"
> -                "renesas,r1ex24016" - the fallback is "atmel,24c16"
> -                "renesas,r1ex24128" - the fallback is "atmel,24c128"
> -                "rohm,br24t01" - the fallback is "atmel,24c01"
> -
> -  - reg: The I2C address of the EEPROM.
> -
> -Optional properties:
> -
> -  - pagesize: The length of the pagesize for writing. Please consult the
> -              manual of your device, that value varies a lot. A wrong va=
lue
> -              may result in data loss! If not specified, a safety value =
of
> -              '1' is used which will be very slow.
> -
> -  - read-only: This parameterless property disables writes to the eeprom=
.
> -
> -  - size: Total eeprom size in bytes.
> -
> -  - no-read-rollover: This parameterless property indicates that the
> -                      multi-address eeprom does not automatically roll o=
ver
> -                      reads to the next slave address. Please consult th=
e
> -                      manual of your device.
> -
> -  - wp-gpios: GPIO to which the write-protect pin of the chip is connect=
ed.
> -
> -  - address-width: number of address bits (one of 8, 16).
> -
> -  - num-addresses: total number of i2c slave addresses this device takes
> -
> -Example:
> -
> -eeprom@52 {
> -       compatible =3D "atmel,24c32";
> -       reg =3D <0x52>;
> -       pagesize =3D <32>;
> -       wp-gpios =3D <&gpio1 3 0>;
> -       num-addresses =3D <8>;
> -};
> +This file has been moved to at24.yaml.
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documen=
tation/devicetree/bindings/eeprom/at24.yaml
> new file mode 100644
> index 000000000000..036068335a4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -0,0 +1,164 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Copyright 2019 BayLibre SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/eeprom/at24.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: I2C EEPROMs compatible with Atmel's AT24
> +
> +maintainers:
> +  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
> +  required:
> +    - compatible
> +
> +properties:
> +  $nodename:
> +    pattern: "^eeprom@[0-9a-f]{1,2}$"
> +  compatible:
> +    oneOf:
> +      - allOf:
> +          - minItems: 1
> +            maxItems: 2
> +            items:
> +              - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas=
|rohm|st),(24(c|cs|mac)[0-9]+|spd)$"
> +              - pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
> +          - oneOf:
> +              - items:
> +                  pattern: c00$
> +              - items:
> +                  pattern: c01$
> +              - items:
> +                  pattern: c02$
> +              - items:
> +                  pattern: c04$
> +              - items:
> +                  pattern: c08$
> +              - items:
> +                  pattern: c16$
> +              - items:
> +                  pattern: cs16$
> +              - items:
> +                  pattern: c32$
> +              - items:
> +                  pattern: cs32$
> +              - items:
> +                  pattern: c64$
> +              - items:
> +                  pattern: cs64$
> +              - items:
> +                  pattern: c128$
> +              - items:
> +                  pattern: cs128$
> +              - items:
> +                  pattern: c256$
> +              - items:
> +                  pattern: cs256$
> +              - items:
> +                  pattern: c512$
> +              - items:
> +                  pattern: cs512$
> +              - items:
> +                  pattern: c1024$
> +              - items:
> +                  pattern: cs1024$
> +              - items:
> +                  pattern: c2048$
> +              - items:
> +                  pattern: cs2048$
> +              - items:
> +                  pattern: spd$
> +      - items:
> +          - const: rohm,br24t01
> +          - const: atmel,24c01
> +      - items:
> +          - const: nxp,se97b
> +          - const: atmel,24c02
> +      - items:
> +          - const: renesas,r1ex24002
> +          - const: atmel,24c02
> +      - items:
> +          - const: renesas,r1ex24016
> +          - const: atmel,24c16
> +      - items:
> +          - const: renesas,r1ex24128
> +          - const: atmel,24c128
> +
> +  reg:
> +    maxItems: 1
> +
> +  pagesize:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The length of the pagesize for writing. Please consult the
> +      manual of your device, that value varies a lot. A wrong value
> +      may result in data loss! If not specified, a safety value of
> +      '1' is used which will be very slow.
> +    enum: [ 1, 8, 16, 32, 64, 128, 258 ]
> +    default: 1
> +
> +  read-only:
> +    $ref: /schemas/types.yaml#definitions/flag
> +    description:
> +      This parameterless property disables writes to the eeprom.
> +
> +  size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Total eeprom size in bytes.
> +
> +  no-read-rollover:
> +    $ref: /schemas/types.yaml#definitions/flag
> +    description:
> +      This parameterless property indicates that the multi-address
> +      eeprom does not automatically roll over reads to the next slave
> +      address. Please consult the manual of your device.
> +
> +  wp-gpios:
> +    description:
> +      GPIO to which the write-protect pin of the chip is connected.
> +    maxItems: 1
> +
> +  address-width:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Number of address bits (one of 8, 16).
> +    default: 8
> +    enum: [ 8, 16 ]
> +
> +  num-addresses:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Total number of i2c slave addresses this device takes.
> +    default: 1
> +    minimum: 1
> +    maximum: 8
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      eeprom@52 {
> +          compatible =3D "microchip,24c32", "atmel,24c32";
> +          reg =3D <0x52>;
> +          pagesize =3D <32>;
> +          wp-gpios =3D <&gpio1 3 0>;
> +          num-addresses =3D <8>;
> +      };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a50e97a63bc8..a65e6bcd957b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2687,7 +2687,7 @@ M:        Bartosz Golaszewski <bgolaszewski@baylibr=
e.com>
>  L:     linux-i2c@vger.kernel.org
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
>  S:     Maintained
> -F:     Documentation/devicetree/bindings/eeprom/at24.txt
> +F:     Documentation/devicetree/bindings/eeprom/at24.yaml
>  F:     drivers/misc/eeprom/at24.c
>
>  ATA OVER ETHERNET (AOE) DRIVER
> --
> 2.20.1
>
