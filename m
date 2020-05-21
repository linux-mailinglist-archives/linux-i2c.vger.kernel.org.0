Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34A201DD7C2
	for <lists+linux-i2c@lfdr.de>; Thu, 21 May 2020 21:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730188AbgEUT6S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 May 2020 15:58:18 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43218 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728635AbgEUT6R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 May 2020 15:58:17 -0400
Received: by mail-io1-f65.google.com with SMTP id h10so8897299iob.10;
        Thu, 21 May 2020 12:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qnmu+TvlIm7jMheLKRmKbVdT8yJM4Ib4roFx6Ri+kOU=;
        b=mRIn0IXp4UQ5mUdWiAgKTRK+vo4TNqukoES/kIS9oYpIoIpljJXQUVArT+93kcED5P
         Za0LsLDSasbo+Jn9ZhaU6mtD1qcMhqAQkUOPg1UVPORj/wSH5JcxheupXq6ZbbdWfEG1
         YO+hpVuU1v6/LbDbn7IDaRkHwfyeGuqp0301OsrU1UZf9jykt4nvSTgCKPqH+5qPwGBc
         3wiG2YLOlp+VIItIUPuDTuy/mp06XRUrKBzy0lmaxsBqj6JagwpnwS6KxIxIehmAh0Du
         AJwmxcrJ3gfBq7u17Mhavr6aYCz6tV3rYz5Dhbub5uU/tG4AsoJ4/Fg2zJ7QaQ4xhemB
         Qt8Q==
X-Gm-Message-State: AOAM531W26B7z5uWCNNdmJegUQaLS8A5sE38m1nveGrBg45reoqe2seg
        HyuPA5ChR7rRnq8islzQAg==
X-Google-Smtp-Source: ABdhPJwMao229/7LqfcaVPM7jNkfJvReoW9ujB9zAGukbIvbaGMmkriGLneoVhuPZEJr8LMRcnrSRw==
X-Received: by 2002:a02:c8c7:: with SMTP id q7mr5370610jao.111.1590091096617;
        Thu, 21 May 2020 12:58:16 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id m89sm3517861ill.40.2020.05.21.12.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:58:16 -0700 (PDT)
Received: (nullmailer pid 2797115 invoked by uid 1000);
        Thu, 21 May 2020 19:58:14 -0000
Date:   Thu, 21 May 2020 13:58:14 -0600
From:   robh@kernel.org
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     avifishman70@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, yuenn@google.com,
        wsa@the-dreams.de, andriy.shevchenko@linux.intel.com,
        devicetree@vger.kernel.org, kfting@nuvoton.com, venture@google.com,
        brendanhiggins@google.com, ofery@google.com,
        benjaminfair@google.com, openbmc@lists.ozlabs.org,
        tmaimon77@gmail.com, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C
 controller
Message-ID: <20200521195814.GA2796824@bogus>
References: <20200521110910.45518-1-tali.perry1@gmail.com>
 <20200521110910.45518-2-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521110910.45518-2-tali.perry1@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 21 May 2020 14:09:08 +0300, Tali Perry wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM I2C controller.
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dts:22.28-29 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:312: recipe for target 'Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1295115

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

