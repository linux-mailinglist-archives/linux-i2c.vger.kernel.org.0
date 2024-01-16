Return-Path: <linux-i2c+bounces-1335-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E232A82F35B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 18:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6D3C1C23767
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 17:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D4F1CD1A;
	Tue, 16 Jan 2024 17:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vNT86cgS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCCE1CD02
	for <linux-i2c@vger.kernel.org>; Tue, 16 Jan 2024 17:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705426992; cv=none; b=cO3HXaocfU0fa1frPFD2BaHeXxh2AmT50EbSdrUefz3cBBxugjmTiUcBbDePUGcHa7n7kq2NCTi3cEW89g0ieHRXMslMfMyAnO0Xgu/bbaa/SHwkSnY65tddOdV3szGuVJW4IyXTd464xDJghOkJgzSz4fx7544C+xXf1aNW5x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705426992; c=relaxed/simple;
	bh=tU1G2fSsXqApBhWFs3rw+GrbYZ6Mz8OepJA7vwe2nZw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=tYd7FnALp9UmsHm2mzMvbxXX71fiJY0/NvCfbXnKnimskGfuwH4vlgefqzig75Ex+puOzljHar5dOBLWpIR5i/e923mQzMpx9L/MvwV/CACtadK/gAkmgtXx11xRqhDug8LEh0TDL1w/VqdHGiSjQURc7J5pcc/xc94QG35Q5Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vNT86cgS; arc=none smtp.client-ip=209.85.215.169
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5ca1b4809b5so4247168a12.3
        for <linux-i2c@vger.kernel.org>; Tue, 16 Jan 2024 09:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705426989; x=1706031789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOvUEuJsPyEoFI20c56wPfAlPPRSnKOXJPA7LwehsD0=;
        b=vNT86cgSilYQ9x0KoLTAgH6RZDpWApv3ZRCgFpZujYXdRpfc18tt1mOmCEH+QvxNmx
         ZGsMXhXx2iyItXGvAFdsKtXpQlLMG1JManQDtOqW5xV4OfIhI/XMCbsD63xO14Z9t5ZC
         Dpa0v9kPTZsQFF6NnGBshPeSG2HW2hLwGdArv1/kHaGdrQtau9+1ZqGe+O93s+gx28Qg
         BKHrm7SOL7iLV3xCCA/5UKiX3axlaZ77nJALl0F72JTLlB8po33B3ZqZUjOVaT8h0K7k
         YhZ8ONDcl5h+oJ24COH9jh7lcuitcYNyVRdiR63qhzCRWWKtwIf/ggHpjbRMwi8LMqK3
         +RLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705426989; x=1706031789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOvUEuJsPyEoFI20c56wPfAlPPRSnKOXJPA7LwehsD0=;
        b=Qz6EjarPBG/tJENSs548LTMc+Jd0suzKj7HYJNrNIvDS2sRg+WyKF8Ajfj+LOSLaNf
         RkHloSaqeJ+O2zIo+F06eQWgxHlsvjBgYXfKnP91H5ZOxNIIhJyd5dQH31grqhMuvJLV
         bX75Xx7xNrjdKW2kLCTn5O4dYsjmZSoi7wjOZ6hXfZqUxgZMBcZgd9FviOmmj98bwD2B
         9FAQnp2zCxC6AIqKiWmgT7zMd3oBEckPWEsdC0pMwXjMulCn4yiUpiI1BBhmmH9qAtfi
         Wps/bKjew7xnCD/RpyuJc2ZOGziMGmC9Xcn7lDlkt3t1PlK/cS9PvGncLlYseQPMKTCN
         8HwQ==
X-Gm-Message-State: AOJu0YxoehVa6DGoW59en/QTvYUg4rneszltf7vXOuRXY7exGHvi1sIx
	uRbe7K3jEEb3gW0+qgITBTnjjkCUtAQn4fwLnNcvioD7PSwExw==
X-Google-Smtp-Source: AGHT+IFfnXzJ6QqROHdB6Xj2zyJPupV82WougEqlSzxhgXZig7gJHVdKVMRD8x6fbMZ56pdGEOlN5hyeMC/53sv3C8s=
X-Received: by 2002:a05:6a21:3416:b0:19b:4a38:5a43 with SMTP id
 yn22-20020a056a21341600b0019b4a385a43mr689217pzb.106.1705426989432; Tue, 16
 Jan 2024 09:43:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org> <20240109125814.3691033-8-tudor.ambarus@linaro.org>
In-Reply-To: <20240109125814.3691033-8-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 11:42:58 -0600
Message-ID: <CAPLW+4=y12fBf47v_HKfBdHTsQJfWo2cwBuFosUKo3xPBqcKJw@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] clk: samsung: gs101: add support for cmu_peric0
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	gregkh@linuxfoundation.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, 
	alim.akhtar@samsung.com, jirislaby@kernel.org, s.nawrocki@samsung.com, 
	tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 7:00=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> CMU_PERIC0 is the clock management unit used for the peric0 block which
