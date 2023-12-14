Return-Path: <linux-i2c+bounces-797-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2946B813445
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 16:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A72321F22225
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 15:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEAF5C09F;
	Thu, 14 Dec 2023 15:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yjrscuM+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0DA199
	for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 07:12:13 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-28afca4b321so883343a91.0
        for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 07:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702566733; x=1703171533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwHpdQvNy5J0Igg1Vsz7T/zPUieTC2ctDg1RFLI3Irg=;
        b=yjrscuM+kOzgQMSFtd+6A38cXtxRDYPuNjaXgIiT1p8geNzIAOv4PPOFAlQf1WMZY5
         84aEdIDMhc6+6Dc4LBGbesemcwCmc+pHV8ayjGeG2uKT50VUzsIu7IHcM4K9cheg5Xvv
         rjZnfaul9kf/EOo+EHKGy1xIMvOrQspVvq4iwF58rpm+/sDyWb29uoUxrmXAHWiFXh6S
         s4F8y305T7kSA2amD4rrEnescyIGZjIqmUz1X5IBtVGRKALIZUbXlHgvpJRe6JMsyqAx
         5xDrEKgyHOeOp9+Znfl8vwnEPclIDXfdy53Hcw8W5l1SNVQxbFt+A5jU3tJrdkiVlDkK
         2a6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702566733; x=1703171533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwHpdQvNy5J0Igg1Vsz7T/zPUieTC2ctDg1RFLI3Irg=;
        b=R6r9mVH9v/AQ/B7P0sw4hHb3lAieDJMpPJN5b4FYzcjA/kv+L2qlAT+GgaR+8H0jbu
         KfCYNpkl8YMCdENfG30pzNa3g35HLnfQCiH6l86UZ1VnpVGuKBHzO5yUfBVcswE5lA5s
         uOGK5vFyM01bvR3bdI5F7gtprLtVJ+LK1dXG/8v6KHVzNUXWKeCpQCLz91u/VkqaEI2M
         eTcVGz7PV1i8mzl10Lu8Aas9Wp9Kx5+Qjm5/zYOKt3P9jMKgG31AWSTMZ8Ep6pMaRRZv
         TuptIz7i5HpAMZ7DeMG2XMaGuKn9URGs/JlUw4cDjJGVAYdfMRYY4XkueD2BEXLcDcbm
         KfLA==
X-Gm-Message-State: AOJu0Yy40HuBY4wHsCa427w2HBJYLCbeFol7a8KRgI2nLNJTAoPLJzr1
	NJjPSsOPbDTuwFevrPt3y75Wt+sl4WMJxPvf1dIYAw==
X-Google-Smtp-Source: AGHT+IHkdlxZI9BdksvtM5U64iab2h/pY7ggP309thulz4NiNhxzZYZ8yM7zHvmhWWBCVkGuUgTGrAki3o9iWrNX200=
X-Received: by 2002:a17:90a:c49:b0:28b:559:3916 with SMTP id
 u9-20020a17090a0c4900b0028b05593916mr499392pje.79.1702566733415; Thu, 14 Dec
 2023 07:12:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org> <20231214105243.3707730-3-tudor.ambarus@linaro.org>
