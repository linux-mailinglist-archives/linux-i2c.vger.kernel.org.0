Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBCED0086
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2019 20:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfJHSMU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Oct 2019 14:12:20 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34544 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbfJHSMU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Oct 2019 14:12:20 -0400
Received: by mail-pf1-f195.google.com with SMTP id b128so11276549pfa.1
        for <linux-i2c@vger.kernel.org>; Tue, 08 Oct 2019 11:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ft4+jYN1dS8NqqiVNLlnlvcOgcl6TC5Rdjhw+oDRjeM=;
        b=fp/xUBWNRr3td/lzO69obrsv/blllnTc7YTOhUQOOc5uE3nOL+Da2ubPZCPl6MzSD8
         7bG8U48fBbMujprEET895v8OHtvgm+bQwX2ZYk1Dec/P1Zax53qJ8EQmKDmgAvG71A2t
         iolwRxV1MILEXICk6/fCgoJN4iZpMq94nxfhMbaxG2iugWflegBTW58ScZ/WZQi4MW2O
         AUmqpRWZ1Cf1QGYM495TsSmpBKT3r7HrLnaNyVAmb6pZBTFFqXHFe5PCrnpeBdzPJ5gM
         Q90Apo4k0GxuwlNEh6WVkJ2zksEhwoTfekOIgsIEMvGpEzRBQj7WujLqdBy5sSXNuKnH
         GKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ft4+jYN1dS8NqqiVNLlnlvcOgcl6TC5Rdjhw+oDRjeM=;
        b=CyxE9SAdSVQVKaknQfiqgi8EfOv5Z7ldtAClEc6iLc/PQifEAiVY7lrwb3yBvET3ei
         dqXfVwLxfTfbMkQCnnnc/pOaUOowWJWer8CYojR+BzMxRUw9MNp51AmbAYMbQEO8yhpF
         LPX92Er6djP/L8d48n6cUBukS5SRmvukoZtdx3gti+vO9PgSqQK31SPP9GYo+JMc5O/y
         u7BND76SJIo+bM07eLmmYE41bjTGcK6UlkyRlOZ86P1A/vH2rj+RMLwsnJKHEAbgpdE3
         A48BnL9hWB7p0WCVXagtlgMggpTvKD6gYbTJ2Xo5/lCDt8mNHB1jTWF4BIeqFRzn3Mej
         k3/g==
X-Gm-Message-State: APjAAAX+oxcTWDIeacYu9MWiiDpKtDJKa9AvYTlDL4z3xlLL0rHeF6c/
        V0Qu7kkBXhMIaNkzF2A3EIE5lw==
X-Google-Smtp-Source: APXvYqwQY/d/4qF6Xf3ltUHZZdZHWBbFSe61lTeC1Lgsde2Fj5T5bc4/HzHq/Mq162NvzHwX2BH7bw==
X-Received: by 2002:a63:d30f:: with SMTP id b15mr37524174pgg.341.1570558339176;
        Tue, 08 Oct 2019 11:12:19 -0700 (PDT)
Received: from google.com ([2620:15c:2cb:1:e90c:8e54:c2b4:29e7])
        by smtp.gmail.com with ESMTPSA id s5sm2343109pjn.24.2019.10.08.11.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 11:12:18 -0700 (PDT)
Date:   Tue, 8 Oct 2019 11:12:13 -0700
From:   Brendan Higgins <brendanhiggins@google.com>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/5] dt-bindings: i2c: aspeed: add buffer and DMA mode
 transfer support
Message-ID: <20191008181213.GB155928@google.com>
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-2-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007231313.4700-2-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 07, 2019 at 04:13:09PM -0700, Jae Hyun Yoo wrote:
> Append bindings to support buffer mode and DMA mode transfer.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  .../devicetree/bindings/i2c/i2c-aspeed.txt    | 67 +++++++++++++++++--
>  1 file changed, 60 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> index 8fbd8633a387..e40dcc108307 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> @@ -3,7 +3,10 @@ Device tree configuration for the I2C busses on the AST24XX and AST25XX SoCs.
>  Required Properties:
>  - #address-cells	: should be 1
>  - #size-cells		: should be 0
> -- reg			: address offset and range of bus
> +- reg			: Address offset and range of bus registers.
> +			  An additional SRAM buffer address offset and range is
> +			  optional in case of enabling I2C dedicated SRAM for
> +			  buffer mode transfer support.

Sorry, I am having trouble parsing this. This seems like the SRAM buffer
is global to all busses. Can you clarify? I expect I will probably have
some more questions elsewhere.

>  - compatible		: should be "aspeed,ast2400-i2c-bus"
>  			  or "aspeed,ast2500-i2c-bus"
>  - clocks		: root clock of bus, should reference the APB
> @@ -16,6 +19,18 @@ Optional Properties:
>  - bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
>  		  specified
>  - multi-master	: states that there is another master active on this bus.
> +- aspeed,dma-buf-size	: size of DMA buffer (from 2 to 4095 in case of AST2500
> +			  or later versions).
> +			  Only AST2500 and later versions support DMA mode
> +			  under some limitations:
> +			  I2C is sharing the DMA H/W with UHCI host controller
> +			  and MCTP controller. Since those controllers operate
> +			  with DMA mode only, I2C has to use buffer mode or byte
> +			  mode instead if one of those controllers is enabled.
> +			  Also make sure that if SD/eMMC or Port80 snoop uses
> +			  DMA mode instead of PIO or FIFO respectively, I2C
> +			  can't use DMA mode. If both DMA and buffer modes are
> +			  enabled, DMA mode will be selected.

nit: I think it makes sense to break down the exceptions into a
bulleted list.

Cheers
