Return-Path: <linux-i2c+bounces-7145-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD53398BC89
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 14:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E675F1C231F9
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 12:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFE41C3317;
	Tue,  1 Oct 2024 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+9qW4Ah"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79678188A01;
	Tue,  1 Oct 2024 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727786725; cv=none; b=mKE7BIe4aMByUxJO9IU2Vtj3+rGIBHblCM7xfGNw4oZkVyb5TmeW2VAQuYqAX5C+BTruy9wFs3ocsxpsV4oW4naUKXhVEOWLf1VQ+PdMOMB4uWLoK7evYDAMDquhbCirjkrYGQvEQKxrsfHfeXewgYILNl5HDTuVe31qZrARubA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727786725; c=relaxed/simple;
	bh=rONTlDGlNdXQq4N23uXg7INy1byH9RVPf6wtNX7kOsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3uAlger/uETJM+OoODhvgR3g26YSiKFe4M8WRgx1/NCoZZQpdNo4XUwTqvLqUzhECdBLmOCM5dapxgnneMMSLW0CEubIA+sHapu//nQ9YPAG8XSyz+Yr9sRA1eoDi6GSqrKqAPYMNQdDa4uO0YIv/tt2OXIraMA0xI8IVXgcfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+9qW4Ah; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F82C4CECD;
	Tue,  1 Oct 2024 12:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727786725;
	bh=rONTlDGlNdXQq4N23uXg7INy1byH9RVPf6wtNX7kOsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+9qW4Ah6RG9jaJPY69xMACkjV8odYd8avjGEF+NDBQxaecQYRr6qBUOjf3hYE/x/
	 IbCr6e9php/IMMHi5NHprwIgyRHETMTzb0RskPYOoeFTvPTPw9jEG4dpbgg4t5Q+Ix
	 chJWVPj3ToIyoCcmDllM3DavLj0L/Lzt0FyYd1mA5zfbBp4gk4AdEsSjdKBepdBDPT
	 iCgsdW3X+127UdYRvJ9df0pzbrDBbtqGhLS5e7je9MdXPR4baNnLasCe7VeiWDtc0O
	 Uz85IVdzJywFl41sMWFhs39kixW6emJVJgsqE4KgPkIwpmNZvRekuMN3uYXVSXHKP2
	 3b5AbwfrxzvIw==
Date: Tue, 1 Oct 2024 14:45:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Wolfram Sang <wsa@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-core: actually use repeated sends
Message-ID: <jzkzcnd5rdprxpw734ppcr5ti23qkppfxs55nse36wcqxff7e3@4ea2lyl7feoo>
References: <20240930-uneasy-dorsal-1acda9227b0d@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930-uneasy-dorsal-1acda9227b0d@spud>

Hi Conor,

On Mon, Sep 30, 2024 at 02:38:27PM GMT, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> At present, where repeated sends are intended to be used, the
> i2c-microchip-core driver sends a stop followed by a start. Lots of i2c
> devices must not malfunction in the face of this behaviour, because the
> driver has operated like this for years! Try to keep track of whether or
> not a repeated send is required, and suppress sending a stop in these
> cases.
> 
> Fixes: 64a6f1c4987e ("i2c: add support for microchip fpga i2c controllers")

I don't think the Fixes tag is needed here if everything worked
until now, unless you got some other device that requires this
change and you need to explain it.

If this is more an improvement (because it has worked), then we
shouldn't add the Fixes tag.

In any case, when patches are going to stable, we need to Cc
stable too.

Cc: <stable@vger.kernel.org> # v6.0+

(This is specified in the
Documentation/process/stable-kernel-rules.rst and I'm starting to
enforce it here).

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

...

> +	/*
> +	 * If there's been an error, the isr needs to return control
> +	 * to the "main" part of the driver, so as not to keep sending
> +	 * messages once it completes and clears the SI bit.
> +	 */
> +	if (idev->msg_err) {
> +		complete(&idev->msg_complete);
> +		return;
> +	}
> +
> +	this_msg = (idev->msg_queue)++;

do we need parenthesis here?

...

> +	/*
> +	 * The isr controls the flow of a transfer, this info needs to be saved
> +	 * to a location that it can access the queue information from.
> +	 */
> +	idev->restart_needed = false;
> +	idev->msg_queue = msgs;
> +	idev->total_num = num;
> +	idev->current_num = 0;
> +
> +	/*
> +	 * But the first entry to the isr is triggered by the start in this
> +	 * function, so the first message needs to be "dequeued".
> +	 */
> +	idev->addr = i2c_8bit_addr_from_msg(this_msg);
> +	idev->msg_len = this_msg->len;
> +	idev->buf = this_msg->buf;
> +	idev->msg_err = 0;
> +
> +	if (idev->total_num > 1) {
> +		struct i2c_msg *next_msg = msgs + 1;
> +
> +		idev->restart_needed = next_msg->flags & I2C_M_RD;
> +	}
> +
> +	idev->current_num++;
> +	idev->msg_queue++;

Can we initialize only once? This part is just adding extra code.

The rest looks good. I just need to know if Wolfram has some more
observations here.

Thanks,
Andi

