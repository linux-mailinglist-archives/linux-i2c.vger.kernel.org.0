Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64EDD2F98A5
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 05:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730852AbhAREaA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 23:30:00 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:51227 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728690AbhARE35 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Jan 2021 23:29:57 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 936285805F2;
        Sun, 17 Jan 2021 23:28:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 17 Jan 2021 23:28:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=s
        ICxixPxct6sLtmHxkqJI743Hy8F/P1ZryCsE09D94Q=; b=ifZUkXk+q51ej7SmX
        2PaJs3RJQHylWkQ79NZB01+E581m62vwJx28PdkVACenTTpsWDK4BVclI0m3cY3l
        EbF+UYV7DLxIpaQsPs/FYT9dFrUUrz/R5V409UOLlPmbK5TbuIPPo2qvGdCDNkeD
        4yHPTzYNRxO3h4c6+dZiALjPrfWNibow+jQAC9JsurWE3Po0lUgt7Ch9kFuQaJkb
        oGNcp7zz6GmStXLtymZgznnAADhCntBlRM5JswHeJt6V6IsDzgiAru6uFdBgPL4Q
        Uun4t8wp78p9Mymk49/f2XL2mvxqP09QBlk6HwYL7OeHa0KS77dwJ6BUw5sVv8AZ
        ilMlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=sICxixPxct6sLtmHxkqJI743Hy8F/P1ZryCsE09D9
        4Q=; b=EC6xx3WGKXuJ+a52Myt/R1gvlro3ZnbwpkeLcKGFwxz1Wcsc+J9oVP3VF
        iqoe/4i+8CKQiXfRB8oyi+7b1ibl2nZnUARSGVmuKSvYMlJF1TaWwzqrvpA7NZoo
        iPk8tfVyZ1kIRjiEKrDA9D7dc2Kf1Sg2dOIHPMmEgfd3N4WZtgsW6utNPY0zLYaI
        FCF+l3fnl86Z5tCSlK8ksO6V7VHmxbosXRsUoogSCvbyupjSYmQrAF4f3uhqU34G
        YoD1f1GMGlK4+TBdycUeW8oBT/Y7vxZhtwokLcPxVYNUfj7AQJd8D5QkdahxMLs4
        EA2nNGsZIWnQWDH0iqDEMiS7sjk0Q==
X-ME-Sender: <xms:gA4FYEpEaczjmpzMcqddwTrVyRZNYcwj13JaP9cpqeBBrKoOGJ-4eg>
    <xme:gA4FYKqrWgSZ1-YX5KTxIXula5JAmnVn3sS7SBPyW-GWFnG4r_2PiZWA5Z1DIt1H9
    1Y9Juqiu5sruKD1gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeuteeu
    gfettdeggeenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:gQ4FYJMr7vTk_aUfBh_Cy3LnTZwzD66_cbgDGxn1ewDlpamW5ErqWw>
    <xmx:gQ4FYL4L9i7Vgjh2mvgEiOur5LtzkqbND31DH_1Gq8sf2GEx8IxK3Q>
    <xmx:gQ4FYD54u-AIq-0EXE2pYxu_TSrlpOvUAW5fRKPAHCplNtph5QwQvg>
    <xmx:gg4FYB7M_N6QRj_OvrC_HhViGEGCS6NozhshuWm31TTEukMR1RktsA>
Received: from [70.135.148.151] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 35D7B1080057;
        Sun, 17 Jan 2021 23:28:48 -0500 (EST)
Subject: Re: [PATCH v3 18/21] dt-bindings: allwinner: Add H616 compatible
 strings
To:     Andre Przywara <andre.przywara@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Icenowy Zheng <icenowy@aosc.io>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org
References: <20210118020848.11721-1-andre.przywara@arm.com>
 <20210118020848.11721-19-andre.przywara@arm.com>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <c21019af-a6e4-4a06-5307-23b227d25934@sholland.org>
