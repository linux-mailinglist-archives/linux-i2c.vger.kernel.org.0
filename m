Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59F296CA1CD
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 12:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjC0K4u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 06:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjC0K4t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 06:56:49 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F479110
        for <linux-i2c@vger.kernel.org>; Mon, 27 Mar 2023 03:56:48 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id r187so9949086ybr.6
        for <linux-i2c@vger.kernel.org>; Mon, 27 Mar 2023 03:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679914607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/V3pA35xhVCbP9jkYQO9e9S5qEV2hgRETTuNLYG0J5I=;
        b=q6NUh0GLhbSm+jdtm5u/zJSq9hxnLKIfoo86F6ho5smnjf34w4TPsj9OZwgJekDkfe
         W+/E4fPYuxWqCcR0vFt/V5DtbFMv76+JyAmmnJ0wDwyX9VkezXK6dmfKe0lGXCkVV1nQ
         punl2iTjp0SNLSPRDx0NFGQ5yRKS1RhOa+esRXcB0rDOTQMuv6QnlQ6J0w3XbombUITr
         maO1C4mmuLpNd4Yky5AvLakgbvtYmCIuyXvMSstF73DGH90kUum/xdYY4Lvz/2gGcsF1
         BKAD5nHXNHn0M7WGb+KgnAMiTaGScaC4MXH6KxkSk+tALMQm2DQxRv8i6rZRUoe1a891
         pdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679914607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/V3pA35xhVCbP9jkYQO9e9S5qEV2hgRETTuNLYG0J5I=;
        b=FQNvWOa6wHd96q0n7ZAyaZVP3EccmDaQuai38+I6EFgXoQb0PY9hl4GsTGik0Wv0GQ
         4ml3U0bDxqaAXS4WebHXFEcruOKQ2HVQYeTsi6m3rBrDHF2hpcpeosuQ0yXYrspuL4gP
         J/9SmcYW9BemuxknATEQnXK5DMQ+UXNY74HNHy7EN4yjTtjkqXmMvkTVZtSXIKKlKsI2
         o74U/UxUL9T9RHo+Hd8U38ilxPWN34WAU3L3EnbRRVaQGwOWZzwjqHP2Z9vz7wMMRB1v
         NmYJ0V0eq1nCVNnNwPseiGdq7wp6yIwDVuhK5oQolOjt3rvqJO7RAGgTTvhiWleABu/r
         LaMQ==
X-Gm-Message-State: AAQBX9erL34pu2RXbW4I+KshBE4wJuqv9odyGif/oPX8wG+d+6ASeAm7
        AwfnsPvbER8+MMKQ/t+zrvxuBHOkEFGKk2xNtmlFmQ==
X-Google-Smtp-Source: AKy350YfvVDOEdafb4m5KIOnnCg2t8RAuLdF4lY57Kt2SzbDhA40QER8ozVCwQkqO3tcWU5y9O4EoOR4PmQqRw+iAnQ=
X-Received: by 2002:a05:6902:1181:b0:b6c:2224:8a77 with SMTP id
 m1-20020a056902118100b00b6c22248a77mr7052843ybu.1.1679914607297; Mon, 27 Mar
 2023 03:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221122-mt8365-i2c-support-v5-0-6e4f3b54937f@baylibre.com>
 <20221122-mt8365-i2c-support-v5-2-6e4f3b54937f@baylibre.com> <2a1b1f66-970e-5adb-389e-b9c47a790712@collabora.com>
In-Reply-To: <2a1b1f66-970e-5adb-389e-b9c47a790712@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Mon, 27 Mar 2023 12:56:36 +0200
Message-ID: <CAFGrd9pf+ojPDciF3Mtw-QT51LZCj+GNLHXurGx_vcC17GHA2A@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk board
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

Hi Angelo,

Le lun. 27 mars 2023 =C3=A0 10:45, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 27/03/23 10:27, Alexandre Mergnat ha scritto:
> > Enable the I2C0 bus provides communication with:
> > - The integrated RT9466 Switching Battery Charger.
> > - The integrated MT6691 LP4X buck for VDDQ.
> > - The integrated MT6691 LP4X buck for VDD2.
> > - The pin header, to plug external I2C devices.
> >
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/b=
oot/dts/mediatek/mt8365-evk.dts
> > index 4683704ea235..35cb142004a4 100644
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
> > @@ -96,6 +103,15 @@ pins {
> >               };
> >       };
> >
> > +     i2c0_pins: i2c0-pins {
> > +             pins {
>                         pinmux =3D ...pins...
>                         bias-pull-up =3D <your-pull-up-adv-value>;
>                 };
>
> ...and please do *not* use the mediatek,pull-up-adv property: this is
> supposed to be there only for older devicetrees and there's a replacement
> for it.... unless you have any specific reason to do so (and if you do,
> you should well explain that).

bias-pull-up isn't necessary currently because MT8365 doesn't use MTK
paris/moore drivers.

> Besides, if you introduce the usage of that property in any 8365 devicetr=
ee,
> the previously proposed 8365 pinctrl cleanup will become a bit harder to =
do.

I'm thinking of deprecating the "mediatek,pull-up-adv",
"mediatek,pull-down-adv" properties from mt8365 pinctrl binding too.

Regards,
Alex
