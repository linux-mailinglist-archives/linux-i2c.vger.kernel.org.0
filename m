Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36D26DC21B
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2019 12:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391218AbfJRKHj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Oct 2019 06:07:39 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41118 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727249AbfJRKHj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Oct 2019 06:07:39 -0400
Received: by mail-ot1-f66.google.com with SMTP id g13so4466976otp.8
        for <linux-i2c@vger.kernel.org>; Fri, 18 Oct 2019 03:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4Vu8JiXTmFUPI/NYdTMI5V6tpTC56aVATRO+EZxqMUg=;
        b=LLPHKZ4L0zMURR2Gs1N6RGR+WCncysqrCQhJ+Up1lLWx1YQAz6Xw7gfUDZwgmexvb3
         bG6f0VYc4/Rlx7PFRao81sUm2E04I2YOQ/lTR937IUMIMCf3bGwMK1D0tlqQW+jmzqEu
         MOzt8N79OaXkoo9zj5sUGBWpYCjkUHX7Z1fPE+gujWcHrkmjPMiaMwfmnUrEu16Wlp3n
         Bb8bZj+xp81L7unvzEa2em6missVtgIktP8tkaA8nO3pKaSYMsQwF1Kzlp3sbPv/1xpP
         8DXBphuQt1aMPqkOzzBwULcHr8+HMfgNZOvIeUtzP2jzrJVhK5PHcDeJ508k/2NCc0Gv
         bB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4Vu8JiXTmFUPI/NYdTMI5V6tpTC56aVATRO+EZxqMUg=;
        b=MwBVq+QsmW0HpEsfhe5wqQYoeeDZ+qPemN+qum5m6tcJmyx+cxYUJs+JmoyAzbmr25
         zAC8yKmlRD7gBBtHffpSRYk//boDP654P9sUDqmLsqzzMCoh+QZhVrBcn2iaqGEFQKIZ
         ftbwrssc611Dbp+QQ3O00gu3tQ96KY0B2qm+mAtMTy7nY+VHKGTfojpgbd/wSJL0aZwk
         L93DtX2L5AzgEuMFvAlyterUrTbq9WrNnenB8Iq5jlYyhdHa6fv9qU49VBHvxjJfZuE9
         4FBn/y/Aq8VeHF83ulElOgwM0zuCqMatpAnvKyfzNt+zqCaC6QaeMR2ppRz+/VgItX/8
         YYTg==
X-Gm-Message-State: APjAAAWwk0rpw64eyhKMs/4jhSq5zeet237un9wUwW3ETiVJRgiug9tY
        w95iissVqejQXkGdnt3zPWsKXH9uwWE6o+ytw8klKg==
X-Google-Smtp-Source: APXvYqxRP3wqz5ncW0B7ywyoT7SUYZwc6ng/vET8V34Tk1Ptv2ONCt1vNB82+PthvDjkuJlh5QtMu0jsKD64wyyrAbU=
X-Received: by 2002:a9d:344a:: with SMTP id v68mr7111048otb.85.1571393258795;
 Fri, 18 Oct 2019 03:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com> <20191018082557.3696-2-bibby.hsieh@mediatek.com>
In-Reply-To: <20191018082557.3696-2-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 18 Oct 2019 12:07:27 +0200
Message-ID: <CAMpxmJXaHqA9S+kxNH_RP3cts2E2Pa5eX0r6GbjYGg1XujyvLg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-binding: eeprom: at24: add supply properties
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
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
>  required:
>    - compatible
>    - reg
> --
> 2.18.0
>

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Rob: if it looks good - can you take it through your branch together
with the conversion patch from this cycle?

Bart
