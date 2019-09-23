Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54085BBD30
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2019 22:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388405AbfIWUis (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Sep 2019 16:38:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:33822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387586AbfIWUis (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Sep 2019 16:38:48 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3500020B7C;
        Mon, 23 Sep 2019 20:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569271127;
        bh=gNrXvUAU8wOQh+iz7AfVncMXjSwAzg06fGaV6JWq7VM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Zhmep+7Yb+218KwH3rXqqFXlWqTUT+B+anFjP7DzudTHptIUjrsAhFxa2zsVTSJ1p
         7FSXtVzzeonhZORvXyVB/BQzuNpVpvxJpvRb40C4i3gDsU5sg8IMC6ELwXmaUIXQ/T
         A6DX/9i1XQuCcydOn+6Ax6wgn94ATIiAwIPhT3Ic=
Received: by mail-qk1-f169.google.com with SMTP id y189so16935585qkc.3;
        Mon, 23 Sep 2019 13:38:47 -0700 (PDT)
X-Gm-Message-State: APjAAAXmTOnrvgXG3anSag8jToy+W93QqGMEDDzZ2FzR03yt9Z7gB8VD
        whbrHBqogkKd4e1qGm4F9GU6m0C6+XFtPjSdQw==
X-Google-Smtp-Source: APXvYqz4x174VUoDQ+sHaLwwQwYrYkn6emdZqVdsDwxBV8jupD/JDZttNZMfO0zz0c9aUqqQPkIDUNmyo/zXIew/gks=
X-Received: by 2002:a37:682:: with SMTP id 124mr1915258qkg.393.1569271126374;
 Mon, 23 Sep 2019 13:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190923175211.2060-1-brgl@bgdev.pl>
In-Reply-To: <20190923175211.2060-1-brgl@bgdev.pl>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 23 Sep 2019 15:38:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ7w0rvzMLePgz-g+HERhuEJ3F9uDpKcwE241FpumZxfA@mail.gmail.com>
Message-ID: <CAL_JsqJ7w0rvzMLePgz-g+HERhuEJ3F9uDpKcwE241FpumZxfA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: at24: convert the binding document to yaml
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 23, 2019 at 12:52 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Convert the binding document for at24 EEPROMs from txt to yaml. The
> compatible property uses a regex pattern to address all the possible
> combinations of "vendor,model" strings.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../devicetree/bindings/eeprom/at24.txt       |  90 +--------------
>  .../devicetree/bindings/eeprom/at24.yaml      | 107 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 109 insertions(+), 90 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/eeprom/at24.yaml

[...]

> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> new file mode 100644
> index 000000000000..28c8b068c8a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: GPL-2.0
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

Did you run this thru 'make dt_bindings_check' and is dt-schema up to
date? I don't think it will pass and if it does I want to fix that.

> +    additionalItems: true

We pretty much never allow this.

> +    maxItems: 2

This applies to arrays...

> +    pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24(c|cs|mac)[0-9]+$"

And this to strings which is non-sense. What you want is something like this:

minItems: 1
maxItems: 2
items:
  - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24(c|cs|mac)[0-9]+$"
  - pattern: "^atmel,24(c|cs|mac)[0-9]+$"

This would allow 'atmel' twice, but entries have to be unique already.
It doesn't enforce the part numbers matching though. For that, you'd
need either a bunch of these under a oneOf instead:

items:
  - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24c00$"
  - const: atmel,24c00

Or just add this to the above with an 'allOf':

items:
  pattern: "(c00|c01|mac402|...)$"

Note the lack of '-' under items. That means the schema applies to all entries.

> +    oneOf:
> +      - const: nxp,se97b
> +      - const: renesas,r1ex24002
> +      - const: renesas,r1ex24016
> +      - const: renesas,r1ex24128
> +      - const: rohm,br24t01

For this part, you probably want:

oneOf:
  - items:
      - const: nxp,se97b
      - const: atmel,24c02
  - items:
      ...

And for the spd cases...

> +    contains:
> +      enum:

allOf:
  - oneOf:
      # all the above stuff
  - contains:
      enum:

> +        - atmel,24c00
> +        - atmel,24c01
> +        - atmel,24cs01
> +        - atmel,24c02
> +        - atmel,24cs02
> +        - atmel,24mac402
> +        - atmel,24mac602
> +        - atmel,spd
> +        - atmel,24c04
> +        - atmel,24cs04
> +        - atmel,24c08
> +        - atmel,24cs08
> +        - atmel,24c16
> +        - atmel,24cs16
> +        - atmel,24c32
> +        - atmel,24cs32
> +        - atmel,24c64
> +        - atmel,24cs64
> +        - atmel,24c128
> +        - atmel,24c256
> +        - atmel,24c512
> +        - atmel,24c1024
> +        - atmel,24c2048
> +
> +  reg:
> +    description:
> +      The I2C slave address of the EEPROM.
> +    maxItems: 1
> +
> +  pagesize:
> +    description:
> +      The length of the pagesize for writing. Please consult the
> +      manual of your device, that value varies a lot. A wrong value
> +      may result in data loss! If not specified, a safety value of
> +      '1' is used which will be very slow.
> +    type: integer

Other than boolean, you need to reference a type in types.yaml.

Does it really vary too much to list out possible values?

> +
> +  read-only:
> +    description:
> +      This parameterless property disables writes to the eeprom.
> +    type: boolean
> +
> +  size:
> +    description:
> +      Total eeprom size in bytes.
> +    type: integer
> +
> +  no-read-rollover:
> +    description:
> +      This parameterless property indicates that the multi-address
> +      eeprom does not automatically roll over reads to the next slave
> +      address. Please consult the manual of your device.
> +    type: boolean
> +
> +  wp-gpios:
> +    description:
> +      GPIO to which the write-protect pin of the chip is connected.
> +    maxItems: 1
> +
> +  address-width:
> +    description:
> +      Number of address bits (one of 8, 16).

Sounds like a constraint...

> +    type: integer
> +
> +  num-addresses:
> +    description:
> +      Total number of i2c slave addresses this device takes.

2^32 addresses okay?

> +    type: integer
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    eeprom@52 {
> +        compatible = "microchip,24c32", "atmel,24c32";
> +        reg = <0x52>;
> +        pagesize = <32>;
> +        wp-gpios = <&gpio1 3 0>;
> +        num-addresses = <8>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a400af0501c9..3c7ced686966 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2698,7 +2698,7 @@ M:        Bartosz Golaszewski <bgolaszewski@baylibre.com>
>  L:     linux-i2c@vger.kernel.org
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
>  S:     Maintained
> -F:     Documentation/devicetree/bindings/eeprom/at24.txt
> +F:     Documentation/devicetree/bindings/eeprom/at24.yaml
>  F:     drivers/misc/eeprom/at24.c
>
>  ATA OVER ETHERNET (AOE) DRIVER
> --
> 2.23.0
>
