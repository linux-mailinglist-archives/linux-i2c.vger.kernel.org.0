Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323AF370315
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Apr 2021 23:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhD3VlM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Apr 2021 17:41:12 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:37644 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhD3VlL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Apr 2021 17:41:11 -0400
Received: by mail-oi1-f180.google.com with SMTP id k25so71404371oic.4;
        Fri, 30 Apr 2021 14:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HyP+/B8IS6YJDID6abklHLjJCypbL5+nqtHOxB04MIc=;
        b=k54vnJW994xRKr+75Pg/7okBbsygXKE7CwkLrqiE8KkxEmCFd43xupVC0vlFXYoY0j
         DepL77rIsvIW89gCOyECurtu3ey5mvutd0i9RdiBGsnBiHstXknmgk1Qn3aZEY6EcmYk
         FKzYc1NOCk2qaHbo4WsOvOlHFU4CHSHqdUVpU92zuK86uMHoIi5WLG20xXHDmJ5P3505
         F+t3J2Kxmwnepg8UGrJ+tbNKCN1jAlmu/XMEtvTK5MYNnTqSQMhRd9I0VwIYiIBuCzB/
         LEDyWEU0QAIJVRyRFvmGQndhx9p7S4CBPTAJAevoDYQMx0IDA+fKnI4+gdW7SFSst8/P
         z1+g==
X-Gm-Message-State: AOAM533ZADvg3m6mf5rSrHYvgYfR19mcSJQDq7y3+bFYLrcwTJaGey+J
        oYp7NUB83DDYSuwGkEt3+zYK8XZyuQ==
X-Google-Smtp-Source: ABdhPJzdPPDNaaPujlksMqGMKWRckmWYPJeon7Q6a4hGNPO4H4oDJeevftRsqwFKpyxgJV+kULFuyw==
X-Received: by 2002:aca:f008:: with SMTP id o8mr5635930oih.106.1619818821938;
        Fri, 30 Apr 2021 14:40:21 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 10sm972253oiq.48.2021.04.30.14.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 14:40:21 -0700 (PDT)
Received: (nullmailer pid 3946462 invoked by uid 1000);
        Fri, 30 Apr 2021 21:40:19 -0000
Date:   Fri, 30 Apr 2021 16:40:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     cl@rock-chips.com
Cc:     jamie@jamieiles.com, jbx6244@gmail.com, linux@roeck-us.net,
        wens@csie.org, linux-watchdog@vger.kernel.org, robh+dt@kernel.org,
        jay.xu@rock-chips.com, gregkh@linuxfoundation.org,
        zhangqing@rock-chips.com, jagan@amarulasolutions.com,
        huangtao@rock-chips.com, ulf.hansson@linaro.org,
        wim@linux-watchdog.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        maz@kernel.org, cnsztl@gmail.com, linux-i2c@vger.kernel.org,
        linux-rockchip@lists.infradead.org, mail@david-bauer.net,
        shawn.lin@rock-chips.com, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org, heiko@sntech.de, uwe@kleine-koenig.org,
        jensenhuang@friendlyarm.com, david.wu@rock-chips.com,
        michael@amarulasolutions.com
Subject: Re: [PATCH v4 10/10] arm64: dts: rockchip: add basic dts for RK3568
 EVB
Message-ID: <20210430214019.GA3946409@robh.at.kernel.org>
References: <20210429081151.17558-1-cl@rock-chips.com>
 <20210429081358.18057-1-cl@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429081358.18057-1-cl@rock-chips.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 29 Apr 2021 16:13:58 +0800, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> This patch add rk3568-evb1-v10.dts for RK3568 evaluation board.
> add uart/emmc/i2c/rk809 node for basic function.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  .../devicetree/bindings/arm/rockchip.yaml     |  5 ++
>  arch/arm64/boot/dts/rockchip/Makefile         |  1 +
>  .../boot/dts/rockchip/rk3568-evb1-v10.dts     | 79 +++++++++++++++++++
>  3 files changed, 85 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> 

Reviewed-by: Rob Herring <robh@kernel.org>
