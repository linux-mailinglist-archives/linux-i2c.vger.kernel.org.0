Return-Path: <linux-i2c+bounces-5549-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8421B95756E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 22:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6240D1C232D1
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 20:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E5B1DD396;
	Mon, 19 Aug 2024 20:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqlqA4WF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1701DD390;
	Mon, 19 Aug 2024 20:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724098344; cv=none; b=T75EjnDe7XG5KNzUj9zTEnJJmZBGw4a597r7ccYybSTMOgU76LXDVZQi0i7xFXiBya6oIekffETKNexsiskiL87tsGBOsvAi963pPVnpXQfsEZuICjP6JHR9HAg5SatauqTt3GdK2aJXwEZhdecrRWsx9SCAHveAWJUYF/ri0OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724098344; c=relaxed/simple;
	bh=t77ROfzbx+fZRo+3bBECC3laH+DWBME/BVezkDkcl9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGbiLUGt/i2yXrT5bXJB+ar2UJiNwJ2kSaC+L7k4AwUeVIi7J1ikQgsyRoe/tpRwJWGOCjztwwcAWXdmfo0HdaJWlUPNY7mlTZGMiOVVP3liWF/vnYXCPDusEziUxH4KWiZLgm7iJa97u6bwQCxVsmt0jYxXnHK6+4ZwqthiNgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqlqA4WF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96038C32782;
	Mon, 19 Aug 2024 20:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724098343;
	bh=t77ROfzbx+fZRo+3bBECC3laH+DWBME/BVezkDkcl9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eqlqA4WFv9cs5T44dwjH/4+gG0qflF2Zvm3bAF1NhoyTDFeW/0xRMWaYu8i6wq8j1
	 DpprxrBxuNIiSfnrCzrus7F3bXQyP1MSG5T3y8RzYtmV/elGQ9iUp5n3ffR3Kr5zGk
	 wY/eut7BOpY4jns4ABkdbRdZgr7G1hqBNzOPC8QPITLNEdcyRU9OKS3cYFdocfeBik
	 kea2+B/vfjvPUzH2r3G861E4A4x01uMXPTyhZcdWUGI/V8AFN/VJXNksER5rzMvSCN
	 h5RyTo4/V/r7NMzN+1NyS0bNrlRFqTVAX3r8xR7pv+7aS1xytY8am7REJMQ1qIbkli
	 EOqTuUYhzw9sg==
Date: Mon, 19 Aug 2024 22:12:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 08/11] i2c: riic: Add support for fast mode plus
Message-ID: <hu4yt2a7ipxrqd7ciqqyg4izei2dr7yerpgf7j53quepxj4ed6@gzlv7l3etpqb>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
 <20240819102348.1592171-9-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819102348.1592171-9-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

...

>  struct riic_dev {
> @@ -311,11 +315,14 @@ static int riic_init_hw(struct riic_dev *riic)
>  	int total_ticks, cks, brl, brh;
>  	struct i2c_timings *t = &riic->i2c_t;
>  	struct device *dev = riic->adapter.dev.parent;
> +	const struct riic_of_data *info = riic->info;

Because you are only using info->fast_mode_plus, perhaps you can
directly take:

	fast_mode_plus = riic->info->fast_mode_plus;

and you make it even more compact.

>  
> -	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
> +	if ((!info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) ||
> +	    (info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)) {
>  		dev_err(&riic->adapter.dev,
> -			"unsupported bus speed (%dHz). %d max\n",
> -			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
> +			"unsupported bus speed (%dHz). %d max\n", t->bus_freq_hz,

super nitpick: can you please put t->bus_freq_hz on a new line,
it looks better to either have everything put in columns or not.

> +			info->fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ :
> +			I2C_MAX_FAST_MODE_FREQ);

another super-nitpick: can you please align
I2C_MAX_FAST_MODE_PLUS_FREQ with I2C_MAX_FAST_MODE_FREQ? It makes
more clear that there is a "? ... :" statement.

Thanks,
Andi

>  		return -EINVAL;
>  	}

