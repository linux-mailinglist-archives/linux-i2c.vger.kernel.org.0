Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0014A398959
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jun 2021 14:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhFBMY4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Jun 2021 08:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhFBMYz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Jun 2021 08:24:55 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49A0C061574;
        Wed,  2 Jun 2021 05:23:10 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id o2-20020a05600c4fc2b029019a0a8f959dso1570235wmq.1;
        Wed, 02 Jun 2021 05:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xXTfKeisJ+d2G9OgHki0LrMi+N+ThHP407zug8OKubM=;
        b=C7IaWtyHWotLA3nR2EHAY8F5rSdnzjKCmjCsDd9VzLcMIbqehAmx+oFZfyOErOYwje
         07vftXUnuDJrX7PHt0HjpReCrLqdCUWnLP3ziYhOIXnlGsxICd9lpUv4X7LWzIe3d1a/
         TQPNZbsRI7T7CDtcdYa+9bMmOSp80pIUY3OFt6WiSbC8xCtqI0ANYbmfUf2qDpuA1sev
         AJdphGzG470UsFzROd1qE8hnnuxnRXtvuYEexEzoOw9rEnnTydEDtRqz9pZOyrNJbaei
         W5x2jzUoE8MSp0xqcbWQ876y3MNzs9esPtFqPmw92w7i5D4hmjAlXKIh/aIffYTvkH4A
         4j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xXTfKeisJ+d2G9OgHki0LrMi+N+ThHP407zug8OKubM=;
        b=TsRO2X0YEvxHm7f9eGWtGp55aArqy1ElKTn43xPt4WK5AJ01T6mA8TQQu294hOU5nG
         vQm4qHC2pnUPY4XpAGzCw3j7qiY1Dgd26RVnMYuqwB8E7Jj+aho/1LpiPvSnfY3XZpAf
         38tNAIODkQk5CoAzA+KFdIz83k3pCNp3xYncrBiIjgz/+aznyO1Vh/cwgeEEEEe1/Lt7
         u5hiB5wOeyobvzZeiZAVsudwgr3OPGoENZFEX1CSD6Qp1wQBtMkCgcVby19tJy4ELa3f
         E4z/VF6efQFEoFfdhhxM8RKzaPpjtl+Ch08xe+UQupQ6qfjD7MnPHkuhO4oE5+hAjpDQ
         fjIg==
X-Gm-Message-State: AOAM533WCdx33hlQdrNjiEwSVGDRqHd4a86feCkJgJuoePfRNHS/flDy
        GjtdgeoECmJygm3lBUmXBRoSBniJmAs=
X-Google-Smtp-Source: ABdhPJysKE2gyVGbc/4vvjXVWq5HJ1UgNq7ruN5kz26olg90yWxtfinAk/bAf6HpX/vpIl7+7pN+Kg==
X-Received: by 2002:a05:600c:3545:: with SMTP id i5mr4819578wmq.43.1622636589361;
        Wed, 02 Jun 2021 05:23:09 -0700 (PDT)
Received: from ziggy.stardust ([37.223.145.68])
        by smtp.gmail.com with ESMTPSA id n20sm2548429wmk.12.2021.06.02.05.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 05:23:08 -0700 (PDT)
Subject: Re: [PATCH v21 RESEND 4/4] arm64: dts: mt8183: add supply name for
 eeprom
To:     Hsin-Yi Wang <hsinyi@chromium.org>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <khali@linux-fr.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
References: <20210527075556.1709140-1-hsinyi@chromium.org>
 <20210527075556.1709140-5-hsinyi@chromium.org>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e7db756c-2563-ee03-55ee-5e84e1444cb0@gmail.com>
Date:   Wed, 2 Jun 2021 14:23:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210527075556.1709140-5-hsinyi@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 27/05/2021 09:55, Hsin-Yi Wang wrote:
> Add supplies for eeprom for mt8183 boards.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Applied to v5.13-next/dts64

Thanks!

> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi | 4 ++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi | 4 ++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi  | 4 ++++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index b442e38a3156..28966a65391b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -88,11 +88,13 @@ &i2c2 {
>  	pinctrl-0 = <&i2c2_pins>;
>  	status = "okay";
>  	clock-frequency = <400000>;
> +	vbus-supply = <&mt6358_vcamio_reg>;
>  
>  	eeprom@58 {
>  		compatible = "atmel,24c32";
>  		reg = <0x58>;
>  		pagesize = <32>;
> +		vcc-supply = <&mt6358_vcama2_reg>;
>  	};
>  };
>  
> @@ -101,11 +103,13 @@ &i2c4 {
>  	pinctrl-0 = <&i2c4_pins>;
>  	status = "okay";
>  	clock-frequency = <400000>;
> +	vbus-supply = <&mt6358_vcn18_reg>;
>  
>  	eeprom@54 {
>  		compatible = "atmel,24c32";
>  		reg = <0x54>;
>  		pagesize = <32>;
> +		vcc-supply = <&mt6358_vcn18_reg>;
>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> index 2f5234a16ead..3aa79403c0c2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> @@ -62,11 +62,13 @@ &i2c2 {
>  	pinctrl-0 = <&i2c2_pins>;
>  	status = "okay";
>  	clock-frequency = <400000>;
> +	vbus-supply = <&mt6358_vcamio_reg>;
>  
>  	eeprom@58 {
>  		compatible = "atmel,24c64";
>  		reg = <0x58>;
>  		pagesize = <32>;
> +		vcc-supply = <&mt6358_vcamio_reg>;
>  	};
>  };
>  
> @@ -75,11 +77,13 @@ &i2c4 {
>  	pinctrl-0 = <&i2c4_pins>;
>  	status = "okay";
>  	clock-frequency = <400000>;
> +	vbus-supply = <&mt6358_vcn18_reg>;
>  
>  	eeprom@54 {
>  		compatible = "atmel,24c64";
>  		reg = <0x54>;
>  		pagesize = <32>;
> +		vcc-supply = <&mt6358_vcn18_reg>;
>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> index fbc471ccf805..30c183c96a54 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> @@ -71,11 +71,13 @@ &i2c2 {
>  	pinctrl-0 = <&i2c2_pins>;
>  	status = "okay";
>  	clock-frequency = <400000>;
> +	vbus-supply = <&mt6358_vcamio_reg>;
>  
>  	eeprom@58 {
>  		compatible = "atmel,24c32";
>  		reg = <0x58>;
>  		pagesize = <32>;
> +		vcc-supply = <&mt6358_vcama2_reg>;
>  	};
>  };
>  
> @@ -84,11 +86,13 @@ &i2c4 {
>  	pinctrl-0 = <&i2c4_pins>;
>  	status = "okay";
>  	clock-frequency = <400000>;
> +	vbus-supply = <&mt6358_vcn18_reg>;
>  
>  	eeprom@54 {
>  		compatible = "atmel,24c32";
>  		reg = <0x54>;
>  		pagesize = <32>;
> +		vcc-supply = <&mt6358_vcn18_reg>;
>  	};
>  };
>  
> 
