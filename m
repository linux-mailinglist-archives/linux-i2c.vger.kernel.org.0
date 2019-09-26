Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF49ABECED
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2019 09:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfIZHz6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Sep 2019 03:55:58 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43759 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727221AbfIZHz6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Sep 2019 03:55:58 -0400
Received: by mail-ot1-f65.google.com with SMTP id o44so1170389ota.10
        for <linux-i2c@vger.kernel.org>; Thu, 26 Sep 2019 00:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Jxri89au+faOXt57GEFLoPcNzRAcIZRn2sHoUi9FQ/k=;
        b=PQbkR+GthI8pwoSypT/w6DIKdOLgbgnJ7tQsEdJ72HaKrSVbFeL0L8ph6f05kagmjB
         Y00WiJYqHWgY1dTweApe8ZNQuMarxY0e/guno4lwD/qb8LPDwqHFfS5TUSXYFwSLe1I3
         21yTgHrSE+X9ZT+YW2Oy2SR6O4E2fhXrIEM1pg7X3G8jEVPjx+u5ExwWTAuqNU7T2MP9
         PFtTy/UTEO2A+I0JBDkVHWI46TwjXjeY3Cl8wDaDCp2RBipC03l5/E0BaidCHOxg4hXP
         XGm6l/el2dluAw8mKB5JhUSNcIyoPsM5QFHWak63tzQ6L3Pnqb+3jzNspdCl9+Gt/be1
         a+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Jxri89au+faOXt57GEFLoPcNzRAcIZRn2sHoUi9FQ/k=;
        b=K6sRi2nufCWt67JQRtEAajm4OxyCVqUjsfABIxKvMZT5HhEaFGs83pDSEnucct1zVx
         Lkjin6BW//UJjM0LaQVnA3ClMd5XeVeq0GAaizF71M7xwMNlRu+kHaKH7WUauFTHRMSY
         Qy56o3o6nHpHazzsdftueZ/XbCvROVHmtyzkU7JoXfZ8ERWprlDmsUuxRBi2s1XHMDH/
         dpi0SEaMqemIqn7gxs+NYUuvV/EO99Ottt3fxdWkmKDFXByG2sDYdjsOyo3vHgzsUoLO
         TWjMrqkpK3EJ1ogtoNrqhnGDEZaWBgzTXLEGaaUTZl1xDBrsYKVZxtgMlgmNwG9H3HTB
         GGFQ==
X-Gm-Message-State: APjAAAVmwmC3a9O70ZUlHqWOtrOqTKExmcmU0z68z1tB/thUkP/l8Cd6
        FBMH49AMnu0cQD68XzHMXc6KxrNiHsF4l1e/RBXobKpI7Qg=
X-Google-Smtp-Source: APXvYqw7KN/Zkr+jVObv8bRfHcDWhfYtBcw9KbIO/kdG1BSZQvjU+8Ch73M9vOyvpjibOHXyL3Iqf3FrWUIp20p3OKo=
X-Received: by 2002:a9d:821:: with SMTP id 30mr127787oty.194.1569484555557;
 Thu, 26 Sep 2019 00:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190925203808.14249-1-robh@kernel.org>
In-Reply-To: <20190925203808.14249-1-robh@kernel.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 26 Sep 2019 09:55:44 +0200
Message-ID: <CAMpxmJUiiEB8Mpv+hxN8s6=h8pfRXpHMva4OR5LkDWLuU5xQzg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: at24: convert the binding document to yaml
To:     Rob Herring <robh@kernel.org>
Cc:     Peter Rosin <peda@axentia.se>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=C5=9Br., 25 wrz 2019 o 22:38 Rob Herring <robh@kernel.org> napisa=C5=82(a)=
:
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
> Here's my reworking of compatible schema and all the other fixes I
> found. The inner 'oneOf' is probably a little excessive given the number
> of lines. All it does is ensure both compatible strings have the same
> part number.
>

Thanks for doing this! Since I'm not well versed in this I can only
accept it as the right solution. :)

> Getting these errors checking Arm dts files:
>
> arch/arm/boot/dts/at91-tse850-3.dt.yaml: jc42@18: compatible: ['nxp,se97b=
', 'jedec,jc-42.4-temp'] is not valid under any of the given schemas
> arch/arm/boot/dts/at91-nattis-2-natte-2.dt.yaml: temp@18: compatible: ['n=
xp,se97b', 'jedec,jc-42.4-temp'] is not valid under any of the given schema=
s
> arch/arm/boot/dts/imx7d-mba7.dt.yaml: temperature-sensor-eeprom@1e: compa=
tible: ['nxp,se97b', 'jedec,jc-42.4-temp'] is not valid under any of the gi=
ven schemas
> arch/arm/boot/dts/imx7s-mba7.dt.yaml: temperature-sensor-eeprom@1e: compa=
tible: ['nxp,se97b', 'jedec,jc-42.4-temp'] is not valid under any of the gi=
ven schemas
>

Interesting. Apparently this chip is a memory sensor with an EEPROM
compatible with 24c02 built in. The EEPROM and temp sensor are visible
on different slave addresses. I guess this means the DT is correct.
The 'nxp,se97b' compatible string however is never mentioned in
Documentation/devicetree/bindings/hwmon/jc42.txt though. I'm not sure
what we should do about it. Any advice?

Bart

>  .../devicetree/bindings/eeprom/at24.txt       |  90 +---------
>  .../devicetree/bindings/eeprom/at24.yaml      | 154 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 156 insertions(+), 90 deletions(-)
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
> index 000000000000..5faa03014cc5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -0,0 +1,154 @@
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
> +properties:
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
