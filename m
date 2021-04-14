Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1A3435F0A5
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 11:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbhDNJTk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 05:19:40 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:17332 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbhDNJTj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 05:19:39 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FKxgb1xhRz9yZX;
        Wed, 14 Apr 2021 17:16:59 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Wed, 14 Apr 2021
 17:19:07 +0800
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wei Xu <xuwei5@hisilicon.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Linuxarm <linuxarm@huawei.com>
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
From:   Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com>
Date:   Wed, 14 Apr 2021 17:19:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021/4/13 20:26, Geert Uytterhoeven wrote:
> The HiSilicon Kunpeng I2C controller is only present on HiSilicon
> Kunpeng SoCs, and its driver relies on ACPI to probe for its presence.
> Hence add dependencies on ARCH_HISI and ACPI, to prevent asking the user
> about this driver when configuring a kernel without Hisilicon platform
> or ACPI firmware support.
> 

this is a public IP which doesn't specifically depend on ARCH_HISI. I'm
not sure all the platform this IP on has ARCH_HISI configured. The driver
will not be compiled by default config. This is not correct to have
this dependence.

> Fixes: d62fbdb99a85730a ("i2c: add support for HiSilicon I2C controller")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/i2c/busses/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index b5b4e0d0ff4dd0bc..3ead6d9e130b2ebc 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -647,7 +647,7 @@ config I2C_HIGHLANDER
>  
>  config I2C_HISI
>  	tristate "HiSilicon I2C controller"
> -	depends on ARM64 || COMPILE_TEST
> +	depends on (ARM64 && ARCH_HISI && ACPI) || COMPILE_TEST
>  	help
>  	  Say Y here if you want to have Hisilicon I2C controller support
>  	  available on the Kunpeng Server.
> 

