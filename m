Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C64FF36C06C
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Apr 2021 09:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbhD0Hv4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Apr 2021 03:51:56 -0400
Received: from gloria.sntech.de ([185.11.138.130]:51138 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230062AbhD0Hv4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 27 Apr 2021 03:51:56 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lbIUf-0002Gr-No; Tue, 27 Apr 2021 09:50:53 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     cl@rock-chips.com
Cc:     robh+dt@kernel.org, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net, jbx6244@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: rockchip: add basic dts for RK3568 EVB
Date:   Tue, 27 Apr 2021 09:50:51 +0200
Message-ID: <3689795.CpGBqz00pN@diego>
In-Reply-To: <20210425094455.25949-1-cl@rock-chips.com>
References: <20210425094216.25724-1-cl@rock-chips.com> <20210425094455.25949-1-cl@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Sonntag, 25. April 2021, 11:44:55 CEST schrieb cl@rock-chips.com:
> From: Liang Chen <cl@rock-chips.com>
> 
> This patch add rk3568-evb1-v10.dts for RK3568 evaluation board.
> add uart/emmc/i2c/rk809 node for basic function.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  .../devicetree/bindings/arm/rockchip.yaml     |  5 ++
>  arch/arm64/boot/dts/rockchip/Makefile         |  1 +
>  .../boot/dts/rockchip/rk3568-evb1-v10.dts     | 80 +++++++++++++++++++
>  3 files changed, 86 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 4a6f772c1043..95ab9714af44 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -565,6 +565,11 @@ properties:
>            - const: rockchip,rk3399-evb
>            - const: rockchip,rk3399
>  
> +      - description: Rockchip RK3568 Evaluation board

please sort this below the rk3399 stuff in the file
( 3568 is a bigger number than 3399 )

Thanks
Heiko


