Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2703222B077
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 15:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgGWN1d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jul 2020 09:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgGWN1c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jul 2020 09:27:32 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46878C0619DC;
        Thu, 23 Jul 2020 06:27:32 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z24so6316584ljn.8;
        Thu, 23 Jul 2020 06:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TSjU4MAQZTytcq970X6CACqxUsskPd5POpk/BhySkyQ=;
        b=J9eiE+maeQbrm7/QgHIZDiWLjYzwVikK3g950e4lUXr5hsdVJu6peObRUrilZsvqqK
         NvgzsfqYhoQSc37S84tl6dsUP5EdV/KBysiHN0TzIEAz0o7eZcnz83/o/5SxtIsWSjiQ
         FUO+5q+itrgwrEoWxEO+O4M5sDLKF27lGy4DgLz7CK2pafw2NbMEFTDWbXDVHS5XC10n
         /wjRQh1jaq1mh0LvL1bLGnNCRNrFCPS9qKmEQkCLBkfJrtvqGouUDxBeqPVo8PH85qwc
         MYlgfoSjb3U6pZcQ+m57+xKcKdGo1+S8s4NyFdYOmkFmedChSSJlmZncIxsi/zJvxfEB
         AJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TSjU4MAQZTytcq970X6CACqxUsskPd5POpk/BhySkyQ=;
        b=kj2DWO7+9A69KaE+P4PrRvz0+fOUE/UzBZQ6eOjCLeAn/3jkxEK95vMDhDcSnzCmyB
         FySsrGuHbK/zRoOlundow1hxel/xoCOI7Z24by+NzErpuxp6A1h7XX2qAL+rO7KvJRj4
         OHy8U5PTWlqz6kjBqPHGp6meKeY3uMKfGuM1DAALruQ6aF54F8bKpPaG3we3U7suoDp3
         GrwPNAZ6ii04AEB9D75Tdgny191D8S8d4FtQ9Z3B8Ta0HgQDdoSxCTm1hCAjiH/d7XW5
         HLZQ7oVdf0n9MswnDyS36ZBkxqy2l5z8wJOpMngLum4oWa2notP1ct83QPGhPg4I2Wfw
         CiTw==
X-Gm-Message-State: AOAM530r3jO0N0UKCl55DwLCc4NeLFej7jysJ1XST4XjmRMfZ8wh1+rp
        oa4UkhTAVImoUortuzA1j+M=
X-Google-Smtp-Source: ABdhPJyo4obRgX1tiqtXnMk4nvoJj79vzcRUD5IKjO7El0+s7mfcMno7p/tUsFSCqYpSbjTNqeF30g==
X-Received: by 2002:a2e:964d:: with SMTP id z13mr1990541ljh.98.1595510850593;
        Thu, 23 Jul 2020 06:27:30 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id c145sm2835986lfd.52.2020.07.23.06.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 06:27:30 -0700 (PDT)
Subject: Re: [PATCH 4/7] i2c: tegra: add high speed mode support
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        linux-i2c@vger.kernel.org, thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldewangan@nvidia.com,
        smohammed@nvidia.com, rgumasta@nvidia.com
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
 <1595506733-10307-4-git-send-email-kyarlagadda@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f0d23b7c-e371-4d44-99b1-cb66e3735e5a@gmail.com>
Date:   Thu, 23 Jul 2020 16:27:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595506733-10307-4-git-send-email-kyarlagadda@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

