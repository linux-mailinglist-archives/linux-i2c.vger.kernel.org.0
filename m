Return-Path: <linux-i2c+bounces-9161-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A73A1A298
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2025 12:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DDC116AFB6
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2025 11:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A64920E03B;
	Thu, 23 Jan 2025 11:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDy5a1SQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B89820C46B;
	Thu, 23 Jan 2025 11:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630577; cv=none; b=OqfYPwCFs+XMYrRJX38sBhCYBckBXWzqIGf3dd18VMOQtcCKqAhxJ+PdKNNgN2iDxiog5qgVdwWT+W7tY5O8yJ6QV4gf1ls//lUElHPkY1KKz3aDACb0CmIczKOR669NexwaK8DUNTGq59Tq7oHs5IKF/JcrYaRlge+SmP8tOZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630577; c=relaxed/simple;
	bh=Qvy74JqKzVd1qj7fQJwVAQBLAKbjrWNDB+WUyydr2iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBTq7hHZxRq5XfeRu6ydnQPoF9cQA7PevU3XsZyvtDLYdy1Od5lSyOybpTCw4prU7a9KOZ2+JZL/kLSBflStApT4jNHz89snW1HiU0PqpidBxPEhIPZQ30mt2Vxl/QPrKUwoLdHE5tykLaYLWmHnX8wy8cimmB0uRJjuG1c5o5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDy5a1SQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F9FC4CED3;
	Thu, 23 Jan 2025 11:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737630576;
	bh=Qvy74JqKzVd1qj7fQJwVAQBLAKbjrWNDB+WUyydr2iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDy5a1SQ2A9Bh43KXqO27rb4uTuw0SwEiZDMaJa76EmUfX4jD6520n31rfpOInsGF
	 S7q4jkd7DJzi8EeyjMVHWNW1sfwNdjXGjxCB5ZDoqN37peHq4LsHXcqZFmttVYR9Mc
	 C6wL/X6dHoVprL5dGGNsblsyc0Seabo27Oj8Yt1y1OQF3BPRmuhcfK6eeN/1sJrvA7
	 8CbxKoTEE9PaqSt4322HjmcQ0Co5G1iHaKTrzlwjvW5Cf81ik4BsZRTpX63P6I1YnC
	 OjRSGHufLwHNWMO/+gvkLGEHNOT+xrX3FUUgdZqBYDJ8vsTRIr5lzBzrOIVXPvi9f1
	 QYr3XFZlj9UKg==
Date: Thu, 23 Jan 2025 11:09:29 +0000
From: Simon Horman <horms@kernel.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 4/7] can: Add Nuvoton NCT6694 CANFD support
Message-ID: <20250123110929.GP395043@kernel.org>
References: <20250123091115.2079802-1-a0282524688@gmail.com>
 <20250123091115.2079802-5-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123091115.2079802-5-a0282524688@gmail.com>

On Thu, Jan 23, 2025 at 05:11:12PM +0800, Ming Yu wrote:
> This driver supports Socket CANFD functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

...

> diff --git a/drivers/net/can/usb/nct6694_canfd.c b/drivers/net/can/usb/nct6694_canfd.c

...

> +static int nct6694_can_get_clock(struct nct6694_can_priv *priv)
> +{
> +	struct nct6694_can_information *info;
> +	struct nct6694_cmd_header cmd_hd = {
> +		.mod = NCT6694_CAN_MOD,
> +		.cmd = NCT6694_CAN_INFORMATION,
> +		.sel = NCT6694_CAN_INFORMATION_SEL,
> +		.len = cpu_to_le16(sizeof(*info))
> +	};
> +	int ret, can_clk;
> +
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	ret = nct6694_read_msg(priv->nct6694, &cmd_hd, info);
> +	if (ret)
> +		goto exit;

Hi Ming Yu,

This goto will result in the function returning can_clk.
But can_clk is not initialised until the following line.

Flagged by W=1 builds with clang-19, and by Smatch.

> +
> +	can_clk = le32_to_cpu(info->can_clk);
> +
> +exit:
> +	kfree(info);
> +	return can_clk;
> +}

...

