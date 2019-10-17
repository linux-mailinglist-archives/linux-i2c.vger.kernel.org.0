Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF1ACDA63B
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2019 09:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408057AbfJQHSy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Oct 2019 03:18:54 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38263 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408058AbfJQHSy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Oct 2019 03:18:54 -0400
Received: by mail-ot1-f66.google.com with SMTP id e11so1018323otl.5
        for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2019 00:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Dw+2kyt8ZMql5PW0RjpSf5DicMdc5oV3hUAm5kX6zkw=;
        b=RZus7gBvqMYLWCGht7/0F3/UnIcaEnxoSdE4aI1+vvuvdlhhQZC/FgU6YBMj6sHLw/
         9TgL9Atz7XxmkX8hy4+wnW5evRtmGF/papUQLH9ePZGassZg/rjcJv3BWnn6gcXKKH2Y
         bshGGkvxBECqxZs6+Yx4DfGfUhjOAuql1XC3QSWt4yyIz1On2QfRaa19zgZu3TnIkZKh
         wf3wJZXjIKAlXCBhsBY6f77PSepHaPQgFkNb5uL1qzbjklx3eH2bGYmrqXdnE9dLTQZh
         OysTFMav+QJDKh8ysvEaV3ZZNOaYQEKTpwI/p51bPTOoA5sl8CWaaMgZ0aT6GPcEzDsw
         uoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Dw+2kyt8ZMql5PW0RjpSf5DicMdc5oV3hUAm5kX6zkw=;
        b=BC9UWaoTNUMP8WG7r5c6ztRGyZoWP5YvF76nsJqabZa85Ge0nTIQDCjZvU2GU8IXCf
         CfleP8BrHOD5n5xBHg2GYFkcc8Kq0lobq7lJqDDPI5c7nfBe0lC2JjFYyQ5+iDJs4KQF
         pjyzKSnfgAwlaXRMJda3HyLHCOyd4GVlij8cjby59RcUMF1svNGN/aOH7w90uPuynsNP
         9yKrjE5gEIsogIhoxHRiDPYUjsCOaLp+cdpFyIkj9XLsB6vTNN+LvDR9Y6I7aVOLAxpN
         H5Gvl3/NrmvEoa38nLXsH+8OkDWG+rPR2bVNktQAb4fox2fRQUEyhWtWaH2b/f3Fyjkl
         r06w==
X-Gm-Message-State: APjAAAUQ0AfcIzqJhBJU2Hv+ALuERsHu14iRPGWtzzSiJKMoVRe/4n31
        u70Map5/xwNJf4QqeUpjH0vlGtZ3BjJV2h3/fDnhaA==
X-Google-Smtp-Source: APXvYqxyw047Hzq8OkGQCQ9WHBEgq0fMgYn7GHVJwWuxJfHwQwOYTLn37/trpQyuPInkhwLZfQ2CveWgxgWMMkLqXLg=
X-Received: by 2002:a9d:344a:: with SMTP id v68mr1848021otb.85.1571296732442;
 Thu, 17 Oct 2019 00:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191016075110.8240-1-bibby.hsieh@mediatek.com>
 <20191016075110.8240-2-bibby.hsieh@mediatek.com> <CAMpxmJWiSaXiPeDFOZvx5krp31wJmMuRM4iV-O6fHqBN_nQz7g@mail.gmail.com>
In-Reply-To: <CAMpxmJWiSaXiPeDFOZvx5krp31wJmMuRM4iV-O6fHqBN_nQz7g@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 17 Oct 2019 09:18:41 +0200
Message-ID: <CAMpxmJXKUwGn+Ud7kN1eam5_CUDuKxeG=vUMXFrC9v8MkHFd3g@mail.gmail.com>
Subject: Re: [PATCH v1] dt-binding: eeprom: at24: add supply properties
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=C5=9Br., 16 pa=C5=BA 2019 o 10:40 Bartosz Golaszewski
<bgolaszewski@baylibre.com> napisa=C5=82(a):
>
> =C5=9Br., 16 pa=C5=BA 2019 o 09:51 Bibby Hsieh <bibby.hsieh@mediatek.com>=
 napisa=C5=82(a):
> >
> > In some platforms, they disable the power-supply of eeprom
> > and i2c due to power consumption reduction.
> >
> > This patch add two supply properties: power-supply, i2c-supply.
> >
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/eeprom/at24.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Docume=
ntation/devicetree/bindings/eeprom/at24.txt
> > index 22aead844d0f..71a534577bcf 100644
> > --- a/Documentation/devicetree/bindings/eeprom/at24.txt
> > +++ b/Documentation/devicetree/bindings/eeprom/at24.txt
> > @@ -78,6 +78,10 @@ Optional properties:
> >
> >    - num-addresses: total number of i2c slave addresses this device tak=
es
> >
> > +  - power-supply: phandle of the regulator that provides the supply vo=
ltage.
>
> The pin is called vcc in the datasheet, I think it would be better to
> reflect that here.
>
> Bart
>
> > +
> > +  - i2c-supply: phandle to the regulator that provides power to i2c.
> > +
> >  Example:
> >
> >  eeprom@52 {
> > --
> > 2.18.0
> >

Hi Bibby,

I noticed that my patch converting the at24 bindings to yaml is in
next now - please add this change on top of current next right away as
it will conflict during merge window.

Bart
