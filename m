Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA941072B8
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2019 14:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbfKVNEP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Nov 2019 08:04:15 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37973 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbfKVNEP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Nov 2019 08:04:15 -0500
Received: by mail-oi1-f195.google.com with SMTP id a14so6412496oid.5
        for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2019 05:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fzPqklm51f4d+04Hk2lQiF3YOc8XKDMT60XYkopdcUs=;
        b=Cznat/dVZPw9vqZe2bd3oZfkQzZl0vWz5bWzsmdOpvJGNKn6qNI+C+eCevnHvOdQEw
         DiPcgzw6YvU/vJNRB2xRSWiu8zLiN0QZ1ZWNZ0Mva9iIRMOUFAbrgyq8Kgoglke8mih3
         Q8o62l9vxugKLHAeIcsfUPPWNJlQgTAhy5Jbs6Rwpi+e71pn0yUePkWQYidiviCtLMFz
         pgSHbflxkymTl5MGW24kHzVVL6qtYC8t5j5/Q3MKfneH0geutsfd6SqpEtskcb7Rts0o
         JcoVwKa+z5jQEUk5ln3MY7xKHUbQAtRi+hQsU3DnsvplJtPOTC/6edITOayA5o7fWlba
         VqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fzPqklm51f4d+04Hk2lQiF3YOc8XKDMT60XYkopdcUs=;
        b=Ge2TeQeQ+8Eo70Ay+cTZKXks03zVd2Lx35j9f7mnUJAeEKMKgqzWbE406osarnq9VV
         ay2GixGxP1cE1zCiHZcdyZBLKWW20s0lrF144R9DUcFoq4mLFILP8wEIr/pTPL2Fu1/L
         KXR8Scp8+4AhGGSq4gV67fhp95vDbFH/NlrvoqotmzWU2+avpH8AkMLvTpw/WJ07iT7e
         fveqBo2JwYrPrPkgJOQ2Nhy9MheeE0x5dtBX3L3oueb2JFd8FHZyVZKg0ivpjy+dVtR3
         V2/nVUyyVanK+a8vzhlfN0vqBCY8KP5GQ7LeT6V+1En4CJ4HlYv7sgg7MIXYKyT/Y8wX
         FDXA==
X-Gm-Message-State: APjAAAWJk5A2GQEcGvaX3DqF0fctIiMjgXbrW2lfAId/b4V9XwAC8K4W
        HC7WOH3b+TMV4JMEEfmLlRmmkQxNw4x+zVAmaMANgA==
X-Google-Smtp-Source: APXvYqy2JE5Ni1hucVa+uC4X3b7zH+41DjbxZJ2O7HjBDpIvPEzKv2S1eu0QvaHdn8sa03AeYVlSy23xr8VmtmUiRPM=
X-Received: by 2002:a05:6808:498:: with SMTP id z24mr12274927oid.114.1574427854113;
 Fri, 22 Nov 2019 05:04:14 -0800 (PST)
MIME-Version: 1.0
References: <20191120142038.30746-1-ktouil@baylibre.com> <20191120142038.30746-2-ktouil@baylibre.com>
 <CACRpkdaZrvPObjyN4kasARzKZ9=PiAcvTzXzWkmC7R+Ay5tU8w@mail.gmail.com>
 <CAMpxmJWSgYjcGdR7Zrj-=nA+H8cYfZUriHQPxN=8zgPDvD-wTA@mail.gmail.com> <CACRpkdaW82pgQivc0VVgqqVv4fgXxMyGD3Lo8YHcMK7aGPDKaw@mail.gmail.com>
In-Reply-To: <CACRpkdaW82pgQivc0VVgqqVv4fgXxMyGD3Lo8YHcMK7aGPDKaw@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Nov 2019 14:04:03 +0100
Message-ID: <CAMpxmJU_0MzroyD_ZF5WOxpZz3dkADLOmW7aKpWdJ7GCvo-RnA@mail.gmail.com>
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

pt., 22 lis 2019 o 13:53 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Fri, Nov 22, 2019 at 1:47 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
>
> > what about the existing bindings for at24 that don't mandate the
> > active-low flag? I'm afraid this would break the support for this
> > specific chip or lead to code duplication if we had this in both nvmem
> > and at24 with different logic.
>
> Hm yeah I realized this when I read patches 3 & 4.
>
> I would to like this:
>
> 1. Add a new generic property
>    writeprotect-gpios that mandates to use GPIO_ACTIVE_LOW
>    and use this in the new example
>
> 2. Deprecate wp-gpios in the binding, keep it around but deprecated.

This is a pretty standard property though - for instance it is
documented in the main mmc binding and doesn't mandate GPIO_ACTIVE_LOW
either. I think this is because nobody says that the write-protect
line must always be driver low to be asserted - this is highly
implementation-specific.

Bartosz

>
> 3. Add a quirk to gpiolib-of in the manner of the other quirks there
>    (like for SPI) so that if we are dealing with some EEPROM node
>    like at24 and the flag is zero, tag on GPIO_ACTIVE_LOW on
>    the descriptor.
>
> The driver will now handle the semantic of both cases
> with gpiolib-of providing a quirk for the old binding.
>
> This is how we solved this type of problem before.
>
> Yours,
> Linus Walleij
