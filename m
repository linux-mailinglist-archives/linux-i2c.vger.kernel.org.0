Return-Path: <linux-i2c+bounces-11365-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E150CAD64CF
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 02:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF6B8189B3FD
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 00:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2029B5CDF1;
	Thu, 12 Jun 2025 00:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqEKGNLk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30D444C77;
	Thu, 12 Jun 2025 00:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749689861; cv=none; b=bBfrxXp5vCB0WkLXt6lCmOCdcnuMmsTHme+zRiZPW9m8vcdsqFdlKmz0aBtmMll5F6i0LCxGzHxWjkYiL4wT6JUjCkKgrFkG7PYQhzqgPIKQT50ziY0YzFGsirKTIC2LQu8Fs5yuEi2glMlvrV3GmZDgSI6F4oEAdjeFEthvfho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749689861; c=relaxed/simple;
	bh=+pBOia5bLDm5o6g/thWQR//IYb1Ob0VFiM5/8EF7+gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkspoDWaM9p3rOKduhM6DgURzQPBUmMejTXkp8qbjKtL804PaX8Jog0lzc+Z9DXY/VDAyCXLQWUmLWgHxzYdv92K2O7RYtydmp9MVeY23BjUdR0iv6Kwv539C0VPvNRd5KDe5kWMoGNAGBiv3cXtynwAz2AM8mXd3YbKaeTrhgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqEKGNLk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE09C4CEE3;
	Thu, 12 Jun 2025 00:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749689861;
	bh=+pBOia5bLDm5o6g/thWQR//IYb1Ob0VFiM5/8EF7+gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DqEKGNLktAmnG45+h3EpK+23slsoAVvPBtfnALmZgWa0kcCUwb69mKpmnfnJ38Bza
	 +bRW4x5cC+SD8hO05vORvex1GsbnYTZ0SIvYnnmCNO5rMNVI/ZgiF42ahXAqTndPxP
	 UlzqKfGFVgEGs47YlWfuYtRLZeR+xynlTIK/s/+zy1W4Hi5QOf5nhfa5n9zLRPPMj0
	 rr0Wba1LtsrDVW1u8UsuIAr6Efw3/3g2TLP5iiTeSyFEA3YnV9hUPkV6qmaQIKuZoN
	 lNZX82OIbqvwRrWb9tReCVq6VCy2ltkqx3zotVDKfRz7Rc1itygAqBHvNPslV/yx5C
	 048MpIQ7bY46Q==
Date: Thu, 12 Jun 2025 02:57:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com, digetx@gmail.com, 
	p.zabel@pengutronix.de, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 2/3] i2c: tegra: make reset an optional property
Message-ID: <7sncphuidgiz6orsocixgybm2npcsjrdm7gnl3e52vfms2polu@4mmhdtc4zg5x>
References: <20250603153022.39434-1-akhilrajeev@nvidia.com>
 <20250603153022.39434-2-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603153022.39434-2-akhilrajeev@nvidia.com>

Hi Andy,

...

> @@ -184,6 +186,9 @@ enum msg_end_type {
>   * @has_mst_fifo: The I2C controller contains the new MST FIFO interface that
>   *		provides additional features and allows for longer messages to
>   *		be transferred in one go.
> + * @has_mst_reset: The I2C controller contains MASTER_RESET_CTRL register which
> + *		provides an alternative to controller reset when configured as
> + *		I2C master
>   * @quirks: I2C adapter quirks for limiting write/read transfer size and not
>   *		allowing 0 length transfers.
>   * @supports_bus_clear: Bus Clear support to recover from bus hang during
> @@ -213,6 +218,7 @@ struct tegra_i2c_hw_feature {
>  	bool has_multi_master_mode;
>  	bool has_slcg_override_reg;
>  	bool has_mst_fifo;
> +	bool has_mst_reset;
>  	const struct i2c_adapter_quirks *quirks;
>  	bool supports_bus_clear;
>  	bool has_apb_dma;
> @@ -604,6 +610,20 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
>  	return 0;
>  }
>  
> +static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
> +{
> +	if (!i2c_dev->hw->has_mst_reset)
> +		return -EOPNOTSUPP;
> +
> +	i2c_writel(i2c_dev, 0x1, I2C_MASTER_RESET_CNTRL);
> +	udelay(2);
> +
> +	i2c_writel(i2c_dev, 0x0, I2C_MASTER_RESET_CNTRL);
> +	udelay(2);
> +
> +	return 0;
> +}
> +
>  static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>  {
>  	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
> @@ -621,8 +641,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>  	 */
>  	if (handle)
>  		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
> -	else
> +	else if (i2c_dev->rst)
>  		err = reset_control_reset(i2c_dev->rst);
> +	else
> +		err = tegra_i2c_master_reset(i2c_dev);

Can you please take a look here? Should the reset happen in ACPI?

Thanks,
Andi

