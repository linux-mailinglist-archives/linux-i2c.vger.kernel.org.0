Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60B5117CAA3
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Mar 2020 03:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgCGCIQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 21:08:16 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40777 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgCGCIQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Mar 2020 21:08:16 -0500
Received: by mail-pg1-f196.google.com with SMTP id t24so1909268pgj.7
        for <linux-i2c@vger.kernel.org>; Fri, 06 Mar 2020 18:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pJwj/Wnf7G/OvgCEBiEPVfsfO5dnRSjL+78IGVllWvA=;
        b=CbcYPatlo5KtrEBdEeZLZ2kISiSSeiPEo63DuhLOaJPokrW/DjIgbLXWbCZFB1Insd
         s2Gs/rmV0bKANdbbhuDH29JNHwkroWv9MYiiCdAmbQm9A+oUCumnZ5OhKVXe2YeusGqd
         HEb3rDUWbQbzO7hR6hU0HxDxTg+uZbylFGEvK65Op0aZ7OUZ6r2h/Kx88jr2AGp8OcXA
         qo6o7dpDy+bn/yVA1u8iyyE5mHiPWwS8gi4gClT1VI2JAAcKtUwSD7FDlwCK1I9vKwnX
         P0hnprY4Fn6Od8ocNZid9eqhe9myEMJiLxwyKAhymQKFXuXJ6/hckIVsEKctzlCr6pEs
         O5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pJwj/Wnf7G/OvgCEBiEPVfsfO5dnRSjL+78IGVllWvA=;
        b=gdeC2Swp7IvhmwyevschNxAAe7iG3TX+Q3im2hO+b1TTH3b2qnt7dTbhg9MY/w6hLa
         QgWM+r2ga3jtgOY44wEKKpiPm7ZItwS4uxiRAfNcCsJPdLi75yM0IOBl+xdifaDjRqeU
         h//4T7yeZQ2Xt6SLOu8Ez8DKFEK4e0AAh275uU2sZSIyNkRXhzAdeo4uTZb6LXAalozN
         hHYP0AnuIeMEU/FERjXDCFj6tiuZbNk37R/5Tydq4sGt2y5rlKhOd5YcjKjrOPiZ4dKf
         1U/tpKMdyzcJLPvZa/1q3bGvbvpEUfA4a5CfWF8GFdvpJga9iwfvz/YtXCzS0Puo6eXr
         Nxrw==
X-Gm-Message-State: ANhLgQ1KHoc2TK7HrjHsL6KSi9bJQ01xq1XaJhnk3TyOKFgTznAvrNMi
        AzWI6cApYhG3GHG2oJ7XMkvbTQ==
X-Google-Smtp-Source: ADFU+vvA2h8bX3Z1LeV1VGB0CV8xcJ+Fz38FSgT0NnRzTPebWSsqnV7j5ZBY+mGXAWvdJ48CxDAYbA==
X-Received: by 2002:a63:5546:: with SMTP id f6mr6119694pgm.260.1583546893317;
        Fri, 06 Mar 2020 18:08:13 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k24sm2071894pfg.27.2020.03.06.18.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 18:08:12 -0800 (PST)
Date:   Fri, 6 Mar 2020 18:08:10 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     wsa@the-dreams.de, vkoul@kernel.org, robert.foss@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: msm8916: Add CCI node
Message-ID: <20200307020810.GB1094083@builder>
References: <1583515184-9636-1-git-send-email-loic.poulain@linaro.org>
 <1583515184-9636-3-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583515184-9636-3-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri 06 Mar 09:19 PST 2020, Loic Poulain wrote:

> The msm8916 CCI controller provides one CCI/I2C bus.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
>  v2: add this patch in the series
>  v3: add only cci node for now
>  v4: no change
> 
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 8686e10..985cb5f 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1451,6 +1451,33 @@
>  			};
>  		};
>  
> +		cci@1b0c000 {

Given that this node is status disabled, we should have a label on it so
that we can enable it.

Apart from that,

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +			compatible = "qcom,msm8916-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x1b0c000 0x1000>;
> +			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
> +			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				<&gcc GCC_CAMSS_CCI_AHB_CLK>,
> +				<&gcc GCC_CAMSS_CCI_CLK>,
> +				<&gcc GCC_CAMSS_AHB_CLK>;
> +			clock-names = "camss_top_ahb", "cci_ahb",
> +				      "cci", "camss_ahb";
> +			assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
> +					  <&gcc GCC_CAMSS_CCI_CLK>;
> +			assigned-clock-rates = <80000000>, <19200000>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&cci0_default>;
> +			status = "disabled";
> +
> +			cci0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>  		camss: camss@1b00000 {
>  			compatible = "qcom,msm8916-camss";
>  			reg = <0x1b0ac00 0x200>,
> -- 
> 2.7.4
> 
