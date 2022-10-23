Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A07B60925D
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Oct 2022 12:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbiJWK7m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Oct 2022 06:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbiJWK7l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Oct 2022 06:59:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 023FBFD02;
        Sun, 23 Oct 2022 03:59:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 82FDA60B45;
        Sun, 23 Oct 2022 10:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E096C433D6;
        Sun, 23 Oct 2022 10:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666522776;
        bh=nME5vyNbyftiQbieWNSiJhbegbJbHVrC6/WlOiXPXOE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tb5PldlPXGoqT1dtaUP6IoS8vBYcezvUj+2bQGCG26KVF7xI8zAdHzjg0gTwyl9wG
         7FzC9IONV0wgesMuZgeiZS9dHH6JeMYbD4dsHHSYXRI9OUHuX2vZJHhh3ZsHD4/Nh6
         qPkYEDePRVdVMv5nlCHAcmN8KJSGb19+/n1Yx/z0ERJVSKzA7XbVStKrDSe2le84Yn
         bRalaFyRnUcyZvqcGgwO2Xq4pv9JFwyw7qLtpi3LBNq4WvGfGjCNem8bv30aV950XD
         BRkdG1eqqpnIojGVmptUTpf/6PU1I1aQPuc6pHdKrzl8nJOZDLdHXtjOFMfFaLrsHN
         94vZPxDVPh90w==
Date:   Sun, 23 Oct 2022 12:00:04 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/21] ARM: s3c: remove s3c24xx specific hacks
Message-ID: <20221023120004.04cb6f3f@jic23-huawei>
In-Reply-To: <20221021203329.4143397-2-arnd@kernel.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
        <20221021203329.4143397-2-arnd@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 21 Oct 2022 22:27:35 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> A number of device drivers reference CONFIG_ARM_S3C24XX_CPUFREQ or
