Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57DA4124565
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2019 12:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbfLRLLF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Dec 2019 06:11:05 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35124 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbfLRLLF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Dec 2019 06:11:05 -0500
Received: by mail-wr1-f66.google.com with SMTP id g17so1842566wro.2
        for <linux-i2c@vger.kernel.org>; Wed, 18 Dec 2019 03:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IiFtSfDjWGdjcVj/Cig3gW5ylZi2W/jVaaneb1ETE7o=;
        b=aaCfR0uOJKRxlZ0/X60eJqXxOjxofImtpit3PnZQuo2PmTiNAoDqoqUZ1rnr7eEMyL
         nyKXD3Wo0nCOQr8TT/Qk1yhUsS3YtZ/AKFs4peQWK+HLYscjC8dUwWuMGoSjCgHgu43c
         2y1N1rYGSvDo4F9T7VwOtMlQ5DP0whuL3x1A2cO6fipPV/+TDZM6r0mfGyr/MbIE6ygB
         0lNrgijd7PNF+JcJAfXu8EUUxgNu0zkCRx11SYoAIKVfkuApVrIEE3IzjZZFASZDSkxQ
         evSXUVQNVQePgtXbCmbeQKr6P0l7FmnxbWSOZTwQuXciYUwu9foOR7sc+39guYR0Jzan
         atrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IiFtSfDjWGdjcVj/Cig3gW5ylZi2W/jVaaneb1ETE7o=;
        b=Nb6mNSR2dPxycpFfvLcJB3FxPy+NOyTaFzsKHGxdElKlxfo+z1rLwVlSem95bTY7VT
         g1YWNSgNz2ZKneFIMAvp+oyrN4d1Mgb+h7FfG9nQmdRKWaIuFCRSqStLH5LCg/tAd6c6
         xqZueWunYlgHRH8+pJ8IBfSKfVoAqfgDlJpDfl4Khib7TeS/HT9GQBoPwI1Pmx8JVBVW
         WsGsaJzO/V6LZFPcmdmJ6L8e8gnIIJ096CYk8cWptUzHRmGHvC05WBdG/fXL29gwMVus
         gVDjdsjCQeCkX0byML1Mogzs+oLTNak7PuX2G1maG7XVRCsNLllHwUi1tqC4kReXTmZy
         m7vg==
X-Gm-Message-State: APjAAAVoXaHg5W5wCROPOvCnJtOiQJhT6ioqnGqcTmQorzT8twpI4Vlm
        9+vv+9Qt6LjvlGul5Eh4SZ1qP+04LW4HY+dCfTIRqA==
X-Google-Smtp-Source: APXvYqwv8hPq5nxjZHQ3sCNBeqM/+re1zUes66iqhNu796cSmk/vhcWdcgcKguzrf+023UauKjSE5fCBEw8iKR5QFe8=
X-Received: by 2002:a5d:6350:: with SMTP id b16mr2245437wrw.132.1576667463555;
 Wed, 18 Dec 2019 03:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20191210154157.21930-1-ktouil@baylibre.com> <20191210154157.21930-2-ktouil@baylibre.com>
 <CACRpkdZb6OppcdCcaQ9abdkDJMk4escyyEm1TMB75rRxoN5e2A@mail.gmail.com>
In-Reply-To: <CACRpkdZb6OppcdCcaQ9abdkDJMk4escyyEm1TMB75rRxoN5e2A@mail.gmail.com>
From:   Khouloud Touil <ktouil@baylibre.com>
Date:   Wed, 18 Dec 2019 12:10:52 +0100
Message-ID: <CALL1Z1xwd5+HeCWWG5DQ8XMph=v=UmpW+P9vG4Lg_vVvzySjiQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: nvmem: new optional property write-protect-gpios
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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

Le lun. 16 d=C3=A9c. 2019 =C3=A0 09:08, Linus Walleij <linus.walleij@linaro=
.org> a =C3=A9crit :
>
> On Tue, Dec 10, 2019 at 4:42 PM Khouloud Touil <ktouil@baylibre.com> wrot=
e:
>
> > +  wp-gpios:
> > +    description:
> > +      GPIO to which the write-protect pin of the chip is connected.
> > +      The write-protect GPIO is asserted, when it's driven high
> > +      (logical '1') to block the write operation. It's deasserted,
> > +      when it's driven low (logical '0') to allow writing.
> > +    maxItems: 1
>
> OK I guess we can't get it less convoluted. This section is consistent.
>
> >  patternProperties:
> >    "^.*@[0-9a-f]+$":
> >      type: object
> > @@ -66,6 +74,7 @@ examples:
> >        qfprom: eeprom@700000 {
> >            #address-cells =3D <1>;
> >            #size-cells =3D <1>;
> > +          wp-gpios =3D <&gpio1 3 0>;
>
> In the example please use the include for GPIO:
>
> #include <dt-bindings/gpio/gpio.h>
>
> wp-gpios =3D <&gpio1 3 GPIO_ACTIVE_HIGH>;
>
> You can just put the #include directive right before the
> example, it should work fine.

Yes sure will fix that.
Thanks for your reviews.

Best regards,
Khouloud
>
> Yours,
> Linus Walleij
