Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7BF5494D3B
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 12:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbiATLlg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 06:41:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbiATLlg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 06:41:36 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F9BC061574;
        Thu, 20 Jan 2022 03:41:35 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id p11-20020a4adfcb000000b002dd4a3e84beso2089418ood.4;
        Thu, 20 Jan 2022 03:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fodk+9GW+hT7jfC255jsfPt58onxdEeUfIkK8XqDsdU=;
        b=WdUH7oHIpGmQ8SPtqwrJiPo6uU40+yyqDTObz92VJVqIUVRbR/huWlPO+OEemREe1i
         W9li5UVN0/fik/d4eAlyLgEX2/q5da611IuIaKDdoY15R9ZrZollWwzX5od8VagBrQSv
         J0n4ZsDqh0BW9s+QtmPtIeiM+MR8L6dJ20J9EVfNSvgWA0OJaO3j0Mbanao+KVsXKHgA
         RG7gZr1jNrv8Bx0fJNHQv5wL4DSy+KS/9M2nbNzgkJ9ph8tz3VZqI6FL4XjwwDTAHWE+
         EIvmkUrl81al3gQqJqYZCImLkVNhjGaA657N8RJmJHw951cE2ADMlFHohM1vbsHACUUj
         15sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fodk+9GW+hT7jfC255jsfPt58onxdEeUfIkK8XqDsdU=;
        b=Zh3rBzjvQLYoeGnHEUc4KwPhW60pm8y8FaLTJIMw2WyWkItsrkIOpyQhR/53mw6vZZ
         US2h6sIUJiZvvjBLvNFhF3axNuL8N+8xQbqViL/OBlVz6QVT9LphIB/CXOGWyq/FY+1h
         tbk7SB+wtDDRAI+Pi822FApSB3z5FczvQrLtnglGZucgo4XgS1pNySh9HvplOLyQ9LBF
         kEpggG1fIAfPSWYVAZw8DUvwSm1sqVFpwc70NHdWaVa+WYCWVL9d9Mvr7msadhXN+Kga
         eB45aXiuGtdxiAXiJ3gqdakxxqUHaE5lebSeCfUXSD0zEd001uZoffEKyExj2wLwbHdH
         isQg==
X-Gm-Message-State: AOAM531b0IVge3Hn39KD4RYz1hBOvz2xs+Ni7l8Al49CSmzGWIWc0Bum
        mzkIBfLjyQpRhIDxPvG4SvdGxT5+9f5Mx/jK3x4=
X-Google-Smtp-Source: ABdhPJyP1IfasnEpm5ZNB/lJD5ftcs9/ELkgDdsDowFlQRyxkRt4OJYwHHz6cCY6j3nkhbn8c3SAq/Q8lMLf1UPjlws=
X-Received: by 2002:a05:6808:1b25:: with SMTP id bx37mr7085479oib.129.1642678895086;
 Thu, 20 Jan 2022 03:41:35 -0800 (PST)
MIME-Version: 1.0
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com> <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Thu, 20 Jan 2022 12:41:23 +0100
Message-ID: <CAFqH_53T+w9gmbTLCt_c4ZR7=NV21hL4Hh0zn4pwm4Pqb0_L=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: google, cros-ec: drop Enric Balletbo i
 Serra from maintainers
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Simon Glass <sjg@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-i2c@vger.kernel.org, linux-iio <linux-iio@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Missatge de Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
del dia dj., 20 de gen. 2022 a les 11:40:
>
> Enric Balletbo i Serra emails bounce:
>
>   <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table
>
> so drop him from the maintainers, similarly to commit 3119c28634dd
> ("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

I'm fine with the removal as I don't have access anymore to this
hardware so it doesn't really make sense to be there. Sorry for not
sending the patches myself before.

Acked-by: Enric Balletbo i Serra <eballetbo@kernel.org>

Best regards,
  Enric

> ---
>  .../devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml          | 1 -
>  .../devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml       | 1 -
>  .../bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml    | 1 -
>  Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml | 1 -
>  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml        | 1 -
>  5 files changed, 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml b/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml
> index 20e1ccfc8630..2d82b44268db 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml
> +++ b/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml
> @@ -8,7 +8,6 @@ title: ChromeOS EC USB Type-C cable and accessories detection
>
>  maintainers:
>    - Benson Leung <bleung@chromium.org>
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
>  description: |
>    On ChromeOS systems with USB Type C ports, the ChromeOS Embedded Controller is
> diff --git a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
> index b386e4128a79..6e1c70e9275e 100644
> --- a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
> +++ b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
> @@ -10,7 +10,6 @@ title: I2C bus that tunnels through the ChromeOS EC (cros-ec)
>  maintainers:
>    - Doug Anderson <dianders@chromium.org>
>    - Benson Leung <bleung@chromium.org>
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
>  description: |
>    On some ChromeOS board designs we've got a connection to the EC
> diff --git a/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml b/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
> index 099b4be927d4..00e3b59641d2 100644
> --- a/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
> +++ b/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
> @@ -10,7 +10,6 @@ title: ChromeOS EC MKBP Proximity Sensor
>  maintainers:
>    - Stephen Boyd <swboyd@chromium.org>
>    - Benson Leung <bleung@chromium.org>
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
>  description: |
>    Google's ChromeOS EC sometimes has the ability to detect user proximity.
> diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> index 5377b232fa10..e8f137abb03c 100644
> --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> @@ -10,7 +10,6 @@ title: ChromeOS EC Keyboard
>  maintainers:
>    - Simon Glass <sjg@chromium.org>
>    - Benson Leung <bleung@chromium.org>
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
>  description: |
>    Google's ChromeOS EC Keyboard is a simple matrix keyboard
> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> index e9c46430fd8a..66a995bbbbe9 100644
> --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> @@ -8,7 +8,6 @@ title: ChromeOS Embedded Controller
>
>  maintainers:
>    - Benson Leung <bleung@chromium.org>
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>    - Guenter Roeck <groeck@chromium.org>
>
>  description:
> --
> 2.32.0
>
