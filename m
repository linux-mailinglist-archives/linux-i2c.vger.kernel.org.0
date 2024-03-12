Return-Path: <linux-i2c+bounces-2340-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3163E879C6C
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 20:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63CEF1C22025
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 19:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E951C142648;
	Tue, 12 Mar 2024 19:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYIDTqbA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A3E1E53F;
	Tue, 12 Mar 2024 19:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710272981; cv=none; b=diTr5AC0+I9ZM5M/Z/rR2uxODYkgRtjKjtCi/7stCRjaf0AnY/uJroUQ7LsaPK5kAW5quMIEf++2JRMXh0bDxNY6RlXr1O8X01FVltZXUGkZri3lBegNlmVcbKZAlSTjejB70Dzr2z+OT/J15ExWuicUwjgi0grkDh5idRzzsIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710272981; c=relaxed/simple;
	bh=dMtF5Qh7erQEtbgRl9kFyUq/5IQdgBd14cT/iolwdSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kh10ToFSXz6maHAXUhyDcaMGsYPjhsiH0zNZVWAS8hOQSic/o4zaMfTsgxmvzwtDBiYmmEAo8W7eYcasXjTEkr7l17gm3zABMO9RIQlBlthwQPWD9/1zNk9EpE6MOGlt3Uf39zeax5tD7kmL/5Q3StuGbTjau4KbKj4bOoX9j68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lYIDTqbA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DBDC433F1;
	Tue, 12 Mar 2024 19:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710272981;
	bh=dMtF5Qh7erQEtbgRl9kFyUq/5IQdgBd14cT/iolwdSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lYIDTqbAw3rwZIQsl3GscLfPPLU6q1KiK9nHXUyJZkvH+URwgsPmChuEPCTGQLyK2
	 B0dwyBjjCQuvI4NdTF77fgG+XtTTzYlWFyhyPGPQ4Iz9w5mYM9Son4PmHnuHV3JnuY
	 UxmvTKwRpAb9YQjB8XxuS/dXCqJFyqXCVh3+87sg3Ew1qO9eJ+NqXHiiqFuDrind0s
	 92ps8YtAZbCUncCNO2qjJe7coJhIc1EnKgY8c9ChADJiV1dTTou55z1FQ+U/7TmOPA
	 U30YNZ87/M6xzu4oC6IpeX6D2FJZxBoWjkcGTQ06+hPHPYD5+ga7hhL6/mHlD5KjQu
	 MYmpX9vhD0Nlw==
Received: by pali.im (Postfix)
	id 49EE7945; Tue, 12 Mar 2024 20:49:38 +0100 (CET)
Date: Tue, 12 Mar 2024 20:49:38 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Patrick =?utf-8?B?SMO2aG4=?= <hoehnp@gmx.de>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: i801: Add lis3lv02d for Dell Precision M6800
Message-ID: <20240312194938.mxmip456xnjdlrbo@pali>
References: <20240312193132.26518-1-hoehnp@gmx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240312193132.26518-1-hoehnp@gmx.de>
User-Agent: NeoMutt/20180716

On Tuesday 12 March 2024 20:31:31 Patrick Höhn wrote:
> On the Dell Precision M6800/OXD1M5, BIOS A26 06/13/2029, Linux prints the
> warning below.
> 
>     i801_smbus 0000:00:1f.4: Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration
> 
> Following the same suggestions by Wolfram Sang as for the Dell Precision
> 3540 [1], the accelerometer can be successfully found on I2C bus 0 at
> address 0x29.

Just to note for other users in future. I2C does not have to be assigned
with number 0. This number is chosen by the kernel at runtime as the
first unused number. So in case you have VGA adapter (or GPU) for which
is i2c driver available and loaded + probed before i801_smbus is loaded
and probed then kernel would report accelerometer at different bus
number. On the other hand, accelerometer address on I2C bus normally
should not change (configurable device can change it but we should hope
that it does not happen).

The correct number of bus can be found by the i2cdetect command too:

  # i2cdetect -l | grep I801

For me it prints:

  i2c-0   unknown         SMBus I801 adapter at f040              N/A

> 
>     $ echo lis3lv02d 0x29 | sudo tee /sys/bus/i2c/devices/i2c-0/new_device
>     lis3lv02d 0x29
>     $ dmesg | tail -5
>     [1185.385204] lis3lv02d_i2c 0-0029: supply Vdd not found, using dummy regulator
>     [1185.385235] lis3lv02d_i2c 0-0029: supply Vdd_IO not found, using dummy regulator
>     [1185.399689] lis3lv02d: 8 bits 3DC sensor found
>     [1185.449391] input: ST LIS3LV02DL Accelerometer as /devices/platform/lis3lv02d/input/input371
>     [1185.449577] i2c i2c-0: new_device: Instantiated device lis3lv02d at 0x29
> 
> So, the device has that accelerometer. Add the I2C address to the
> mapping list, and test it successfully on the device.
> 
> [1]: https://lore.kernel.org/linux-i2c/97708c11-ac85-fb62-2c8e-d37739ca826f@molgen.mpg.de/
> Signed-off-by: Patrick Höhn <hoehnp@gmx.de>

Otherwise looks good,

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/i2c/busses/i2c-i801.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 2c36b36d7d51..c1fee2c61da1 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1231,6 +1231,7 @@ static const struct {
>  	 */
>  	{ "Latitude 5480",      0x29 },
>  	{ "Precision 3540",     0x29 },
> +	{ "Precision M6800",    0x29 },
>  	{ "Vostro V131",        0x1d },
>  	{ "Vostro 5568",        0x29 },
>  	{ "XPS 15 7590",        0x29 },
> --
> 2.43.2
> 

