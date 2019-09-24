Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8B34BC4B0
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2019 11:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395067AbfIXJUv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Sep 2019 05:20:51 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45392 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbfIXJUv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Sep 2019 05:20:51 -0400
Received: by mail-oi1-f195.google.com with SMTP id o205so986647oib.12
        for <linux-i2c@vger.kernel.org>; Tue, 24 Sep 2019 02:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t63WI6jnEVUeiSnM61KUP9eWloPNpDRUCDwDuMDDoVg=;
        b=098imhfXUnWyUFSKUmzK25160O/img3eT5gYzMnSulDsq5DpyYfnq0WE8Mzkwnk/SB
         b6UE1jvvMPLEeShXakMQBKcKxtkD4r+cdYynG1yrLvpikA9s/3EZqeMYL4nmVn1xoCDK
         1KX3ZlcR6pFUIAfqJ8cS8yftBxxG4vuxF3jFfG8pQX89VdmfTaAtGnnVhvmSD8uAUcJC
         dHSzZtbuoNY4r/a41bQXNNhs8gPGBj4XdZObMZvN8C0iVHBWuQm+DpBdGWuyq+QyPi1Z
         gAdt92wruxr4QXqO0gkH/gT5lOJqjsHqQ3EFkFtvAky7b/8zK0q8awCRfq54nOefPTdm
         AXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t63WI6jnEVUeiSnM61KUP9eWloPNpDRUCDwDuMDDoVg=;
        b=Tp2ya/dmhBTI4p1oI8mFsYN3dau9bBV4MZ0glN5lwf1dtlVPDq/5nkqjQMXh+HmHWz
         uhQb/py3+53CunKbWh1wGhyQ+RhbbVfp8e0wcrOAydg7usTbCBOZ1sYPWhVSAnTdicQU
         Ta3eLEo0VR3qx5oU+MZiUuwMUl7bQfz1n/+CmdItdiW3PM7c9Po1iCWOwPofBeTt8JL3
         f6RmxcVXMXXXR47o5IvLxC8co0P68Xr+xStE/X4K/BEL4MX080zhfFJ3IFeg125nhBay
         9b4MKrv5yE3T8OSBpZUifZCziCSO1I11t6qHjgbZ9sg6WUPLJpcqAU9t+Qh6BIhBKw2k
         YP3w==
X-Gm-Message-State: APjAAAXNJ0EjZro2Z/kvtE/6q1omOkwOFGLShM2QBYz59ToEyq9kR8rA
        rYDeSPBSIVRnLU5bHkWDKTN/dwhLTPc7gaiHcDP/HQ==
X-Google-Smtp-Source: APXvYqxVUXxEwWWRw3DeXIcBvN1WnJ5y+L/y+uMjcWYYPzubyms6LUqyOC5Htl5jD2a2NgXsY2NXGHxWaA10vo2/74s=
X-Received: by 2002:aca:4406:: with SMTP id r6mr1269018oia.175.1569316849530;
 Tue, 24 Sep 2019 02:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190923175211.2060-1-brgl@bgdev.pl> <CAL_JsqJ7w0rvzMLePgz-g+HERhuEJ3F9uDpKcwE241FpumZxfA@mail.gmail.com>
In-Reply-To: <CAL_JsqJ7w0rvzMLePgz-g+HERhuEJ3F9uDpKcwE241FpumZxfA@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 24 Sep 2019 11:20:38 +0200
Message-ID: <CAMpxmJUffRsAw9sMr2KqgqSp+houehBdpaSSG2UweYyUo5hNRw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: at24: convert the binding document to yaml
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pon., 23 wrz 2019 o 22:38 Rob Herring <robh+dt@kernel.org> napisa=C5=82(a):
>
> On Mon, Sep 23, 2019 at 12:52 PM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Convert the binding document for at24 EEPROMs from txt to yaml. The
> > compatible property uses a regex pattern to address all the possible
> > combinations of "vendor,model" strings.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  .../devicetree/bindings/eeprom/at24.txt       |  90 +--------------
> >  .../devicetree/bindings/eeprom/at24.yaml      | 107 ++++++++++++++++++
> >  MAINTAINERS                                   |   2 +-
> >  3 files changed, 109 insertions(+), 90 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/eeprom/at24.yaml
>
> [...]
>
> > diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Docum=
entation/devicetree/bindings/eeprom/at24.yaml
> > new file mode 100644
> > index 000000000000..28c8b068c8a1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +# Copyright 2019 BayLibre SAS
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/eeprom/at24.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: I2C EEPROMs compatible with Atmel's AT24
> > +
> > +maintainers:
> > +  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > +
> > +properties:
> > +  compatible:
>
> Did you run this thru 'make dt_bindings_check' and is dt-schema up to
> date? I don't think it will pass and if it does I want to fix that.
>

I couldn't get the dt_binding_check target to work, but I ran it
through dt-doc-validate directly until it didn't complain.

