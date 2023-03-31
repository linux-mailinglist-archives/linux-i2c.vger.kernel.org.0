Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE5126D2020
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Mar 2023 14:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbjCaMYB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Mar 2023 08:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbjCaMX7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Mar 2023 08:23:59 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74CE91F7A4
        for <linux-i2c@vger.kernel.org>; Fri, 31 Mar 2023 05:23:35 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5463fa0c2bfso81056847b3.1
        for <linux-i2c@vger.kernel.org>; Fri, 31 Mar 2023 05:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680265413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Erj+LpG9U9tgf75fYxXUx/4AP5Lrz3YtH2NJWnrUADc=;
        b=6PPQNQ38F2taYSfQU9v2DEAamsnh/Lbnu/amvdM8KrjKWByBjQNFRumzgQ6bFTIVcg
         oqM5cD5GzvtXrq4QKgf0QR24wLthmKi0vHGjsw7wNe07GZf/AhV6wtCJUS2GRKa0Dkm9
         ogGQtK1Pk3rw0HafvOpbT74mY8725/u7lOPfbjAFImHmsYNBQ8RthlKUhiV6qC5Zt8VK
         azNKQnT7w+QKvkD1bLLpQvJ0w7Q28641njy0RIuooeWVVJvGVyRnUJxVXHIysYuHG4Yi
         PcFfn6mUu+gLGO67975HLvFAQRxLXxZefnMgkFzwdKxaeJZERKx0YzsJbzsVX2r/R/D2
         gbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680265413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Erj+LpG9U9tgf75fYxXUx/4AP5Lrz3YtH2NJWnrUADc=;
        b=DQsnpgRTRAXmBW5xxIRcPENem8/O6knZfr7W++mqP5bkCA7KTeC6L5hMr0dpkC97fR
         lNR4UYTr2bURR4aO4/ZF5tOgjQ6iLWXdQrrsMbc0oudxg1JhTnzXjbl5Q8eZ0NhA1ZIX
         Xd0hkYr+MIgFchLtoG8lsdmYYMj7s0QAcgPhUlmy9U0/hW8oL6nceJPoLkz6OXYvjmOV
         cegs6U5nwEAcRK1HfK7r4jEyQ4de20Jyxa/9s3/QVz+sjPHhL2++KwCiOFUoHXT9lO/Q
         7vjjbbeEyxittYy7llrF8zC2/ls3uiPvLNUTWiydmkdQywwPXdwZUbtXyJEbr/ublrI/
         e58A==
X-Gm-Message-State: AAQBX9epeOlMkaFoevE/VrvPLKHK60i4b6K+kgnl7JmP8MhYLZyZASzp
        /daLyTTqrvFhosq15+94UB4bWt8g3tHJd0yiXVR43cYdEQJBQA1j
X-Google-Smtp-Source: AKy350aL53ZPqA6HfapR1wIrwTkgdBrTNV+3+AGc+bH/1duJuWV8Tg9mBbJRl2WjZvPtf0iLrGSnfzJ9TL0IQ2zu33o=
X-Received: by 2002:a81:ad5d:0:b0:540:e744:13ae with SMTP id
 l29-20020a81ad5d000000b00540e74413aemr12502859ywk.3.1680265413041; Fri, 31
 Mar 2023 05:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com>
 <20221122-mt8365-i2c-support-v6-2-e1009c8afd53@baylibre.com>
 <945d8a82-80b3-8ae2-3b2a-7011621ad8d9@collabora.com> <c654905d-a8c8-fafb-b8c5-2992b7cac0d8@gmail.com>
In-Reply-To: <c654905d-a8c8-fafb-b8c5-2992b7cac0d8@gmail.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Fri, 31 Mar 2023 14:23:21 +0200
Message-ID: <CAFGrd9oi9UAAXw_jUN=4wGN0GeMbSsOWa6ceBYSDxf0YikHFPQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk board
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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

Thanks Angelo and Matthis for your time !

Alex

Le jeu. 30 mars 2023 =C3=A0 19:14, Matthias Brugger
<matthias.bgg@gmail.com> a =C3=A9crit :
>
>
>
> On 28/03/2023 12:04, AngeloGioacchino Del Regno wrote:
> > Il 28/03/23 11:04, Alexandre Mergnat ha scritto:
> >> Enable the I2C0 bus provides communication with:
> >> - The integrated RT9466 Switching Battery Charger.
> >> - The integrated MT6691 LP4X buck for VDDQ.
> >> - The integrated MT6691 LP4X buck for VDD2.
> >> - The pin header, to plug external I2C devices.
> >>
> >> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> >> ---
> >>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 15 +++++++++++++++
> >>   1 file changed, 15 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> >> b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> >> index 4683704ea235..adc79ba14b33 100644
> >> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> >> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> >> @@ -87,6 +87,13 @@ optee_reserved: optee@43200000 {
> >>       };
> >>   };
> >> +&i2c0 {
> >> +    clock-frequency =3D <100000>;
> >> +    pinctrl-0 =3D <&i2c0_pins>;
> >> +    pinctrl-names =3D "default";
> >> +    status =3D "okay";
> >> +};
> >> +
> >>   &pio {
> >>       gpio_keys: gpio-keys-pins {
> >>           pins {
> >> @@ -96,6 +103,14 @@ pins {
> >>           };
> >>       };
> >> +    i2c0_pins: i2c0-pins {
> >> +        pins {
> >> +            bias-pull-up;
> >
> > I prefer seeing pinmux first, any other properties last....
> > If Matthias can please fix that while applying...
> >
>
> Done and queued the whole series.
>
> Thanks!
> Matthias
>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> >
> >
