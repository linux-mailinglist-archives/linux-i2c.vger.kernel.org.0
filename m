Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F242F4BCDB7
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Feb 2022 11:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243573AbiBTJg7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Feb 2022 04:36:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232929AbiBTJg6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Feb 2022 04:36:58 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CD630A
        for <linux-i2c@vger.kernel.org>; Sun, 20 Feb 2022 01:36:37 -0800 (PST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BDC54402FE
        for <linux-i2c@vger.kernel.org>; Sun, 20 Feb 2022 09:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645349795;
        bh=LePQseFU9KkFZIr2PZSkEhdx+6kX03cW7zQvAw4RWg4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=AODrkKVSrlAuTmNPYvL2FFpkgmqE5Gv6kA0xnIXWLNS/ShSjkApibJjETSi9QTeKd
         8wSIidow2FqxeevrCr2oIBWLAB6J5eIUDZdMJ/Z8uAekHF1amqUH3kw9pK0vkKAUJt
         rbRyl6Vo1gKwRkw83m9byBvtHA1CByqO4jDbORzWxgFUVb/oVIqOv4X541II3FMw6S
         wiKBYC31F7WDiQceCsu17wvL1jl4tKyhjnLHlzTQsJFdBPvBEb+q95bI2miXSN1DAf
         1PxwOkrwh7g0lOSsc9MLQwsXyerQUMUcL3u2wWuQ0Bsfw/jLhCho2/q6w+z7GYnSp6
         uyu8JrOlPa73w==
Received: by mail-wr1-f69.google.com with SMTP id j8-20020adfc688000000b001e3322ced69so5685476wrg.13
        for <linux-i2c@vger.kernel.org>; Sun, 20 Feb 2022 01:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LePQseFU9KkFZIr2PZSkEhdx+6kX03cW7zQvAw4RWg4=;
        b=6clGalmydfL4e9GkIuoKv3vNhNODNxw8Aa0e98exjwQEFuZN7nRUDNvu2BGg/4lcXW
         x/qaUHVUZScXPmb3HSWHLtDA9ONWcrne0jT0comYn2EAb6QixhCefx1cXLAqqZAga70Y
         tDo7j2dwST8602IwyyenfVRsx+b395MT5KhPyPOenQ4GTwbkDOqWOcU2M9bM3Ju19shI
         R/z9HGCLS1S++0mFAjs0fMn/4aYX1/xLiG8tIXeXJA98Az26BK20F9aqVw3J1vvMlExH
         Tg6EC/llVAxL2kJb4/nJWWkXodFxarID+gUsoGA9wvqlzrLIvupsX4+y66057jLck0/u
         8ikA==
X-Gm-Message-State: AOAM5336oJoeWR4kC4FdNhMDlHoNrlk4/yU5p+/9lbxRoSlG9mYUiing
        Gdlz7Bn3CxiAiyBz9XkRf6Qhsd+uDsA5BoPNvxQr2Fi381XNpqeNBrDHW0E6M2+ppzqHx7uhUTe
        GdsFRRMo1gG87YYEYJhocH5mJGFc9zIctcrlwEA==
X-Received: by 2002:a5d:6d0e:0:b0:1e2:fa3d:7f22 with SMTP id e14-20020a5d6d0e000000b001e2fa3d7f22mr11961950wrq.142.1645349794255;
        Sun, 20 Feb 2022 01:36:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwirmZy7S2pWU943BOtjlEkOfxkLQLpQso7yDIB5X+bes0fyRGnOL9B7PBSY3OljiTG2BQN2g==
X-Received: by 2002:a5d:6d0e:0:b0:1e2:fa3d:7f22 with SMTP id e14-20020a5d6d0e000000b001e2fa3d7f22mr11961910wrq.142.1645349794068;
        Sun, 20 Feb 2022 01:36:34 -0800 (PST)
Received: from [192.168.0.117] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id l15sm4308967wmi.29.2022.02.20.01.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Feb 2022 01:36:33 -0800 (PST)
Message-ID: <888977e0-03bb-3a6b-eca3-7fbf35f53ffc@canonical.com>
Date:   Sun, 20 Feb 2022 10:36:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 11/11] i2c: npcm: Support NPCM845
Content-Language: en-US
To:     Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, christophe.leroy@csgroup.eu,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        digetx@gmail.com, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-12-warp5tw@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220220035321.3870-12-warp5tw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20/02/2022 04:53, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Add NPCM8XX I2C support.
> The NPCM8XX uses a similar i2c module as NPCM7XX.
> The internal HW FIFO is larger in NPCM8XX.
> 
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  drivers/i2c/busses/Kconfig       |  8 +--
>  drivers/i2c/busses/Makefile      |  2 +-
>  drivers/i2c/busses/i2c-npcm7xx.c | 87 ++++++++++++++++++++++----------
>  3 files changed, 66 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 42da31c1ab70..ab9ee2de5e00 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -817,13 +817,13 @@ config I2C_NOMADIK
>  	  I2C interface from ST-Ericsson's Nomadik and Ux500 architectures,
>  	  as well as the STA2X11 PCIe I/O HUB.
>  
> -config I2C_NPCM7XX
> +config I2C_NPCM
>  	tristate "Nuvoton I2C Controller"
> -	depends on ARCH_NPCM7XX || COMPILE_TEST
> +	depends on ARCH_NPCM || COMPILE_TEST
>  	help
>  	  If you say yes to this option, support will be included for the
> -	  Nuvoton I2C controller, which is available on the NPCM7xx BMC
> -	  controller.
> +	  Nuvoton I2C controller, which is available on the NPCM BMC
> +	  controllers.
>  	  Driver can also support slave mode (select I2C_SLAVE).
>  
>  config I2C_OCORES
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 1d00dce77098..01fdf74a5565 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -80,7 +80,7 @@ obj-$(CONFIG_I2C_MT7621)	+= i2c-mt7621.o
>  obj-$(CONFIG_I2C_MV64XXX)	+= i2c-mv64xxx.o
>  obj-$(CONFIG_I2C_MXS)		+= i2c-mxs.o
>  obj-$(CONFIG_I2C_NOMADIK)	+= i2c-nomadik.o
> -obj-$(CONFIG_I2C_NPCM7XX)	+= i2c-npcm7xx.o
> +obj-$(CONFIG_I2C_NPCM)		+= i2c-npcm7xx.o
>  obj-$(CONFIG_I2C_OCORES)	+= i2c-ocores.o
>  obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
>  obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2cbf9c679aed..b281e0424e3e 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -17,6 +17,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
> @@ -91,7 +92,7 @@ enum i2c_addr {
>  
>  /* init register and default value required to enable module */
>  #define NPCM_I2CSEGCTL			0xE4
> -#define NPCM_I2CSEGCTL_INIT_VAL		0x0333F000
> +#define NPCM_I2CSEGCTL_INIT_VAL		bus->data->segctl_init_val
>  
>  /* Common regs */
>  #define NPCM_I2CSDA			0x00
> @@ -228,8 +229,7 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
>  #define NPCM_I2CFIF_CTS_CLR_FIFO	BIT(6)
>  #define NPCM_I2CFIF_CTS_SLVRSTR		BIT(7)
>  
> -/* NPCM_I2CTXF_CTL reg fields */
> -#define NPCM_I2CTXF_CTL_TX_THR		GENMASK(4, 0)
> +/* NPCM_I2CTXF_CTL reg field */
>  #define NPCM_I2CTXF_CTL_THR_TXIE	BIT(6)
>  
>  /* NPCM_I2CT_OUT reg fields */
> @@ -238,22 +238,22 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
>  #define NPCM_I2CT_OUT_T_OUTST		BIT(7)
>  
>  /* NPCM_I2CTXF_STS reg fields */
> -#define NPCM_I2CTXF_STS_TX_BYTES	GENMASK(4, 0)
> +#define NPCM_I2CTXF_STS_TX_BYTES	bus->data->txf_sts_tx_bytes

It's not a clean code to use defines for complex types. It's not a
constant anymore, so just use bus->data->txf_sts_tx_bytes directly.

The same in other places.

>  #define NPCM_I2CTXF_STS_TX_THST		BIT(6)
>  

Best regards,
Krzysztof