23.07.2020 15:18, Krishna Yarlagadda пишет:
> From: Shardar Shariff Md <smohammed@nvidia.com>
> 
> Add high speed mode support
> 
> Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 64 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 56 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index bdbbca0..2f654ed 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -85,12 +85,14 @@
>  #define PACKET_HEADER0_PROTOCOL_I2C		1
>  #define PACKET_HEADER0_CONT_ID_MASK		0xF
>  
> +#define I2C_HEADER_HIGHSPEED_MODE		BIT(22)
>  #define I2C_HEADER_CONT_ON_NAK			BIT(21)
>  #define I2C_HEADER_READ				BIT(19)
>  #define I2C_HEADER_10BIT_ADDR			BIT(18)
>  #define I2C_HEADER_IE_ENABLE			BIT(17)
>  #define I2C_HEADER_REPEAT_START			BIT(16)
>  #define I2C_HEADER_CONTINUE_XFER		BIT(15)
> +#define I2C_HEADER_MASTER_ADDR_SHIFT		12
>  #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
>  
>  #define I2C_BUS_CLEAR_CNFG			0x084
> @@ -136,6 +138,7 @@
>  
>  /* configuration load timeout in microseconds */
>  #define I2C_CONFIG_LOAD_TIMEOUT			1000000
> +#define I2C_HS_MODE				3500000

The I2C_MAX_HIGH_SPEED_MODE_FREQ is 3400000, what is 3500000 then?

https://elixir.bootlin.com/linux/v5.8-rc4/source/include/linux/i2c.h#L42