> similar symbols that are no longer available with the platform gone,
> though the drivers themselves are still used on newer platforms,
> so remove these hacks.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
For the IIO Kconfig change

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  arch/arm/include/debug/s3c24xx.S              |  10 -
>  arch/arm/mach-s3c/Makefile                    |   2 -
>  arch/arm/mach-s3c/devs.c                      |   1 -
>  arch/arm/mach-s3c/dma.h                       |   7 -
>  arch/arm/mach-s3c/gpio-samsung.h              |   7 -
>  arch/arm/mach-s3c/irqs.h                      |   7 -
>  arch/arm/mach-s3c/map.h                       |   7 -
>  arch/arm/mach-s3c/pm-core.h                   |   7 -
>  arch/arm/mach-s3c/regs-clock.h                |   7 -
>  arch/arm/mach-s3c/regs-gpio.h                 |   7 -
>  arch/arm/mach-s3c/regs-irq.h                  |   7 -
>  drivers/clocksource/Kconfig                   |   2 +-
>  drivers/i2c/busses/Kconfig                    |   3 +-
>  drivers/i2c/busses/i2c-s3c2410.c              |  72 -------
>  drivers/iio/adc/Kconfig                       |   6 +-
>  .../media/platform/samsung/s3c-camif/Kconfig  |   8 +-
>  drivers/mmc/host/Kconfig                      |   5 +-
>  drivers/mtd/nand/raw/Kconfig                  |   2 +-
>  drivers/mtd/nand/raw/s3c2410.c                |  60 ------
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |  10 -
>  drivers/rtc/Kconfig                           |   8 +-
>  drivers/tty/serial/Kconfig                    |   8 +-
>  drivers/tty/serial/samsung_tty.c              | 199 ------------------
>  drivers/usb/host/Kconfig                      |   8 +-
>  drivers/watchdog/Kconfig                      |   9 +-
>  drivers/watchdog/s3c2410_wdt.c                |  84 +-------
>  include/linux/clk/samsung.h                   |  32 ---
>  include/linux/soc/samsung/s3c-pm.h            |  58 -----
>  28 files changed, 29 insertions(+), 614 deletions(-)
> 
> diff --git a/arch/arm/include/debug/s3c24xx.S b/arch/arm/include/debug/s3c24xx.S
> index af873b526677..7ab5e577cd42 100644
> --- a/arch/arm/include/debug/s3c24xx.S
> +++ b/arch/arm/include/debug/s3c24xx.S
> @@ -28,16 +28,6 @@
>  		and	\rd, \rd, #S3C2410_UFSTAT_TXMASK
>  	.endm
>  
> -/* Select the correct implementation depending on the configuration. The
> - * S3C2440 will get selected by default, as these are the most widely
> - * used variants of these
> -*/
> -
> -#if defined(CONFIG_DEBUG_S3C2410_UART)
> -#define fifo_full  fifo_full_s3c2410
> -#define fifo_level fifo_level_s3c2410
> -#endif
> -
>  /* include the reset of the code which will do the work */
>  
>  #include <debug/samsung.S>
> diff --git a/arch/arm/mach-s3c/Makefile b/arch/arm/mach-s3c/Makefile
> index e7f18039b149..a5135137e648 100644
> --- a/arch/arm/mach-s3c/Makefile
> +++ b/arch/arm/mach-s3c/Makefile
> @@ -2,9 +2,7 @@
>  #
>  # Copyright 2009 Simtec Electronics
>  
> -ifdef CONFIG_ARCH_S3C64XX
>  include $(src)/Makefile.s3c64xx
> -endif
>  
>  # Objects we always build independent of SoC choice
>  
> diff --git a/arch/arm/mach-s3c/devs.c b/arch/arm/mach-s3c/devs.c
> index 9ac07c023adf..a31d1c3038e8 100644
> --- a/arch/arm/mach-s3c/devs.c
> +++ b/arch/arm/mach-s3c/devs.c
> @@ -29,7 +29,6 @@
>  #include <linux/sizes.h>
>  #include <linux/platform_data/s3c-hsudc.h>
>  #include <linux/platform_data/s3c-hsotg.h>
> -#include <linux/platform_data/dma-s3c24xx.h>
>  
>  #include <linux/platform_data/media/s5p_hdmi.h>
>  
> diff --git a/arch/arm/mach-s3c/dma.h b/arch/arm/mach-s3c/dma.h
> index 59a4578c5f00..48057cb90070 100644
> --- a/arch/arm/mach-s3c/dma.h
> +++ b/arch/arm/mach-s3c/dma.h
> @@ -1,9 +1,2 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -
> -#ifdef CONFIG_ARCH_S3C24XX
> -#include "dma-s3c24xx.h"
> -#endif
> -
> -#ifdef CONFIG_ARCH_S3C64XX
>  #include "dma-s3c64xx.h"
> -#endif
> diff --git a/arch/arm/mach-s3c/gpio-samsung.h b/arch/arm/mach-s3c/gpio-samsung.h
> index 02f6f4a96862..4233515eddaa 100644
> --- a/arch/arm/mach-s3c/gpio-samsung.h
> +++ b/arch/arm/mach-s3c/gpio-samsung.h
> @@ -1,9 +1,2 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -
> -#ifdef CONFIG_ARCH_S3C24XX
> -#include "gpio-samsung-s3c24xx.h"
> -#endif
> -
> -#ifdef CONFIG_ARCH_S3C64XX
>  #include "gpio-samsung-s3c64xx.h"
> -#endif
> diff --git a/arch/arm/mach-s3c/irqs.h b/arch/arm/mach-s3c/irqs.h
> index 0bff1c1c8eb0..3ff0e0963080 100644
> --- a/arch/arm/mach-s3c/irqs.h
> +++ b/arch/arm/mach-s3c/irqs.h
> @@ -1,9 +1,2 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -
> -#ifdef CONFIG_ARCH_S3C24XX
> -#include "irqs-s3c24xx.h"
> -#endif
> -
> -#ifdef CONFIG_ARCH_S3C64XX
>  #include "irqs-s3c64xx.h"
> -#endif
> diff --git a/arch/arm/mach-s3c/map.h b/arch/arm/mach-s3c/map.h
> index 7cfb517d4886..778d6f81cb2b 100644
> --- a/arch/arm/mach-s3c/map.h
> +++ b/arch/arm/mach-s3c/map.h
> @@ -1,9 +1,2 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -
> -#ifdef CONFIG_ARCH_S3C24XX
> -#include "map-s3c24xx.h"
> -#endif
> -
> -#ifdef CONFIG_ARCH_S3C64XX
>  #include "map-s3c64xx.h"
> -#endif
> diff --git a/arch/arm/mach-s3c/pm-core.h b/arch/arm/mach-s3c/pm-core.h
> index b0e1d277f599..3e0c2df79120 100644
> --- a/arch/arm/mach-s3c/pm-core.h
> +++ b/arch/arm/mach-s3c/pm-core.h
> @@ -1,9 +1,2 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -
> -#ifdef CONFIG_ARCH_S3C24XX
> -#include "pm-core-s3c24xx.h"
> -#endif
> -
> -#ifdef CONFIG_ARCH_S3C64XX
>  #include "pm-core-s3c64xx.h"
> -#endif
> diff --git a/arch/arm/mach-s3c/regs-clock.h b/arch/arm/mach-s3c/regs-clock.h
> index 7df31f203d28..fc7e3886b07c 100644
> --- a/arch/arm/mach-s3c/regs-clock.h
> +++ b/arch/arm/mach-s3c/regs-clock.h
> @@ -1,9 +1,2 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -
> -#ifdef CONFIG_ARCH_S3C24XX
> -#include "regs-clock-s3c24xx.h"
> -#endif
> -
> -#ifdef CONFIG_ARCH_S3C64XX
>  #include "regs-clock-s3c64xx.h"
> -#endif
> diff --git a/arch/arm/mach-s3c/regs-gpio.h b/arch/arm/mach-s3c/regs-gpio.h
> index 0d41cb76d440..4e08e8609663 100644
> --- a/arch/arm/mach-s3c/regs-gpio.h
> +++ b/arch/arm/mach-s3c/regs-gpio.h
> @@ -1,9 +1,2 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -
> -#ifdef CONFIG_ARCH_S3C24XX
> -#include "regs-gpio-s3c24xx.h"
> -#endif
> -
> -#ifdef CONFIG_ARCH_S3C64XX
>  #include "regs-gpio-s3c64xx.h"
> -#endif
> diff --git a/arch/arm/mach-s3c/regs-irq.h b/arch/arm/mach-s3c/regs-irq.h
> index 57f0dda8dbf5..4243daa54bd1 100644
> --- a/arch/arm/mach-s3c/regs-irq.h
> +++ b/arch/arm/mach-s3c/regs-irq.h
> @@ -1,9 +1,2 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -
> -#ifdef CONFIG_ARCH_S3C24XX
> -#include "regs-irq-s3c24xx.h"
> -#endif
> -
> -#ifdef CONFIG_ARCH_S3C64XX
>  #include "regs-irq-s3c64xx.h"
> -#endif
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 4469e7f555e9..fc10ecc3602d 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -441,7 +441,7 @@ config CLKSRC_EXYNOS_MCT
>  config CLKSRC_SAMSUNG_PWM
>  	bool "PWM timer driver for Samsung S3C, S5P" if COMPILE_TEST
>  	depends on HAS_IOMEM
> -	depends on ARCH_EXYNOS || ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210 || COMPILE_TEST
> +	depends on ARCH_EXYNOS || ARCH_S3C64XX || ARCH_S5PV210 || COMPILE_TEST
>  	help
>  	  This is a new clocksource driver for the PWM timer found in
>  	  Samsung S3C, S5P and Exynos SoCs, replacing an earlier driver
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index f427c8ea5c7b..84d21e0a7cdf 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1009,8 +1009,7 @@ config I2C_RZV2M
>  
>  config I2C_S3C2410
>  	tristate "S3C/Exynos I2C Driver"
> -	depends on ARCH_EXYNOS || ARCH_S3C24XX || ARCH_S3C64XX || \
> -		   ARCH_S5PV210 || COMPILE_TEST
> +	depends on ARCH_EXYNOS || ARCH_S3C64XX || ARCH_S5PV210 || COMPILE_TEST
>  	help
>  	  Say Y here to include support for I2C controller in the
>  	  Samsung SoCs (S3C, S5Pv210, Exynos).
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index 36dab9cd208c..45e9df81345a 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -116,9 +116,6 @@ struct s3c24xx_i2c {
>  	struct s3c2410_platform_i2c	*pdata;
>  	struct gpio_desc	*gpios[2];
>  	struct pinctrl          *pctrl;
> -#if defined(CONFIG_ARM_S3C24XX_CPUFREQ)
> -	struct notifier_block	freq_transition;
> -#endif
>  	struct regmap		*sysreg;
>  	unsigned int		sys_i2c_cfg;
>  };
> @@ -885,65 +882,6 @@ static int s3c24xx_i2c_clockrate(struct s3c24xx_i2c *i2c, unsigned int *got)
>  	return 0;
>  }
>  
> -#if defined(CONFIG_ARM_S3C24XX_CPUFREQ)
> -
> -#define freq_to_i2c(_n) container_of(_n, struct s3c24xx_i2c, freq_transition)
> -
> -static int s3c24xx_i2c_cpufreq_transition(struct notifier_block *nb,
> -					  unsigned long val, void *data)
> -{
> -	struct s3c24xx_i2c *i2c = freq_to_i2c(nb);
> -	unsigned int got;
> -	int delta_f;
> -	int ret;
> -
> -	delta_f = clk_get_rate(i2c->clk) - i2c->clkrate;
> -
> -	/* if we're post-change and the input clock has slowed down
> -	 * or at pre-change and the clock is about to speed up, then
> -	 * adjust our clock rate. <0 is slow, >0 speedup.
> -	 */
> -
> -	if ((val == CPUFREQ_POSTCHANGE && delta_f < 0) ||
> -	    (val == CPUFREQ_PRECHANGE && delta_f > 0)) {
> -		i2c_lock_bus(&i2c->adap, I2C_LOCK_ROOT_ADAPTER);
> -		ret = s3c24xx_i2c_clockrate(i2c, &got);
> -		i2c_unlock_bus(&i2c->adap, I2C_LOCK_ROOT_ADAPTER);
> -
> -		if (ret < 0)
> -			dev_err(i2c->dev, "cannot find frequency (%d)\n", ret);
> -		else
> -			dev_info(i2c->dev, "setting freq %d\n", got);
> -	}
> -
> -	return 0;
> -}
> -
> -static inline int s3c24xx_i2c_register_cpufreq(struct s3c24xx_i2c *i2c)
> -{
> -	i2c->freq_transition.notifier_call = s3c24xx_i2c_cpufreq_transition;
> -
> -	return cpufreq_register_notifier(&i2c->freq_transition,
> -					 CPUFREQ_TRANSITION_NOTIFIER);
> -}
> -
> -static inline void s3c24xx_i2c_deregister_cpufreq(struct s3c24xx_i2c *i2c)
> -{
> -	cpufreq_unregister_notifier(&i2c->freq_transition,
> -				    CPUFREQ_TRANSITION_NOTIFIER);
> -}
> -
> -#else
> -static inline int s3c24xx_i2c_register_cpufreq(struct s3c24xx_i2c *i2c)
> -{
> -	return 0;
> -}
> -
> -static inline void s3c24xx_i2c_deregister_cpufreq(struct s3c24xx_i2c *i2c)
> -{
> -}
> -#endif
> -
>  #ifdef CONFIG_OF
>  static int s3c24xx_i2c_parse_dt_gpio(struct s3c24xx_i2c *i2c)
>  {
> @@ -1152,13 +1090,6 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	ret = s3c24xx_i2c_register_cpufreq(i2c);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to register cpufreq notifier\n");
> -		clk_unprepare(i2c->clk);
> -		return ret;
> -	}
> -
>  	/*
>  	 * Note, previous versions of the driver used i2c_add_adapter()
>  	 * to add the bus at any number. We now pass the bus number via
> @@ -1175,7 +1106,6 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>  	ret = i2c_add_numbered_adapter(&i2c->adap);
>  	if (ret < 0) {
>  		pm_runtime_disable(&pdev->dev);
> -		s3c24xx_i2c_deregister_cpufreq(i2c);
>  		clk_unprepare(i2c->clk);
>  		return ret;
>  	}
> @@ -1192,8 +1122,6 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
>  
>  	pm_runtime_disable(&pdev->dev);
>  
> -	s3c24xx_i2c_deregister_cpufreq(i2c);
> -
>  	i2c_del_adapter(&i2c->adap);
>  
>  	return 0;
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 791612ca6012..9de7f05d40e2 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -437,11 +437,11 @@ config EP93XX_ADC
>  
>  config EXYNOS_ADC
>  	tristate "Exynos ADC driver support"
> -	depends on ARCH_EXYNOS || ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210 || (OF && COMPILE_TEST)
> +	depends on ARCH_EXYNOS || ARCH_S3C64XX || ARCH_S5PV210 || (OF && COMPILE_TEST)
>  	depends on HAS_IOMEM
>  	help
> -	  Driver for the ADC block found in the Samsung S3C (S3C2410, S3C2416,
> -	  S3C2440, S3C2443, S3C6410), S5Pv210 and Exynos SoCs.
> +	  Driver for the ADC block found in the Samsung S3C6410, S5Pv210 and
> +	  Exynos SoCs.
>  	  Choose Y here only if you build for such Samsung SoC.
>  
>  	  To compile this driver as a module, choose M here: the module will be
> diff --git a/drivers/media/platform/samsung/s3c-camif/Kconfig b/drivers/media/platform/samsung/s3c-camif/Kconfig
> index 8cb8d1ac3edc..f359f6382fff 100644
> --- a/drivers/media/platform/samsung/s3c-camif/Kconfig
> +++ b/drivers/media/platform/samsung/s3c-camif/Kconfig
> @@ -1,15 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config VIDEO_S3C_CAMIF
> -	tristate "Samsung S3C24XX/S3C64XX SoC Camera Interface driver"
> +	tristate "Samsung 3C64XX SoC Camera Interface driver"
>  	depends on V4L_PLATFORM_DRIVERS
>  	depends on VIDEO_DEV && I2C && PM
> -	depends on ARCH_S3C64XX || PLAT_S3C24XX || COMPILE_TEST
> +	depends on ARCH_S3C64XX || COMPILE_TEST
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_DMA_CONTIG
>  	help
> -	  This is a v4l2 driver for s3c24xx and s3c64xx SoC series camera
> -	  host interface (CAMIF).
> +	  This is a v4l2 driver for s3c64xx SoC series camera host interface
> +	  (CAMIF).
>  
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called s3c-camif.
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 84dd37ff2735..79d8ddf1f616 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -312,9 +312,8 @@ config MMC_SDHCI_S3C
>  	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
>  	help
>  	  This selects the Secure Digital Host Controller Interface (SDHCI)
> -	  often referrered to as the HSMMC block in some of the Samsung S3C
> -	  (S3C2416, S3C2443, S3C6410), S5Pv210 and Exynos (Exynso4210,
> -	  Exynos4412) SoCs.
> +	  often referrered to as the HSMMC block in some of the Samsung
> +	  S3C6410, S5Pv210 and Exynos (Exynso4210, Exynos4412) SoCs.
>  
>  	  If you have a controller with this interface (thereforeyou build for
>  	  such Samsung SoC), say Y or M here.
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index 280a55139387..a347833b8f29 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -79,7 +79,7 @@ config MTD_NAND_NDFC
>  
>  config MTD_NAND_S3C2410
>  	tristate "Samsung S3C NAND controller"
> -	depends on ARCH_S3C24XX || ARCH_S3C64XX
> +	depends on ARCH_S3C64XX
>  	help
>  	  This enables the NAND flash controller on the S3C24xx and S3C64xx
>  	  SoCs
> diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
> index f0a4535c812a..80d96f94d6cb 100644
> --- a/drivers/mtd/nand/raw/s3c2410.c
> +++ b/drivers/mtd/nand/raw/s3c2410.c
> @@ -166,10 +166,6 @@ struct s3c2410_nand_info {
>  	enum s3c_nand_clk_state		clk_state;
>  
>  	enum s3c_cpu_type		cpu_type;
> -
> -#ifdef CONFIG_ARM_S3C24XX_CPUFREQ
> -	struct notifier_block	freq_transition;
> -#endif
>  };
>  
>  struct s3c24XX_nand_devtype_data {
> @@ -711,54 +707,6 @@ static void s3c2440_nand_write_buf(struct nand_chip *this, const u_char *buf,
>  	}
>  }
>  
> -/* cpufreq driver support */
> -
> -#ifdef CONFIG_ARM_S3C24XX_CPUFREQ
> -
> -static int s3c2410_nand_cpufreq_transition(struct notifier_block *nb,
> -					  unsigned long val, void *data)
> -{
> -	struct s3c2410_nand_info *info;
> -	unsigned long newclk;
> -
> -	info = container_of(nb, struct s3c2410_nand_info, freq_transition);
> -	newclk = clk_get_rate(info->clk);
> -
> -	if ((val == CPUFREQ_POSTCHANGE && newclk < info->clk_rate) ||
> -	    (val == CPUFREQ_PRECHANGE && newclk > info->clk_rate)) {
> -		s3c2410_nand_setrate(info);
> -	}
> -
> -	return 0;
> -}
> -
> -static inline int s3c2410_nand_cpufreq_register(struct s3c2410_nand_info *info)
> -{
> -	info->freq_transition.notifier_call = s3c2410_nand_cpufreq_transition;
> -
> -	return cpufreq_register_notifier(&info->freq_transition,
> -					 CPUFREQ_TRANSITION_NOTIFIER);
> -}
> -
> -static inline void
> -s3c2410_nand_cpufreq_deregister(struct s3c2410_nand_info *info)
> -{
> -	cpufreq_unregister_notifier(&info->freq_transition,
> -				    CPUFREQ_TRANSITION_NOTIFIER);
> -}
> -
> -#else
> -static inline int s3c2410_nand_cpufreq_register(struct s3c2410_nand_info *info)
> -{
> -	return 0;
> -}
> -
> -static inline void
> -s3c2410_nand_cpufreq_deregister(struct s3c2410_nand_info *info)
> -{
> -}
> -#endif
> -
>  /* device management functions */
>  
>  static int s3c24xx_nand_remove(struct platform_device *pdev)
> @@ -768,8 +716,6 @@ static int s3c24xx_nand_remove(struct platform_device *pdev)
>  	if (info == NULL)
>  		return 0;
>  
> -	s3c2410_nand_cpufreq_deregister(info);
> -
>  	/* Release all our mtds  and their partitions, then go through
>  	 * freeing the resources used
>  	 */
> @@ -1184,12 +1130,6 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
>  	if (err != 0)
>  		goto exit_error;
>  
> -	err = s3c2410_nand_cpufreq_register(info);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to init cpufreq support\n");
> -		goto exit_error;
> -	}
> -
>  	if (allow_clk_suspend(info)) {
>  		dev_info(&pdev->dev, "clock idle support enabled\n");
>  		s3c2410_nand_clk_set_state(info, CLOCK_SUSPEND);
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index bd13b5ef246d..1a478854293f 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1322,16 +1322,6 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
>  #ifdef CONFIG_PINCTRL_S3C64XX
>  	{ .compatible = "samsung,s3c64xx-pinctrl",
>  		.data = &s3c64xx_of_data },
> -#endif
> -#ifdef CONFIG_PINCTRL_S3C24XX
> -	{ .compatible = "samsung,s3c2412-pinctrl",
> -		.data = &s3c2412_of_data },
> -	{ .compatible = "samsung,s3c2416-pinctrl",
> -		.data = &s3c2416_of_data },
> -	{ .compatible = "samsung,s3c2440-pinctrl",
> -		.data = &s3c2440_of_data },
> -	{ .compatible = "samsung,s3c2450-pinctrl",
> -		.data = &s3c2450_of_data },
>  #endif
>  	{},
>  };
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 312dccfa3f18..d13ca620ea5d 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1406,18 +1406,14 @@ config RTC_DRV_OMAP
>  
>  config RTC_DRV_S3C
>  	tristate "Samsung S3C series SoC RTC"
> -	depends on ARCH_EXYNOS || ARCH_S3C64XX || ARCH_S3C24XX || ARCH_S5PV210 || \
> +	depends on ARCH_EXYNOS || ARCH_S3C64XX || ARCH_S5PV210 || \
>  		   COMPILE_TEST
>  	help
>  	  RTC (Realtime Clock) driver for the clock inbuilt into the
> -	  Samsung S3C24XX series of SoCs. This can provide periodic
> +	  Samsung S3C64XX series of SoCs. This can provide periodic
>  	  interrupt rates from 1Hz to 64Hz for user programs, and
>  	  wakeup from Alarm.
>  
> -	  The driver currently supports the common features on all the
> -	  S3C24XX range, such as the S3C2410, S3C2412, S3C2413, S3C2440
> -	  and S3C2442.
> -
>  	  This driver can also be build as a module. If so, the module
>  	  will be called rtc-s3c.
>  
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 434f83168546..3ba8a39655a3 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -242,23 +242,23 @@ config SERIAL_SAMSUNG
>  	select SERIAL_CORE
>  	help
>  	  Support for the on-chip UARTs on the Samsung
> -	  S3C24xx/S3C64xx/S5Pv210/Exynos and Apple M1 SoCs, providing
> +	  S3C64xx/S5Pv210/Exynos and Apple M1 SoCs, providing
>  	  /dev/ttySAC0, 1 and 2 (note, some machines may not provide all of
>  	  these ports, depending on how the serial port pins are configured.
> +
>  	  Choose Y/M here only if you build for such SoC.
>  
>  config SERIAL_SAMSUNG_UARTS_4
>  	bool
>  	depends on SERIAL_SAMSUNG
> -	default y if !(CPU_S3C2410 || CPU_S3C2412 || CPU_S3C2440 || CPU_S3C2442)
> +	default y
>  	help
>  	  Internal node for the common case of 4 Samsung compatible UARTs
>  
>  config SERIAL_SAMSUNG_UARTS
>  	int
>  	depends on SERIAL_SAMSUNG
> -	default 4 if SERIAL_SAMSUNG_UARTS_4 || CPU_S3C2416
> -	default 3
> +	default 4
>  	help
>  	  Select the number of available UART ports for the Samsung S3C
>  	  serial driver
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 77d1363029f5..5adf3963b2f6 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -152,10 +152,6 @@ struct s3c24xx_uart_port {
>  	const struct s3c2410_uartcfg	*cfg;
>  
>  	struct s3c24xx_uart_dma		*dma;
> -
> -#ifdef CONFIG_ARM_S3C24XX_CPUFREQ
> -	struct notifier_block		freq_transition;
> -#endif
>  };
>  
>  static void s3c24xx_serial_tx_chars(struct s3c24xx_uart_port *ourport);
> @@ -1859,93 +1855,6 @@ static void s3c24xx_serial_resetport(struct uart_port *port,
>  	udelay(1);
>  }
>  
> -#ifdef CONFIG_ARM_S3C24XX_CPUFREQ
> -
> -static int s3c24xx_serial_cpufreq_transition(struct notifier_block *nb,
> -					     unsigned long val, void *data)
> -{
> -	struct s3c24xx_uart_port *port;
> -	struct uart_port *uport;
> -
> -	port = container_of(nb, struct s3c24xx_uart_port, freq_transition);
> -	uport = &port->port;
> -
> -	/* check to see if port is enabled */
> -
> -	if (port->pm_level != 0)
> -		return 0;
> -
> -	/* try and work out if the baudrate is changing, we can detect
> -	 * a change in rate, but we do not have support for detecting
> -	 * a disturbance in the clock-rate over the change.
> -	 */
> -
> -	if (IS_ERR(port->baudclk))
> -		goto exit;
> -
> -	if (port->baudclk_rate == clk_get_rate(port->baudclk))
> -		goto exit;
> -
> -	if (val == CPUFREQ_PRECHANGE) {
> -		/* we should really shut the port down whilst the
> -		 * frequency change is in progress.
> -		 */
> -
> -	} else if (val == CPUFREQ_POSTCHANGE) {
> -		struct ktermios *termios;
> -		struct tty_struct *tty;
> -
> -		if (uport->state == NULL)
> -			goto exit;
> -
> -		tty = uport->state->port.tty;
> -
> -		if (tty == NULL)
> -			goto exit;
> -
> -		termios = &tty->termios;
> -
> -		if (termios == NULL) {
> -			dev_warn(uport->dev, "%s: no termios?\n", __func__);
> -			goto exit;
> -		}
> -
> -		s3c24xx_serial_set_termios(uport, termios, NULL);
> -	}
> -
> -exit:
> -	return 0;
> -}
> -
> -static inline int
> -s3c24xx_serial_cpufreq_register(struct s3c24xx_uart_port *port)
> -{
> -	port->freq_transition.notifier_call = s3c24xx_serial_cpufreq_transition;
> -
> -	return cpufreq_register_notifier(&port->freq_transition,
> -					 CPUFREQ_TRANSITION_NOTIFIER);
> -}
> -
> -static inline void
> -s3c24xx_serial_cpufreq_deregister(struct s3c24xx_uart_port *port)
> -{
> -	cpufreq_unregister_notifier(&port->freq_transition,
> -				    CPUFREQ_TRANSITION_NOTIFIER);
> -}
> -
> -#else
> -static inline int
> -s3c24xx_serial_cpufreq_register(struct s3c24xx_uart_port *port)
> -{
> -	return 0;
> -}
> -
> -static inline void
> -s3c24xx_serial_cpufreq_deregister(struct s3c24xx_uart_port *port)
> -{
> -}
> -#endif
> -
>  static int s3c24xx_serial_enable_baudclk(struct s3c24xx_uart_port *ourport)
>  {
>  	struct device *dev = ourport->port.dev;
> @@ -2237,10 +2146,6 @@ static int s3c24xx_serial_probe(struct platform_device *pdev)
>  	if (!IS_ERR(ourport->baudclk))
>  		clk_disable_unprepare(ourport->baudclk);
>  
> -	ret = s3c24xx_serial_cpufreq_register(ourport);
> -	if (ret < 0)
> -		dev_err(&pdev->dev, "failed to add cpufreq notifier\n");
> -
>  	probe_index++;
>  
>  	return 0;
> @@ -2251,7 +2156,6 @@ static int s3c24xx_serial_remove(struct platform_device *dev)
>  	struct uart_port *port = s3c24xx_dev_to_port(&dev->dev);
>  
>  	if (port) {
> -		s3c24xx_serial_cpufreq_deregister(to_ourport(port));
>  		uart_remove_one_port(&s3c24xx_uart_drv, port);
>  	}
>  
> @@ -2589,94 +2493,6 @@ static struct console s3c24xx_serial_console = {
>  };
>  #endif /* CONFIG_SERIAL_SAMSUNG_CONSOLE */
>  
> -#ifdef CONFIG_CPU_S3C2410
> -static const struct s3c24xx_serial_drv_data s3c2410_serial_drv_data = {
> -	.info = {
> -		.name		= "Samsung S3C2410 UART",
> -		.type		= TYPE_S3C24XX,
> -		.port_type	= PORT_S3C2410,
> -		.fifosize	= 16,
> -		.rx_fifomask	= S3C2410_UFSTAT_RXMASK,
> -		.rx_fifoshift	= S3C2410_UFSTAT_RXSHIFT,
> -		.rx_fifofull	= S3C2410_UFSTAT_RXFULL,
> -		.tx_fifofull	= S3C2410_UFSTAT_TXFULL,
> -		.tx_fifomask	= S3C2410_UFSTAT_TXMASK,
> -		.tx_fifoshift	= S3C2410_UFSTAT_TXSHIFT,
> -		.def_clk_sel	= S3C2410_UCON_CLKSEL0,
> -		.num_clks	= 2,
> -		.clksel_mask	= S3C2410_UCON_CLKMASK,
> -		.clksel_shift	= S3C2410_UCON_CLKSHIFT,
> -	},
> -	.def_cfg = {
> -		.ucon		= S3C2410_UCON_DEFAULT,
> -		.ufcon		= S3C2410_UFCON_DEFAULT,
> -	},
> -};
> -#define S3C2410_SERIAL_DRV_DATA (&s3c2410_serial_drv_data)
> -#else
> -#define S3C2410_SERIAL_DRV_DATA NULL
> -#endif
> -
> -#ifdef CONFIG_CPU_S3C2412
> -static const struct s3c24xx_serial_drv_data s3c2412_serial_drv_data = {
> -	.info = {
> -		.name		= "Samsung S3C2412 UART",
> -		.type		= TYPE_S3C24XX,
> -		.port_type	= PORT_S3C2412,
> -		.fifosize	= 64,
> -		.has_divslot	= 1,
> -		.rx_fifomask	= S3C2440_UFSTAT_RXMASK,
> -		.rx_fifoshift	= S3C2440_UFSTAT_RXSHIFT,
> -		.rx_fifofull	= S3C2440_UFSTAT_RXFULL,
> -		.tx_fifofull	= S3C2440_UFSTAT_TXFULL,
> -		.tx_fifomask	= S3C2440_UFSTAT_TXMASK,
> -		.tx_fifoshift	= S3C2440_UFSTAT_TXSHIFT,
> -		.def_clk_sel	= S3C2410_UCON_CLKSEL2,
> -		.num_clks	= 4,
> -		.clksel_mask	= S3C2412_UCON_CLKMASK,
> -		.clksel_shift	= S3C2412_UCON_CLKSHIFT,
> -	},
> -	.def_cfg = {
> -		.ucon		= S3C2410_UCON_DEFAULT,
> -		.ufcon		= S3C2410_UFCON_DEFAULT,
> -	},
> -};
> -#define S3C2412_SERIAL_DRV_DATA (&s3c2412_serial_drv_data)
> -#else
> -#define S3C2412_SERIAL_DRV_DATA NULL
> -#endif
> -
> -#if defined(CONFIG_CPU_S3C2440) || defined(CONFIG_CPU_S3C2416) || \
> -	defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2442)
> -static const struct s3c24xx_serial_drv_data s3c2440_serial_drv_data = {
> -	.info = {
> -		.name		= "Samsung S3C2440 UART",
> -		.type		= TYPE_S3C24XX,
> -		.port_type	= PORT_S3C2440,
> -		.fifosize	= 64,
> -		.has_divslot	= 1,
> -		.rx_fifomask	= S3C2440_UFSTAT_RXMASK,
> -		.rx_fifoshift	= S3C2440_UFSTAT_RXSHIFT,
> -		.rx_fifofull	= S3C2440_UFSTAT_RXFULL,
> -		.tx_fifofull	= S3C2440_UFSTAT_TXFULL,
> -		.tx_fifomask	= S3C2440_UFSTAT_TXMASK,
> -		.tx_fifoshift	= S3C2440_UFSTAT_TXSHIFT,
> -		.def_clk_sel	= S3C2410_UCON_CLKSEL2,
> -		.num_clks	= 4,
> -		.clksel_mask	= S3C2412_UCON_CLKMASK,
> -		.clksel_shift	= S3C2412_UCON_CLKSHIFT,
> -		.ucon_mask	= S3C2440_UCON0_DIVMASK,
> -	},
> -	.def_cfg = {
> -		.ucon		= S3C2410_UCON_DEFAULT,
> -		.ufcon		= S3C2410_UFCON_DEFAULT,
> -	},
> -};
> -#define S3C2440_SERIAL_DRV_DATA (&s3c2440_serial_drv_data)
> -#else
> -#define S3C2440_SERIAL_DRV_DATA NULL
> -#endif
> -
>  #if defined(CONFIG_CPU_S3C6400) || defined(CONFIG_CPU_S3C6410)
>  static const struct s3c24xx_serial_drv_data s3c6400_serial_drv_data = {
>  	.info = {
> @@ -2845,15 +2661,6 @@ static const struct s3c24xx_serial_drv_data artpec8_serial_drv_data = {
>  
>  static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
>  	{
> -		.name		= "s3c2410-uart",
> -		.driver_data	= (kernel_ulong_t)S3C2410_SERIAL_DRV_DATA,
> -	}, {
> -		.name		= "s3c2412-uart",
> -		.driver_data	= (kernel_ulong_t)S3C2412_SERIAL_DRV_DATA,
> -	}, {
> -		.name		= "s3c2440-uart",
> -		.driver_data	= (kernel_ulong_t)S3C2440_SERIAL_DRV_DATA,
> -	}, {
>  		.name		= "s3c6400-uart",
>  		.driver_data	= (kernel_ulong_t)S3C6400_SERIAL_DRV_DATA,
>  	}, {
> @@ -2881,12 +2688,6 @@ MODULE_DEVICE_TABLE(platform, s3c24xx_serial_driver_ids);
>  
>  #ifdef CONFIG_OF
>  static const struct of_device_id s3c24xx_uart_dt_match[] = {
> -	{ .compatible = "samsung,s3c2410-uart",
> -		.data = S3C2410_SERIAL_DRV_DATA },
> -	{ .compatible = "samsung,s3c2412-uart",
> -		.data = S3C2412_SERIAL_DRV_DATA },
> -	{ .compatible = "samsung,s3c2440-uart",
> -		.data = S3C2440_SERIAL_DRV_DATA },
>  	{ .compatible = "samsung,s3c6400-uart",
>  		.data = S3C6400_SERIAL_DRV_DATA },
>  	{ .compatible = "samsung,s5pv210-uart",
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index fb7b603dddf8..8ba4fe9364b1 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -443,12 +443,12 @@ config USB_OHCI_HCD_STI
>  	  STMicroelectronics consumer electronics SoC's.
>  
>  config USB_OHCI_HCD_S3C2410
> -	tristate "OHCI support for Samsung S3C24xx/S3C64xx SoC series"
> -	depends on USB_OHCI_HCD && (ARCH_S3C24XX || ARCH_S3C64XX || COMPILE_TEST)
> -	default y if (ARCH_S3C24XX || ARCH_S3C64XX)
> +	tristate "OHCI support for Samsung S3C64xx SoC series"
> +	depends on USB_OHCI_HCD && (ARCH_S3C64XX || COMPILE_TEST)
> +	default ARCH_S3C64XX
>  	help
>  	  Enables support for the on-chip OHCI controller on
> -	  S3C24xx/S3C64xx chips.
> +	  S3C64xx chips.
>  
>  config USB_OHCI_HCD_LPC32XX
>  	tristate "Support for LPC on-chip OHCI USB controller"
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index b64bc49c7f30..eee7df45347a 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -491,14 +491,13 @@ config IXP4XX_WATCHDOG
>  	  Say N if you are unsure.
>  
>  config S3C2410_WATCHDOG
> -	tristate "S3C2410 Watchdog"
> -	depends on ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || \
> -		   COMPILE_TEST
> +	tristate "S3C6410/S5Pv210/Exynos Watchdog"
> +	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
>  	select WATCHDOG_CORE
>  	select MFD_SYSCON if ARCH_EXYNOS
>  	help
> -	  Watchdog timer block in the Samsung S3C24xx, S3C64xx, S5Pv210 and
> -	  Exynos SoCs. This will reboot the system when the timer expires with
> +	  Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Exynos
> +	  SoCs. This will reboot the system when the timer expires with
>  	  the watchdog enabled.
>  
>  	  The driver is limited by the speed of the system's PCLK
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index d3fc8ed886ff..200ba236a72e 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -562,73 +562,6 @@ static irqreturn_t s3c2410wdt_irq(int irqno, void *param)
>  	return IRQ_HANDLED;
>  }
>  
> -#ifdef CONFIG_ARM_S3C24XX_CPUFREQ
> -
> -static int s3c2410wdt_cpufreq_transition(struct notifier_block *nb,
> -					  unsigned long val, void *data)
> -{
> -	int ret;
> -	struct s3c2410_wdt *wdt = freq_to_wdt(nb);
> -
> -	if (!s3c2410wdt_is_running(wdt))
> -		goto done;
> -
> -	if (val == CPUFREQ_PRECHANGE) {
> -		/* To ensure that over the change we don't cause the
> -		 * watchdog to trigger, we perform an keep-alive if
> -		 * the watchdog is running.
> -		 */
> -
> -		s3c2410wdt_keepalive(&wdt->wdt_device);
> -	} else if (val == CPUFREQ_POSTCHANGE) {
> -		s3c2410wdt_stop(&wdt->wdt_device);
> -
> -		ret = s3c2410wdt_set_heartbeat(&wdt->wdt_device,
> -						wdt->wdt_device.timeout);
> -
> -		if (ret >= 0)
> -			s3c2410wdt_start(&wdt->wdt_device);
> -		else
> -			goto err;
> -	}
> -
> -done:
> -	return 0;
> -
> - err:
> -	dev_err(wdt->dev, "cannot set new value for timeout %d\n",
> -				wdt->wdt_device.timeout);
> -	return ret;
> -}
> -
> -static inline int s3c2410wdt_cpufreq_register(struct s3c2410_wdt *wdt)
> -{
> -	wdt->freq_transition.notifier_call = s3c2410wdt_cpufreq_transition;
> -
> -	return cpufreq_register_notifier(&wdt->freq_transition,
> -					 CPUFREQ_TRANSITION_NOTIFIER);
> -}
> -
> -static inline void s3c2410wdt_cpufreq_deregister(struct s3c2410_wdt *wdt)
> -{
> -	wdt->freq_transition.notifier_call = s3c2410wdt_cpufreq_transition;
> -
> -	cpufreq_unregister_notifier(&wdt->freq_transition,
> -				    CPUFREQ_TRANSITION_NOTIFIER);
> -}
> -
> -#else
> -
> -static inline int s3c2410wdt_cpufreq_register(struct s3c2410_wdt *wdt)
> -{
> -	return 0;
> -}
> -
> -static inline void s3c2410wdt_cpufreq_deregister(struct s3c2410_wdt *wdt)
> -{
> -}
> -#endif
> -
>  static inline unsigned int s3c2410wdt_get_bootstatus(struct s3c2410_wdt *wdt)
>  {
>  	unsigned int rst_stat;
> @@ -761,12 +694,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	wdt->wdt_device.min_timeout = 1;
>  	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt);
>  
> -	ret = s3c2410wdt_cpufreq_register(wdt);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to register cpufreq\n");
> -		goto err_src_clk;
> -	}
> -
>  	watchdog_set_drvdata(&wdt->wdt_device, wdt);
>  
>  	/* see if we can actually set the requested timer margin, and if
> @@ -783,7 +710,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  				 S3C2410_WATCHDOG_DEFAULT_TIME);
>  		} else {
>  			dev_err(dev, "failed to use default timeout\n");
> -			goto err_cpufreq;
> +			goto err_src_clk;
>  		}
>  	}
>  
> @@ -791,7 +718,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  			       pdev->name, pdev);
>  	if (ret != 0) {
>  		dev_err(dev, "failed to install irq (%d)\n", ret);
> -		goto err_cpufreq;
> +		goto err_src_clk;
>  	}
>  
>  	watchdog_set_nowayout(&wdt->wdt_device, nowayout);
> @@ -817,7 +744,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  
>  	ret = watchdog_register_device(&wdt->wdt_device);
>  	if (ret)
> -		goto err_cpufreq;
> +		goto err_src_clk;
>  
>  	ret = s3c2410wdt_enable(wdt, true);
>  	if (ret < 0)
> @@ -839,9 +766,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>   err_unregister:
>  	watchdog_unregister_device(&wdt->wdt_device);
>  
> - err_cpufreq:
> -	s3c2410wdt_cpufreq_deregister(wdt);
> -
>   err_src_clk:
>  	clk_disable_unprepare(wdt->src_clk);
>  
> @@ -862,8 +786,6 @@ static int s3c2410wdt_remove(struct platform_device *dev)
>  
>  	watchdog_unregister_device(&wdt->wdt_device);
>  
> -	s3c2410wdt_cpufreq_deregister(wdt);
> -
>  	clk_disable_unprepare(wdt->src_clk);
>  	clk_disable_unprepare(wdt->bus_clk);
>  
> diff --git a/include/linux/clk/samsung.h b/include/linux/clk/samsung.h
> index 38b774001712..0cf7aac83439 100644
> --- a/include/linux/clk/samsung.h
> +++ b/include/linux/clk/samsung.h
> @@ -21,36 +21,4 @@ static inline void s3c64xx_clk_init(struct device_node *np,
>  				    bool s3c6400, void __iomem *base) { }
>  #endif /* CONFIG_S3C64XX_COMMON_CLK */
>  
> -#ifdef CONFIG_S3C2410_COMMON_CLK
> -void s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
> -			     int current_soc,
> -			     void __iomem *reg_base);
> -#else
> -static inline void s3c2410_common_clk_init(struct device_node *np,
> -					   unsigned long xti_f,
> -					   int current_soc,
> -					   void __iomem *reg_base) { }
> -#endif /* CONFIG_S3C2410_COMMON_CLK */
> -
> -#ifdef CONFIG_S3C2412_COMMON_CLK
> -void s3c2412_common_clk_init(struct device_node *np, unsigned long xti_f,
> -			     unsigned long ext_f, void __iomem *reg_base);
> -#else
> -static inline void s3c2412_common_clk_init(struct device_node *np,
> -					   unsigned long xti_f,
> -					   unsigned long ext_f,
> -					   void __iomem *reg_base) { }
> -#endif /* CONFIG_S3C2412_COMMON_CLK */
> -
> -#ifdef CONFIG_S3C2443_COMMON_CLK
> -void s3c2443_common_clk_init(struct device_node *np, unsigned long xti_f,
> -			     int current_soc,
> -			     void __iomem *reg_base);
> -#else
> -static inline void s3c2443_common_clk_init(struct device_node *np,
> -					   unsigned long xti_f,
> -					   int current_soc,
> -					   void __iomem *reg_base) { }
> -#endif /* CONFIG_S3C2443_COMMON_CLK */
> -
>  #endif /* __LINUX_CLK_SAMSUNG_H_ */
> diff --git a/include/linux/soc/samsung/s3c-pm.h b/include/linux/soc/samsung/s3c-pm.h
> index f9164559c99f..5b23d85d20ab 100644
> --- a/include/linux/soc/samsung/s3c-pm.h
> +++ b/include/linux/soc/samsung/s3c-pm.h
> @@ -14,58 +14,10 @@
>  
>  /* PM debug functions */
>  
> -/**
> - * struct pm_uart_save - save block for core UART
> - * @ulcon: Save value for S3C2410_ULCON
> - * @ucon: Save value for S3C2410_UCON
> - * @ufcon: Save value for S3C2410_UFCON
> - * @umcon: Save value for S3C2410_UMCON
> - * @ubrdiv: Save value for S3C2410_UBRDIV
> - *
> - * Save block for UART registers to be held over sleep and restored if they
> - * are needed (say by debug).
> -*/
> -struct pm_uart_save {
> -	u32	ulcon;
> -	u32	ucon;
> -	u32	ufcon;
> -	u32	umcon;
> -	u32	ubrdiv;
> -	u32	udivslot;
> -};
> -
> -#ifdef CONFIG_SAMSUNG_PM_DEBUG
> -/**
> - * s3c_pm_dbg() - low level debug function for use in suspend/resume.
> - * @msg: The message to print.
> - *
> - * This function is used mainly to debug the resume process before the system
> - * can rely on printk/console output. It uses the low-level debugging output
> - * routine printascii() to do its work.
> - */
> -extern void s3c_pm_dbg(const char *msg, ...);
> -
> -#define S3C_PMDBG(fmt...) s3c_pm_dbg(fmt)
> -
> -extern void s3c_pm_save_uarts(bool is_s3c24xx);
> -extern void s3c_pm_restore_uarts(bool is_s3c24xx);
> -
> -#ifdef CONFIG_ARCH_S3C64XX
> -extern void s3c_pm_arch_update_uart(void __iomem *regs,
> -				    struct pm_uart_save *save);
> -#else
> -static inline void
> -s3c_pm_arch_update_uart(void __iomem *regs, struct pm_uart_save *save)
> -{
> -}
> -#endif
> -
> -#else
>  #define S3C_PMDBG(fmt...) pr_debug(fmt)
>  
>  static inline void s3c_pm_save_uarts(bool is_s3c24xx) { }
>  static inline void s3c_pm_restore_uarts(bool is_s3c24xx) { }
> -#endif
>  
>  /* suspend memory checking */
>  
> @@ -81,14 +33,4 @@ extern void s3c_pm_check_store(void);
>  #define s3c_pm_check_store()   do { } while (0)
>  #endif
>  
> -/* system device subsystems */
> -
> -extern struct bus_type s3c2410_subsys;
> -extern struct bus_type s3c2410a_subsys;
> -extern struct bus_type s3c2412_subsys;
> -extern struct bus_type s3c2416_subsys;
> -extern struct bus_type s3c2440_subsys;
> -extern struct bus_type s3c2442_subsys;
> -extern struct bus_type s3c2443_subsys;
> -
>  #endif