> is used for USI and I3C. Add support for all cmu_peric0 clocks but
> CLK_GOUT_PERIC0_IP (not enough info in the datasheet).
>
> Few clocks are marked as critical because when either of them is
> disabled, the system hangs even if their clock parents are enabled.
>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> v3:
> - comply with the renamed cmu_peric0 clock name: "bus"
> - collect Peter's R-b tag
> v2:
> - update commit message
> - identify and mark critical clocks
>
>  drivers/clk/samsung/clk-gs101.c | 583 ++++++++++++++++++++++++++++++++
>  1 file changed, 583 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs=
101.c
> index 782993951fff..f3f0f5feb28d 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -20,6 +20,7 @@
>  #define CLKS_NR_TOP    (CLK_GOUT_CMU_TPU_UART + 1)
>  #define CLKS_NR_APM    (CLK_APM_PLL_DIV16_APM + 1)
>  #define CLKS_NR_MISC   (CLK_GOUT_MISC_XIU_D_MISC_ACLK + 1)
> +#define CLKS_NR_PERIC0 (CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
>
>  /* ---- CMU_TOP --------------------------------------------------------=
----- */
>
> @@ -2478,6 +2479,585 @@ static const struct samsung_cmu_info misc_cmu_inf=
o __initconst =3D {
>         .clk_name               =3D "bus",
>  };
>
> +/* ---- CMU_PERIC0 -----------------------------------------------------=
----- */
> +
> +/* Register Offset definitions for CMU_PERIC0 (0x10800000) */
> +#define PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER            0x0600
> +#define PLL_CON1_MUX_CLKCMU_PERIC0_BUS_USER            0x0604
> +#define PLL_CON0_MUX_CLKCMU_PERIC0_I3C_USER            0x0610
> +#define PLL_CON1_MUX_CLKCMU_PERIC0_I3C_USER            0x0614
> +#define PLL_CON0_MUX_CLKCMU_PERIC0_USI0_UART_USER      0x0620
> +#define PLL_CON1_MUX_CLKCMU_PERIC0_USI0_UART_USER      0x0624
> +#define PLL_CON0_MUX_CLKCMU_PERIC0_USI14_USI_USER      0x0640
> +#define PLL_CON1_MUX_CLKCMU_PERIC0_USI14_USI_USER      0x0644
> +#define PLL_CON0_MUX_CLKCMU_PERIC0_USI1_USI_USER       0x0650
> +#define PLL_CON1_MUX_CLKCMU_PERIC0_USI1_USI_USER       0x0654
> +#define PLL_CON0_MUX_CLKCMU_PERIC0_USI2_USI_USER       0x0660
> +#define PLL_CON1_MUX_CLKCMU_PERIC0_USI2_USI_USER       0x0664
> +#define PLL_CON0_MUX_CLKCMU_PERIC0_USI3_USI_USER       0x0670
> +#define PLL_CON1_MUX_CLKCMU_PERIC0_USI3_USI_USER       0x0674
> +#define PLL_CON0_MUX_CLKCMU_PERIC0_USI4_USI_USER       0x0680
> +#define PLL_CON1_MUX_CLKCMU_PERIC0_USI4_USI_USER       0x0684
> +#define PLL_CON0_MUX_CLKCMU_PERIC0_USI5_USI_USER       0x0690
> +#define PLL_CON1_MUX_CLKCMU_PERIC0_USI5_USI_USER       0x0694
> +#define PLL_CON0_MUX_CLKCMU_PERIC0_USI6_USI_USER       0x06a0
> +#define PLL_CON1_MUX_CLKCMU_PERIC0_USI6_USI_USER       0x06a4
> +#define PLL_CON0_MUX_CLKCMU_PERIC0_USI7_USI_USER       0x06b0
> +#define PLL_CON1_MUX_CLKCMU_PERIC0_USI7_USI_USER       0x06b4
> +#define PLL_CON0_MUX_CLKCMU_PERIC0_USI8_USI_USER       0x06c0
> +#define PLL_CON1_MUX_CLKCMU_PERIC0_USI8_USI_USER       0x06c4
> +#define PERIC0_CMU_PERIC0_CONTROLLER_OPTION            0x0800
> +#define CLKOUT_CON_BLK_PERIC0_CMU_PERIC0_CLKOUT0       0x0810
> +#define CLK_CON_DIV_DIV_CLK_PERIC0_I3C                 0x1800
> +#define CLK_CON_DIV_DIV_CLK_PERIC0_USI0_UART           0x1804
> +#define CLK_CON_DIV_DIV_CLK_PERIC0_USI14_USI           0x180c
> +#define CLK_CON_DIV_DIV_CLK_PERIC0_USI1_USI            0x1810
> +#define CLK_CON_DIV_DIV_CLK_PERIC0_USI2_USI            0x1814
> +#define CLK_CON_DIV_DIV_CLK_PERIC0_USI3_USI            0x1820
> +#define CLK_CON_DIV_DIV_CLK_PERIC0_USI4_USI            0x1824
> +#define CLK_CON_DIV_DIV_CLK_PERIC0_USI5_USI            0x1828
> +#define CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI            0x182c
> +#define CLK_CON_DIV_DIV_CLK_PERIC0_USI7_USI            0x1830
> +#define CLK_CON_DIV_DIV_CLK_PERIC0_USI8_USI            0x1834
> +#define CLK_CON_BUF_CLKBUF_PERIC0_IP                   0x2000
> +#define CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPORT_PCLK =
                       0x2004
