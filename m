Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02F8A2A374
	for <lists+linux-i2c@lfdr.de>; Sat, 25 May 2019 10:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfEYId1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 May 2019 04:33:27 -0400
Received: from mleia.com ([178.79.152.223]:53066 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726399AbfEYId0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 May 2019 04:33:26 -0400
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 10F54400019;
        Sat, 25 May 2019 09:33:25 +0100 (BST)
Subject: Re: [PATCH 3/8] MAINTAINERS: add I2C DT bindings to LPC platforms
To:     Wolfram Sang <wsa@the-dreams.de>,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-i2c@vger.kernel.org
References: <20190521082137.2889-1-wsa@the-dreams.de>
 <20190521082137.2889-4-wsa@the-dreams.de>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <266e3199-840b-54e7-cacf-c6eb5fc1c6c5@mleia.com>
Date:   Sat, 25 May 2019 11:33:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20190521082137.2889-4-wsa@the-dreams.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20190525_093325_131783_B91B0A37 
X-CRM114-Status: GOOD (  11.42  )
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 05/21/2019 11:21 AM, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90abfe11b05c..01b5579cfa07 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1782,6 +1782,7 @@ ARM/LPC18XX ARCHITECTURE
>  M:	Vladimir Zapolskiy <vz@mleia.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/i2c/i2c-lpc2k.txt
>  F:	arch/arm/boot/dts/lpc43*
>  F:	drivers/i2c/busses/i2c-lpc2k.c
>  F:	drivers/memory/pl172.c
> @@ -1795,6 +1796,7 @@ M:	Sylvain Lemieux <slemieux.tyco@gmail.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  T:	git git://github.com/vzapolskiy/linux-lpc32xx.git
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/i2c/i2c-pnx.txt
>  F:	arch/arm/boot/dts/lpc32*
>  F:	arch/arm/mach-lpc32xx/
>  F:	drivers/i2c/busses/i2c-pnx.c
> 

it makes sense, thank you for the change!

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
