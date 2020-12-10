Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1F92D523B
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 04:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731797AbgLJD61 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 22:58:27 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46411 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731901AbgLJD6S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Dec 2020 22:58:18 -0500
Received: by mail-oi1-f196.google.com with SMTP id k2so4261077oic.13;
        Wed, 09 Dec 2020 19:57:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vwi7EsUY4QX9MoPeQj2F3XyThczy9Eoa3ygKqHwraM8=;
        b=SUu0wZ3c29awRSmVvOzLxFmWDPMk1xzVRSSnZ9chNEwtiKFM/7buKigJQzbbeRi6F+
         pKd1XZR0cexRgvXujVsh6tMhMb0ClLZshyDmILPiJdOJfrW0cEn5zElc6h6P7G4XwTy7
         lC6/YPG0blLlaGNQHFvlbJHijBKLRXxuQ+vrMJ4fJhvfWBzHvA/R/fbNsG0YibXCx22p
         UAu4qERhsc0C9hjgztTzEblr/0K4HbbVJfdgHLrrLVlmE5yLOz4W92d2FioSwOzSMCdC
         msBF/cAVsLNYCu41vvGvmy/xGmndpsiyTCWOf6ebzVpJ2d9RN6AZbUp18rBhwVaGP48I
         uY3g==
X-Gm-Message-State: AOAM530Zn1EdG56LyOMah+H1DCTmSFf3m/AbEvXNejH+2/xSf3SIISOM
        9LMeoFBGfi/vkr6WwQZ6RA==
X-Google-Smtp-Source: ABdhPJxbSXwk6hsl3+9BW2YHSj4lcS2keAbSmvQEVrJIpw4Z8Up+ovo6oO7C665COkov1yF+JyIGug==
X-Received: by 2002:aca:f3c6:: with SMTP id r189mr4189959oih.83.1607572654025;
        Wed, 09 Dec 2020 19:57:34 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q3sm839505ota.53.2020.12.09.19.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:57:33 -0800 (PST)
Received: (nullmailer pid 1635431 invoked by uid 1000);
        Thu, 10 Dec 2020 03:57:31 -0000
Date:   Wed, 9 Dec 2020 21:57:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yash Shah <yash.shah@sifive.com>
Cc:     thierry.reding@gmail.com, linux-i2c@vger.kernel.org,
        gregkh@linuxfoundation.org, palmer@dabbelt.com,
        linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
        u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, broonie@kernel.org, bgolaszewski@baylibre.com,
        aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        linus.walleij@linaro.org, peter@korsgaard.com, andrew@lunn.ch,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org, lee.jones@linaro.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 5/9] dt-bindings: gpio: Update DT binding docs to
 support SiFive FU740 SoC
Message-ID: <20201210035731.GA1635391@robh.at.kernel.org>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-6-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607403341-57214-6-git-send-email-yash.shah@sifive.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 08 Dec 2020 10:25:37 +0530, Yash Shah wrote:
> Add new compatible strings to the DT binding documents to support SiFive
> FU740-C000.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
