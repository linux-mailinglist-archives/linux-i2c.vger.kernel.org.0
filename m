Return-Path: <linux-i2c+bounces-5358-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BAD951092
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 01:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6360B1F25D36
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 23:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FE21ABED2;
	Tue, 13 Aug 2024 23:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r8ELICU7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D481ABEA4;
	Tue, 13 Aug 2024 23:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723591471; cv=none; b=WS7Pqfyr2PEnqSgAPezLLcdMuX7pGVD5hOEmMx+LVz5aPBiA7VLxiSjjcXR+ayZL8V+VPtLkBG4REOfYNtWVbFzsW7zYDjme45kNNthBFLU+9sAMtc0E/5QFP7udOKdfAb666m2+8bFQ2cg7ixy8Zsa7M57wyzZ1uWjCHH8EvbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723591471; c=relaxed/simple;
	bh=GO2++5vBD4Pi/QwB+hArlHHUYaYdMOfzb4pkmpEqjjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N92Pl8XtR4WfRaDb0YGB1pUqe0GNDdCBRlehJa137hRQFnYhEVrDLktu6BPXzjqIzQYvoiAQyqvR1a2yAB0sZ7NlFMLJ0LtooGUsu2SUjDBYnL663K9oXcSYoqUnfXmxlA9u+OGOuiIMzXR0jdlu9/juiCMpZ7oA9elaQd3jpqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r8ELICU7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A81C32782;
	Tue, 13 Aug 2024 23:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723591471;
	bh=GO2++5vBD4Pi/QwB+hArlHHUYaYdMOfzb4pkmpEqjjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r8ELICU7uuTX8vaKprCLN8fiAB/dIkP7aA0p9z8k1mwybrN48URZ6fGjBUa1mp4xe
	 3pIgulmGTb60R6XV+giGrCXKTZWARy8XK4BvKl0q6XrXI5mPwtwzLAUqR8ry8v+hVW
	 8c1QoKIPqMQsQg44LWWNf3p8ajDyxdwIOssBcYtFt3pB/yJB5mDnrxVleDmWiyT9cL
	 WhypUr0MOVGUBPR95ybMoPeIDdj1PSn7H8xbE+8xrXE4MeDi6BWtcLwDI6oBDCCZvH
	 FrGSSxFiOrOVXHgYTjCv1eruweJlp1uiLUbHdEfO9W2bV+UDscLM8z/v2khUW+xHYE
	 NUhTifixawKQw==
Date: Wed, 14 Aug 2024 00:24:28 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	blake.vermeer@keysight.com
Subject: Re: [PATCH 3/5] i2c: Congatec Board Controller i2c bus driver
Message-ID: <tv6v7g3nkoedbu4olu2xi76qtfueebnfz7c2zx7t2wmpthqdt6@wmbo2lwv5qnf>
References: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com>
 <20240503-congatec-board-controller-v1-3-fec5236270e7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503-congatec-board-controller-v1-3-fec5236270e7@bootlin.com>

Hi Thomas,

On Fri, Aug 09, 2024 at 04:52:07PM GMT, Thomas Richard wrote:
> Add i2c support for the Congatec Board Controller.

do you mind adding some more description?

> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

...

> +config I2C_CGBC
> +	tristate "Congatec I2C Controller"
> +	depends on MFD_CGBC
> +	help
> +	  This enables the I2C bus interfaces for the Congatec Board

This what? :-)

> +	  Controller.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called i2c-cgbc.ko.
> +

...

> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>

please sort includes in alphabetical order?

> +#include <linux/mfd/cgbc.h>

...

> +enum i2c_state {
> +	STATE_DONE = 0,
> +	STATE_INIT,
> +	STATE_START,
> +	STATE_READ,
> +	STATE_WRITE,
> +	STATE_ERROR,
> +};

can you please use the cgbc prefix for this enum and all the
members?

...

> +	if (bus_frequency > CGBC_I2C_FREQ_MAX_HZ ||
> +	    bus_frequency < CGBC_I2C_FREQ_MIN_HZ) {
> +		dev_warn(i2c->dev, "invalid frequency %u, using default\n", bus_frequency);

should this rather be a dev_info()? (supernit: please start with
capital leter).

> +		bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
> +	}
> +
> +	cmd[0] = CGBC_I2C_CMD_SPEED | algo_data->bus_id;
> +	cmd[1] = cgbc_i2c_freq_to_reg(bus_frequency);
> +
> +	ret = cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
> +	if (ret)
> +		return dev_err_probe(i2c->dev, ret,
> +				     "Failed to initialize I2C bus %s",
> +				     adap->name);
> +
> +	cmd[1] = 0x00;
> +
> +	ret = cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
> +	if (ret)
> +		return dev_err_probe(i2c->dev, ret,
> +				     "Failed to get I2C bus frequency");
> +
> +	bus_frequency = cgbc_i2c_reg_to_freq(data);
> +
> +	dev_dbg(i2c->dev, "%s is running at %d Hz\n", adap->name, bus_frequency);
> +
> +	/*
> +	 * The read_maxtime_us is the maximum time to wait during a read to get
> +	 * data. At maximum CGBC_I2C_READ_MAX_LEN can be read by command.
> +	 * So calculate the max time to size correctly the timeout.
> +	 */

this comment is a bit wild, can we rephrase to something like:

/*
 * The read_maxtime_us variable represents the maximum time to wait
 * for data during a read operation. The maximum amount of data that
 * can be read by a command is CGBC_I2C_READ_MAX_LEN.
 * Therefore, calculate the max time to properly size the timeout.
 */

(it's a suggestion, please choose the words you prefer).

Andi

