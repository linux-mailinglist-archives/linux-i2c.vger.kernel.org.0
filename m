Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8102D5226
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 04:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730328AbgLJD4t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 22:56:49 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45369 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731425AbgLJD4m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Dec 2020 22:56:42 -0500
Received: by mail-oi1-f195.google.com with SMTP id f132so4266485oib.12;
        Wed, 09 Dec 2020 19:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UaBW8kKjumKB5NsRdwxO15H0fluT5i+CZRLhsRHEAQc=;
        b=C8MLF4bulyGXK3qXMqUq9K5i2BEuIlOmPxK9sjDF1/GaB8x+J96o+mvEnIdbPXKtCC
         N8l+CvQgRSyAXtd9SPel9JrMstqIO5R4hkSYt3rTtMEmfTYIZp+pS+qqg4GlFLcmY/BH
         q4oTCD1NSzT4F0h0JmuuE5WjOYGfVMH8QGKMn0xAWD+MtNRpzKi1UyVfr8qiUCDxM7+K
         s/Xh5j/ayxmeIrMpKqN6O0t6PRShVuND3HQlpbjbqFGloB29otlphk3h8qRftiiridJK
         OxRS5vDhVb7Y0HQ2E0VcnbZO/C2wp4S/k721U7J82jQNkg7UG9aVRuMz9ckeUH5S0B1D
         2dWw==
X-Gm-Message-State: AOAM531BKs7XYHfZRmm7D45KL49fp8wCY0aFs8sqegzbTbR/xvjl/PAI
        6Ot7PxwoogQ8Re8RyyUv8w==
X-Google-Smtp-Source: ABdhPJwOhrm+iTszJ9LZontta94nHHnjY/oxO3rxT338UzSFe4GWwGxrSlB90g+rA2ah/Usvy4il1Q==
X-Received: by 2002:aca:60c4:: with SMTP id u187mr4120688oib.42.1607572557234;
        Wed, 09 Dec 2020 19:55:57 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v12sm759702ooi.46.2020.12.09.19.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:55:56 -0800 (PST)
Received: (nullmailer pid 1633035 invoked by uid 1000);
        Thu, 10 Dec 2020 03:55:54 -0000
Date:   Wed, 9 Dec 2020 21:55:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yash Shah <yash.shah@sifive.com>
Cc:     linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        broonie@kernel.org, linux-riscv@lists.infradead.org,
        linux-i2c@vger.kernel.org, lee.jones@linaro.org,
        linux-kernel@vger.kernel.org, palmer@dabbelt.com,
        linux-gpio@vger.kernel.org, peter@korsgaard.com,
        robh+dt@kernel.org, paul.walmsley@sifive.com,
        aou@eecs.berkeley.edu, u.kleine-koenig@pengutronix.de,
        bgolaszewski@baylibre.com, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, linux-pwm@vger.kernel.org,
        linus.walleij@linaro.org, andrew@lunn.ch,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: riscv: Update DT binding docs to
 support SiFive FU740 SoC
Message-ID: <20201210035554.GA1632991@robh.at.kernel.org>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607403341-57214-2-git-send-email-yash.shah@sifive.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 08 Dec 2020 10:25:33 +0530, Yash Shah wrote:
> Add new compatible strings in cpus.yaml to support the E71 and U74 CPU
> cores ("harts") that are present on FU740-C000 SoC.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
