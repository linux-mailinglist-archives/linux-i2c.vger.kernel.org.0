Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93F8139C302
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 23:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbhFDVyl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 17:54:41 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:41919 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhFDVyl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Jun 2021 17:54:41 -0400
Received: by mail-ot1-f54.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so10494944oth.8;
        Fri, 04 Jun 2021 14:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ILOka822LzxnhvtGTiD2FcIXEnEowxCvzQ9C96ADGAQ=;
        b=RRpiz0e19Aw3bGCnpdXGiF9XMEEoJv9oxPf/odJLVQNLxLnhN/o7Ol1KN1yQQuXjIk
         iK3StfhiR+28puREjr8c30ylFS++uaOFVqW2Od50mSrisgbx4g34IRSsonPAU5US5a5j
         mle5OOKEXDcyOK6CkJKBs217we30ywjBDy4JgZ2fjSERho/TPLPLqjz2goaT/pY20JuH
         MTufOvMXTvkp4Ukz5o8wpVgBOe+oDLXZeiPfP02eXXaS+XJEBg6GoAW9Coj2T5k1HjAZ
         1/yQUOYTXCzQLEaA3D5fe1RL2GxRwVehjJKy4ZNUkOkg1nOqcVp/+/ncagaR6SqjuFUJ
         Y0+w==
X-Gm-Message-State: AOAM53080umH1wWs+HnOGoppT4Czxb+EuX/DwGJoSt37pXM79vZiAPi8
        PHPUgPIXEiUmOQdyrmwneQ==
X-Google-Smtp-Source: ABdhPJxN3jYRBieyk5dqpKTqPvquWW0OS6rQTFGlLA04pLQ6K/WGRfU/vHlK3pTBIFJ8ExvIBxMChw==
X-Received: by 2002:a9d:6acb:: with SMTP id m11mr2113587otq.246.1622843574039;
        Fri, 04 Jun 2021 14:52:54 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e21sm712555oie.32.2021.06.04.14.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:52:53 -0700 (PDT)
Received: (nullmailer pid 3990542 invoked by uid 1000);
        Fri, 04 Jun 2021 21:52:51 -0000
Date:   Fri, 4 Jun 2021 16:52:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        x86@kernel.org, devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Andy Shevchenko <andy@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        linux-omap@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 4/4] dt-bindings: gpio: pcf857x: Convert to json-schema
Message-ID: <20210604215251.GA3990489@robh.at.kernel.org>
References: <cover.1622560799.git.geert+renesas@glider.be>
 <7caa954add90255fc177e5dbabe17d62e0242861.1622560799.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7caa954add90255fc177e5dbabe17d62e0242861.1622560799.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 01 Jun 2021 17:25:47 +0200, Geert Uytterhoeven wrote:
> Convert the PCF857x-compatible I/O expanders Device Tree binding
> documentation to json-schema.
> 
> Document missing compatible values, properties, and gpio hogs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Drop support for "ti,pcf8575", as it's 100% compatible with
>     "nxp,pcf8575",
>   - Drop "hog-[0-9]+" from hog names,
>   - Rely on dt-schema/schemas/gpio/gpio-hog.yaml for hog properties.
> ---
>  .../devicetree/bindings/gpio/gpio-pcf857x.txt |  69 ------------
>  .../devicetree/bindings/gpio/nxp,pcf8575.yaml | 103 ++++++++++++++++++
>  2 files changed, 103 insertions(+), 69 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
