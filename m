Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7B3F107262
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2019 13:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbfKVMrR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Nov 2019 07:47:17 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45328 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfKVMrR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Nov 2019 07:47:17 -0500
Received: by mail-oi1-f194.google.com with SMTP id 14so6318036oir.12
        for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2019 04:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u5HN2aZVdj7m+hEI/tOay7oYBKK4V1c4Qj4MJYDq/G8=;
        b=y43nUX9f2O6pPgD2zT2J76e5OrIx6dYRFy/3LTBk/WB5BUPyt5Tw9+g349oglCGlpc
         S7PtdBt9Bhyo4VczYhRGS72HwuwJWIhNbUpNqO1xxjcNMF/pd3d6bCjqUDt2FjuXgpx4
         H6RR2+YNKVH9W6DgH5Rg1+Si8iE6MOvVwW5eVga9QVLjZY67y/mqbQs7CoJHy/AxXsdY
         o9M+cpQJO+3WCBE6a9ylZPf0Y3+ILeYjYyankYt0PeP3F6eODLhifc90Mq0uOSL95ij3
         yrrZDRKqDelRApbxvKFD6mIDbqBSUWLXTc2DEJSWsZT49fVT1Sme4YtNpeaS537MhXfU
         aVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u5HN2aZVdj7m+hEI/tOay7oYBKK4V1c4Qj4MJYDq/G8=;
        b=XaOgJFGBp2JieNmjv9+wIz60TojBHhsSJrigibVdSYk+ZcyOC93dES6Ea/Jq3Zzrym
         4reG2fmIVMDepef0dihmUKDPjSg2cr02xCSivA4SrjqGy4k8wPEWaOqimW/4FZeSDRFj
         PlRlbNcqGv0gibqjSIkaSZWul6rVslQe6bwMz8JaLZ2H7qbyR6f+6N2fWGRGGgq27Zx3
         YKMpOJ5uh18znr/qcG0dWauxFyjXIAaI8P1IqQO4RsNLg43SElO5diLIFOo9YPeJDqKV
         K2p8d48WEETUL5f0kzoWKI10EDLK9UhW1QOPxxHd8ESh6WWa9vYjGfgQNCnvV9CvFNd/
         oHxA==
X-Gm-Message-State: APjAAAUX3EV5D24LR8Py4T1THOF2G73co8FsU7BFXzYobmm2roaMLGFm
        P+RqshveIfIJIlRLz5sY1OlhLWOsKPWAuqMTBqbqXw==
X-Google-Smtp-Source: APXvYqxdARFB1pPQ8THn95OiREH9UoH/eBJsQ+rkNZxsd+lQ6YYGrLy7l38RStqRCSsPvKjSawxBrhh8+xlo54P8RSA=
X-Received: by 2002:aca:d904:: with SMTP id q4mr12198515oig.21.1574426835323;
 Fri, 22 Nov 2019 04:47:15 -0800 (PST)
MIME-Version: 1.0
References: <20191120142038.30746-1-ktouil@baylibre.com> <20191120142038.30746-2-ktouil@baylibre.com>
 <CACRpkdaZrvPObjyN4kasARzKZ9=PiAcvTzXzWkmC7R+Ay5tU8w@mail.gmail.com>
In-Reply-To: <CACRpkdaZrvPObjyN4kasARzKZ9=PiAcvTzXzWkmC7R+Ay5tU8w@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Nov 2019 13:47:04 +0100
Message-ID: <CAMpxmJWSgYjcGdR7Zrj-=nA+H8cYfZUriHQPxN=8zgPDvD-wTA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: nvmem: new optional property write-protect-gpios
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Khouloud Touil <ktouil@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        baylibre-upstreaming@groups.io,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pt., 22 lis 2019 o 13:41 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> Hi Khouloud,
>
> thanks for your patch!
>
> I just have a semantic comment:
>
> On Wed, Nov 20, 2019 at 3:21 PM Khouloud Touil <ktouil@baylibre.com> wrot=
e:
>
> > Instead of modifying all the memory drivers to check this pin, make
> > the NVMEM subsystem check if the write-protect GPIO being passed
> > through the nvmem_config or defined in the device tree and pull it
> > low whenever writing to the memory.
>
> It is claimed that this should be pulled low to assert it so by
> definition it is active low.
>
> > +  wp-gpios:
> > +    description:
> > +      GPIO to which the write-protect pin of the chip is connected.
> > +    maxItems: 1
>
> Mandate that the flag in the second cell should be GPIO_ACTIVE_LOW
>
> >  patternProperties:
> >    "^.*@[0-9a-f]+$":
> >      type: object
> > @@ -66,6 +71,7 @@ examples:
> >        qfprom: eeprom@700000 {
> >            #address-cells =3D <1>;
> >            #size-cells =3D <1>;
> > +          wp-gpios =3D <&gpio1 3 0>;
>
> #include <dt-bindings/gpio/gpio.h>
> wp-gpios =3D <&gpio1 3 GPIO_ACTIVE_LOW>;
>
> This will in Linux have the semantic effect that you need to
> set the output high with gpio_set_val(d, 1) to assert it
> (drive it low) but that really doesn't matter to the device tree
> bindings, those are OS-agnostic: if the line is active low then
> it should use this flag.
>
> It has the upside that the day you need a write-protect that
> is active high, it is simple to support that use case too.
>

Linus,

what about the existing bindings for at24 that don't mandate the
active-low flag? I'm afraid this would break the support for this
specific chip or lead to code duplication if we had this in both nvmem
and at24 with different logic.

Bartosz

> Yours,
> Linus Walleij