> +#define CLK_CON_GAT_CLK_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_OSCCLK_IPCLKP=
ORT_CLK                0x2008
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_D_TZPC_PERIC0_IPCLKPORT_PCLK    =
               0x200c
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPC_PERIC0_IPCLKPORT_PCLK       =
               0x2010
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPIO_PERIC0_IPCLKPORT_PCLK      =
               0x2014
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_LHM_AXI_P_PERIC0_IPCLKPORT_I_CLK=
               0x2018
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_0   =
               0x201c
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_1   =
               0x2020
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_10  =
               0x2024
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_11  =
               0x2028
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_12  =
               0x202c
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_13  =
               0x2030
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_14  =
               0x2034
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_15  =
               0x2038
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_2   =
               0x203c
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_3   =
               0x2040
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4   =
               0x2044
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_5   =
               0x2048
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_6   =
               0x204c
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7   =
               0x2050
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_8   =
               0x2054
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_9   =
               0x2058
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_0    =
               0x205c
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1    =
               0x2060
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10   =
               0x2064
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_11   =
               0x2068
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_12   =
               0x206c
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_13   =
               0x2070
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_14   =
               0x2074
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_15   =
               0x2078
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2    =
               0x207c
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_3    =
               0x2080
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4    =
               0x2084
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5    =
               0x2088
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6    =
               0x208c
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7    =
               0x2090
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8    =
               0x2094
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9    =
               0x2098
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_0   =
               0x209c
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_2   =
               0x20a4
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_0    =
               0x20a8
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_2    =
               0x20b0
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_BUSP_IPCLKPO=
RT_CLK         0x20b4
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_I3C_IPCLKPOR=
T_CLK          0x20b8
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI0_UART_IP=
CLKPORT_CLK    0x20bc
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI14_USI_IP=
CLKPORT_CLK    0x20c4
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI1_USI_IPC=
LKPORT_CLK     0x20c8
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI2_USI_IPC=
LKPORT_CLK     0x20cc
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI3_USI_IPC=
LKPORT_CLK     0x20d0
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI4_USI_IPC=
LKPORT_CLK     0x20d4
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI5_USI_IPC=
LKPORT_CLK     0x20d8
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI6_USI_IPC=
LKPORT_CLK     0x20dc
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI7_USI_IPC=
LKPORT_CLK     0x20e0
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI8_USI_IPC=
LKPORT_CLK     0x20e4
> +#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_SYSREG_PERIC0_IPCLKPORT_PCLK    =
               0x20e8
