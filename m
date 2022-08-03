Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1BF588FA2
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Aug 2022 17:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237985AbiHCPqh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Aug 2022 11:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237423AbiHCPqf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Aug 2022 11:46:35 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09081E0CD
        for <linux-i2c@vger.kernel.org>; Wed,  3 Aug 2022 08:46:34 -0700 (PDT)
Received: from [192.168.1.101] (abxi232.neoplus.adsl.tpnet.pl [83.9.2.232])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E96CA3F672;
        Wed,  3 Aug 2022 17:46:31 +0200 (CEST)
Message-ID: <d5a35d28-3b4e-c763-a1fb-89aa3dae6fd2@somainline.org>
Date:   Wed, 3 Aug 2022 17:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sdm845-db845c: drop power-domains
 from CCI I2C sensors
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     corbet@lwn.net
References: <20220802153947.44457-1-krzysztof.kozlowski@linaro.org>
 <20220802153947.44457-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220802153947.44457-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2.08.2022 17:39, Krzysztof Kozlowski wrote:
> The Camera Control Interface I2C controller device node belongs to
> TITAN_TOP_GDSC power domain, so its children do not need to specify it
> again.  The OV7251 and OV8856 camera sensor bindings do not allow
> power-domains.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Not tested on hardware.
> ---
Not tested on hardware either, but looks good.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index c6e2c571b452..b9304f81290a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1228,8 +1228,6 @@ camera@10 {
>  		 * both have to be enabled through the power management
>  		 * gpios.
>  		 */
> -		power-domains = <&clock_camcc TITAN_TOP_GDSC>;
> -
>  		dovdd-supply = <&vreg_lvs1a_1p8>;
>  		avdd-supply = <&cam0_avdd_2v8>;
>  		dvdd-supply = <&cam0_dvdd_1v2>;
> @@ -1273,8 +1271,6 @@ camera@60 {
>  		 *
>  		 * No 1.2V vddd-supply regulator is used.
>  		 */
> -		power-domains = <&clock_camcc TITAN_TOP_GDSC>;
> -
>  		vdddo-supply = <&vreg_lvs1a_1p8>;
>  		vdda-supply = <&cam3_avdd_2v8>;
>  
