Return-Path: <linux-i2c+bounces-4649-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F12927F07
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 00:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F97F1C21F34
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 22:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBC3143C75;
	Thu,  4 Jul 2024 22:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tPz7pAJE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8543F9C5;
	Thu,  4 Jul 2024 22:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720132223; cv=none; b=UhyfiZFwC8MFuQTtaJVDh3krOd3Oy9xNAwUo5uZKyz6V6R0/fSH3wg1fgdcTtHRd1lssMdvaeHUkjsjn79gpLoHUVyQ1MeRVq7wOYZsxRm0C98puCISE/EQSyUAoXLQM4ldEEPXzWwXzKz8oJwC0cnw+k55whLCmlV+dV0r9QBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720132223; c=relaxed/simple;
	bh=oC+xE2yZTlJ8yikxMpueWbCgaUQJN5ofJ1HUX+kkhBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoYuFSrOBTiuxoaP7opFNWVmv1+THn2e4Sfy6dzW6BPG18tFkOOwyoMPR1YDb5q6dKkqvx9hqNvHmh5EOVvqNOJthpkEoxVnZXpyn2YubEnYVLRzGTCTa+ApvJaMFbjXIp70uHZFymeNJDu7YRJLpK9xOP/uIJvXIRE6Y+7ezv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tPz7pAJE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE441C3277B;
	Thu,  4 Jul 2024 22:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720132222;
	bh=oC+xE2yZTlJ8yikxMpueWbCgaUQJN5ofJ1HUX+kkhBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tPz7pAJE/wI+SoOsFUkaR4lJ02bUIBSgFz+qE63L9NCx0UvU04gTIAaFku8AzUUFz
	 O5yyu9krmsKFJxYoUyD0AgxolksrhWgP9+Zct7gBIIN+RGvc/Xg2L3/0Hky68gM/Jg
	 Xe4BulebNNEIZgc0aT6ylrfNf9tlfE950uk2WyEvDTtQPrHVh28Qdd1DG5jXhumT85
	 Zo0uDDqUT7hC17dx9Izpf400+lQIjK5AL6YYqopKkY5OphqcR8IprFGzwKpm7kHDOt
	 zp0QA7DR65mkhdEzsrVoH+JgvaSPXZqVmn0AxWIfFWozEL4Zxd5ihF3NXmsurXifm/
	 X9iPG0lggTNGQ==
Date: Fri, 5 Jul 2024 00:30:19 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 02/12] i2c: riic: Use temporary variable for struct
 device
Message-ID: <mzuqdxb2dthfg6xa5jhodj6d54b6zlcnby35hmxe4jvfw3oghm@uunqpeg5wcdd>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-3-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625121358.590547-3-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

...

> Use a temporary variable for the struct device pointers to avoid
> dereferencing.

So far just refactoring...

> While at it, replace riic->adapter.dev argument of
> dev_err() from riic_init_hw() with the temporary variable (pointing to
> riic->adapter.dev.parent).

This is the real change in this patch and you are not explaining
why you did it.

...

> @@ -303,11 +304,12 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
>  	int ret = 0;
>  	unsigned long rate;
>  	int total_ticks, cks, brl, brh;
> +	struct device *dev = riic->adapter.dev.parent;
>  
> -	pm_runtime_get_sync(riic->adapter.dev.parent);
> +	pm_runtime_get_sync(dev);
>  
>  	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
> -		dev_err(&riic->adapter.dev,
> +		dev_err(dev,
>  			"unsupported bus speed (%dHz). %d max\n",
>  			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);

I personally prefer the reference to the current device, it's
more traceable. If you think it's not providing enough
information, then you can improve it, but I wouldn't like to lose
reference to this driver in the log.

Andi