>  /* Packet header size in bytes */
>  #define I2C_PACKET_HEADER_SIZE			12
> @@ -215,12 +218,14 @@ struct tegra_i2c_hw_feature {
>  	int clk_divisor_std_mode;
>  	int clk_divisor_fast_mode;
>  	u16 clk_divisor_fast_plus_mode;
> +	int clk_multiplier_hs_mode;
>  	bool has_multi_master_mode;
>  	bool has_slcg_override_reg;
>  	bool has_mst_fifo;
>  	const struct i2c_adapter_quirks *quirks;
>  	bool supports_bus_clear;
>  	bool has_reg_write_buffering;
> +	bool has_hs_mode_support;
>  	bool has_apb_dma;
>  	u8 tlow_std_mode;
>  	u8 thigh_std_mode;
> @@ -293,6 +298,7 @@ struct tegra_i2c_dev {
>  	bool is_curr_dma_xfer;
>  	struct completion dma_complete;
>  	bool is_curr_atomic_xfer;
> +	int clk_divisor_hs_mode;
>  };
>  
>  static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
> @@ -778,8 +784,9 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
>  	if (i2c_dev->is_dvc)
>  		tegra_dvc_init(i2c_dev);
>  
> -	val = I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN |
> -	      FIELD_PREP(I2C_CNFG_DEBOUNCE_CNT, 2);
> +	val = I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN;
> +	if (i2c_dev->bus_clk_rate != I2C_HS_MODE)
> +		val |= FIELD_PREP(I2C_CNFG_DEBOUNCE_CNT, 0x2);
>  
>  	if (i2c_dev->hw->has_multi_master_mode)
>  		val |= I2C_CNFG_MULTI_MASTER_MODE;
> @@ -791,6 +798,13 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
>  		tegra_i2c_vi_init(i2c_dev);
>  
>  	/* Make sure clock divisor programmed correctly */
> +	if (i2c_dev->bus_clk_rate == I2C_HS_MODE) {
> +		i2c_dev->clk_divisor_hs_mode = i2c_dev->hw->clk_divisor_hs_mode;
> +	} else {
> +		val = i2c_readl(i2c_dev, I2C_CLK_DIVISOR);
> +		i2c_dev->clk_divisor_hs_mode = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE, val);

FIELD_PREP?

clk_divisor_hs_mode should be a local variable and I don't think its
value needs to be read out from hardware.

> +	}
> +
>  	clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
>  				 i2c_dev->hw->clk_divisor_hs_mode) |
>  		      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE,
> @@ -822,8 +836,13 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
>  		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
>  
>  	if (!clk_reinit) {
> -		clk_multiplier = (tlow + thigh + 2);
> -		clk_multiplier *= (i2c_dev->clk_divisor_non_hs_mode + 1);
> +		if (i2c_dev->bus_clk_rate == I2C_HS_MODE) {
> +			clk_multiplier = i2c_dev->hw->clk_multiplier_hs_mode;
> +			clk_multiplier *= (i2c_dev->clk_divisor_hs_mode + 1);

Actually, clk_divisor_hs_mode variable shouldn't be needed at all, use
hw->clk_divisor_hs_mode directly.

> +		} else {
> +			clk_multiplier = (tlow + thigh + 2);
> +			clk_multiplier *= (i2c_dev->clk_divisor_non_hs_mode + 1);
> +		}
>  		err = clk_set_rate(i2c_dev->div_clk,
>  				   i2c_dev->bus_clk_rate * clk_multiplier);
>  		if (err) {
> @@ -1244,6 +1263,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  		packet_header |= I2C_HEADER_CONT_ON_NAK;
>  	if (msg->flags & I2C_M_RD)
>  		packet_header |= I2C_HEADER_READ;
> +	if (i2c_dev->bus_clk_rate == I2C_HS_MODE)
> +		packet_header |= I2C_HEADER_HIGHSPEED_MODE;
>  	if (dma && !i2c_dev->msg_read)
>  		*buffer++ = packet_header;
>  	else
> @@ -1448,6 +1469,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
>  	.clk_divisor_std_mode = 0,
>  	.clk_divisor_fast_mode = 0,
>  	.clk_divisor_fast_plus_mode = 0,
> +	.clk_multiplier_hs_mode = 12,
>  	.has_config_load_reg = false,
>  	.has_multi_master_mode = false,
>  	.has_slcg_override_reg = false,
> @@ -1455,6 +1477,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
>  	.quirks = &tegra_i2c_quirks,
>  	.supports_bus_clear = false,
>  	.has_reg_write_buffering = true,
> +	.has_hs_mode_support = false,
>  	.has_apb_dma = true,
>  	.tlow_std_mode = 0x4,
>  	.thigh_std_mode = 0x2,
> @@ -1474,6 +1497,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
>  	.clk_divisor_std_mode = 0,
>  	.clk_divisor_fast_mode = 0,
>  	.clk_divisor_fast_plus_mode = 0,
> +	.clk_multiplier_hs_mode = 12,
>  	.has_config_load_reg = false,
>  	.has_multi_master_mode = false,
>  	.has_slcg_override_reg = false,
> @@ -1481,6 +1505,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
>  	.quirks = &tegra_i2c_quirks,
>  	.supports_bus_clear = false,
>  	.has_reg_write_buffering = true,
> +	.has_hs_mode_support = false,
>  	.has_apb_dma = true,
>  	.tlow_std_mode = 0x4,
>  	.thigh_std_mode = 0x2,
> @@ -1500,6 +1525,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
>  	.clk_divisor_std_mode = 0x19,
>  	.clk_divisor_fast_mode = 0x19,
>  	.clk_divisor_fast_plus_mode = 0x10,
> +	.clk_multiplier_hs_mode = 3,

3?

>  	.has_config_load_reg = false,
>  	.has_multi_master_mode = false,
>  	.has_slcg_override_reg = false,
> @@ -1507,6 +1533,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
>  	.quirks = &tegra_i2c_quirks,
>  	.supports_bus_clear = true,
>  	.has_reg_write_buffering = true,
> +	.has_hs_mode_support = false,
>  	.has_apb_dma = true,
>  	.tlow_std_mode = 0x4,
>  	.thigh_std_mode = 0x2,
> @@ -1522,10 +1549,11 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
>  	.has_continue_xfer_support = true,
>  	.has_per_pkt_xfer_complete_irq = true,
>  	.has_single_clk_source = true,
> -	.clk_divisor_hs_mode = 1,
> +	.clk_divisor_hs_mode = 2,

Why are you changing this?


...
> +	if (i2c_dev->bus_clk_rate == I2C_HS_MODE &&
> +	    !i2c_dev->hw->has_hs_mode_support) {
> +		dev_info(i2c_dev->dev, "HS mode not supported\n");
> +		i2c_dev->bus_clk_rate = 100000; /* default clock rate */

 I2C_MAX_STANDARD_MODE_FREQ
