Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D083625ED2
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2019 09:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbfEVHvb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 May 2019 03:51:31 -0400
Received: from gloria.sntech.de ([185.11.138.130]:43182 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726552AbfEVHva (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 May 2019 03:51:30 -0400
Received: from we0524.dip.tu-dresden.de ([141.76.178.12] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1hTM24-0007xP-LO; Wed, 22 May 2019 09:51:28 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 5/8] MAINTAINERS: add I2C DT bindings to Rockchip platform
Date:   Wed, 22 May 2019 09:51:27 +0200
Message-ID: <2847662.8Nn05j9K3f@phil>
In-Reply-To: <20190521082137.2889-6-wsa@the-dreams.de>
References: <20190521082137.2889-1-wsa@the-dreams.de> <20190521082137.2889-6-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Am Dienstag, 21. Mai 2019, 10:21:34 CEST schrieb Wolfram Sang:
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> Cc: Heiko Stuebner <heiko@sntech.de>

not sure if you want me to apply this or just want to pick it up
yourself (I don't have a hard preference here). In any case, if you
want to pick it up, it is obviously

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1a60cd98aad5..09f32866bdef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2145,6 +2145,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-rockchip@lists.infradead.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/i2c/i2c-rk3x.txt
>  F:	arch/arm/boot/dts/rk3*
>  F:	arch/arm/boot/dts/rv1108*
>  F:	arch/arm/mach-rockchip/
> 




