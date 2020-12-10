Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9542D529D
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 05:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730872AbgLJD5g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 22:57:36 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35946 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730364AbgLJD53 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Dec 2020 22:57:29 -0500
Received: by mail-ot1-f68.google.com with SMTP id y24so3669747otk.3;
        Wed, 09 Dec 2020 19:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XtgXKp72oglbFgMKvdSmrdvqmjrEw3HulhGPrudWit8=;
        b=IWbk8i5VhOBGLVYq5OhDtkoiJMO+tJsNfzYVyCmzIb6BztyFYZJb16aAaaClzVHXSW
         FK8Ncb+5mZbBW+qz8B0yzTivpw+6aCsJGFnn1VsCfoNjYImRXnbSHQqbQlzeaY2D8nM6
         fRymueUW0bmoASbk3UdyvbOgQyAASHRpPlciWcpf2hUXMlsVau3e+F8EG80kqy44tA6r
         +rj4FwtjwQI3iB7KzrqlwMylbNodXmgRReH+7NQ0Lw0A83Y/BsHHQ3qTdJoSqroXBhcI
         sPBP6cB639PW4Tm7abtoMVomliY5ZNsFoEIdPeNAFws5TgqmVTNBdy/aYqNFA+rBifwH
         mYNw==
X-Gm-Message-State: AOAM530XuPRUu8LuK8T47yi5KAbpcz/k3y4a6Q0G9g+U04q9Q2NNCX5B
        nJH7skkCrJSOwnCK22z/Zg==
X-Google-Smtp-Source: ABdhPJwF+nB/RMncluIRA2teA/Ygf1vGV5BQp4zYvTL+YR0/LAFf2ZKZWtKezQ2tAQo45UiQ9rIG5g==
X-Received: by 2002:a05:6830:1d0:: with SMTP id r16mr4509553ota.54.1607572607747;
        Wed, 09 Dec 2020 19:56:47 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q18sm763803ood.35.2020.12.09.19.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:56:46 -0800 (PST)
Received: (nullmailer pid 1634187 invoked by uid 1000);
        Thu, 10 Dec 2020 03:56:45 -0000
Date:   Wed, 9 Dec 2020 21:56:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yash Shah <yash.shah@sifive.com>
Cc:     linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        broonie@kernel.org, gregkh@linuxfoundation.org,
        aou@eecs.berkeley.edu, lee.jones@linaro.org,
        u.kleine-koenig@pengutronix.de, thierry.reding@gmail.com,
        andrew@lunn.ch, peter@korsgaard.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org
Subject: Re: [PATCH v2 3/9] dt-bindings: pwm: Update DT binding docs to
 support SiFive FU740 SoC
Message-ID: <20201210035645.GA1633151@robh.at.kernel.org>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-4-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607403341-57214-4-git-send-email-yash.shah@sifive.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 08, 2020 at 10:25:35AM +0530, Yash Shah wrote:
> Add new compatible strings to the DT binding documents to support SiFive
> FU740-C000.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-sifive.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> index 5ac2527..84e6691 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> @@ -25,12 +25,15 @@ description:
>  properties:
>    compatible:
>      items:
> -      - const: sifive,fu540-c000-pwm
> +      - enum:
> +          - sifive,fu540-c000-pwm
> +          - sifive,fu740-c000-pwm
>        - const: sifive,pwm0
>      description:
>        Should be "sifive,<chip>-pwm" and "sifive,pwm<version>". Supported
> -      compatible strings are "sifive,fu540-c000-pwm" for the SiFive PWM v0
> -      as integrated onto the SiFive FU540 chip, and "sifive,pwm0" for the
> +      compatible strings are "sifive,fu540-c000-pwm" and
> +      "sifive,fu740-c000-pwm" for the SiFive PWM v0 as integrated onto the
> +      SiFive FU540 and FU740 chip respectively, and "sifive,pwm0" for the

Better if you reword this so we don't have to update it for every new 
compatible.

>        SiFive PWM v0 IP block with no chip integration tweaks.
>        Please refer to sifive-blocks-ip-versioning.txt for details.
>  
> -- 
> 2.7.4
> 
