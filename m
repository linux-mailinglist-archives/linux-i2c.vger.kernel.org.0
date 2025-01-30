Return-Path: <linux-i2c+bounces-9238-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA87A23190
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 17:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A3003A496F
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 16:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD951EBFE3;
	Thu, 30 Jan 2025 16:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4zLAEby"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBC51DA5F;
	Thu, 30 Jan 2025 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738253575; cv=none; b=ewBeEDaM2Lcxb8QItKLDKvTn7p2EwNyzCSThY6aKlBV1JAHeD7Z+FILOprX2bAeoMZBcYB4mqNUlJlDtIbAQWNfluhwLaGxiNBlHZPGKJtOqeaLNVLPOsEtRIDoVtQOO3BqhHBEEkICGRo4W1Pbyl9v2lm4GCAJNeUJtqL4gyAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738253575; c=relaxed/simple;
	bh=B0WiyP8kxOBx9oHNPc/Vy+XK0t+Gnb5cVEaSaHNC+IY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YA938I7aG890FNzgLjv7ufaWDvDqhnOAQkmoz3KJWKIPkvcLNTrY6s8vYSDoBGgqo1NmsBW5Saxv8iFrYEy0uFYG/YQ5nV52rR084V1tx0Y3kFir4rDMwM7o4Sc8gmFBZ8sc/ivJDbROMoH4q2oKojCXMi38YZoYqGDVAGjdvOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4zLAEby; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28336C4CEE0;
	Thu, 30 Jan 2025 16:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738253575;
	bh=B0WiyP8kxOBx9oHNPc/Vy+XK0t+Gnb5cVEaSaHNC+IY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=B4zLAEbyaXFQ1A7gMx0FuLfBziPwEhReXIdTy6jtSQxG3Qw2dMzivdoBEdJKf8avM
	 j+rSC1EvyRye4HdGOMgbYN1YmxYiCJZdvjveYk62oU748su8ncXGLjeTim5a7aXa7j
	 oZFlQyPGujRZqkn2cy+BjlSzgaTrY0sg7o61d2IhrTOfbqvgy23SZMutw4cJEYUjaw
	 2PjAfjSIPyWyAzGq+URH46wx1vfz6QJ2RhHaUO8ONHJfFT2qJ3cjEunGZmw2CMqCUk
	 U8y/ho6GWuaC0KLWACPgcT5+mU6vw0mN6fJXhMhFPdfwrQe63o2qcB/QNZ/+U6XpKh
	 V//HFpXVlZ0wA==
Message-ID: <febb1225-3c14-4377-90e0-4d4aee307ede@kernel.org>
Date: Thu, 30 Jan 2025 17:12:48 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] i2c: tegra: Add support for SW mutex register
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 ldewangan@nvidia.com, digetx@gmail.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250130143424.52389-1-kkartik@nvidia.com>
 <20250130143424.52389-5-kkartik@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250130143424.52389-5-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/01/2025 15:34, Kartik Rajput wrote:
> From: Akhil R <akhilrajeev@nvidia.com>
> 
> Add support for SW mutex register introduced in Tegra264 to provide
> an option to share the interface between multiple firmwares and/or
> VMs.
> 
> However, the hardware does not ensure any protection based on the
> values. The driver/firmware should honor the peer who already holds
> the mutex.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v1 -> v2:
> 	* Fixed typos.
> 	* Fix tegra_i2c_mutex_lock() logic.
> 	* Add a timeout in tegra_i2c_mutex_lock() instead of polling for
> 	  mutex indefinitely.
> ---
>  drivers/i2c/busses/i2c-tegra.c | 132 +++++++++++++++++++++++++++++----
>  1 file changed, 117 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 7c8b76406e2e..aa92faa6f5cb 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -135,6 +135,14 @@
>  #define I2C_MST_FIFO_STATUS_TX			GENMASK(23, 16)
>  #define I2C_MST_FIFO_STATUS_RX			GENMASK(7, 0)
>  
> +#define I2C_SW_MUTEX				0x0ec
> +#define I2C_SW_MUTEX_REQUEST			GENMASK(3, 0)
> +#define I2C_SW_MUTEX_GRANT			GENMASK(7, 4)
> +#define I2C_SW_MUTEX_ID				9
> +
> +/* SW mutex acquire timeout value in milliseconds. */
> +#define I2C_SW_MUTEX_TIMEOUT			25
> +
>  /* configuration load timeout in microseconds */
>  #define I2C_CONFIG_LOAD_TIMEOUT			1000000
>  
> @@ -203,6 +211,7 @@ enum msg_end_type {
>   * @has_interface_timing_reg: Has interface timing register to program the tuned
>   *		timing settings.
>   * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
> + * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VM.
>   */
>  struct tegra_i2c_hw_feature {
>  	bool has_continue_xfer_support;
> @@ -229,6 +238,7 @@ struct tegra_i2c_hw_feature {
>  	u32 setup_hold_time_hs_mode;
>  	bool has_interface_timing_reg;
>  	bool has_hs_mode_support;
> +	bool has_mutex;
>  };
>  
>  /**
> @@ -372,6 +382,103 @@ static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
>  	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>  }
>  
> +static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
> +				   u32 reg, u32 mask, u32 delay_us,
> +				   u32 timeout_us)
> +{
> +	void __iomem *addr = i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
> +	u32 val;
> +
> +	if (!i2c_dev->atomic_mode)
> +		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
> +						  delay_us, timeout_us);
> +
> +	return readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
> +						 delay_us, timeout_us);
> +}
> +
> +static int tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	u32 val, id;
> +
> +	val = i2c_readl(i2c_dev, I2C_SW_MUTEX);
> +	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +	if (id != 0 && id != I2C_SW_MUTEX_ID)
> +		return 0;
> +
> +	val = FIELD_PREP(I2C_SW_MUTEX_REQUEST, I2C_SW_MUTEX_ID);
> +	i2c_writel(i2c_dev, val, I2C_SW_MUTEX);

And how do you exactly prevent concurrent, overwriting write? This looks
like pure race.

> +
> +	val = i2c_readl(i2c_dev, I2C_SW_MUTEX);
> +	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +
> +	if (id != I2C_SW_MUTEX_ID)
> +		return 0;
> +
> +	return 1;
> +}
> +
> +static void tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	unsigned int num_retries = I2C_SW_MUTEX_TIMEOUT;
> +
> +	/* Poll until mutex is acquired or timeout. */
> +	while (--num_retries && !tegra_i2c_mutex_trylock(i2c_dev))
> +		usleep_range(1000, 2000);
> +
> +	WARN_ON(!num_retries);


Blocked thread is not a reason to reboot entire system (see panic on
warn). Drop or change to some dev_warn.


> +}
> +
> +static void tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	u32 val, id;
> +
> +	val = i2c_readl(i2c_dev, I2C_SW_MUTEX);
> +	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +
> +	if (WARN_ON(id != I2C_SW_MUTEX_ID))

Same problem here.



Best regards,
Krzysztof

