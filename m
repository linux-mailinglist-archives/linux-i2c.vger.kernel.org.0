Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A338E3C79E6
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 00:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236733AbhGMXBv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 19:01:51 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:45981 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235417AbhGMXBu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jul 2021 19:01:50 -0400
Received: by mail-io1-f43.google.com with SMTP id y16so6223805iol.12;
        Tue, 13 Jul 2021 15:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JTI1ZBR9D1Ugup4282dbl5tw68/bdXRLNL3cR2M36lk=;
        b=AqXB8tdCYM+JQVy+8YYIEFzjHv1mck4krMtxLlypCIMHXlHptHapmdZ04Nv+/2G1R+
         ABDe9RnxG2B2gBul2xAUSeYr2LD/c1fU+68YLq61aTqioe24SzjGio3orVW0VUb27ist
         FOXsrUERQ2JF8iKQvTcAeHnb/YZZhLmnGYlocvRYXT4DHt4jdm5ATQuLzsRZAmHfBzqM
         25ukl0fg8Bv9DhBtqmJLfP41WVQohFPKZ03uHEZ1N+POWm0u/YQdxHvNDrui0uLq8XTP
         pz6hmHSIpOeLPurwuWwA56JlUqrkHKlTpfoP7OZ6MILlKmdebXOH2jf8/7v9KHWPtiwN
         WfaQ==
X-Gm-Message-State: AOAM533iZbDjaqz8+WfbsgWHElz6mqMlkWAfSPKBUWs89VegWpr3UJ5U
        4pnZOiPY54cNNiCFnIzX+Q==
X-Google-Smtp-Source: ABdhPJwqQj4i60dPLCZFJEHdYwTRX+Yhru1/A8V14H871+oGYZI2ex/1qE4HdMBMRRnO95P5eEF3/Q==
X-Received: by 2002:a02:cace:: with SMTP id f14mr6161797jap.5.1626217139833;
        Tue, 13 Jul 2021 15:58:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b2sm224559iln.5.2021.07.13.15.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 15:58:59 -0700 (PDT)
Received: (nullmailer pid 1010485 invoked by uid 1000);
        Tue, 13 Jul 2021 22:58:53 -0000
Date:   Tue, 13 Jul 2021 16:58:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     cl@rock-chips.com
Cc:     linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, cnsztl@gmail.com,
        linux-watchdog@vger.kernel.org, lee.jones@linaro.org,
        shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org,
        heiko@sntech.de, huangtao@rock-chips.com, wim@linux-watchdog.org,
        jensenhuang@friendlyarm.com, linux-serial@vger.kernel.org,
        maz@kernel.org, zhangqing@rock-chips.com, thierry.reding@gmail.com,
        jamie@jamieiles.com, ulf.hansson@linaro.org, mail@david-bauer.net,
        jbx6244@gmail.com, david.wu@rock-chips.com,
        linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
        linux-mmc@vger.kernel.org, jay.xu@rock-chips.com,
        uwe@kleine-koenig.org, michael@amarulasolutions.com,
        linux@roeck-us.net, jagan@amarulasolutions.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org, wens@csie.org,
        devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH v5 1/4] dt-bindings: pwm: rockchip: add
 description for rk3568
Message-ID: <20210713225853.GA1010426@robh.at.kernel.org>
References: <20210622020517.13100-1-cl@rock-chips.com>
 <20210623021303.28015-1-cl@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623021303.28015-1-cl@rock-chips.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 23 Jun 2021 10:13:03 +0800, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> add "rockchip,rk3568-pwm", "rockchip,rk3328-pwm" for pwm nodes on
> a rk3568 platform to pwm-rockchip.yaml.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
