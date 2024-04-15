Return-Path: <linux-i2c+bounces-2955-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F448A5D9D
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 00:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 335601C220A3
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 22:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F25157A5A;
	Mon, 15 Apr 2024 22:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXefIzaQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B92725601;
	Mon, 15 Apr 2024 22:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713219068; cv=none; b=fEyMlJfYtNxt4KL8F1DDoOr7LFkpo1eXcIPC+2wd59Xr7HI/831NuP/u5FpKb46zVn6POQwgcN7W/q0/wjyRfJegqxhAGbnzA2zJqCO3Gj+kMkmKje+urUhrsnJWPP15dn5teczjtGim7o4k5nHrvvnqH37Ef3L8hkg5B7NM+go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713219068; c=relaxed/simple;
	bh=yAUhUPGP6pRFUgJ6hrCL5leLqTgSSXyLqybDbhMmenw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pdu4iw85a6a1W81PXCxoRhqxcYUzGlb66wf5qltDNB95mYNoa+eHcuFQ0xggeezoRM1RHsTXbKJD31TQEIdNjwzqFgI6K/2tTJ4nbeLAf3lV01bkLpdq7bMJS+ZsWRt0iW2+7JbLhI58lr9wr7T8jKPOi1PSbPKUEPjBEblL53Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXefIzaQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8311C113CC;
	Mon, 15 Apr 2024 22:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713219067;
	bh=yAUhUPGP6pRFUgJ6hrCL5leLqTgSSXyLqybDbhMmenw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXefIzaQSP3GV6t/Bw7PBgqAbtRin9sQLZR50mi6lrZhBJfqPVblrDvLIlbVyIo3H
	 qwEEHCUHrR4fWLpcO1meS8DQu8DBkrg4DvBUUrmYhJraswx0CvTscXOWtRsoiJU9GX
	 dWkw1TOkunZ3b7bJaqAtu2MB/mbgsuWttdjzB+EgB+EWjkPhBr4z9/Sy8maHB0UQ7u
	 c8zpxXH+DD+6xAtwbNVyDwmYKYr30cx98cI5aXY7oUA99tSy9t7hxiBuiT3tRxkMUR
	 sxbteIj+Mu5squUUP1n5rk+LEVJ1E5DPCFNPspntr09m5hUVF3rP9NnfSLyAsWvoRJ
	 c/yx2OPtd89Cw==
Date: Tue, 16 Apr 2024 00:11:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-fsi@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, alistair@popple.id.au, 
	joel@jms.id.au, jk@ozlabs.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: Re: [PATCH v2 25/31] i2c: fsi: Calculate clock divider from local
 bus frequency
Message-ID: <q6bl7sbskt4ukd3mylfgwpo6dmv444umdpycs6xp7ozd2kv335@syeymu62fczb>
References: <20240226165321.91976-1-eajames@linux.ibm.com>
 <20240226165321.91976-26-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226165321.91976-26-eajames@linux.ibm.com>

Hi Eddie,

> @@ -689,6 +692,20 @@ static int fsi_i2c_probe(struct device *dev)
>  	mutex_init(&i2c->lock);
>  	i2c->fsi = to_fsi_dev(dev);
>  	INIT_LIST_HEAD(&i2c->ports);
> +	i2c->clock_div = I2C_DEFAULT_CLK_DIV;
> +
> +	lbus = fsi_device_local_bus_frequency(i2c->fsi);
> +	if (lbus) {
> +		u32 clock = I2C_DEFAULT_CLK_RATE;

I don't see the need for initialization.

> +
> +		if (!device_property_read_u32(dev, "clock-frequency", &clock)) {
> +			if (!clock)
> +				clock = I2C_DEFAULT_CLK_RATE;
> +		}

no need for brackets.

> +
> +		// i2c clock rate = local bus clock / (4 * (i2c clock div + 1))

You forgot to remove this.

Andi

> +		i2c->clock_div = (((lbus + (clock - 1)) / clock) / 4) - 1;
> +	}
>  
>  	rc = fsi_i2c_dev_init(i2c);
>  	if (rc)
> -- 
> 2.39.3
> 

