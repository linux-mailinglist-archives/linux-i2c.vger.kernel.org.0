Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB7D496D55
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jan 2022 19:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbiAVSfq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jan 2022 13:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiAVSfq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jan 2022 13:35:46 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0AE0C06173B;
        Sat, 22 Jan 2022 10:35:45 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id n8so457097lfq.4;
        Sat, 22 Jan 2022 10:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=6Am4YnD9KTFo9pgUgTrDTzYozeoflnXjTOGZfWwTWNg=;
        b=LdXLQBcP16CDu2nIYF2Azo7Av+b/1I2icMbcKKKtft2AhWt1OVafHCZ0EoqmiGk8OC
         z7NT+rP++ZyAk06vip5VCxfX/E7n4m0EgGcIXDJ+dyUFS9fKqm2Qni3t6FAqJCUrZWCY
         PfUZekBxgNILwSFVSuCxE633qyGztuc34Qnz5KDZ4tR6Zw2YGEbxr2tEy7bjmDZUooU1
         5nH5/YMz6mMDDrO8rQu4bU5maeRlW8cVdZZLZM4BHAuU6H9WpOWCQGbev3Gxz+/o+T4f
         VrCvZXDU4ZRfl/IRRf/ZnaSOPoDUV+3s/9DAE4LuryvQyBoUQFtRBEQh2vBRMnq7CM/F
         8lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6Am4YnD9KTFo9pgUgTrDTzYozeoflnXjTOGZfWwTWNg=;
        b=cUS//jZwoAIG1cbCPuPOjqiDOyr+qHJR2NbfOnkamQM5YtTsxAocHnNpUpiEmQodGG
         jhuF5RFEiA582XnGgRl2jQWtITNclRMQbzvh32hJlt3yk3mdo7MUQsQJKISQufc9BuQQ
         jL2bqXrPqyu9Lf1fKyV+OBINhA8mNdTbMSGbj18q297COd/kUI4Hph4l1DNYlVreX4o/
         MGa/v+rUDUjyye1yaojJlNahhUmASJYrOEfv3pxhn3n2Kt2e6Ft+5PVbeJc8VH08YmgQ
         u/VXnjCt/VmFb1koN4okSDOb129BXos9mAmtTZfhOSZD7PabNJs+NRhBSyK+39pjknid
         y9HQ==
X-Gm-Message-State: AOAM5315zJe6a2l00UxvMrr94ppzloGDHf0rC0AiMfA7htJwGbFEQIhZ
        KVCfWfYv7PDmFPq5kbJP5P0=
X-Google-Smtp-Source: ABdhPJz0YZ2QnjDZa7kIRynR+NtfAWdMkk12sGInhaKzgGmmsKoRb+QC4ym6a5KovS5Ned/ZAfHQAw==
X-Received: by 2002:a05:6512:1290:: with SMTP id u16mr7561566lfs.151.1642876543901;
        Sat, 22 Jan 2022 10:35:43 -0800 (PST)
Received: from [192.168.2.145] (109-252-139-36.dynamic.spd-mgts.ru. [109.252.139.36])
        by smtp.googlemail.com with ESMTPSA id j18sm633773lfm.56.2022.01.22.10.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jan 2022 10:35:43 -0800 (PST)
Message-ID: <103960bf-ed5c-4a0c-9142-65ffc2e4bca0@gmail.com>
Date:   Sat, 22 Jan 2022 21:35:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] dt-bindings: Add headers for Tegra234 I2C
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>, devicetree@vger.kernel.org,
        jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, mperttunen@nvidia.com,
        robh+dt@kernel.org, thierry.reding@gmail.com
References: <1642850607-20664-1-git-send-email-akhilrajeev@nvidia.com>
 <1642850607-20664-2-git-send-email-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <1642850607-20664-2-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

22.01.2022 14:23, Akhil R пишет:
> Add dt-bindings header files for I2C controllers for Tegra234
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra234-clock.h | 19 +++++++++++++++++++
>  include/dt-bindings/reset/tegra234-reset.h |  8 ++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
> index 8d7e66e..5d05c19 100644
> --- a/include/dt-bindings/clock/tegra234-clock.h
> +++ b/include/dt-bindings/clock/tegra234-clock.h
> @@ -30,5 +30,24 @@
>  #define TEGRA234_CLK_PLLC4			237U
>  /** @brief 32K input clock provided by PMIC */
>  #define TEGRA234_CLK_CLK_32K			289U
> +/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C1 */
> +#define TEGRA234_CLK_I2C1			48U
> +/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C2 */
> +#define TEGRA234_CLK_I2C2			49U
> +/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C3 */
> +#define TEGRA234_CLK_I2C3			50U
> +/** output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C4 */
> +#define TEGRA234_CLK_I2C4			51U
> +/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C6 */
> +#define TEGRA234_CLK_I2C6			52U
> +/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C7 */
> +#define TEGRA234_CLK_I2C7			53U
> +/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C8 */
> +#define TEGRA234_CLK_I2C8			54U
> +/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C9 */
> +#define TEGRA234_CLK_I2C9			55U
> +
> +/** @brief PLLP clk output */
> +#define TEGRA234_CLK_PLLP_OUT0			102U
>  
>  #endif
> diff --git a/include/dt-bindings/reset/tegra234-reset.h b/include/dt-bindings/reset/tegra234-reset.h
> index 50e13bc..e07e898 100644
> --- a/include/dt-bindings/reset/tegra234-reset.h
> +++ b/include/dt-bindings/reset/tegra234-reset.h
> @@ -12,6 +12,14 @@
>   */
>  #define TEGRA234_RESET_SDMMC4			85U
>  #define TEGRA234_RESET_UARTA			100U
> +#define TEGRA234_RESET_I2C1			24U
> +#define TEGRA234_RESET_I2C2			29U
> +#define TEGRA234_RESET_I2C3			30U
> +#define TEGRA234_RESET_I2C4			31U
> +#define TEGRA234_RESET_I2C6			32U
> +#define TEGRA234_RESET_I2C7			33U
> +#define TEGRA234_RESET_I2C8			34U
> +#define TEGRA234_RESET_I2C9			35U

Why ID order isn't maintained?
