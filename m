Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDB1C4FFB6D
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Apr 2022 18:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236895AbiDMQjY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Apr 2022 12:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235243AbiDMQjX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Apr 2022 12:39:23 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B82345D64A;
        Wed, 13 Apr 2022 09:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649867816; x=1681403816;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SioN7hE4JJ0EbzEEpsQ1nTa8K8QRrunFk5RvqYz6FjE=;
  b=qSh4h/Gx67jnHDr+Es3enJwuFaRfxEWjXYJXNQiZF0OiiJdsKmZchplY
   4IwlaDd18/ya8Iknr5yEzvEfW85WCMAE7/KGhLFD5/Zsr67zy2eq/5NdD
   rdRMvukT5AgstTjJJsjxPzfS7LbB6iiyRy7YXobpzSdUEFvNiYzAiE+6a
   1C576vdmC2QvnEeIflPWJjBKfzRKd+MIAyLFHgUHZ0WvYRstwprLvftw5
   pls0FYxfr9MAXNBE7/htEf+kE4ODnPJz/Dw3GGAAPYplrqTFTm9USbwfu
   5U9OjvaFW7y/SWICI4TxoNRa1g4Bbc4mFl3L0wCT7P81yME9pv/yPSqPJ
   w==;
X-IronPort-AV: E=Sophos;i="5.90,257,1643698800"; 
   d="scan'208";a="152546254"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2022 09:36:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Apr 2022 09:36:55 -0700
Received: from [10.12.72.146] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 13 Apr 2022 09:36:53 -0700
Message-ID: <703ee79c-3b25-5b1f-dfe1-bfafade468fd@microchip.com>
Date:   Wed, 13 Apr 2022 18:36:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/3] ARM: dts: at91: sama7g5: Swap `rx` and `tx` for
 `i2c` nodes
Content-Language: en-US
To:     Sergiu Moga <sergiu.moga@microchip.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski@canonical.com>,
        <alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Tudor Ambarus <tudor.ambarus@microchip.com>
References: <20220310114553.184763-1-sergiu.moga@microchip.com>
 <20220310114553.184763-2-sergiu.moga@microchip.com>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20220310114553.184763-2-sergiu.moga@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/03/2022 at 12:45, Sergiu Moga wrote:
> Swap `rx` and `tx` for the `dma-names` property of the `i2c` nodes
> in order to maintain consistency across Microchip/Atmel SoC files.
> 
> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
As it fixes some of the warning in dt schema check in 5.18-rc1, I queue 
this patch in "fixes" branch for 5.18.

Thanks, best regards,
   Nicolas

> ---
>   arch/arm/boot/dts/sama7g5.dtsi | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sama7g5.dtsi b/arch/arm/boot/dts/sama7g5.dtsi
> index 4decd3a91a76..f691c8f08d04 100644
> --- a/arch/arm/boot/dts/sama7g5.dtsi
> +++ b/arch/arm/boot/dts/sama7g5.dtsi
> @@ -601,9 +601,9 @@ i2c1: i2c@600 {
>   				#size-cells = <0>;
>   				clocks = <&pmc PMC_TYPE_PERIPHERAL 39>;
>   				atmel,fifo-size = <32>;
> -				dmas = <&dma0 AT91_XDMAC_DT_PERID(7)>,
> -					<&dma0 AT91_XDMAC_DT_PERID(8)>;
> -				dma-names = "rx", "tx";
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(8)>,
> +					<&dma0 AT91_XDMAC_DT_PERID(7)>;
> +				dma-names = "tx", "rx";
>   				status = "disabled";
>   			};
>   		};
> @@ -786,9 +786,9 @@ i2c8: i2c@600 {
>   				#size-cells = <0>;
>   				clocks = <&pmc PMC_TYPE_PERIPHERAL 46>;
>   				atmel,fifo-size = <32>;
> -				dmas = <&dma0 AT91_XDMAC_DT_PERID(21)>,
> -					<&dma0 AT91_XDMAC_DT_PERID(22)>;
> -				dma-names = "rx", "tx";
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(22)>,
> +					<&dma0 AT91_XDMAC_DT_PERID(21)>;
> +				dma-names = "tx", "rx";
>   				status = "disabled";
>   			};
>   		};
> @@ -810,9 +810,9 @@ i2c9: i2c@600 {
>   				#size-cells = <0>;
>   				clocks = <&pmc PMC_TYPE_PERIPHERAL 47>;
>   				atmel,fifo-size = <32>;
> -				dmas = <&dma0 AT91_XDMAC_DT_PERID(23)>,
> -					<&dma0 AT91_XDMAC_DT_PERID(24)>;
> -				dma-names = "rx", "tx";
> +				dmas = <&dma0 AT91_XDMAC_DT_PERID(24)>,
> +					<&dma0 AT91_XDMAC_DT_PERID(23)>;
> +				dma-names = "tx", "rx";
>   				status = "disabled";
>   			};
>   		};


-- 
Nicolas Ferre
