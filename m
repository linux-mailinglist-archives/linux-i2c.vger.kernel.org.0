Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142D2430377
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Oct 2021 17:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbhJPPnw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Oct 2021 11:43:52 -0400
Received: from marcansoft.com ([212.63.210.85]:34062 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231824AbhJPPno (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 16 Oct 2021 11:43:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id AD9EC41E64;
        Sat, 16 Oct 2021 15:41:33 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: Add pasemi i2c to ARM/APPLE MACHINE
To:     Sven Peter <sven@svenpeter.dev>, Wolfram Sang <wsa@kernel.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20211016110344.53509-1-sven@svenpeter.dev>
From:   Hector Martin <marcan@marcan.st>
Message-ID: <97d4881d-7637-aac1-d206-513f0d7c2738@marcan.st>
Date:   Sun, 17 Oct 2021 00:41:31 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211016110344.53509-1-sven@svenpeter.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16/10/2021 20.03, Sven Peter wrote:
> Add the pasemi i2c platform and core files to the ARM/APPLE MACHINE
> entry in MAINTAINERS.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
> As discussed in the i2c series, here are the MAINTAINER changes.
> Hector will take this commit through his tree.
> 
>   MAINTAINERS | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ad62687a0b3c..ecf239ac427e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1729,10 +1729,13 @@ B:	https://github.com/AsahiLinux/linux/issues
>   C:	irc://irc.oftc.net/asahi-dev
>   T:	git https://github.com/AsahiLinux/linux.git
>   F:	Documentation/devicetree/bindings/arm/apple.yaml
> +F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>   F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
>   F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
>   F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
>   F:	arch/arm64/boot/dts/apple/
> +F:	drivers/i2c/busses/i2c-pasemi-core.c
> +F:	drivers/i2c/busses/i2c-pasemi-platform.c
>   F:	drivers/irqchip/irq-apple-aic.c
>   F:	include/dt-bindings/interrupt-controller/apple-aic.h
>   F:	include/dt-bindings/pinctrl/apple.h
> 

Acked-by: Hector Martin <marcan@marcan.st>

Thanks!

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
