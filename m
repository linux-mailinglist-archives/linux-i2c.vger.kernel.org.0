Return-Path: <linux-i2c+bounces-7537-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA989AE262
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 12:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DF1D1C2164C
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 10:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C791C7617;
	Thu, 24 Oct 2024 10:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SA2w5szo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1011C4A31;
	Thu, 24 Oct 2024 10:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729765209; cv=none; b=ehVuATaTDj0zgFn3yfc+nnklKi2glg/kNeTP2I8X5T0CMLly7dfP8bC2FOfR+pbS8ar0llYtYzSmV9dm7Mpbx8/64v9biREO4+2R5mqHM+eUlnFPN8leyqZaWEVo4L4zDUi/rCa/hp7Qzedlpc4qoHs/pvQ+XJ88+ggUYcjEAh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729765209; c=relaxed/simple;
	bh=JZRT/LML4GQueNnOCFhx/XljE+CECLtfbjWTWn0M5qM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTM6jmmfpfNfVuOfXsY9JRKpWBIqVVG77cC0OE/7nTyRKuV/WlwLUqtHxOMYO+ELQ797IRO4u5D79S5x8VUT9Rb4fTDmNlrVgMyfFgL9CEeIGaDIf5kehcHqo2QBgBGVfeZSdbqMQc5P8mZfLyWBqHAipluz302ZUdNnQtCIkbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SA2w5szo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91D8C4CEC7;
	Thu, 24 Oct 2024 10:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729765209;
	bh=JZRT/LML4GQueNnOCFhx/XljE+CECLtfbjWTWn0M5qM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SA2w5szoWW2BU+Mf4zmP7FiFjH4iVCZmxCMflLXidIUuRUUTZ1ytMhG27HIercfbf
	 wkMowBMShKDw1Ey5mRNdzBoUvJcwcUo+vPBYlNOL+hqzwkQX0eky30pcFtGk386rLn
	 27Zk8qFLxPpFT0cMNBQ2e3+VQhvrZTXGm+7QkXquEfoqMGJuuuxn2aJ9il53fI5Ib9
	 DFCfGISL7OXw+1Tn7/Th/eC2BuUwGDiHxcjSwHe0MjyeM/4LnBWMH4qyzfxujpV3MS
	 3XWW9hVIs4V6oVVYsHYrJvaLALQIR+k86ZJh8N9VGa35vrONdI3ktam4bvjOltGzmq
	 WkJmjbnzR5d3Q==
Date: Thu, 24 Oct 2024 12:20:00 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] i2c: npcm: use i2c frequency table
Message-ID: <fh43vyo4oviet35jmihew5yew5ez3nyaqgsyntqtd7x7s5mdrv@ezpal3a4banw>
References: <20241021062732.5592-1-kfting@nuvoton.com>
 <20241021062732.5592-4-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021062732.5592-4-kfting@nuvoton.com>

Hi Tyrone,

...

> -	/* 100KHz and below: */
> -	if (bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
> -		sclfrq = src_clk_khz / (bus_freq_khz * 4);
> -
> -		if (sclfrq < SCLFRQ_MIN || sclfrq > SCLFRQ_MAX)
> -			return -EDOM;
> -
> -		if (src_clk_khz >= 40000)
> -			hldt = 17;
> -		else if (src_clk_khz >= 12500)
> -			hldt = 15;
> -		else
> -			hldt = 7;
> -	}
> -
> -	/* 400KHz: */
> -	else if (bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ) {
> -		sclfrq = 0;
> +	switch (bus_freq_hz) {
> +	case I2C_MAX_STANDARD_MODE_FREQ:
> +		smb_timing = smb_timing_100khz;
> +		table_size = ARRAY_SIZE(smb_timing_100khz);
> +		break;
> +	case I2C_MAX_FAST_MODE_FREQ:
> +		smb_timing = smb_timing_400khz;
> +		table_size = ARRAY_SIZE(smb_timing_400khz);
>  		fast_mode = I2CCTL3_400K_MODE;
> -
> -		if (src_clk_khz < 7500)
> -			/* 400KHZ cannot be supported for core clock < 7.5MHz */
> -			return -EDOM;
> -
> -		else if (src_clk_khz >= 50000) {
> -			k1 = 80;
> -			k2 = 48;
> -			hldt = 12;
> -			dbnct = 7;
> -		}
> -
> -		/* Master or Slave with frequency > 25MHz */
> -		else if (src_clk_khz > 25000) {
> -			hldt = clk_coef(src_clk_khz, 300) + 7;
> -			k1 = clk_coef(src_clk_khz, 1600);
> -			k2 = clk_coef(src_clk_khz, 900);
> -		}
> -	}
> -
> -	/* 1MHz: */
> -	else if (bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
> -		sclfrq = 0;
> +		break;
> +	case I2C_MAX_FAST_MODE_PLUS_FREQ:
> +		smb_timing = smb_timing_1000khz;
> +		table_size = ARRAY_SIZE(smb_timing_1000khz);
>  		fast_mode = I2CCTL3_400K_MODE;
> -
> -		/* 1MHZ cannot be supported for core clock < 24 MHz */
> -		if (src_clk_khz < 24000)
> -			return -EDOM;
> -
> -		k1 = clk_coef(src_clk_khz, 620);
> -		k2 = clk_coef(src_clk_khz, 380);
> -
> -		/* Core clk > 40 MHz */
> -		if (src_clk_khz > 40000) {
> -			/*
> -			 * Set HLDT:
> -			 * SDA hold time:  (HLDT-7) * T(CLK) >= 120
> -			 * HLDT = 120/T(CLK) + 7 = 120 * FREQ(CLK) + 7
> -			 */
> -			hldt = clk_coef(src_clk_khz, 120) + 7;
> -		} else {
> -			hldt = 7;
> -			dbnct = 2;
> -		}
> +		break;
> +	default:
> +		return -EINVAL;

There is here a slight change of behaiour which is not mentioned
in the commit log. Before the user could set a bus_freq_hz which
had to be <= I2C_MAX_..._MODE_FREQ, while now it has to be
precisely that.

Do we want to check what the user has set in the DTS?

(Or am I missing something?)

Thanks,
Andi

