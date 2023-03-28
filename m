Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11B096CC03F
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Mar 2023 15:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbjC1NLN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Mar 2023 09:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232775AbjC1NLL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Mar 2023 09:11:11 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C45AF17
        for <linux-i2c@vger.kernel.org>; Tue, 28 Mar 2023 06:10:49 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-545ce8e77fcso151537637b3.1
        for <linux-i2c@vger.kernel.org>; Tue, 28 Mar 2023 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680009044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5yUH2O4hFCVjfaJWgubVrQf+rHb0zN2XaPsX21lAqI=;
        b=vpa/+dtXjYAGKZeU8wx922IUmAzz10Ey2PwnEv3C6YNXcpfFqDvPP9DAyCYP/Rp6US
         xopnZ+5Vz+RzGo033bP6o44pPbxUQ9qrXT8ouYCOeR2mmX29fKdZPNQI6JXw5VVtCEbE
         K2d+jCn3Qr38rlPs7tLJSjq5sKNy+HrzQ8WvMXu1/KBgRyf4B2oc3g/ocJ530XxOA0A0
         mzHUzru5ARo8f8qnw0hvTNU90vLr2XYzmJdAPqUp4fQ94R85EvyzoH41ISOnWdg8vxGS
         f18UVQbyZ9MWZ3D3f3WgH4G8oNm9zUEnX5ryw0NdgpkDWURzHPsXfbCjkgo2eYmZhQmT
         +xCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680009044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5yUH2O4hFCVjfaJWgubVrQf+rHb0zN2XaPsX21lAqI=;
        b=xOTRQ0CNQcUXsMRBWN+tiUXokl5a+yacYEdezHv0MMtM55Hh7Yn+uZ9O/hsLul8PmE
         p0G7EtgiVJ7Askep86AO5vnH7LDzYOxLv0u3HH6h8HbyqkQ60NDGLCfYx/3FPGNCljSe
         FVOfTGFf1hOm0KGTDZI1jWDZjLtCGZ/RtSNiCs0Hf+gX+mbyxuiurRT/WwADcxo37KvX
         QY4vAnGWA3HQvzUnDLBq/oLUakYMOVo5QvwtMDy+yKgw5rAyjSgHY8GCb9woyWBqUwLv
         ZiZU98vH0unsrdAPcOFo1lGi4aes5/fdY7zOy9VnoRr1iX0Wjjz2z9F8w56g42M2BhLh
         yzQw==
X-Gm-Message-State: AAQBX9cPlL0Cosm6BjQJmgUX/bwvtVTl4q6VO4Nk1ThLerLCPaZ3x+k9
        AheHlrw9k7JBrU840OOswCA7oS24yYewhw82niqWLQ==
X-Google-Smtp-Source: AKy350bdKqptsJnHXGuH0PKZyaYDntgiQ0cShdje6zVHnvCC14jNHBYIsZq725pn7qWvX7BedhrW3FtTFjBXS25A3qI=
X-Received: by 2002:a81:b721:0:b0:545:3f42:2d97 with SMTP id
 v33-20020a81b721000000b005453f422d97mr6264242ywh.3.1680009044455; Tue, 28 Mar
 2023 06:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com>
 <20221122-mt8365-i2c-support-v6-2-e1009c8afd53@baylibre.com> <945d8a82-80b3-8ae2-3b2a-7011621ad8d9@collabora.com>
In-Reply-To: <945d8a82-80b3-8ae2-3b2a-7011621ad8d9@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Tue, 28 Mar 2023 15:10:33 +0200
Message-ID: <CAFGrd9oV9isSmpsT7VZ6VY4VpW4RtNnM4J+t_TbRMwt7t13gRw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk board
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le mar. 28 mars 2023 =C3=A0 12:05, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 28/03/23 11:04, Alexandre Mergnat ha scritto:
> > Enable the I2C0 bus provides communication with:
> > - The integrated RT9466 Switching Battery Charger.
> > - The integrated MT6691 LP4X buck for VDDQ.
> > - The integrated MT6691 LP4X buck for VDD2.
> > - The pin header, to plug external I2C devices.
> >
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/b=
oot/dts/mediatek/mt8365-evk.dts
> > index 4683704ea235..adc79ba14b33 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> > @@ -87,6 +87,13 @@ optee_reserved: optee@43200000 {
> >       };
> >   };
> >
> > +&i2c0 {
> > +     clock-frequency =3D <100000>;
> > +     pinctrl-0 =3D <&i2c0_pins>;
> > +     pinctrl-names =3D "default";
> > +     status =3D "okay";
> > +};
> > +
> >   &pio {
> >       gpio_keys: gpio-keys-pins {
> >               pins {
> > @@ -96,6 +103,14 @@ pins {
> >               };
> >       };
> >
> > +     i2c0_pins: i2c0-pins {
> > +             pins {
> > +                     bias-pull-up;
>
> I prefer seeing pinmux first, any other properties last....

Here the pinctrl binding cleanup [1]

Regards,
Alex

[1]: https://lore.kernel.org/all/20230327-cleanup-pinctrl-binding-v1-0-b695=
e32e4f2e@baylibre.com/
