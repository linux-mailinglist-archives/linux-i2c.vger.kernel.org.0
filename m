Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2576D498530
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 17:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243899AbiAXQsu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 11:48:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235273AbiAXQsu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jan 2022 11:48:50 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B77C06173B;
        Mon, 24 Jan 2022 08:48:49 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id y15so42925065lfa.9;
        Mon, 24 Jan 2022 08:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=OGRoCWlLh1MtdWp2wRwR8A6iXPK2mkskDaiLHJ++qnI=;
        b=iNqXCOEYfW1EwHWWGckGw2iIgEPVYKhaRwGiaY2KnEa7YqA4kao7mzfgVd2oNfjptt
         53PqzD9paye3tFaQWkCk3ryI1Rb8qbART76KSsfV3pa/aVuNkOnkQX1xAcNDfF5At6J7
         hmcsr8dW6+i3OstSOGUKpfHQBFJqYh/fzSjrbAeCna7UkmfXLeqw2gPjUwthOEukTw6v
         Pf++exKO4IYKNGOKY/2lSgp9uDQ98LjevykXHnkBKckjiT8abYVSCFvCaMnLo7E3zPJR
         djB4PvMivWQdsc9JxUKZ3gUrTiAr69DIglFf7N58z5fkOftou4e4JlvdN+sHHqk3cngH
         T3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OGRoCWlLh1MtdWp2wRwR8A6iXPK2mkskDaiLHJ++qnI=;
        b=ZHBM6mzUfHJvajltGAhcTySYIVZnRRVNUzIDufqybgRmps0HQL8XuvBqTwSqJglNx6
         DibtTONcvSwMHNp3FuKgT/3THCcYWDSx5WmwZo3p2E7d2mGZ+RqzfSip9fJsJS3Jmf9K
         VjAaY2Ie6IgCy7FaqwVOhjH+9FXeYoXMaf24+utqgbkFAiVTp7V9DU2LIWFt0bAuZGm7
         c49Ym4GRe6Gh3ogEXBwssmxLzpGBy3PFny9xv63TgEYbq6mVB3YK+Uw+7fa+hOBPWJsw
         Bop/Pfq+NCwUGm2E3eTzTRqfLEYqongKXjPtv5wa1DyVgLLEQJj7KpttOdSXpd4DKNBE
         pucQ==
X-Gm-Message-State: AOAM5312Z7LeDUIgbT5a0blyMFc1hgHSRAY/amG/CxgHOB+tjdtAT8vd
        gw7WrYRJZA8Sf3w36+r3vGU=
X-Google-Smtp-Source: ABdhPJxBFI3sfXPwHgAnVDNtaQChKuY6EgxqjFs76Q30zFSl70khIgPLU+qKwyA5ZzQWzP3Jp3KmTQ==
X-Received: by 2002:a19:ca03:: with SMTP id a3mr13426648lfg.16.1643042927780;
        Mon, 24 Jan 2022 08:48:47 -0800 (PST)
Received: from [192.168.2.145] (109-252-139-36.dynamic.spd-mgts.ru. [109.252.139.36])
        by smtp.googlemail.com with ESMTPSA id o22sm244127lfk.14.2022.01.24.08.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 08:48:47 -0800 (PST)
Message-ID: <c323b734-b134-2dc0-cfa2-c9f63f1c3ad8@gmail.com>
Date:   Mon, 24 Jan 2022 19:48:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/4] arm64: tegra: Add Tegra234 I2C devicetree nodes
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>, devicetree@vger.kernel.org,
        jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, mperttunen@nvidia.com,
        robh+dt@kernel.org, thierry.reding@gmail.com
References: <1643023097-5221-1-git-send-email-akhilrajeev@nvidia.com>
 <1643023097-5221-3-git-send-email-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <1643023097-5221-3-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

24.01.2022 14:18, Akhil R пишет:
> Add device tree nodes for Tegra234 I2C controllers
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 121 +++++++++++++++++++++++++++++++
>  1 file changed, 121 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index 6b6f1580..c686827 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -144,6 +144,96 @@
>  			status = "disabled";
>  		};
>  
> +		gen1_i2c: i2c@3160000 {
> +			compatible = "nvidia,tegra194-i2c";
> +			reg = <0x3160000 0x100>;
> +			status = "disabled";
> +			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-frequency = <400000>;
> +			clocks = <&bpmp TEGRA234_CLK_I2C1
> +				  &bpmp TEGRA234_CLK_PLLP_OUT0>;
> +			assigned-clocks = <&bpmp TEGRA234_CLK_I2C1>;
> +			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
> +			clock-names = "div-clk", "parent";
> +			resets = <&bpmp TEGRA234_RESET_I2C1>;
> +			reset-names = "i2c";
> +		};

The patchset looks okay to me, thank you. I've one question:

Could you please explain why the "PLLP" I2C timing configuration that is
specified in the "example" section of Tegra TRM isn't suitable for
T194/234? Why I2C Tegra kernel driver uses a different configuration?
