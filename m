Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2BB21A537
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jul 2020 18:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbgGIQxH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jul 2020 12:53:07 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:43534 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgGIQxG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jul 2020 12:53:06 -0400
Received: by mail-il1-f193.google.com with SMTP id i18so2597463ilk.10;
        Thu, 09 Jul 2020 09:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QGtnLn93cLTP51XtiHAgImeMicUFaKH6Di/Wzvj2c74=;
        b=oSNLxOy0M8NZnfujoffuh3of8VypFHIuNRE33MxxXVHT7XKORSMkPSS3Fm8TDlnJlq
         iporDYwG+6f6ywfXIvS53ORS3GioQd3zQddH1UeJKjADz0cqeL3FsATJCu34D4g7dXo7
         ZOLM8Npc44Kt1w/sY3XhW3AI4XPNkNqZzhGRmBvpgu3oUrRuosVHdFLsS3FWwjuI1mH1
         jv8F1TwGwuTsVB4lz2SMD0DjMW+tK+llNbW7psN8a1HLPaucNHfcPBBIKFFPKadD7Sa0
         xEnIEFiHjbpU8VuB52GfbArXjStSp9PdbKBWVmJwo378BN4pCrcmegtTlecTVzEVkzNc
         kWtw==
X-Gm-Message-State: AOAM532Ngs0GdEWsr4XypUabH0FIxCpdURbvnas2Kc52xFA5i0mSt+T3
        LYgYilQBc8+d/W2nsCDrXw0Fdw2Mdw==
X-Google-Smtp-Source: ABdhPJwLatvtfpim77UnE4k3Fw8neGwQY9Y5yT7cf7NbhVzmfdTlq+t+Xv/AgKtyxAHMq4oobz0XSg==
X-Received: by 2002:a92:cb10:: with SMTP id s16mr48806023ilo.192.1594313585538;
        Thu, 09 Jul 2020 09:53:05 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id o16sm2076043ilt.59.2020.07.09.09.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 09:53:04 -0700 (PDT)
Received: (nullmailer pid 507617 invoked by uid 1000);
        Thu, 09 Jul 2020 16:52:42 -0000
Date:   Thu, 9 Jul 2020 10:52:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     gregory.clement@bootlin.com, megous@megous.com, anarsoul@gmail.com,
        tiny.windzz@gmail.com, sboyd@kernel.org, jason@lakedaemon.net,
        robh+dt@kernel.org, maz@kernel.org, wens@csie.org,
        lee.jones@linaro.org, mripard@kernel.org,
        amit.kucheria@verdurent.com, linux-i2c@vger.kernel.org,
        icenowy@aosc.io, linux-gpio@vger.kernel.org,
        srinivas.kandagatla@linaro.org, linux-pm@vger.kernel.org,
        daniel.lezcano@linaro.org, liyong@allwinnertech.com,
        huangshuosheng@allwinnertech.com, linus.walleij@linaro.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        bage@linutronix.de, linux-arm-kernel@lists.infradead.org,
        mturquette@baylibre.com, rui.zhang@intel.com, tglx@linutronix.de,
        clabbe@baylibre.com, linux-kernel@vger.kernel.org,
        p.zabel@pengutronix.de, stefan@olimex.com
Subject: Re: [PATCH v3 04/16] dt-bindings: pinctrl: sunxi: make gpio banks
 supplies required
Message-ID: <20200709165242.GA506534@bogus>
References: <20200708071942.22595-1-frank@allwinnertech.com>
 <20200708071942.22595-5-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708071942.22595-5-frank@allwinnertech.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 08 Jul 2020 15:19:30 +0800, Frank Lee wrote:
> Since we don't really have to care about the existing DT for boards,
> it would be great to make the gpio banks supplies required.
> 
> Signed-off-by: Frank Lee <frank@allwinnertech.com>
> ---
>  .../devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml: required:2: '^vcc-p[a-hlm]-supply$' does not match '^([a-zA-Z#][a-zA-Z0-9,+\\-._@]{0,63}|\\$nodename)$'
Documentation/devicetree/bindings/Makefile:20: recipe for target 'Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml: ignoring, error in schema: required: 2
warning: no schema found in file: ./Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml: ignoring, error in schema: required: 2
warning: no schema found in file: ./Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1325057

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

