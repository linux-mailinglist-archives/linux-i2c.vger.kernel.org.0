Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D61478F1D
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 16:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237940AbhLQPJT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 10:09:19 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37214
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237935AbhLQPJT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 10:09:19 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 45107406EC
        for <linux-i2c@vger.kernel.org>; Fri, 17 Dec 2021 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639753758;
        bh=Ekcv8bNIXIYPhjro0Nb278CmOGUMMLIkTcaAs3AM2AE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=kgs1Uc1F0BASNMDcnAVM1T4h5vTCAF5MxScMYFVPkY1IaTcYibCq511hOY98bLlWL
         q3/M+7u7eYGKCCBuy8GMUh3BcEHjVbUrymm09cn2sm1o1cTWixBbzUHhDUYSXYH2RF
         1T7NI+bVIyugqLDz3mjyKIXtOuWU+Pm+FZZnfOhBktvCjyQq3l+sN53IunP3DWZaOP
         6NF0nrc/sBKyf0jhLxZgUKYjDlfZONuc81dqIN/5frLNJj5pbJdMmr7D4w0qAfrdd5
         GaH2Dt6ukszjKSc2rxc60+jPy4wYzjYkdSsIxgi7SIgCT48Mgnk49p3GSWUvrqNELm
         ltKGFOPD/89KA==
Received: by mail-lf1-f71.google.com with SMTP id q13-20020a19f20d000000b0041fcb65b6c7so1033782lfh.8
        for <linux-i2c@vger.kernel.org>; Fri, 17 Dec 2021 07:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ekcv8bNIXIYPhjro0Nb278CmOGUMMLIkTcaAs3AM2AE=;
        b=xqpbbMbandhgvJ/BqrDGg3SCKvoauAOlzHJqD6Gj54rpOoswC5vyh09TAy4/qVQguD
         F34J8eDc03TG3rfk5w9buXso2YiTcT1hsFsNu+pci+uqfvi5seJbDK1wdroy4dzr5U2p
         WgP00glzJez4cjDf0WR0gWf0W1HQiJdBGvmM8GEqb+4l9a41nzlnzPP+HxbE+WE5L75t
         i4fne81X1mmjoLLTRPmzHRPhne+GHOSx4+IhwOcjfVuQ6Xv+wGgir9maFkpbJZoL7c+c
         21s849j2uNf8DIOes9KuiTSDLItXc7WBZ1ffgzX8NMPCzf0AcmcysncutRjET68FHJCq
         bGtg==
X-Gm-Message-State: AOAM531HjCFXOs5nElY1X+rg0tm4Ne+pV6xH6QceY/YIrPlhU0NiUHrc
        0nEDMRS0zc5hnlrBNdRf8jyIrEmi153DA2KEK6Ub9rl5uEP3YqM16DJH83BijoZymZqce+Utq5o
        97cpYrXs1dc0Mrv43ROvlaTs2cpvmM9eWEkJDfg==
X-Received: by 2002:a05:651c:324:: with SMTP id b4mr3004610ljp.188.1639753756754;
        Fri, 17 Dec 2021 07:09:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHJzYnX2gs6VoqK9iRkmiSREooJ2FXXIbMDOX3XDHzAr4mBWfowLrbkwZGknR7FEjLbWDk2Q==
X-Received: by 2002:a05:651c:324:: with SMTP id b4mr3004581ljp.188.1639753756369;
        Fri, 17 Dec 2021 07:09:16 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d4sm1429654lfg.82.2021.12.17.07.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 07:09:15 -0800 (PST)
Message-ID: <61ae4cfd-a544-96d3-d521-877b8b38b5fc@canonical.com>
Date:   Fri, 17 Dec 2021 16:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 17/17] MAINTAINERS: update riscv/microchip entry
Content-Language: en-US
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com, heiko@sntech.de,
        lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
        ivan.griffin@microchip.com, atish.patra@wdc.com
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-18-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211217093325.30612-18-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Update the RISC-V/Microchip entry by adding the microchip dts
> directory and myself as maintainer
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a2345ce8521..3b1d6be7bd56 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16348,8 +16348,10 @@ K:	riscv
>  
>  RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
>  M:	Lewis Hanly <lewis.hanly@microchip.com>
> +M:	Conor Dooley <conor.dooley@microchip.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Supported
> +F:	arch/riscv/boot/dts/microchip/
>  F:	drivers/mailbox/mailbox-mpfs.c
>  F:	drivers/soc/microchip/
>  F:	include/soc/microchip/mpfs.h
> 

Good to have the DTS covered, so FWIW:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

You still should get Lewis' ack (unless he merges it)

Best regards,
Krzysztof
