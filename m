Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE373E2A55
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 08:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404222AbfJXGWl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 02:22:41 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45684 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727750AbfJXGWl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Oct 2019 02:22:41 -0400
Received: by mail-ot1-f65.google.com with SMTP id 41so19647722oti.12
        for <linux-i2c@vger.kernel.org>; Wed, 23 Oct 2019 23:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yZG9jtnuedOt/dHRAYWtgX9vQPKuKorOkKTpY87wyXk=;
        b=Y0Ugk/GkYYSJvfvSLIIRehaDu7G67d+YIEMhVeWgQ6hkMbNhBCGfy/0Ti7kxXNizWQ
         hMbjNMj+HgU8BbK7r0tTchIFVVQbV5lhYo8/lG/R1mVuI4F2cvog2Y4YcJgMdHG5CteZ
         uirFwSv4l+I+eYBe1BRuO2vM6IPfVSWHf6iNqKsviquihddTxgf10/zDKQu/gnDl10mF
         kbPz3KsxZrayQyuzNyiwIVIk8meycKiYg7Mg93ladWbWIRjMbZIgtFhKfU7ssbHgjwzD
         rTbkpI1mUHKts4Wn2qyoFblGlASbBIUxPsGLJF+uGyhAvLuQ/3Cz8fF8AvVBunekpIy9
         S/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yZG9jtnuedOt/dHRAYWtgX9vQPKuKorOkKTpY87wyXk=;
        b=AUUmWSkc/2dNWREXRhhplo6i0+HYOqHP9GeKDE1xqXdZaznjHiM2opJv/7kixcovjj
         JpQvGxSxRen5TT7D4km3EtF+0JL2EryqP4F0dsVbd9SQ7AcZOf2cb6feBGk0vOzRX/X0
         w/S5R7wDZ8CDKoMAZdhv9wTh+VCrZIaAASEW1RqB9sUtSAxnyVBbGN+Dasw1CK10vP0t
         6RPbvJLGSX3CLkf1exid7JZatjkvFeruJW4AFZki3NZvy3qaZGWwBU3xHFzq2Mo7+4cg
         g2sN4gmff8+UXp2c0v55iH4ItOD03+2GQdTwPbEF495A3WyV8okdlZxsRuCMLzHm3kCM
         5Hxw==
X-Gm-Message-State: APjAAAU+FisML5OzMoCib5Ap5WTakxMcz7yBkqg2dWw3xAwuvXDobmHQ
        KatF1kgHig3NLgEp5r4vVOcnXlg9d6qbVnokH/04Pi+/
X-Google-Smtp-Source: APXvYqxJku0jD1DLeuOdSJmz+cYvJj75K9Mr00GQYG+N9hxnoES/hgjbwd23TIaXuqUWdX5hvF6wbbZk3Q31ac5fT4k=
X-Received: by 2002:a9d:7dd6:: with SMTP id k22mr10090655otn.256.1571898160578;
 Wed, 23 Oct 2019 23:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com> <20191018082557.3696-2-bibby.hsieh@mediatek.com>
In-Reply-To: <20191018082557.3696-2-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 24 Oct 2019 08:22:29 +0200
Message-ID: <CAMpxmJW_HQnL8i5FnKcVUs=ZyrnaFe6X+oqG38-v=O05d5vNxw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-binding: eeprom: at24: add supply properties
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

pt., 18 pa=C5=BA 2019 o 10:26 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=
=C5=82(a):
>
> In some platforms, they disable the power-supply of eeprom and i2c due
> to power consumption reduction.
>
> This patch add two supply properties: vcc-supply, i2c-supply.
>
> Changes since v1:
>  - change supply name
>  - rebase to next
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documen=
tation/devicetree/bindings/eeprom/at24.yaml
> index e8778560d966..578487a5d9b7 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -167,6 +167,14 @@ properties:
>      minimum: 1
>      maximum: 8
>
> +  vcc-supply:
> +    description:
> +      phandle of the regulator that provides the supply voltage.
> +
> +  i2c-sypply:
> +    description:
> +      phandle to the regulator that provides power to i2c.
> +

Something was bothering me about this patch so I came back to take a
look. Can you explain what i2c actually stands for in this doc? I hope
I'm misinterpreting something and it isn't that the driver disables
the regulator powering the i2c bus controller?

Bart

>  required:
>    - compatible
>    - reg
> --
> 2.18.0
>
