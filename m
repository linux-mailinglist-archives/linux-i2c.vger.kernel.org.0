Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB537607471
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 11:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiJUJun (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 05:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbiJUJuk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 05:50:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34FF1885A4;
        Fri, 21 Oct 2022 02:50:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 80ED561E00;
        Fri, 21 Oct 2022 09:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5E7C433D6;
        Fri, 21 Oct 2022 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666345837;
        bh=LeQMdSwbtJuXOi2FuwUwd5vVFwEoPYoelUlHATZ33bc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oD+ZpDeeHOAYGH98EjgSF/NQcTjpdu0Piz+tOuBHVfbR9F1OgvnuGpsx3/ELuKpCE
         0AydlaozEN7cI1UknkZnbVJbubxW8bwijBVPs3VWvotIiqu/uGjC+Hmds9wRYQ2usA
         YLN9Tq2Wj6bHnZR+0wGpyCehUGEDFxLlQnNtOIM9uFfjcTlEgUDtLpUBM2gl8k1zhR
         +VnGEoxA0khRJq9mpwacSyKHNVGH8KNeYO6u2YMLh4zxalWRkIK7QGGZPCQuw60o0H
         ozb+eUKtzLJ/eLKOEx2zuI4536P69mKpeo0oJ9Dmy/nWXZ8aFAZ//YfZDRHZtV1hVh
         apsNSQmOjXkbw==
Date:   Fri, 21 Oct 2022 10:50:30 +0100
From:   Lee Jones <lee@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-omap@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 13/17] ARM: omap1: remove unused board files
Message-ID: <Y1JrZu8iC9fobX0E@google.com>
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-13-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221019150410.3851944-13-arnd@kernel.org>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 19 Oct 2022, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> All board support that was marked as 'unused' earlier can
> now be removed, leaving the five machines that that still
> had someone using them in 2022, or that are supported in
> qemu.
> 
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  MAINTAINERS                             |   2 -
>  arch/arm/Kconfig.debug                  |  36 +-
>  arch/arm/configs/omap1_defconfig        |   2 -
>  arch/arm/mach-omap1/Kconfig             |  93 +---
>  arch/arm/mach-omap1/Makefile            |  18 -
>  arch/arm/mach-omap1/board-fsample.c     | 366 ---------------
>  arch/arm/mach-omap1/board-generic.c     |  85 ----
>  arch/arm/mach-omap1/board-h2-mmc.c      |  74 ---
>  arch/arm/mach-omap1/board-h2.c          | 448 ------------------
>  arch/arm/mach-omap1/board-h2.h          |  38 --
>  arch/arm/mach-omap1/board-h3-mmc.c      |  64 ---
>  arch/arm/mach-omap1/board-h3.c          | 455 ------------------
>  arch/arm/mach-omap1/board-h3.h          |  35 --
>  arch/arm/mach-omap1/board-htcherald.c   | 585 ------------------------
>  arch/arm/mach-omap1/board-innovator.c   | 481 -------------------
>  arch/arm/mach-omap1/board-nand.c        |  33 --
>  arch/arm/mach-omap1/board-palmtt.c      | 285 ------------
>  arch/arm/mach-omap1/board-palmz71.c     | 300 ------------
>  arch/arm/mach-omap1/board-perseus2.c    | 333 --------------
>  arch/arm/mach-omap1/fpga.c              | 186 --------
>  arch/arm/mach-omap1/fpga.h              |  49 --
>  arch/arm/mach-omap1/gpio7xx.c           | 272 -----------
>  drivers/i2c/busses/Kconfig              |   2 +-
>  drivers/mfd/Kconfig                     |   2 +-

Acked-by: Lee Jones <lee@kernel.org>

>  drivers/mmc/host/Kconfig                |   2 +-
>  drivers/usb/gadget/udc/Kconfig          |   2 +-
>  drivers/usb/host/Kconfig                |   2 +-
>  include/linux/platform_data/leds-omap.h |  19 -
>  28 files changed, 12 insertions(+), 4257 deletions(-)
>  delete mode 100644 arch/arm/mach-omap1/board-fsample.c
>  delete mode 100644 arch/arm/mach-omap1/board-generic.c
>  delete mode 100644 arch/arm/mach-omap1/board-h2-mmc.c
>  delete mode 100644 arch/arm/mach-omap1/board-h2.c
>  delete mode 100644 arch/arm/mach-omap1/board-h2.h
>  delete mode 100644 arch/arm/mach-omap1/board-h3-mmc.c
>  delete mode 100644 arch/arm/mach-omap1/board-h3.c
>  delete mode 100644 arch/arm/mach-omap1/board-h3.h
>  delete mode 100644 arch/arm/mach-omap1/board-htcherald.c
>  delete mode 100644 arch/arm/mach-omap1/board-innovator.c
>  delete mode 100644 arch/arm/mach-omap1/board-nand.c
>  delete mode 100644 arch/arm/mach-omap1/board-palmtt.c
>  delete mode 100644 arch/arm/mach-omap1/board-palmz71.c
>  delete mode 100644 arch/arm/mach-omap1/board-perseus2.c
>  delete mode 100644 arch/arm/mach-omap1/fpga.c
>  delete mode 100644 arch/arm/mach-omap1/fpga.h
>  delete mode 100644 arch/arm/mach-omap1/gpio7xx.c
>  delete mode 100644 include/linux/platform_data/leds-omap.h

-- 
Lee Jones [李琼斯]