Date:   Sun, 17 Jan 2021 22:28:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20210118020848.11721-19-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/17/21 8:08 PM, Andre Przywara wrote:
> Add simple "allwinner,sun50i-h616-xxx" compatible names to existing
> bindings, and pair them with an existing fallback compatible string,
> as the devices are compatible.
> This covers I2C, infrared, RTC and SPI.
> 
> Use enums to group all compatible devices together.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C
> ---
>  .../bindings/i2c/marvell,mv64xxx-i2c.yaml     | 21 +++++++------------
>  .../media/allwinner,sun4i-a10-ir.yaml         | 16 ++++++--------
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |  3 +++
>  .../bindings/spi/allwinner,sun6i-a31-spi.yaml |  1 +
>  4 files changed, 17 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> index 5b5ae402f97a..eb72dd571def 100644
> --- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> @@ -18,21 +18,14 @@ properties:
>            - const: allwinner,sun4i-a10-i2c
>        - const: allwinner,sun6i-a31-i2c
>        - items:
> -          - const: allwinner,sun8i-a23-i2c
> +          - enum:
> +              - allwinner,sun8i-a23-i2c
> +              - allwinner,sun8i-a83t-i2c
> +              - allwinner,sun50i-a64-i2c
> +              - allwinner,sun50i-a100-i2c
> +              - allwinner,sun50i-h6-i2c
> +              - allwinner,sun50i-h616-i2c
>            - const: allwinner,sun6i-a31-i2c
> -      - items:
> -          - const: allwinner,sun8i-a83t-i2c
> -          - const: allwinner,sun6i-a31-i2c
> -      - items:
> -          - const: allwinner,sun50i-a64-i2c
> -          - const: allwinner,sun6i-a31-i2c
> -      - items:
> -          - const: allwinner,sun50i-a100-i2c
> -          - const: allwinner,sun6i-a31-i2c
> -      - items:
> -          - const: allwinner,sun50i-h6-i2c
> -          - const: allwinner,sun6i-a31-i2c
> -
>        - const: marvell,mv64xxx-i2c
>        - const: marvell,mv78230-i2c
>        - const: marvell,mv78230-a0-i2c
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> index 5fa19d4aeaf3..6d8395d6bca0 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> @@ -20,16 +20,12 @@ properties:
>        - const: allwinner,sun5i-a13-ir
>        - const: allwinner,sun6i-a31-ir
>        - items:
> -          - const: allwinner,sun8i-a83t-ir
> -          - const: allwinner,sun6i-a31-ir
> -      - items:
> -          - const: allwinner,sun8i-r40-ir
> -          - const: allwinner,sun6i-a31-ir
> -      - items:
> -          - const: allwinner,sun50i-a64-ir
> -          - const: allwinner,sun6i-a31-ir
> -      - items:
> -          - const: allwinner,sun50i-h6-ir
> +          - enum:
> +              - allwinner,sun8i-a83t-ir
> +              - allwinner,sun8i-r40-ir
> +              - allwinner,sun50i-a64-ir
> +              - allwinner,sun50i-h6-ir
> +              - allwinner,sun50i-h616-ir
>            - const: allwinner,sun6i-a31-ir
>  
>    reg:
> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> index 37c2a601c3fa..97928efd2bc9 100644
> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> @@ -26,6 +26,9 @@ properties:
>            - const: allwinner,sun50i-a64-rtc
>            - const: allwinner,sun8i-h3-rtc
>        - const: allwinner,sun50i-h6-rtc
> +      - items:
> +          - const: allwinner,sun50i-h616-rtc
> +          - const: allwinner,sun50i-h6-rtc

Since H6, the RTC manages the 24 MHz DCXO, so it provides a fourth clock
output. If this is easy to change later, then it is fine for now, but
maybe it is better to get the H616 binding correct from the beginning?

Cheers,
Samuel

>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> index 7866a655d81c..908248260afa 100644
> --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> @@ -25,6 +25,7 @@ properties:
>            - enum:
>                - allwinner,sun8i-r40-spi
>                - allwinner,sun50i-h6-spi
> +              - allwinner,sun50i-h616-spi
>            - const: allwinner,sun8i-h3-spi
>  
>    reg:
> 

