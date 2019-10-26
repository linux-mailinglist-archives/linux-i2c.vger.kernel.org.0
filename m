Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BADC5E5A57
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2019 14:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfJZMFP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Oct 2019 08:05:15 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40167 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfJZMFP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 26 Oct 2019 08:05:15 -0400
Received: by mail-ot1-f65.google.com with SMTP id d8so3842829otc.7
        for <linux-i2c@vger.kernel.org>; Sat, 26 Oct 2019 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wziPjru27ecL6mZ4dPMfLGt//OSBOTgIklyIX5IY5eQ=;
        b=mb0lFk5GbEYzaV1slHpJlUJqh2SAli0n5c3YqKLabdLuIIaCmXMqVTMIGfLUyojTXs
         bI0Nuo8tfdVBmP7Wct/hRcHovPrLPGZrY0V1fsHG9+fkujNiiOEjdXr3CLMY5Wan6CT1
         nbsGMyaBhbtXue3Np2UAH5qOKhIdVYr8gy2Eg9VqnRNo6jho+mI6f/RuzKR28DwHViGT
         4YT1ZWB1JkgehArTICssZj3d7aojTAGZ5ILIvxuNYDdGUj4dsAqobsWyaBgJ6mHA/TFH
         jUvdfriFVC1xCEDPMrcCUN8VtpcwMHWpDeZeVwhCNA+Krwpov7o3nz/efd29IR7/RAno
         pCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wziPjru27ecL6mZ4dPMfLGt//OSBOTgIklyIX5IY5eQ=;
        b=bBFin13jTygEXiKpvfZc5y2040pCzIspi9OJFm5Cte65JLAWMujNUsXg13wNRMIYS/
         4OFz5evqUFRxce0d7FY42axq+wlEAKa1QAy7RSptghU6S1LfwqSEW3rlq1uvYOHZ5CDn
         XL5zVRR2RuyCWMxfxehUkief+dtv+aBqSZo6JvzWwtIiqDhGK92Q81M1UU7pkf0ig1Va
         PjEwJbKhqjrd5XBR0M8MOpCQq+kkKnWPLDSi9OsdBm5JcMbtUtk6YnjNJIe4CLKaexxq
         GDxvVNvgttpvdgE4WH65UWf5O81TcAh/86S+662Io2DwXALbKJoJexv+ZwCfxIOgyUiJ
         ro1g==
X-Gm-Message-State: APjAAAUEiPnoJD4YTamFONW9kTYF91X3Y39jC68qOzVNOFUj9uInTzQv
        5DWroEzAe7k+dEQtunn7GhebFv8BNxZcW8Tbpv5Ksg==
X-Google-Smtp-Source: APXvYqw1CBK/GZ4OGs5cVGiCrX5U6xfZaJCv+7JjUnIhmAHa+oK5tXFTkv3DfBtKhkprvzG3Yt7Se6jUWbp5I5X9ZiE=
X-Received: by 2002:a9d:6c96:: with SMTP id c22mr6546047otr.194.1572091513116;
 Sat, 26 Oct 2019 05:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
 <20191018082557.3696-2-bibby.hsieh@mediatek.com> <CAMpxmJW_HQnL8i5FnKcVUs=ZyrnaFe6X+oqG38-v=O05d5vNxw@mail.gmail.com>
 <CAAFQd5CA_53uDo6QdRcvqJ5shUG5K25f+WXCn9OYMHfSgwLMSA@mail.gmail.com>
 <CAMpxmJWzEER4iBo9-WhmumuH1nmWYvy=xud+=7wzp3op8-P7uw@mail.gmail.com>
 <CAAFQd5DNdmm4sn1JNPhnuMor50ZP4EJmymtS4hB4WkNHmKOs6w@mail.gmail.com> <20191025211000.GA8235@bogus>
In-Reply-To: <20191025211000.GA8235@bogus>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sat, 26 Oct 2019 14:05:02 +0200
Message-ID: <CAMpxmJUygTr2b+q-skb8_m9TfOiEvqoOCSjDQEi+sf9iNN0=BQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-binding: eeprom: at24: add supply properties
To:     Rob Herring <robh@kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>, Wolfram Sang <wsa@the-dreams.de>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pt., 25 pa=C5=BA 2019 o 23:10 Rob Herring <robh@kernel.org> napisa=C5=82(a)=
:
>
> On Thu, Oct 24, 2019 at 06:32:38PM +0900, Tomasz Figa wrote:
> > On Thu, Oct 24, 2019 at 5:40 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > >
> > > czw., 24 pa=C5=BA 2019 o 09:02 Tomasz Figa <tfiga@chromium.org> napis=
a=C5=82(a):
> > > >
> > > > On Thu, Oct 24, 2019 at 3:22 PM Bartosz Golaszewski
> > > > <bgolaszewski@baylibre.com> wrote:
> > > > >
> > > > > pt., 18 pa=C5=BA 2019 o 10:26 Bibby Hsieh <bibby.hsieh@mediatek.c=
om> napisa=C5=82(a):
> > > > > >
> > > > > > In some platforms, they disable the power-supply of eeprom and =
i2c due
> > > > > > to power consumption reduction.
> > > > > >
> > > > > > This patch add two supply properties: vcc-supply, i2c-supply.
> > > > > >
> > > > > > Changes since v1:
> > > > > >  - change supply name
> > > > > >  - rebase to next
> > > > > >
> > > > > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > > > > > ---
> > > > > >  Documentation/devicetree/bindings/eeprom/at24.yaml | 8 +++++++=
+
> > > > > >  1 file changed, 8 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml=
 b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > > > > index e8778560d966..578487a5d9b7 100644
> > > > > > --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > > > > > @@ -167,6 +167,14 @@ properties:
> > > > > >      minimum: 1
> > > > > >      maximum: 8
> > > > > >
> > > > > > +  vcc-supply:
> > > > > > +    description:
> > > > > > +      phandle of the regulator that provides the supply voltag=
e.
> > > > > > +
> > > > > > +  i2c-sypply:
> > > > > > +    description:
> > > > > > +      phandle to the regulator that provides power to i2c.
> > > > > > +
> > > > >
> > > > > Something was bothering me about this patch so I came back to tak=
e a
> > > > > look. Can you explain what i2c actually stands for in this doc? I=
 hope
> > > > > I'm misinterpreting something and it isn't that the driver disabl=
es
> > > > > the regulator powering the i2c bus controller?
> > > >
> > > > In our case it's the regulator that the I2C bus is pulled up to.
> > > >
> > >
> > > Then it has nothing to do with a generic EEPROM driver IMO. I think
> > > you need to add the control for this regulator to your i2c controller
> > > driver and create a power domain where the EEPROM would be lower in
> > > hierarchy.
> >
> > While I agree that the generic EEPROM driver may not be the best place
> > to do it, neither is a driver for a specific SoC i2c controller. The
> > hardware design is not specific to any particular i2c controller.
> >
> > Perhaps we need the generic i2c core to take into account an
> > i2c-supply? Wolfram, any thoughts on this?
>
> Sounds good to me. Maybe 'bus-supply' instead to indicate it's supposed
> to be for the bus and not other things. It should reside in the I2C
> controller's node (or mux ports) though.
>
> Rob

Thanks,

in that case Bibby: please just use a single regulator for vcc-supply in at=
24.

Thanks,
Bartosz
