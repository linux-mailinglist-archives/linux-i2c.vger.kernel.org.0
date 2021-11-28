Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56BE04606E6
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Nov 2021 15:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357985AbhK1OcX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Nov 2021 09:32:23 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:48888 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357847AbhK1OaX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Nov 2021 09:30:23 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9E001B80D19;
        Sun, 28 Nov 2021 14:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E181C004E1;
        Sun, 28 Nov 2021 14:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638109624;
        bh=BXX6BNWkUI1KY/vvEKSAwHk13IY+j6MOE4LeLMJnjpI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SbFUtvH2fnRzwNeHqBPIF4eKlsML0n4Q8wq04aVRR+2S3uu2Uy2jXupJwkNso/KcF
         8n7SCeokUayzMLi/0673bPe8Tk5N0BIHqMCwjmlgBa3NXdmOHWQUyZG7LU52dxlEbx
         SC6JXZDKPDLD2jkAPURUv2YdAf0QKlDiU2zgr0EY=
Date:   Sun, 28 Nov 2021 15:27:00 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 6/8] tty: serial: Make SERIAL_SAMSUNG=y impossible when
 EXYNOS_USI_V2=m
Message-ID: <YaORtBO4b9AyFYyd@kroah.com>
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
 <20211127223253.19098-7-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211127223253.19098-7-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Nov 28, 2021 at 12:32:51AM +0200, Sam Protsenko wrote:
> When UART is encapsulated in USIv2 block (e.g. in Exynos850), USIv2
> driver must be loaded first, as it's preparing USI hardware for
> particular protocol use. Make it impossible for Samsung serial driver to
> be built-in when USIv2 driver is built as a module, to prevent incorrect
> booting order for those drivers.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/tty/serial/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 0e5ccb25bdb1..47bc24e74041 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -237,6 +237,7 @@ config SERIAL_CLPS711X_CONSOLE
>  config SERIAL_SAMSUNG
>  	tristate "Samsung SoC serial support"
>  	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_APPLE || COMPILE_TEST
> +	depends on EXYNOS_USI_V2 || !EXYNOS_USI_V2

That's odd, and is not going to help if everything is built as a module
and loaded that way.

This needs to be done properly in code to handle the issues if the
"wrong" code is loaded first.  Please trigger off of the hardware type
correctly so you don't have to worry about this at all.

thanks,

greg k-h
