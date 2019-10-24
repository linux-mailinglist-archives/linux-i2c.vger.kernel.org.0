Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 049A9E2AAF
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 09:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408559AbfJXHCE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 03:02:04 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46667 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406799AbfJXHCE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Oct 2019 03:02:04 -0400
Received: by mail-ed1-f65.google.com with SMTP id r18so17754351eds.13
        for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2019 00:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r1ealINk/vBRs5MHLxZSAqk1WNqkm8mFEDI5kSywayY=;
        b=JKPsHkAtPtqdS4hoUEvmPxLvcGdqwQdaJIuY4oHxot8PcoK8c6dIW5R9L1oqyL3MW5
         V9jc3MkFg+uou+UOTA7wWD7qZ1+ohFI39luRmS5AUloEQtWrLJg5WtXqLd++nEpOxQAM
         QxyQrvmD/GQpM7AW99oufP2zUm6K/3fsH6oYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r1ealINk/vBRs5MHLxZSAqk1WNqkm8mFEDI5kSywayY=;
        b=mjKEK84qZJ+NE3Q4TGFJNp2RHL3uMUHBOC6AlX0NSnXVQjLrM16+ZbDCFGxDzulQKY
         qKRsvrj2+KqqXkO92AFxYPNnxztelhk8GBdleAj2LQsV1yddEumZ4NRQpbX8WxjzQzzX
         U0BLn+OvAS+sipFk9DHMjZAeLM4K5hVjALReWdSf++ND3wLhcow9XhC2WMjwc2QnrupR
         mfJhAju41bK/FVQX/czzZRtvLAZAc8uB9YZdE3W28/Ze95+ZY2tFVLmjAUDUAyXdrGAR
         UoNmu727kBMJ1ounpddierheTX7SrCWBbEE/o0KIA8J8b700HyQi0PwnaxUL56HKTmej
         Uw9g==
X-Gm-Message-State: APjAAAULZITZEdTfkQieOLuqG0Nm0wKysA2Lie2YCW/L7utRyVNkx4yO
        qSj+0Oknxulx74pXawv0jjm5wm5ZdcF1lQ==
X-Google-Smtp-Source: APXvYqziD3XjD9lkgp2FniJZttJtuPn+fKmHFlCiOdjken3Q+yGA9pd3fpSbVpOWluXd5KTFAeZlIw==
X-Received: by 2002:aa7:c1cb:: with SMTP id d11mr8611513edp.40.1571900520872;
        Thu, 24 Oct 2019 00:02:00 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id z65sm908035ede.86.2019.10.24.00.01.59
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 00:02:00 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 6so1303278wmf.0
        for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2019 00:01:59 -0700 (PDT)
X-Received: by 2002:a1c:a516:: with SMTP id o22mr3591177wme.116.1571900519274;
 Thu, 24 Oct 2019 00:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
 <20191018082557.3696-2-bibby.hsieh@mediatek.com> <CAMpxmJW_HQnL8i5FnKcVUs=ZyrnaFe6X+oqG38-v=O05d5vNxw@mail.gmail.com>
In-Reply-To: <CAMpxmJW_HQnL8i5FnKcVUs=ZyrnaFe6X+oqG38-v=O05d5vNxw@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 24 Oct 2019 16:01:47 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CA_53uDo6QdRcvqJ5shUG5K25f+WXCn9OYMHfSgwLMSA@mail.gmail.com>
Message-ID: <CAAFQd5CA_53uDo6QdRcvqJ5shUG5K25f+WXCn9OYMHfSgwLMSA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-binding: eeprom: at24: add supply properties
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
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

On Thu, Oct 24, 2019 at 3:22 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> pt., 18 pa=C5=BA 2019 o 10:26 Bibby Hsieh <bibby.hsieh@mediatek.com> napi=
sa=C5=82(a):
> >
> > In some platforms, they disable the power-supply of eeprom and i2c due
> > to power consumption reduction.
> >
> > This patch add two supply properties: vcc-supply, i2c-supply.
> >
> > Changes since v1:
> >  - change supply name
> >  - rebase to next
> >
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/eeprom/at24.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Docum=
entation/devicetree/bindings/eeprom/at24.yaml
> > index e8778560d966..578487a5d9b7 100644
> > --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> > +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > @@ -167,6 +167,14 @@ properties:
> >      minimum: 1
> >      maximum: 8
> >
> > +  vcc-supply:
> > +    description:
> > +      phandle of the regulator that provides the supply voltage.
> > +
> > +  i2c-sypply:
> > +    description:
> > +      phandle to the regulator that provides power to i2c.
> > +
>
> Something was bothering me about this patch so I came back to take a
> look. Can you explain what i2c actually stands for in this doc? I hope
> I'm misinterpreting something and it isn't that the driver disables
> the regulator powering the i2c bus controller?

In our case it's the regulator that the I2C bus is pulled up to.

Best regards,
Tomasz
