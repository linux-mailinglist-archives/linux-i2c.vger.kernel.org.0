Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8A943BB8D
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Oct 2021 22:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234508AbhJZUbc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Oct 2021 16:31:32 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:35525 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231545AbhJZUbc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Oct 2021 16:31:32 -0400
Received: by mail-ot1-f48.google.com with SMTP id w12-20020a056830410c00b0054e7ceecd88so444563ott.2;
        Tue, 26 Oct 2021 13:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OmISPFoW2kKwNI1TC2eM1qAir9vtpVAUyXH+lQynzN4=;
        b=EK11dpG1B9UyzyutHU8b0sq3/FJPD8F2zvUWEx/AlsJLZRo7Ew5lYUjt6sEQ9Ece7l
         ek1IiXhw/nxJ8ucjPRP78BEpFcFYUW+WrpsRD3NubnQB1cyBF41UuQjoe2l5iqhaRl3P
         zJa+DVifjiMXbHsrq7eqW/ESK43vH0ck5K6uIdZNmBFSaoxTugFf6jVO8WfUPkdGZ9td
         IAqppJ4T+v8AJcuAMAEEC9V4ivmcmLpkQQG53+kf31pxGjRCBEPmxgVbUW4J800YhqdP
         mR0LkPPiys3C4Su6efsK44JD4wvSHA9iecQPeL8kgdKcuUM544mSzCfnQ3SrU0P6q47J
         fNiA==
X-Gm-Message-State: AOAM533PKXtO9FgE+ImtGYKg/P3sHULOMXnw5MuRnQrai+aC8mqIu+3y
        9gCbz06ttYZPfgNRXbtnmfwx7fbEfQ==
X-Google-Smtp-Source: ABdhPJxa1Qf7mE8H2HOq9PzWv+ncjFiya+dmd5h24+FoLrFuZgGY9RuWPmOj82/jdHjF1V1OZruUtA==
X-Received: by 2002:a9d:bab:: with SMTP id 40mr22055684oth.274.1635280147490;
        Tue, 26 Oct 2021 13:29:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l1sm5041092oic.30.2021.10.26.13.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 13:29:05 -0700 (PDT)
Received: (nullmailer pid 3187225 invoked by uid 1000);
        Tue, 26 Oct 2021 20:29:05 -0000
Date:   Tue, 26 Oct 2021 15:29:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     peda@axentia.se, peter.korsgaard@barco.com,
        lars.povlsen@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c-mux-gpio: Add optional DT property
Message-ID: <YXhlEYr2zygThVsj@robh.at.kernel.org>
References: <20211013141003.2388495-1-horatiu.vultur@microchip.com>
 <20211013141003.2388495-2-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013141003.2388495-2-horatiu.vultur@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 13, 2021 at 04:10:02PM +0200, Horatiu Vultur wrote:
> Add optional property 'select-delay' DT property. In case this is set
> then a delay is added when changing mux state. The value is specified in
> usec.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
> index d4cf10582a26..d0dacbad491a 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
> @@ -28,6 +28,7 @@ Required properties:
>  Optional properties:
>  - idle-state: value to set the muxer to when idle. When no value is
>    given, it defaults to the last value used.
> +- select-delay: GPIO settle delay when changing mux state. In usec.

Seems generally useful. Can we add this first to the mux control 
binding, then use it here (or better yet, use the mux binding if you 
can instead).

Also, properties with units need a standard unit suffix.

>  
>  For each i2c child node, an I2C child bus will be created. They will
>  be numbered based on their order in the device tree.
> -- 
> 2.33.0
> 
> 