In-Reply-To: <20231214105243.3707730-3-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 14 Dec 2023 09:12:02 -0600
Message-ID: <CAPLW+4=3naHwG4co=7bOf4LxmOPKR0qpn_hNGxys_N3AUzfiOA@mail.gmail.com>
Subject: Re: [PATCH 02/13] dt-bindings: clock: google,gs101-clock: add PERIC0
 clock management unit
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	conor+dt@kernel.org, andi.shyti@kernel.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, arnd@arndb.de, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 4:52=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Add dt-schema documentation for the Connectivity Peripheral 0 (PERIC0)
> clock management unit.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/clock/google,gs101-clock.yaml    | 25 +++++-
>  include/dt-bindings/clock/google,gs101.h      | 86 +++++++++++++++++++
>  2 files changed, 109 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.y=
aml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> index 3eebc03a309b..ba54c13c55bc 100644
> --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> @@ -30,14 +30,15 @@ properties:
>        - google,gs101-cmu-top
>        - google,gs101-cmu-apm
>        - google,gs101-cmu-misc
> +      - google,gs101-cmu-peric0
>
>    clocks:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>
>    clock-names:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>
>    "#clock-cells":
>      const: 1
> @@ -88,6 +89,26 @@ allOf:
>              - const: dout_cmu_misc_bus
>              - const: dout_cmu_misc_sss
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: google,gs101-cmu-peric0
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (24.576 MHz)
> +            - description: Connectivity Peripheral 0 bus clock (from CMU=
_TOP)
> +            - description: Connectivity Peripheral 0 IP clock (from CMU_=
TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: dout_cmu_peric0_bus
> +            - const: dout_cmu_peric0_ip
> +
>  additionalProperties: false
>
>  examples:
> diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindin=
gs/clock/google,gs101.h
> index 21adec22387c..7d7a896416a7 100644
> --- a/include/dt-bindings/clock/google,gs101.h
> +++ b/include/dt-bindings/clock/google,gs101.h
> @@ -389,4 +389,90 @@
>  #define CLK_GOUT_MISC_WDT_CLUSTER1_PCLK                        73
>  #define CLK_GOUT_MISC_XIU_D_MISC_ACLK                  74
>
> +/* CMU_PERIC0 */

This comments looks off here. Other than than, LGTM:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> +/* CMU_PERIC0 MUX */
> +#define CLK_MOUT_PERIC0_BUS_USER                       1
> +#define CLK_MOUT_PERIC0_I3C_USER                       2
> +#define CLK_MOUT_PERIC0_USI0_UART_USER                 3
> +#define CLK_MOUT_PERIC0_USI14_USI_USER                 4
> +#define CLK_MOUT_PERIC0_USI1_USI_USER                  5
> +#define CLK_MOUT_PERIC0_USI2_USI_USER                  6
> +#define CLK_MOUT_PERIC0_USI3_USI_USER                  7
> +#define CLK_MOUT_PERIC0_USI4_USI_USER                  8
> +#define CLK_MOUT_PERIC0_USI5_USI_USER                  9
> +#define CLK_MOUT_PERIC0_USI6_USI_USER                  10
> +#define CLK_MOUT_PERIC0_USI7_USI_USER                  11
> +#define CLK_MOUT_PERIC0_USI8_USI_USER                  12
> +
> +/* CMU_PERIC0 Dividers */
> +#define CLK_DOUT_PERIC0_I3C                            13
> +#define CLK_DOUT_PERIC0_USI0_UART                      14
> +#define CLK_DOUT_PERIC0_USI14_USI                      15
> +#define CLK_DOUT_PERIC0_USI1_USI                       16
> +#define CLK_DOUT_PERIC0_USI2_USI                       17
> +#define CLK_DOUT_PERIC0_USI3_USI                       18
> +#define CLK_DOUT_PERIC0_USI4_USI                       19
> +#define CLK_DOUT_PERIC0_USI5_USI                       20
> +#define CLK_DOUT_PERIC0_USI6_USI                       21
> +#define CLK_DOUT_PERIC0_USI7_USI                       22
> +#define CLK_DOUT_PERIC0_USI8_USI                       23
> +
> +/* CMU_PERIC0 Gates */
> +#define CLK_GOUT_PERIC0_IP                             24
> +#define CLK_GOUT_PERIC0_PERIC0_CMU_PERIC0_PCLK         25
> +#define CLK_GOUT_PERIC0_CLK_PERIC0_OSCCLK_CLK          26
> +#define CLK_GOUT_PERIC0_D_TZPC_PERIC0_PCLK             27
> +#define CLK_GOUT_PERIC0_GPC_PERIC0_PCLK                        28
> +#define CLK_GOUT_PERIC0_GPIO_PERIC0_PCLK               29
> +#define CLK_GOUT_PERIC0_LHM_AXI_P_PERIC0_I_CLK         30
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_0            31
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_1            32
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_10           33
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_11           34
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_12           35
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_13           36
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_14           37
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_15           38
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_2            39
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_3            40
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_4            41
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_5            42
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_6            43
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7            44
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_8            45
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_9            46
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_0             47
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_1             48
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_10            49
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_11            50
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_12            51
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_13            52
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_14            53
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_15            54
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_2             55
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_3             56
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_4             57
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_5             58
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_6             59
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_7             60
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_8             61
> +#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_9             62
> +#define CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0            63
> +#define CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2            64
> +#define CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0             65
> +#define CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_2             66
> +#define CLK_GOUT_PERIC0_CLK_PERIC0_BUSP_CLK            67
> +#define CLK_GOUT_PERIC0_CLK_PERIC0_I3C_CLK             68
> +#define CLK_GOUT_PERIC0_CLK_PERIC0_USI0_UART_CLK       69
> +#define CLK_GOUT_PERIC0_CLK_PERIC0_USI14_USI_CLK       70
> +#define CLK_GOUT_PERIC0_CLK_PERIC0_USI1_USI_CLK                71
> +#define CLK_GOUT_PERIC0_CLK_PERIC0_USI2_USI_CLK                72
> +#define CLK_GOUT_PERIC0_CLK_PERIC0_USI3_USI_CLK                73
> +#define CLK_GOUT_PERIC0_CLK_PERIC0_USI4_USI_CLK                74
> +#define CLK_GOUT_PERIC0_CLK_PERIC0_USI5_USI_CLK                75
> +#define CLK_GOUT_PERIC0_CLK_PERIC0_USI6_USI_CLK                76
> +#define CLK_GOUT_PERIC0_CLK_PERIC0_USI7_USI_CLK                77
> +#define CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK                78
> +#define CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK             79
> +
>  #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
> --
> 2.43.0.472.g3155946c3a-goog
>

