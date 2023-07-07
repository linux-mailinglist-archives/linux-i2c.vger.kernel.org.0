Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB91A74AFA4
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 13:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbjGGLYv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 07:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjGGLYu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 07:24:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80D91FF7;
        Fri,  7 Jul 2023 04:24:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2BCE761947;
        Fri,  7 Jul 2023 11:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5956EC433C7;
        Fri,  7 Jul 2023 11:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1688729088;
        bh=LOgGo2S8J0W/3urW+Ti0fTdtCUZF8vgQbegkxehA2Nw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V6pm8aS+Hqo30H+UfcDWPK9FUel6+CEaeLnbsqjg5FNFn7kS9vpsV/yUffNtNtN4r
         eYj8wPa9jFaESU9qYfLPXkEq1P+y26NKM033eo6Tum/YGx4QnFqAodrRTvrUgwxjd+
         Hb0ygjCLtz/yNG4DLd9KU6K45+rum5O927EybD2I=
Date:   Fri, 7 Jul 2023 11:37:39 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc:     Oleksii_Moisieiev@epam.com, herbert@gondor.apana.org.au,
        davem@davemloft.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
        olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
        mchehab@kernel.org, fabrice.gasnier@foss.st.com,
        andi.shyti@kernel.org, ulf.hansson@linaro.org, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, hugues.fruchet@foss.st.com,
        lee@kernel.org, will@kernel.org, catalin.marinas@arm.com,
        arnd@kernel.org, richardcochran@gmail.com,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        netdev@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 05/10] firewall: introduce stm32_firewall framework
Message-ID: <2023070748-false-enroll-e5dc@gregkh>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705172759.1610753-6-gatien.chevallier@foss.st.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 05, 2023 at 07:27:54PM +0200, Gatien Chevallier wrote:
> Introduce a firewall framework that offers to firewall consumers different
> firewall services such as the ability to check their access rights against
> their firewall controller(s).
> 
> The firewall framework offers a generic API that is defined in firewall
> controllers drivers to best fit the specificity of each firewall.

But you aren't defining a "generic" api here, you are defining a
specific one for your specific hardware.

Or am I missing something?

> 
> There are various types of firewalls:
> -Peripheral firewalls that filter accesses to peripherals
> -Memory firewalls that filter accesses to memories or memory regions
> -Resource firewalls that filter accesses to internal resources such as
> reset and clock controllers
> 
> A firewall controller must be probed at arch_initcall level and register
> to the framework so that consumers can use their services.

Why must it happen at arch_initcall?  So it can never be a module?  That
feels wrong.

> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  MAINTAINERS                               |   5 +
>  arch/arm64/Kconfig.platforms              |   1 +
>  drivers/bus/Kconfig                       |  10 +
>  drivers/bus/Makefile                      |   1 +
>  drivers/bus/stm32_firewall.c              | 252 ++++++++++++++++++++++
>  drivers/bus/stm32_firewall.h              |  83 +++++++
>  include/linux/bus/stm32_firewall_device.h | 134 ++++++++++++
>  7 files changed, 486 insertions(+)
>  create mode 100644 drivers/bus/stm32_firewall.c
>  create mode 100644 drivers/bus/stm32_firewall.h
>  create mode 100644 include/linux/bus/stm32_firewall_device.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 41385f01fa98..fabf95ba9b86 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20123,6 +20123,11 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
>  F:	drivers/media/i2c/st-mipid02.c
>  
> +ST STM32 FIREWALL
> +M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
> +S:	Maintained
> +F:	drivers/bus/stm32_firewall.c
> +
>  ST STM32 I2C/SMBUS DRIVER
>  M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
>  M:	Alain Volmat <alain.volmat@foss.st.com>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 6069120199bb..5a46e90f1e4e 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -293,6 +293,7 @@ config ARCH_STM32
>  	select ARM_SMC_MBOX
>  	select ARM_SCMI_PROTOCOL
>  	select COMMON_CLK_SCMI
> +	select STM32_FIREWALL
>  	help
>  	  This enables support for ARMv8 based STMicroelectronics
>  	  STM32 family, including:
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index fcfa280df98a..4d54a7ea52b2 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -163,6 +163,16 @@ config QCOM_SSC_BLOCK_BUS
>  	  i2c/spi/uart controllers, a hexagon core, and a clock controller
>  	  which provides clocks for the above.
>  
> +config STM32_FIREWALL
> +	bool "STM32 Firewall framework"
> +	depends on ARCH_STM32

Why this dependency?

> +	default MACH_STM32MP157 || MACH_STM32MP13 || MACH_STM32MP25
> +	help
> +	  Say y to enable firewall framework and its services. Firewall
> +	  controllers will be able to register to the framework. Firewall
> +	  controllers must be initialized and register to the firewall framework
> +	  at arch_initcall level.

This needs better wording saying it is only for stm32 devices.

> +
>  config SUN50I_DE2_BUS
>  	bool "Allwinner A64 DE2 Bus Driver"
>  	  default ARM64
> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> index d90eed189a65..fc0511450ec2 100644
> --- a/drivers/bus/Makefile
> +++ b/drivers/bus/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
>  obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
>  obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
>  obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
> +obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o
>  obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
>  obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
>  obj-$(CONFIG_OF)		+= simple-pm-bus.o
> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
> new file mode 100644
> index 000000000000..510db5bc6eaf
> --- /dev/null
> +++ b/drivers/bus/stm32_firewall.c
> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later

Are you _SURE_ this needs to be "or later"?  Sorry, I have to ask.

thanks,

greg k-h
