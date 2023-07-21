Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7307175D10C
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jul 2023 20:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjGUSGY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jul 2023 14:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjGUSGX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jul 2023 14:06:23 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A422273C
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jul 2023 11:06:22 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fbaef9871cso3610807e87.0
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jul 2023 11:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689962779; x=1690567579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiohpvIM88q923ApY+TFuUJapPlTrtIkZpRLVAxwyJE=;
        b=hIMOorrUg3HxNRUPkeCV9OgRZ3TNjDneByV1BwppZoGKhMPuYwWrjw9FPC23vgjhnO
         BAhuKN3t7XLRzqirPDdhQub3+Jg1ozWFZ9LGOD3QSPE5jSC5AT3SJX2IIgKhK/UDyTZg
         2XHg8RnuOQDnzQ1Tuvpf4TfTKF/P7t9xt0Bsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689962779; x=1690567579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiohpvIM88q923ApY+TFuUJapPlTrtIkZpRLVAxwyJE=;
        b=dHJyKvOZ3RUTv+ZVkMQy+MtOOcq88tMhJwBHE09LmqHvTLeY/QEHD0PJCtb4Yb7e+4
         Gi/gO8wmoi6BAhj3o0ne/7BXiA1MqEPptwSlAmsZZMSJe6AOC9N/vv+TODS54ult0oCP
         gSX4VmAwBF+yrgfEeGksJuX1H0vswWoojjRe0urfldXmE5M9KAN2eSfiLsW00IVXg51J
         Ml3zgEH4Qj/+KPUwlEw4/viUoZK4xAB3iQNXKmSU5G7L2wDURHdYPbfrfzYCQJUKNDAZ
         fEIQ3WN1Uq6xGuMY71baSlTeKGVxrBCc41g2X83yIpEd0O3JmrPQ2kqg61ywoKuCxKFw
         sPAA==
X-Gm-Message-State: ABy/qLb0gt98yL/p8Yap385k/sLdS7wwG4VZlN2DpmSHWzfF9Tq3vWt/
        T1NXJ1V6Wntsc6bCA3XnKExx7/ivlP2syron+Iz+wQ==
X-Google-Smtp-Source: APBJJlHjt5/m2KetrOYu11wERVvUhXyo2aZy/GK9opOiNLCFqSCmde0ihn0ERiu4rdm5IXIh+PI5Cw==
X-Received: by 2002:a05:6512:3134:b0:4fd:d6ba:73ba with SMTP id p20-20020a056512313400b004fdd6ba73bamr1697110lfd.37.1689962778806;
        Fri, 21 Jul 2023 11:06:18 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id l17-20020a1709061c5100b009888aa1da11sm2445320ejg.188.2023.07.21.11.06.17
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 11:06:17 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-521e046f6c7so1219a12.1
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jul 2023 11:06:17 -0700 (PDT)
X-Received: by 2002:a50:d717:0:b0:51d:ebed:93a6 with SMTP id
 t23-20020a50d717000000b0051debed93a6mr14771edi.5.1689962777300; Fri, 21 Jul
 2023 11:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230721133035.15222-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721133035.15222-1-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 21 Jul 2023 11:06:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U1humE-MrCgWmDqSjGZPnzP04-ScGcY7yBETuW-viyHQ@mail.gmail.com>
Message-ID: <CAD=FV=U1humE-MrCgWmDqSjGZPnzP04-ScGcY7yBETuW-viyHQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: arb-gpio-challange: convert to DT schema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Fri, Jul 21, 2023 at 6:30=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge=
.yaml b/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.yaml
> new file mode 100644
> index 000000000000..17f15490f073
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.yaml
> @@ -0,0 +1,138 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-arb-gpio-challenge.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO-based I2C Arbitration Using a Challenge & Response Mechanism
> +
> +maintainers:
> +  - Doug Anderson <dianders@chromium.org>
> +  - Peter Rosin <peda@axentia.se>

While I don't object to Peter Rosin being listed here if he wants it,
I suspect that you added him because he was the author of
"i2c-arb.txt". I guess that file was really only added to try to keep
things common between this GPIO arbitrator and the one that he cares
about: "nxp,pca9541.txt". Probably he doesn't want to be added here.

Speaking of "nxp,pca9541.txt", it seems like you need to convert that
before removing "i2c-arb.txt". It still refers to that file even after
your patch, doesn't it?

In any case, other than that, this looks fine. Thanks for doing the convers=
ion!

Acked-by: Douglas Anderson <dianders@chromium.org>

-Doug
