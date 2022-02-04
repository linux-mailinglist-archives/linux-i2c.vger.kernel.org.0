Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A517F4AA347
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 23:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243877AbiBDWkD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 17:40:03 -0500
Received: from mail-oo1-f50.google.com ([209.85.161.50]:34470 "EHLO
        mail-oo1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234084AbiBDWkC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 17:40:02 -0500
Received: by mail-oo1-f50.google.com with SMTP id k13-20020a4a948d000000b003172f2f6bdfso935526ooi.1;
        Fri, 04 Feb 2022 14:40:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4SpOqXKZyIeEOwKum6DXXuPPOySrNMUxlGQiydAANr0=;
        b=1z8XVadVZd1fcb1V67q4LiItZ6Ax8g3myRWDGPnCWKWr/VkzHw2zyPSCOM0j4/2PA6
         t7YYi0tkLU/svi0hB5Q4TBngTPCWcCxSDR4LJ7JH7oiAb7oV3tttXY5kzSs4Z/IkjiGI
         ZLOG24kEmHqz6Rxb4wT4FtL9jVKvMCKWDRwWnEfuUdYABj9+JCUmntQFj2wjw8kmVY15
         2vEYLE+HpIvFm5/rxTP+iQGw9nlz0kl/aRfPft+EC1o13A4uWlazWqDFwPW74I5jVBbr
         a26izlSlETkfNLwvhRI3/fd+dWZJ8LTccOu6LXKHABJzUq25uJiU/yn2qepJAopQ8dLn
         iEog==
X-Gm-Message-State: AOAM531JVB66MUbY5rc+wCm98/P3zAPzuZA4d+MLCNv/Wa9gryST2gc0
        27plIvPHQ98AcI7GUJ42fQ==
X-Google-Smtp-Source: ABdhPJziJjQB0Qp80nJm3Y4Cy1qJ7dzDubZWuRGCVWikvMDlk1osf5kUVE4kGf/A/2TIRveTqnozng==
X-Received: by 2002:a05:6870:1111:: with SMTP id 17mr311570oaf.171.1644014401893;
        Fri, 04 Feb 2022 14:40:01 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p22sm1163371oae.33.2022.02.04.14.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 14:40:01 -0800 (PST)
Received: (nullmailer pid 3314444 invoked by uid 1000);
        Fri, 04 Feb 2022 22:39:59 -0000
Date:   Fri, 4 Feb 2022 16:39:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     alexandre.belloni@bootlin.com, brgl@bgdev.pl,
        devicetree@vger.kernel.org, daire.mcnamara@microchip.com,
        robh+dt@kernel.org, linux-riscv@lists.infradead.org,
        linux-rtc@vger.kernel.org, a.zummo@towertech.it,
        geert@linux-m68k.org, jassisinghbrar@gmail.com,
        paul.walmsley@sifive.com, lee.jones@linaro.org, palmer@dabbelt.com,
        bin.meng@windriver.com, thierry.reding@gmail.com,
        ivan.griffin@microchip.com, linux-i2c@vger.kernel.org,
        atishp@rivosinc.com, heiko@sntech.de, linus.walleij@linaro.org,
        lewis.hanly@microchip.com, aou@eecs.berkeley.edu,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-gpio@vger.kernel.org, krzysztof.kozlowski@canonical.com,
        u.kleine-koenig@pengutronix.de
Subject: Re: [PATCH v5 01/12] dt-bindings: soc/microchip: update
 syscontroller compatibles
Message-ID: <Yf2rPx1NHunFOzBu@robh.at.kernel.org>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131114726.973690-2-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 31 Jan 2022 11:47:16 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Polarfire SoC is currently using two different compatible string
> prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
> its system controller in order to match the compatible string used in
> the soc binding and device tree
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  ...larfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} | 6 +++---
>  ...s-controller.yaml => microchip,mpfs-sys-controller.yaml} | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
>  rename Documentation/devicetree/bindings/soc/microchip/{microchip,polarfire-soc-sys-controller.yaml => microchip,mpfs-sys-controller.yaml} (75%)
> 

Acked-by: Rob Herring <robh@kernel.org>
