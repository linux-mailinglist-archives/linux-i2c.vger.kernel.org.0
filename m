Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6116E3C79DC
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 00:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235536AbhGMXAI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 19:00:08 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179]:39510 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235417AbhGMXAH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jul 2021 19:00:07 -0400
Received: by mail-il1-f179.google.com with SMTP id a7so5582218iln.6;
        Tue, 13 Jul 2021 15:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=pLqgmA3zxhNncLZSYPNiduirqdJowC5CS/FxB37q7a0=;
        b=QY3IRJHoflPIMpkwq+MCpIENT0F9/vIJtKJ9H7d6dzpvruOVRBOUxyKV9ZWm+WYhBr
         5VNHo10Qmcm/xnL7q6UQM5H5vwP2b7J651QxOJaWvJRRo7/svdSdqcvcQPCrL2/WeBiV
         Poj5QQDcffHCD4FZEbHubdmvypHvD/yty+0H6lqeOvRh/qCbz9Cx4oz07GQyYhyixSwl
         3yhYIGZXM/BICIbi2EbbsG/aWkk2Fyu7tdBeCeMGuAiH3tvuXwjnj/r/c6Bo4YRRK49U
         NSrID3KHVc2zWX0WVFnw9SuAoxV8BYKO5rtnMj9iaSAprOuma6zXdggnZ6rs3BefAgV1
         MTqQ==
X-Gm-Message-State: AOAM531coC40WCS6CzpUck0Vre4QL9gZvQhIMknvWMskQcqQ/aJ/2ZUt
        6Wa8+nMZ39R6dpgWlHJC5w==
X-Google-Smtp-Source: ABdhPJxDX1fh/0j6B2cCSd4v8x4aGdA/5rqK4c3fCxO5I50gLSJPtAzdjVMjSMFPK1gExOJTLlDC3g==
X-Received: by 2002:a05:6e02:218c:: with SMTP id j12mr4598261ila.32.1626217035898;
        Tue, 13 Jul 2021 15:57:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t16sm209462ilp.15.2021.07.13.15.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 15:57:15 -0700 (PDT)
Received: (nullmailer pid 1007696 invoked by uid 1000);
        Tue, 13 Jul 2021 22:57:09 -0000
Date:   Tue, 13 Jul 2021 16:57:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, cl@rock-chips.com,
        thierry.reding@gmail.com, heiko@sntech.de,
        jagan@amarulasolutions.com, wens@csie.org, uwe@kleine-koenig.org,
        mail@david-bauer.net, jbx6244@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        wim@linux-watchdog.org, linux@roeck-us.net, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org, maz@kernel.org,
        linux-pwm@vger.kernel.org
Subject: Re: [RESEND PATCH v5 1/4] dt-bindings: pwm: rockchip: add
 description for rk3568
Message-ID: <20210713225709.GA987961@robh.at.kernel.org>
References: <20210622020517.13100-1-cl@rock-chips.com>
 <20210623021303.28015-1-cl@rock-chips.com>
 <20210705064914.o2neaiwqndjfdyqd@pengutronix.de>
 <YOK1+pMy+N64eR75@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YOK1+pMy+N64eR75@dell>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 05, 2021 at 08:34:18AM +0100, Lee Jones wrote:
> On Mon, 05 Jul 2021, Uwe Kleine-König wrote:
> 
> > On Wed, Jun 23, 2021 at 10:13:03AM +0800, cl@rock-chips.com wrote:
> > > From: Liang Chen <cl@rock-chips.com>
> > > 
> > > add "rockchip,rk3568-pwm", "rockchip,rk3328-pwm" for pwm nodes on
> > > a rk3568 platform to pwm-rockchip.yaml.
> > 
> > Looks good to me
> > 
> > Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > Who is supposed to apply this patch? Does this need blessing by Rob?
> 
> There is no standard.  Rob will usually have some kind of arrangement
> with the associated maintainer(s).  If this is a big functional
> change, I would suggest letting Rob and his army of bots give it the
> once over before it is applied in any case.

The documented standard[1] is subsystem maintainers take bindings. Are 
there exceptions? Yes. Usually that's standalone patches (which netdev 
maintainers just ignore for example).

One line compatible string changes don't need to wait for me.

Rob

[1] https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/tree/Documentation/devicetree/bindings/submitting-patches.rst#n67
