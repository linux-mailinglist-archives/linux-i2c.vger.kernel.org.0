Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44F7463FA9
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 22:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235439AbhK3VKu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 16:10:50 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:46819 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343815AbhK3VKk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Nov 2021 16:10:40 -0500
Received: by mail-oi1-f173.google.com with SMTP id s139so43797486oie.13;
        Tue, 30 Nov 2021 13:07:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4gg5b+5+2y7U63Bnu2c8JbCCZY9MXtlTKiL/L4n51Ko=;
        b=Ljl2A+s7+YEcFV6GFuT9kE6+CuWerhzHG7SIP6dgJ1SFLL7xCJHvnXzvmT+NIHUl0d
         fAkgV8pJH/JeX2JJpag1NEjyACbL01cgoj0ZpvZC425GXVdLA94qGaj81xz5hkmJfyg2
         IfNQRHSZOWN+yZOIQWWLhzyB5dTwUc0SvtemEW7LCDXByTj/LjH8ks/AxlkTrf15oejE
         g9tVWt+m1ENuj7X8BXqawcOA8ocTAwuL+cLYuGaqPrP7+R50E8xveyagfdWljwMP/sJq
         SmyHRFrR2TmLgjegc+pUuy3OcdEaui4iUiwLE5ms5QjSR/76UIbjXRVz4gOzc8vAYqLp
         kTMw==
X-Gm-Message-State: AOAM533TNUa95+7Q92YTAlW1Rs59lZvD/t+wz1ztYRqKROcTp3Wl9Wv2
        sbA4NuwSrP9NvY0BTQMIvA==
X-Google-Smtp-Source: ABdhPJwszMtVlCisFxngW/VFQAvuLZSoSuhMa3VOy/UnnyojRjqEWs12vnAvWQY7uPs/m4qs/UXUDw==
X-Received: by 2002:a54:4482:: with SMTP id v2mr1507982oiv.61.1638306440069;
        Tue, 30 Nov 2021 13:07:20 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w5sm3218985otk.70.2021.11.30.13.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 13:07:19 -0800 (PST)
Received: (nullmailer pid 3013377 invoked by uid 1000);
        Tue, 30 Nov 2021 21:07:18 -0000
Date:   Tue, 30 Nov 2021 15:07:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Janne Grunau <j@jannau.net>
Cc:     Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>,
        devicetree@vger.kernel.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Sven Peter <sven@svenpeter.dev>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 2/3] dt-bindings: i2c: apple,i2c: allow multiple
 compatibles
Message-ID: <YaaShhQlDR+EBUc7@robh.at.kernel.org>
References: <20211122222440.21177-1-j@jannau.net>
 <20211122222440.21177-3-j@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122222440.21177-3-j@jannau.net>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 22 Nov 2021 23:24:39 +0100, Janne Grunau wrote:
> The intention was to have a SoC-specific and base compatible string
> to allow forward compatibility and SoC specific quirks,
> 
> Fixes: df7c4a8c1b47 ("dt-bindings: i2c: Add Apple I2C controller bindings")
> Signed-off-by: Janne Grunau <j@jannau.net>
> Cc: Mark Kettenis <kettenis@openbsd.org>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> ---
>  Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