> > +    additionalItems: true
>
> We pretty much never allow this.
>
> > +    maxItems: 2
>
> This applies to arrays...
>
> > +    pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),=
24(c|cs|mac)[0-9]+$"
>
> And this to strings which is non-sense. What you want is something like t=
his:
>
> minItems: 1
> maxItems: 2
> items:
>   - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24(=
c|cs|mac)[0-9]+$"
>   - pattern: "^atmel,24(c|cs|mac)[0-9]+$"
>
> This would allow 'atmel' twice, but entries have to be unique already.
> It doesn't enforce the part numbers matching though. For that, you'd
> need either a bunch of these under a oneOf instead:
>
> items:
>   - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),24c=
00$"
>   - const: atmel,24c00
>
> Or just add this to the above with an 'allOf':
>
> items:
>   pattern: "(c00|c01|mac402|...)$"
>

I'm lost here - what do you mean add this to the above with an
'allOf'? I can't really imagine an example for that.

> Note the lack of '-' under items. That means the schema applies to all en=
tries.
>
> > +    oneOf:
> > +      - const: nxp,se97b
> > +      - const: renesas,r1ex24002
> > +      - const: renesas,r1ex24016
> > +      - const: renesas,r1ex24128
> > +      - const: rohm,br24t01
>
> For this part, you probably want:
>
> oneOf:
>   - items:
>       - const: nxp,se97b
>       - const: atmel,24c02
>   - items:
>       ...
>
> And for the spd cases...
>
> > +    contains:
> > +      enum:
>
> allOf:
>   - oneOf:
>       # all the above stuff
>   - contains:
>       enum:
>

I'm not sure I follow the entire thing. I'll try to prepare a v2 but I
don't really expect it to be right already.

> > +        - atmel,24c00
> > +        - atmel,24c01
> > +        - atmel,24cs01
> > +        - atmel,24c02
> > +        - atmel,24cs02
> > +        - atmel,24mac402
> > +        - atmel,24mac602
> > +        - atmel,spd
> > +        - atmel,24c04
> > +        - atmel,24cs04
> > +        - atmel,24c08
> > +        - atmel,24cs08
> > +        - atmel,24c16
> > +        - atmel,24cs16
> > +        - atmel,24c32
> > +        - atmel,24cs32
> > +        - atmel,24c64
> > +        - atmel,24cs64
> > +        - atmel,24c128
> > +        - atmel,24c256
> > +        - atmel,24c512
> > +        - atmel,24c1024
> > +        - atmel,24c2048
> > +
> > +  reg:
> > +    description:
> > +      The I2C slave address of the EEPROM.
> > +    maxItems: 1
> > +
> > +  pagesize:
> > +    description:
> > +      The length of the pagesize for writing. Please consult the
> > +      manual of your device, that value varies a lot. A wrong value
> > +      may result in data loss! If not specified, a safety value of
> > +      '1' is used which will be very slow.
> > +    type: integer
>
> Other than boolean, you need to reference a type in types.yaml.
>
> Does it really vary too much to list out possible values?
>

Nobody is using anything other than 1, 8, 16, 32 and 64, so I guess we
can limit ourselves to those for now.

> > +
> > +  read-only:
> > +    description:
> > +      This parameterless property disables writes to the eeprom.
> > +    type: boolean
> > +
> > +  size:
> > +    description:
> > +      Total eeprom size in bytes.
> > +    type: integer
> > +
> > +  no-read-rollover:
> > +    description:
> > +      This parameterless property indicates that the multi-address
> > +      eeprom does not automatically roll over reads to the next slave
> > +      address. Please consult the manual of your device.
> > +    type: boolean
> > +
> > +  wp-gpios:
> > +    description:
> > +      GPIO to which the write-protect pin of the chip is connected.
> > +    maxItems: 1
> > +
> > +  address-width:
> > +    description:
> > +      Number of address bits (one of 8, 16).
>
> Sounds like a constraint...

Right.

>
> > +    type: integer
> > +
> > +  num-addresses:
> > +    description:
> > +      Total number of i2c slave addresses this device takes.
>
> 2^32 addresses okay?
>

Nope, I'll fix it.

Thanks for the review!

Bart

> > +    type: integer
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +examples:
> > +  - |
> > +    eeprom@52 {
> > +        compatible =3D "microchip,24c32", "atmel,24c32";
> > +        reg =3D <0x52>;
> > +        pagesize =3D <32>;
> > +        wp-gpios =3D <&gpio1 3 0>;
> > +        num-addresses =3D <8>;
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a400af0501c9..3c7ced686966 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2698,7 +2698,7 @@ M:        Bartosz Golaszewski <bgolaszewski@bayli=
bre.com>
> >  L:     linux-i2c@vger.kernel.org
> >  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.gi=
t
> >  S:     Maintained
> > -F:     Documentation/devicetree/bindings/eeprom/at24.txt
> > +F:     Documentation/devicetree/bindings/eeprom/at24.yaml
> >  F:     drivers/misc/eeprom/at24.c
> >
> >  ATA OVER ETHERNET (AOE) DRIVER
> > --
> > 2.23.0
> >
