Return-Path: <linux-i2c+bounces-12672-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8144B44A6A
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 01:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86C17A02A63
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 23:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289142F657A;
	Thu,  4 Sep 2025 23:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ly5Ism6I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C660D2F6565;
	Thu,  4 Sep 2025 23:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757028483; cv=none; b=qJdkcmyZHpVwKgB1qWdplqWvQW/oEBFj1O6IVGXSlwImjxLOLU9CaVMz5ozdCzP1/5MS4AdZv9XKlYRWQG8FvLRS01nPphIIzhhO8/vp1TlgKSkzmNywhHb+/but9i/94MAlqaqFxVCc2/Q6Of0+Z3YuQjUwuH1UfNYHM2MKK8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757028483; c=relaxed/simple;
	bh=ly5f5L034OBshPPmHWgiZrq2nVBBsbg/Jf7vHlaQUWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFLV0JW4yjEwuXEwHg1PyKc9Efm0WASOO4iwHSYHQ9dBOFS9BKuexEI9oFyGj7vEGnvZPKbPABf5ytp6GZQWlNNSDUhLo6V4X5ciWdkHssnpUZJgabE3ljz5vH40EeZ5v+Eu+C+t7vs+QLN+JmWz8I5uzuaUwSkharMoiwTh+9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ly5Ism6I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1D8C4CEF0;
	Thu,  4 Sep 2025 23:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757028483;
	bh=ly5f5L034OBshPPmHWgiZrq2nVBBsbg/Jf7vHlaQUWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ly5Ism6IqfIlvxasm57hCAO7wUxPD9JsMjU0KImRbjVR+rs9WCTTPAdwYEBlS51vZ
	 4HFd3FLX/dY+XQm/OVs+D5ir6Gn87BiClCtZP4SZC2rKUdWsfK2tYs+10JGD/Nl42u
	 Io4OE8+9SndISpcNgIahX/a8B5NmRi+elc1Hkgwt0QQLdkVvuSAROE7JP/PvsytowB
	 in8swEKTSxL+mwG6+dsVtOnEvIaZMwMfe10nwj6RoXnaEVd7IPOZvyZXLC175mnvBm
	 vXkw/6HkOffPJzWFll3xM2y3zY7GaQAPukOWVl6uAtEw6TcQf+OZYICggA7THrhYp+
	 f6+LRhbzTxL4g==
Date: Fri, 5 Sep 2025 01:28:00 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: akhilrajeev@nvidia.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	ldewangan@nvidia.com, digetx@gmail.com, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/5] i2c: tegra: Add support for SW mutex register
Message-ID: <l4po62bw6672xpaabkbvu6snyg4hrgcdxaijpt6evizortwjok@jwg2asezj3cb>
References: <20250828055933.496548-1-kkartik@nvidia.com>
 <20250828055933.496548-5-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828055933.496548-5-kkartik@nvidia.com>

Hi Kartik,

On Thu, Aug 28, 2025 at 11:29:32AM +0530, Kartik Rajput wrote:
> Add support for SW mutex register introduced in Tegra264 to provide
> an option to share the interface between multiple firmwares and/or
> VMs.

You could add a short description on how to use the mutex
register here.

> However, the hardware does not ensure any protection based on the
> values. The driver/firmware should honor the peer who already holds
> the mutex.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

...

> @@ -381,6 +391,73 @@ static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
>  	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>  }
>  
> +static int tegra_i2c_mutex_acquired(struct tegra_i2c_dev *i2c_dev)

this is a bool function.

> +{
> +	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
> +	u32 val, id;
> +
> +	val = readl(i2c_dev->base + reg);
> +	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +
> +	if (id != I2C_SW_MUTEX_ID_CCPLEX)
> +		return 0;
> +
> +	return 1;

return id != I2C_SW_MUTEX_ID_CCPLEX;

> +}
> +
> +static int tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)

I think this can be bool.

> +{
> +	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
> +	u32 val, id;
> +
> +	val = readl(i2c_dev->base + reg);
> +	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +	if (id != 0 && id != I2C_SW_MUTEX_ID_CCPLEX)
> +		return 0;
> +
> +	val = FIELD_PREP(I2C_SW_MUTEX_REQUEST, I2C_SW_MUTEX_ID_CCPLEX);
> +	writel(val, i2c_dev->base + reg);
> +
> +	return tegra_i2c_mutex_acquired(i2c_dev);
> +}
> +
> +static int tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	int locked;

I guess this can be bool.

> +	int ret;
> +
> +	if (i2c_dev->atomic_mode)
> +		ret = read_poll_timeout_atomic(tegra_i2c_mutex_trylock, locked, locked,
> +					       USEC_PER_MSEC, I2C_SW_MUTEX_TIMEOUT_US,
> +					       false, i2c_dev);
> +	else
> +		ret = read_poll_timeout(tegra_i2c_mutex_trylock, locked, locked, USEC_PER_MSEC,
> +					I2C_SW_MUTEX_TIMEOUT_US, false, i2c_dev);
> +
> +	if (!tegra_i2c_mutex_acquired(i2c_dev))
> +		dev_warn(i2c_dev->dev, "failed to acquire mutex\n");

I would try a few times before giving up.

Besides, is there a chance where ret is '0' and the mutex is not
acquired? If so, we are not signalling error if the mutex is not
acquired, but I think we should.

I would do:

	if (...)
		ret = ...
	else
		ret = ...
	
	if (ret)
		return ret;

	if (!tegra_i2c_mutex_acquired(i2c_dev)) {
		dev_warn(i2c_dev->dev, "failed to acquire mutex\n");
		return -ESOMETHING;
	}

	return 0;

Makes sense?

> +
> +	return ret;
> +}
> +
> +static int tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
> +{
> +	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
> +	u32 val, id;
> +
> +	val = readl(i2c_dev->base + reg);
> +
> +	id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
> +	if (id && id != I2C_SW_MUTEX_ID_CCPLEX) {
> +		dev_warn(i2c_dev->dev, "unable to unlock mutex, mutex is owned by: %u\n", id);
> +		return -EPERM;

I would try a few times before giving up.

> +	}
> +
> +	writel(0, i2c_dev->base + reg);
> +
> +	return 0;
> +}
> +
>  static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
>  {
>  	u32 int_mask;
> @@ -1422,6 +1499,13 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  		return ret;
>  	}
>  
> +

no need for this extra blank line.

> +	if (i2c_dev->hw->has_mutex) {

I would put this check in tegra_i2c_mutex_lock() and _unlock() in
order to avoid two level indentation here.

> +		ret = tegra_i2c_mutex_lock(i2c_dev);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	for (i = 0; i < num; i++) {
>  		enum msg_end_type end_type = MSG_END_STOP;
>  
> @@ -1451,6 +1535,12 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  			break;
>  	}
>  
> +	if (i2c_dev->hw->has_mutex) {
> +		ret = tegra_i2c_mutex_unlock(i2c_dev);
> +		if (ret)
> +			return ret;

We are skipping pm_runtime_put(), though.

Thanks,
Andi

> +	}
> +
>  	pm_runtime_put(i2c_dev->dev);
>  
>  	return ret ?: i;

