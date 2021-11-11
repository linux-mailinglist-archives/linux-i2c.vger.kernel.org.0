Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406F044D39F
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 09:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbhKKJAo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 04:00:44 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33574
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232507AbhKKJAm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 04:00:42 -0500
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4859E3F1A7
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 08:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636621073;
        bh=EkW1pMNvYMXSWViTWL0b6uTuOm+kaiADnR/jCTEvI80=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=FM9chcfkEKS5UmgFVD0w5b9dxCWhwrbDxGk4Gxl9SMKOMVfynBLi2ekUUDucDADnJ
         aYSElyRGwC5uSqlhQDYFytJNCPaDDS+7Ae6c/kNnB3YUxRfQq2FXefQx/vrYmP0XfN
         aEZFLUV3Q+4ux/VhLlcsbZZF9iDuXmIOBNaYqjq3sLAfjKlHlXwvG31T5uoUu8ax0x
         RWRtyn2RF2GPf59xN2HObjYfqIQRhXFF0AxmfRmqTLE0mTGx9HpLs93uksanIvjrQk
         hEJ3oRYg4Fhc7upjkKBEeQfUxl/MzqSvyXNcJ2KljYY9gQUWKEdKSm4dMGjLIkb3di
         MjrF1Ozspgkvw==
Received: by mail-lj1-f198.google.com with SMTP id j11-20020a2ea90b000000b00218c174bb5dso1505892ljq.22
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 00:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EkW1pMNvYMXSWViTWL0b6uTuOm+kaiADnR/jCTEvI80=;
        b=n0J4THOZTc2tzBy31Lk7+t9plluo5+a4rDqSEYVQRexrL4gz8e0Zk/hHwr72zxVYbO
         SeEJGG9QnuVDOD1isW0al6b7e/KvVcKS6wLRNVd38gMRc2BM+vUOUJPEj+TqCQ/AZgAF
         vQxSa4WdjanLyn7JJqisaxA23m0VgtMaJ95Njp1jTE9/0cynv8oPslD5URg5+xNZwevb
         Mzvzg6edrZMdpbqZAmjVHNO6zB8X7c59XLmRbjIYtxqgYcaq5eYtwk9t9GCRO4N/gSQm
         K2ipx1aia59LS6qEJJ8ZzI89D5ETBieVPVS7arHGbqDkxEF4oK5kVNjD9/3r64Y8nrz1
         0saw==
X-Gm-Message-State: AOAM531hFDnYeLwHy6RvAlvy5h9lIDIhNE8qmjU5E74J0IcTJWNL7+gA
        WQg2lPC7pXoL0nQCDJ4VfhecrHXsmMxLIQby2cKQMp4/SJYjspCP6htX6f+SPrs/jQ6dQQAmq8X
        tAfej0ftCc1cdj7Y7VdDzlYqQzDS+EBnsUQ/6sA==
X-Received: by 2002:a05:6512:3f1a:: with SMTP id y26mr5120162lfa.372.1636621072716;
        Thu, 11 Nov 2021 00:57:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyske0xauslL1Z+bnPQXmlOUOZVcMqum4mhLp9zOOVR+D9d0O2rE+kzkRpn+ZngtwgIcE/UAw==
X-Received: by 2002:a05:6512:3f1a:: with SMTP id y26mr5120146lfa.372.1636621072540;
        Thu, 11 Nov 2021 00:57:52 -0800 (PST)
Received: from [192.168.0.27] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x7sm229110lfu.116.2021.11.11.00.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 00:57:52 -0800 (PST)
Message-ID: <4f46fefc-09c9-f9ee-a456-382a64d4ed6f@canonical.com>
Date:   Thu, 11 Nov 2021 09:57:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/2] i2c: exynos5: add support for ExynosAutov9 SoC
Content-Language: en-US
To:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        chanho61.park@samsung.com,
        Sam Protsenko <semen.protsenko@linaro.org>
References: <20211111084327.106696-1-jaewon02.kim@samsung.com>
 <CGME20211111084749epcas2p1e80b3f3657310498bfdae65c425b3278@epcas2p1.samsung.com>
 <20211111084327.106696-3-jaewon02.kim@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211111084327.106696-3-jaewon02.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/11/2021 09:43, Jaewon Kim wrote:
