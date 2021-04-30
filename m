Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73B9B3702AE
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Apr 2021 23:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235299AbhD3VLd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Apr 2021 17:11:33 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:38788 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbhD3VLd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Apr 2021 17:11:33 -0400
Received: by mail-oi1-f180.google.com with SMTP id d25so33808949oij.5;
        Fri, 30 Apr 2021 14:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kSEgVUlltgSDOONBiS4sAFkzxQMosR8q2b8hfma9UC8=;
        b=rDyrWi6/RI8ccI76ewcjhI12T+GGI6UL9VtQsyOO1Kr1A0OZ7XlWRHfXEfrRQDHsvm
         BQRV2NIq1seKF9k+vCyp60KnVu4apbP8iHiSbkSkuiOzP2O6adPrTWJnADu6Z22+9w4K
         2v/EHJrko7TWaWL0PidHJohaPI4lIshvM47V0qdiwRe6IPe+Xnsb7nG2YoGaV6nr8V7H
         FAlq7lhhp5LxmM0VMn+qHTJL4qQNtTMKcl1D8KwVL5AbzeN+zwcnsfHXpetkZxTlUNuZ
         BeRNRIvpcZrLSMPtgXUPhzZl39xm7uTJg18PZ4KLd6a9IOXy+wFYeJuiQrQPxjoGVpIA
         jMSQ==
X-Gm-Message-State: AOAM531g8b77EfmEBNw+bIrWFXcWi8ciEscYBdWFR7BEV+aUs/vBMT/x
        wFuNQ7rc+MsAXO60V5bdyw==
X-Google-Smtp-Source: ABdhPJyC09D8lASABIQOXdJUS4e0eg6y4Lwzcjjkv84brMLnJFgup/NBDzBUDxNZkEwVZYlQzZxdWQ==
X-Received: by 2002:aca:1211:: with SMTP id 17mr5508725ois.20.1619817044122;
        Fri, 30 Apr 2021 14:10:44 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q130sm1010654oif.40.2021.04.30.14.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 14:10:43 -0700 (PDT)
Received: (nullmailer pid 3899661 invoked by uid 1000);
        Fri, 30 Apr 2021 21:10:41 -0000
Date:   Fri, 30 Apr 2021 16:10:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     cl@rock-chips.com
Cc:     jbx6244@gmail.com, david.wu@rock-chips.com,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, jagan@amarulasolutions.com,
        linux@roeck-us.net, maz@kernel.org, linux-serial@vger.kernel.org,
        cnsztl@gmail.com, wim@linux-watchdog.org, shawn.lin@rock-chips.com,
        devicetree@vger.kernel.org, ulf.hansson@linaro.org,
        linux-arm-kernel@lists.infradead.org, zhangqing@rock-chips.com,
        linux-watchdog@vger.kernel.org, jensenhuang@friendlyarm.com,
        huangtao@rock-chips.com, heiko@sntech.de, jamie@jamieiles.com,
        uwe@kleine-koenig.org, linux-i2c@vger.kernel.org,
        jay.xu@rock-chips.com, mail@david-bauer.net,
        linux-mmc@vger.kernel.org, wens@csie.org,
        michael@amarulasolutions.com, robh+dt@kernel.org
Subject: Re: [PATCH v4 01/10] dt-bindings: i2c: i2c-rk3x: add description for
 rk3568
Message-ID: <20210430211041.GA3899631@robh.at.kernel.org>
References: <20210429081151.17558-1-cl@rock-chips.com>
 <20210429081151.17558-2-cl@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429081151.17558-2-cl@rock-chips.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 29 Apr 2021 16:11:42 +0800, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> add "rockchip,rk3568-i2c", "rockchip,rk3399-i2c" for i2c nodes on
> a rk3568 platform to i2c-rk3x.yaml.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