> +#define DMYQCH_CON_PERIC0_TOP0_QCH_S1                  0x3000
> +#define DMYQCH_CON_PERIC0_TOP0_QCH_S2                  0x3004
> +#define DMYQCH_CON_PERIC0_TOP0_QCH_S3                  0x3008
> +#define DMYQCH_CON_PERIC0_TOP0_QCH_S4                  0x300c
> +#define DMYQCH_CON_PERIC0_TOP0_QCH_S5                  0x3010
> +#define DMYQCH_CON_PERIC0_TOP0_QCH_S6                  0x3014
> +#define DMYQCH_CON_PERIC0_TOP0_QCH_S7                  0x3018
> +#define DMYQCH_CON_PERIC0_TOP0_QCH_S8                  0x301c
> +#define PCH_CON_LHM_AXI_P_PERIC0_PCH                   0x3020
> +#define QCH_CON_D_TZPC_PERIC0_QCH                      0x3024
> +#define QCH_CON_GPC_PERIC0_QCH                         0x3028
> +#define QCH_CON_GPIO_PERIC0_QCH                                0x302c
> +#define QCH_CON_LHM_AXI_P_PERIC0_QCH                   0x3030
> +#define QCH_CON_PERIC0_CMU_PERIC0_QCH                  0x3034
> +#define QCH_CON_PERIC0_TOP0_QCH_I3C1                   0x3038
> +#define QCH_CON_PERIC0_TOP0_QCH_I3C2                   0x303c
> +#define QCH_CON_PERIC0_TOP0_QCH_I3C3                   0x3040
> +#define QCH_CON_PERIC0_TOP0_QCH_I3C4                   0x3044
> +#define QCH_CON_PERIC0_TOP0_QCH_I3C5                   0x3048
> +#define QCH_CON_PERIC0_TOP0_QCH_I3C6                   0x304c
> +#define QCH_CON_PERIC0_TOP0_QCH_I3C7                   0x3050
> +#define QCH_CON_PERIC0_TOP0_QCH_I3C8                   0x3054
> +#define QCH_CON_PERIC0_TOP0_QCH_USI1_USI               0x3058
> +#define QCH_CON_PERIC0_TOP0_QCH_USI2_USI               0x305c
> +#define QCH_CON_PERIC0_TOP0_QCH_USI3_USI               0x3060
> +#define QCH_CON_PERIC0_TOP0_QCH_USI4_USI               0x3064
> +#define QCH_CON_PERIC0_TOP0_QCH_USI5_USI               0x3068
> +#define QCH_CON_PERIC0_TOP0_QCH_USI6_USI               0x306c
> +#define QCH_CON_PERIC0_TOP0_QCH_USI7_USI               0x3070
> +#define QCH_CON_PERIC0_TOP0_QCH_USI8_USI               0x3074
> +#define QCH_CON_PERIC0_TOP1_QCH_USI0_UART              0x3078
> +#define QCH_CON_PERIC0_TOP1_QCH_USI14_UART             0x307c
> +#define QCH_CON_SYSREG_PERIC0_QCH                      0x3080
> +#define QUEUE_CTRL_REG_BLK_PERIC0_CMU_PERIC0           0x3c00
> +
> +static const unsigned long peric0_clk_regs[] __initconst =3D {
> +       PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER,
> +       PLL_CON1_MUX_CLKCMU_PERIC0_BUS_USER,
> +       PLL_CON0_MUX_CLKCMU_PERIC0_I3C_USER,
> +       PLL_CON1_MUX_CLKCMU_PERIC0_I3C_USER,
> +       PLL_CON0_MUX_CLKCMU_PERIC0_USI0_UART_USER,
> +       PLL_CON1_MUX_CLKCMU_PERIC0_USI0_UART_USER,
> +       PLL_CON0_MUX_CLKCMU_PERIC0_USI14_USI_USER,
> +       PLL_CON1_MUX_CLKCMU_PERIC0_USI14_USI_USER,
> +       PLL_CON0_MUX_CLKCMU_PERIC0_USI1_USI_USER,
> +       PLL_CON1_MUX_CLKCMU_PERIC0_USI1_USI_USER,
> +       PLL_CON0_MUX_CLKCMU_PERIC0_USI2_USI_USER,
> +       PLL_CON1_MUX_CLKCMU_PERIC0_USI2_USI_USER,
> +       PLL_CON0_MUX_CLKCMU_PERIC0_USI3_USI_USER,
> +       PLL_CON1_MUX_CLKCMU_PERIC0_USI3_USI_USER,
> +       PLL_CON0_MUX_CLKCMU_PERIC0_USI4_USI_USER,
> +       PLL_CON1_MUX_CLKCMU_PERIC0_USI4_USI_USER,
> +       PLL_CON0_MUX_CLKCMU_PERIC0_USI5_USI_USER,
> +       PLL_CON1_MUX_CLKCMU_PERIC0_USI5_USI_USER,
> +       PLL_CON0_MUX_CLKCMU_PERIC0_USI6_USI_USER,
> +       PLL_CON1_MUX_CLKCMU_PERIC0_USI6_USI_USER,
> +       PLL_CON0_MUX_CLKCMU_PERIC0_USI7_USI_USER,
> +       PLL_CON1_MUX_CLKCMU_PERIC0_USI7_USI_USER,
> +       PLL_CON0_MUX_CLKCMU_PERIC0_USI8_USI_USER,
> +       PLL_CON1_MUX_CLKCMU_PERIC0_USI8_USI_USER,
> +       PERIC0_CMU_PERIC0_CONTROLLER_OPTION,
> +       CLKOUT_CON_BLK_PERIC0_CMU_PERIC0_CLKOUT0,
> +       CLK_CON_DIV_DIV_CLK_PERIC0_I3C,
> +       CLK_CON_DIV_DIV_CLK_PERIC0_USI0_UART,
> +       CLK_CON_DIV_DIV_CLK_PERIC0_USI14_USI,
> +       CLK_CON_DIV_DIV_CLK_PERIC0_USI1_USI,
> +       CLK_CON_DIV_DIV_CLK_PERIC0_USI2_USI,
> +       CLK_CON_DIV_DIV_CLK_PERIC0_USI3_USI,
> +       CLK_CON_DIV_DIV_CLK_PERIC0_USI4_USI,
> +       CLK_CON_DIV_DIV_CLK_PERIC0_USI5_USI,
> +       CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI,
> +       CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI,
> +       CLK_CON_DIV_DIV_CLK_PERIC0_USI8_USI,
> +       CLK_CON_BUF_CLKBUF_PERIC0_IP,
> +       CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_CLK_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_OSCCLK_IPCLKPO=
RT_CLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_D_TZPC_PERIC0_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPC_PERIC0_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPIO_PERIC0_IPCLKPORT_PCLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_LHM_AXI_P_PERIC0_IPCLKPORT_I_CLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_0,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_1,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_10,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_11,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_12,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_13,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_14,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_15,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_2,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_3,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_5,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_6,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_8,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_9,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_0,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_11,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_12,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_13,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_14,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_15,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_3,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_0,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_2,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_0,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_2,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_BUSP_IPCLKPOR=
T_CLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_I3C_IPCLKPORT=
_CLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI0_UART_IPC=
LKPORT_CLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI14_USI_IPC=
LKPORT_CLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI1_USI_IPCL=
KPORT_CLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI2_USI_IPCL=
KPORT_CLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI3_USI_IPCL=
KPORT_CLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI4_USI_IPCL=
KPORT_CLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI5_USI_IPCL=
KPORT_CLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI6_USI_IPCL=
KPORT_CLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI7_USI_IPCL=
KPORT_CLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI8_USI_IPCL=
KPORT_CLK,
> +       CLK_CON_GAT_GOUT_BLK_PERIC0_UID_SYSREG_PERIC0_IPCLKPORT_PCLK,
> +       DMYQCH_CON_PERIC0_TOP0_QCH_S1,
> +       DMYQCH_CON_PERIC0_TOP0_QCH_S2,
> +       DMYQCH_CON_PERIC0_TOP0_QCH_S3,
> +       DMYQCH_CON_PERIC0_TOP0_QCH_S4,
> +       DMYQCH_CON_PERIC0_TOP0_QCH_S5,
> +       DMYQCH_CON_PERIC0_TOP0_QCH_S6,
> +       DMYQCH_CON_PERIC0_TOP0_QCH_S7,
> +       DMYQCH_CON_PERIC0_TOP0_QCH_S8,
> +       PCH_CON_LHM_AXI_P_PERIC0_PCH,
> +       QCH_CON_D_TZPC_PERIC0_QCH,
> +       QCH_CON_GPC_PERIC0_QCH,
> +       QCH_CON_GPIO_PERIC0_QCH,
> +       QCH_CON_LHM_AXI_P_PERIC0_QCH,
> +       QCH_CON_PERIC0_CMU_PERIC0_QCH,
> +       QCH_CON_PERIC0_TOP0_QCH_I3C1,
> +       QCH_CON_PERIC0_TOP0_QCH_I3C2,
> +       QCH_CON_PERIC0_TOP0_QCH_I3C3,
> +       QCH_CON_PERIC0_TOP0_QCH_I3C4,
> +       QCH_CON_PERIC0_TOP0_QCH_I3C5,
> +       QCH_CON_PERIC0_TOP0_QCH_I3C6,
> +       QCH_CON_PERIC0_TOP0_QCH_I3C7,
> +       QCH_CON_PERIC0_TOP0_QCH_I3C8,
> +       QCH_CON_PERIC0_TOP0_QCH_USI1_USI,
> +       QCH_CON_PERIC0_TOP0_QCH_USI2_USI,
> +       QCH_CON_PERIC0_TOP0_QCH_USI3_USI,
> +       QCH_CON_PERIC0_TOP0_QCH_USI4_USI,
> +       QCH_CON_PERIC0_TOP0_QCH_USI5_USI,
> +       QCH_CON_PERIC0_TOP0_QCH_USI6_USI,
> +       QCH_CON_PERIC0_TOP0_QCH_USI7_USI,
> +       QCH_CON_PERIC0_TOP0_QCH_USI8_USI,
> +       QCH_CON_PERIC0_TOP1_QCH_USI0_UART,
> +       QCH_CON_PERIC0_TOP1_QCH_USI14_UART,
> +       QCH_CON_SYSREG_PERIC0_QCH,
> +       QUEUE_CTRL_REG_BLK_PERIC0_CMU_PERIC0,
> +};
> +
> +/* List of parent clocks for Muxes in CMU_PERIC0 */
> +PNAME(mout_peric0_bus_user_p)          =3D { "oscclk", "dout_cmu_peric0_=
bus" };
> +PNAME(mout_peric0_i3c_user_p)          =3D { "oscclk", "dout_cmu_peric0_=
ip" };
> +PNAME(mout_peric0_usi0_uart_user_p)    =3D { "oscclk", "dout_cmu_peric0_=
ip" };
> +PNAME(mout_peric0_usi_usi_user_p)      =3D { "oscclk", "dout_cmu_peric0_=
ip" };
> +
> +static const struct samsung_mux_clock peric0_mux_clks[] __initconst =3D =
{
> +       MUX(CLK_MOUT_PERIC0_BUS_USER, "mout_peric0_bus_user",
> +           mout_peric0_bus_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER, =
4, 1),
> +       MUX(CLK_MOUT_PERIC0_I3C_USER, "mout_peric0_i3c_user",
> +           mout_peric0_i3c_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_I3C_USER, =
4, 1),
> +       MUX(CLK_MOUT_PERIC0_USI0_UART_USER,
> +           "mout_peric0_usi0_uart_user", mout_peric0_usi0_uart_user_p,
> +           PLL_CON0_MUX_CLKCMU_PERIC0_USI0_UART_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIC0_USI14_USI_USER,
> +           "mout_peric0_usi14_usi_user", mout_peric0_usi_usi_user_p,
> +           PLL_CON0_MUX_CLKCMU_PERIC0_USI14_USI_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIC0_USI1_USI_USER,
> +           "mout_peric0_usi1_usi_user", mout_peric0_usi_usi_user_p,
> +           PLL_CON0_MUX_CLKCMU_PERIC0_USI1_USI_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIC0_USI2_USI_USER,
> +           "mout_peric0_usi2_usi_user", mout_peric0_usi_usi_user_p,
> +           PLL_CON0_MUX_CLKCMU_PERIC0_USI2_USI_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIC0_USI3_USI_USER,
> +           "mout_peric0_usi3_usi_user", mout_peric0_usi_usi_user_p,
> +           PLL_CON0_MUX_CLKCMU_PERIC0_USI3_USI_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIC0_USI4_USI_USER,
> +           "mout_peric0_usi4_usi_user", mout_peric0_usi_usi_user_p,
> +           PLL_CON0_MUX_CLKCMU_PERIC0_USI4_USI_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIC0_USI5_USI_USER,
> +           "mout_peric0_usi5_usi_user", mout_peric0_usi_usi_user_p,
> +           PLL_CON0_MUX_CLKCMU_PERIC0_USI5_USI_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIC0_USI6_USI_USER,
> +           "mout_peric0_usi6_usi_user", mout_peric0_usi_usi_user_p,
> +           PLL_CON0_MUX_CLKCMU_PERIC0_USI6_USI_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIC0_USI7_USI_USER,
> +           "mout_peric0_usi7_usi_user", mout_peric0_usi_usi_user_p,
> +           PLL_CON0_MUX_CLKCMU_PERIC0_USI7_USI_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIC0_USI8_USI_USER,
> +           "mout_peric0_usi8_usi_user", mout_peric0_usi_usi_user_p,
> +           PLL_CON0_MUX_CLKCMU_PERIC0_USI8_USI_USER, 4, 1),
> +};
> +
> +static const struct samsung_div_clock peric0_div_clks[] __initconst =3D =
{
> +       DIV(CLK_DOUT_PERIC0_I3C, "dout_peric0_i3c", "mout_peric0_i3c_user=
",
> +           CLK_CON_DIV_DIV_CLK_PERIC0_I3C, 0, 3),
> +       DIV(CLK_DOUT_PERIC0_USI0_UART,
> +           "dout_peric0_usi0_uart", "mout_peric0_usi0_uart_user",
> +           CLK_CON_DIV_DIV_CLK_PERIC0_USI0_UART, 0, 3),
> +       DIV(CLK_DOUT_PERIC0_USI14_USI,
> +           "dout_peric0_usi14_usi", "mout_peric0_usi14_usi_user",
> +           CLK_CON_DIV_DIV_CLK_PERIC0_USI14_USI, 0, 3),
> +       DIV(CLK_DOUT_PERIC0_USI1_USI,
> +           "dout_peric0_usi1_usi", "mout_peric0_usi1_usi_user",
> +           CLK_CON_DIV_DIV_CLK_PERIC0_USI1_USI, 0, 3),
> +       DIV(CLK_DOUT_PERIC0_USI2_USI,
> +           "dout_peric0_usi2_usi", "mout_peric0_usi2_usi_user",
> +           CLK_CON_DIV_DIV_CLK_PERIC0_USI2_USI, 0, 3),
> +       DIV(CLK_DOUT_PERIC0_USI3_USI,
> +           "dout_peric0_usi3_usi", "mout_peric0_usi3_usi_user",
> +           CLK_CON_DIV_DIV_CLK_PERIC0_USI3_USI, 0, 3),
> +       DIV(CLK_DOUT_PERIC0_USI4_USI,
> +           "dout_peric0_usi4_usi", "mout_peric0_usi4_usi_user",
> +           CLK_CON_DIV_DIV_CLK_PERIC0_USI4_USI, 0, 3),
> +       DIV(CLK_DOUT_PERIC0_USI5_USI,
> +           "dout_peric0_usi5_usi", "mout_peric0_usi5_usi_user",
> +           CLK_CON_DIV_DIV_CLK_PERIC0_USI5_USI, 0, 3),
> +       DIV(CLK_DOUT_PERIC0_USI6_USI,
> +           "dout_peric0_usi6_usi", "mout_peric0_usi6_usi_user",
> +           CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI, 0, 3),
> +       DIV(CLK_DOUT_PERIC0_USI7_USI,
> +           "dout_peric0_usi7_usi", "mout_peric0_usi7_usi_user",
> +           CLK_CON_DIV_DIV_CLK_PERIC0_USI7_USI, 0, 3),
> +       DIV(CLK_DOUT_PERIC0_USI8_USI,
> +           "dout_peric0_usi8_usi", "mout_peric0_usi8_usi_user",
> +           CLK_CON_DIV_DIV_CLK_PERIC0_USI8_USI, 0, 3),
> +};
> +
> +static const struct samsung_gate_clock peric0_gate_clks[] __initconst =
=3D {
> +       /* Disabling this clock makes the system hang. Mark the clock as =
critical. */
> +       GATE(CLK_GOUT_PERIC0_PERIC0_CMU_PERIC0_PCLK,
> +            "gout_peric0_peric0_cmu_peric0_pclk", "mout_peric0_bus_user"=
,
> +            CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPORT_P=
CLK,
> +            21, CLK_IS_CRITICAL, 0),

Why not just CLK_IGNORE_UNUSED? As I understand this gate clock can be
used to disable PCLK (bus clock) provided to the whole CMU_PERIC0.
Aren't there any valid cases for disabling this clock, like during
some PM transitions? For Exynos850 clock driver I marked all clocks of
this kind as CLK_IGNORE_UNUSED and it works fine. In other words: I'd
say CLK_IS_CRITICAL flag is more "strong" than CLK_IGNORE_UNUSED, and
requires better and more specific explanation, to make sure we are not
abusing it. And I'm not sure this is the case.

The same goes for the rest of clocks marked as CLK_IS_CRITICAL in this
patch. Please check if maybe using CLK_IGNORE_UNUSED makes sense for
any of those as well.

> +       GATE(CLK_GOUT_PERIC0_CLK_PERIC0_OSCCLK_CLK,
> +            "gout_peric0_clk_peric0_oscclk_clk", "oscclk",
> +            CLK_CON_GAT_CLK_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_OSCCLK_IP=
CLKPORT_CLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_D_TZPC_PERIC0_PCLK,
> +            "gout_peric0_d_tzpc_peric0_pclk", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_D_TZPC_PERIC0_IPCLKPORT_PCLK=
,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_GPC_PERIC0_PCLK,
> +            "gout_peric0_gpc_peric0_pclk", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPC_PERIC0_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_GPIO_PERIC0_PCLK,
> +            "gout_peric0_gpio_peric0_pclk", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_GPIO_PERIC0_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       /* Disabling this clock makes the system hang. Mark the clock as =
critical. */
> +       GATE(CLK_GOUT_PERIC0_LHM_AXI_P_PERIC0_I_CLK,
> +            "gout_peric0_lhm_axi_p_peric0_i_clk", "mout_peric0_bus_user"=
,
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_LHM_AXI_P_PERIC0_IPCLKPORT_I=
_CLK,
> +            21, CLK_IS_CRITICAL, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_0,
> +            "gout_peric0_peric0_top0_ipclk_0", "dout_peric0_usi1_usi",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
0,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_1,
> +            "gout_peric0_peric0_top0_ipclk_1", "dout_peric0_usi2_usi",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
1,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_10,
> +            "gout_peric0_peric0_top0_ipclk_10", "dout_peric0_i3c",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
10,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_11,
> +            "gout_peric0_peric0_top0_ipclk_11", "dout_peric0_i3c",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
11,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_12,
> +            "gout_peric0_peric0_top0_ipclk_12", "dout_peric0_i3c",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
12,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_13,
> +            "gout_peric0_peric0_top0_ipclk_13", "dout_peric0_i3c",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
13,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_14,
> +            "gout_peric0_peric0_top0_ipclk_14", "dout_peric0_i3c",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
14,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_15,
> +            "gout_peric0_peric0_top0_ipclk_15", "dout_peric0_i3c",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
15,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_2,
> +            "gout_peric0_peric0_top0_ipclk_2", "dout_peric0_usi3_usi",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
2,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_3,
> +            "gout_peric0_peric0_top0_ipclk_3", "dout_peric0_usi4_usi",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
3,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_4,
> +            "gout_peric0_peric0_top0_ipclk_4", "dout_peric0_usi5_usi",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
4,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_5,
> +            "gout_peric0_peric0_top0_ipclk_5", "dout_peric0_usi6_usi",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
5,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_6,
> +            "gout_peric0_peric0_top0_ipclk_6", "dout_peric0_usi7_usi",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
6,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7,
> +            "gout_peric0_peric0_top0_ipclk_7", "dout_peric0_usi8_usi",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
7,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_8,
> +            "gout_peric0_peric0_top0_ipclk_8", "dout_peric0_i3c",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
8,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_9,
> +            "gout_peric0_peric0_top0_ipclk_9", "dout_peric0_i3c",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_=
9,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_0,
> +            "gout_peric0_peric0_top0_pclk_0", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_0=
,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_1,
> +            "gout_peric0_peric0_top0_pclk_1", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1=
,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_10,
> +            "gout_peric0_peric0_top0_pclk_10", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1=
0,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_11,
> +            "gout_peric0_peric0_top0_pclk_11", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1=
1,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_12,
> +            "gout_peric0_peric0_top0_pclk_12", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1=
2,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_13,
> +            "gout_peric0_peric0_top0_pclk_13", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1=
3,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_14,
> +            "gout_peric0_peric0_top0_pclk_14", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1=
4,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_15,
> +            "gout_peric0_peric0_top0_pclk_15", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1=
5,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_2,
> +            "gout_peric0_peric0_top0_pclk_2", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2=
,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_3,
> +            "gout_peric0_peric0_top0_pclk_3", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_3=
,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_4,
> +            "gout_peric0_peric0_top0_pclk_4", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4=
,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_5,
> +            "gout_peric0_peric0_top0_pclk_5", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5=
,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_6,
> +            "gout_peric0_peric0_top0_pclk_6", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6=
,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_7,
> +            "gout_peric0_peric0_top0_pclk_7", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7=
,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_8,
> +            "gout_peric0_peric0_top0_pclk_8", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8=
,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_9,
> +            "gout_peric0_peric0_top0_pclk_9", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9=
,
> +            21, 0, 0),
> +       /* Disabling this clock makes the system hang. Mark the clock as =
critical. */
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0,
> +            "gout_peric0_peric0_top1_ipclk_0", "dout_peric0_usi0_uart",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_=
0,
> +            21, CLK_IS_CRITICAL, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2,
> +            "gout_peric0_peric0_top1_ipclk_2", "dout_peric0_usi14_usi",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_IPCLK_=
2,
> +            21, 0, 0),
> +       /* Disabling this clock makes the system hang. Mark the clock as =
critical. */
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0,
> +            "gout_peric0_peric0_top1_pclk_0", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_0=
,
> +            21, CLK_IS_CRITICAL, 0),
> +       GATE(CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_2,
> +            "gout_peric0_peric0_top1_pclk_2", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP1_IPCLKPORT_PCLK_2=
,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_CLK_PERIC0_BUSP_CLK,
> +            "gout_peric0_clk_peric0_busp_clk", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_BUSP_IPC=
LKPORT_CLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_CLK_PERIC0_I3C_CLK,
> +            "gout_peric0_clk_peric0_i3c_clk", "dout_peric0_i3c",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_I3C_IPCL=
KPORT_CLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI0_UART_CLK,
> +            "gout_peric0_clk_peric0_usi0_uart_clk", "dout_peric0_usi0_ua=
rt",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI0_UAR=
T_IPCLKPORT_CLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI14_USI_CLK,
> +            "gout_peric0_clk_peric0_usi14_usi_clk", "dout_peric0_usi14_u=
si",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI14_US=
I_IPCLKPORT_CLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI1_USI_CLK,
> +            "gout_peric0_clk_peric0_usi1_usi_clk", "dout_peric0_usi1_usi=
",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI1_USI=
_IPCLKPORT_CLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI2_USI_CLK,
> +            "gout_peric0_clk_peric0_usi2_usi_clk", "dout_peric0_usi2_usi=
",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI2_USI=
_IPCLKPORT_CLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI3_USI_CLK,
> +            "gout_peric0_clk_peric0_usi3_usi_clk", "dout_peric0_usi3_usi=
",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI3_USI=
_IPCLKPORT_CLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI4_USI_CLK,
> +            "gout_peric0_clk_peric0_usi4_usi_clk", "dout_peric0_usi4_usi=
",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI4_USI=
_IPCLKPORT_CLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI5_USI_CLK,
> +            "gout_peric0_clk_peric0_usi5_usi_clk", "dout_peric0_usi5_usi=
",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI5_USI=
_IPCLKPORT_CLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI6_USI_CLK,
> +            "gout_peric0_clk_peric0_usi6_usi_clk", "dout_peric0_usi6_usi=
",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI6_USI=
_IPCLKPORT_CLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI7_USI_CLK,
> +            "gout_peric0_clk_peric0_usi7_usi_clk", "dout_peric0_usi7_usi=
",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI7_USI=
_IPCLKPORT_CLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK,
> +            "gout_peric0_clk_peric0_usi8_usi_clk", "dout_peric0_usi8_usi=
",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI8_USI=
_IPCLKPORT_CLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK,
> +            "gout_peric0_sysreg_peric0_pclk", "mout_peric0_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIC0_UID_SYSREG_PERIC0_IPCLKPORT_PCLK=
,
> +            21, 0, 0),
> +};
> +
> +static const struct samsung_cmu_info peric0_cmu_info __initconst =3D {
> +       .mux_clks               =3D peric0_mux_clks,
> +       .nr_mux_clks            =3D ARRAY_SIZE(peric0_mux_clks),
> +       .div_clks               =3D peric0_div_clks,
> +       .nr_div_clks            =3D ARRAY_SIZE(peric0_div_clks),
> +       .gate_clks              =3D peric0_gate_clks,
> +       .nr_gate_clks           =3D ARRAY_SIZE(peric0_gate_clks),
> +       .nr_clk_ids             =3D CLKS_NR_PERIC0,
> +       .clk_regs               =3D peric0_clk_regs,
> +       .nr_clk_regs            =3D ARRAY_SIZE(peric0_clk_regs),
> +       .clk_name               =3D "bus",
> +};
> +
>  /* ---- platform_driver ------------------------------------------------=
----- */
>
>  static int __init gs101_cmu_probe(struct platform_device *pdev)
> @@ -2498,6 +3078,9 @@ static const struct of_device_id gs101_cmu_of_match=
[] =3D {
>         }, {
>                 .compatible =3D "google,gs101-cmu-misc",
>                 .data =3D &misc_cmu_info,
> +       }, {
> +               .compatible =3D "google,gs101-cmu-peric0",
> +               .data =3D &peric0_cmu_info,
>         }, {
>         },
>  };
> --
> 2.43.0.472.g3155946c3a-goog
>
>