> Serial IPs(UART, I2C, SPI) are integrated into New IP-Core
> called USI(Universal Serial Interface).
> 
> As it is integrated into USI, there are additinal HW changes.
> Registers to control USI and sysreg to set serial IPs have been added.
> Also, some timing registres have been changed.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>  drivers/i2c/busses/i2c-exynos5.c | 133 ++++++++++++++++++++++++++++---
>  1 file changed, 123 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index 97d4f3ac0abd..6a05af550aa5 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -22,6 +22,8 @@
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/spinlock.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
>  
>  /*
>   * HSI2C controller from Samsung supports 2 modes of operation
> @@ -166,9 +168,21 @@
>  
>  #define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(100))
>  
> +/* USI(Universal Serial Interface) Register map */
> +#define USI_CON					0xc4
> +#define USI_OPTION				0xc8
> +
> +/* USI(Universal Serial Interface) Register bits */
> +#define USI_CON_RESET				BIT(0)
> +
> +/* SYSREG Register bit */
> +#define SYSREG_USI_SW_CONF_MASK			(0x7 << 0)
> +#define SYSREG_I2C_SW_CONF			BIT(2)
> +
>  enum i2c_type_exynos {
>  	I2C_TYPE_EXYNOS5,
>  	I2C_TYPE_EXYNOS7,
> +	I2C_TYPE_EXYNOSAUTOV9,

The type in driver could stay USI, I only wanted the compatible to be
using SoC product ID/number. But current AUTOV9 is fine as well.

>  };
>  
>  struct exynos5_i2c {
> @@ -199,6 +213,10 @@ struct exynos5_i2c {
>  
>  	/* Version of HS-I2C Hardware */
>  	const struct exynos_hsi2c_variant *variant;
> +
> +	/* USI sysreg info */
> +	struct regmap		*usi_sysreg;
> +	unsigned int		usi_offset;
>  };
>  
>  /**
> @@ -212,24 +230,34 @@ struct exynos5_i2c {
>   */
>  struct exynos_hsi2c_variant {
>  	unsigned int		fifo_depth;
> +	unsigned int		has_usi;

Sorry for not noticing it earlier, but this should be bool.

>  	enum i2c_type_exynos	hw;
>  };
>  
>  static const struct exynos_hsi2c_variant exynos5250_hsi2c_data = {
>  	.fifo_depth	= 64,
> +	.has_usi	= 0,

And this should be "false".

>  	.hw		= I2C_TYPE_EXYNOS5,
>  };
>  
>  static const struct exynos_hsi2c_variant exynos5260_hsi2c_data = {
>  	.fifo_depth	= 16,
> +	.has_usi	= 0,
>  	.hw		= I2C_TYPE_EXYNOS5,
>  };
>  
>  static const struct exynos_hsi2c_variant exynos7_hsi2c_data = {
>  	.fifo_depth	= 16,
> +	.has_usi	= 0,
>  	.hw		= I2C_TYPE_EXYNOS7,
>  };
>  
> +static const struct exynos_hsi2c_variant exynosautov9_hsi2c_data = {
> +	.fifo_depth	= 64,
> +	.has_usi	= 1,
> +	.hw		= I2C_TYPE_EXYNOSAUTOV9,
> +};
> +
>  static const struct of_device_id exynos5_i2c_match[] = {
>  	{
>  		.compatible = "samsung,exynos5-hsi2c",
> @@ -243,6 +271,9 @@ static const struct of_device_id exynos5_i2c_match[] = {
>  	}, {
>  		.compatible = "samsung,exynos7-hsi2c",
>  		.data = &exynos7_hsi2c_data
> +	}, {
> +		.compatible = "samsung,exynosautov9-hsi2c",
> +		.data = &exynosautov9_hsi2c_data
>  	}, {},
>  };
>  MODULE_DEVICE_TABLE(of, exynos5_i2c_match);
> @@ -281,6 +312,31 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
>  		i2c->op_clock;
>  	int div, clk_cycle, temp;
>  
> +	/* In case of HSI2C controllers in EXYNOSAUTOV9

Linux coding comment please, so with a separate /* :

/*
 * In case of....

Rest looks good, thanks for the changes!

Best regards,
Krzysztof
