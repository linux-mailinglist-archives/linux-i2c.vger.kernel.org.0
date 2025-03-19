Return-Path: <linux-i2c+bounces-9921-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04581A69BEE
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 23:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74BB1189706F
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 22:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C49221B9F6;
	Wed, 19 Mar 2025 22:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2k2VfpU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE5721B8EC;
	Wed, 19 Mar 2025 22:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422753; cv=none; b=T0hw1Lsc4USbgeOGod8b9+jMA2JV6I/uKrrJ1SjFziUefJCXcsnLNJHtSW7+0r279sJfHnJRLDWPT+FDAGJGZeKJ1zcDBQFSbdYzlE/6TSck6a4cPkjqJsfLwYxCrUrwy0oGxdgnMgsUtyw+YtHhYCu//rtFtDW3a9VxfgUoDYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422753; c=relaxed/simple;
	bh=T3lLF3/1GFy7kFU7d7/Zu/FJ1HVub4ov+wjvUfr1Sh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+0oBhL4MMbi/YOBYFNWDA/b+naJ8Uad1IY9vW/4lRj+kkhOvxUWYwCc8OHYZMez6zzv5sI61Rfq0J+j7mX/wThMNMkDys73bCXqmLonl0Y6SzHJDZMGqqt+fgLQEz8DCyqdwILgLu7gNQbUZr7dpfY5FxmduWVpE55Jagnl4mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2k2VfpU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C562EC4CEE4;
	Wed, 19 Mar 2025 22:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422753;
	bh=T3lLF3/1GFy7kFU7d7/Zu/FJ1HVub4ov+wjvUfr1Sh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o2k2VfpUyj+4XTWMrT22dHk32KCRMrbPykFE0dBH7Vj+Ww/L+1IcAV7lB+rEZwG81
	 fcl/QDpdPaOrwACZi8NiScPIhlYleoJ2ZWool7WI6gqCy/Te0m8WTzDzVOVz27BDDp
	 rcGJWLV5XTJUfgrLaBu0Pe0Ceu+gZvNXToTscOaAt0fWtHfF8EgzTyoFnHZ9ka61IA
	 5Ml+0DJ1U5kJr6gd3jKpxDXDfbFslKyvu2gzMM1d4OO1uIh+g5TRgZQ+5qHQKra0Z7
	 wYU56mvWMB7mnWo55mUKaZ8FmOFrFnjpOGC+zfnWW5GotwWQCVCPxc3XZpv0mh85cr
	 47loW7rpAYBYw==
Date: Wed, 19 Mar 2025 23:19:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Robert Richter <rric@kernel.org>
Subject: Re: [PATCH v13 3/3] i2c: octeon: add block-mode i2c operations
Message-ID: <thazi6n7jwqp6xoz4p6ce7ohxts7ubhgs5h6chqsnnexbkiy3j@q6xzdrze6a6f>
References: <20250318021632.2710792-1-aryan.srivastava@alliedtelesis.co.nz>
 <20250318021632.2710792-4-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318021632.2710792-4-aryan.srivastava@alliedtelesis.co.nz>

Hi Aryan,

few nitpicks between the lines. Please send only this patch as I
have applied already patch 1 and 2.

...

> +static int octeon_i2c_hlc_block_comp_read(struct octeon_i2c *i2c, struct i2c_msg *msgs)
> +{
> +	int ret;
> +	u16 len;
> +	u64 cmd;
> +
> +	octeon_i2c_hlc_enable(i2c);
> +	octeon_i2c_block_enable(i2c);
> +
> +	/* Write (size - 1) into block control register */
> +	len = msgs[1].len - 1;
> +	octeon_i2c_writeq_flush((u64)len, i2c->twsi_base + OCTEON_REG_BLOCK_CTL(i2c));
> +
> +	/* Prepare core command */
> +	cmd = SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR | SW_TWSI_OP_7_IA;
> +	cmd |= (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
> +
> +	/* Send core command */
> +	ret = octeon_i2c_hlc_read_cmd(i2c, msgs[0], cmd);
> +	if (ret)
> +		return ret;

Do we need to disable the block mode?

> +	cmd = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
> +	if ((cmd & SW_TWSI_R) == 0)
> +		return octeon_i2c_check_status(i2c, false);
> +
> +	/* read data in FIFO */
> +	octeon_i2c_writeq_flush(TWSX_BLOCK_STS_RESET_PTR,
> +				i2c->twsi_base + OCTEON_REG_BLOCK_STS(i2c));
> +	for (u16 i = 0; i <= len; i += 8) {

Please, do not declare the iterator inside the for loop.

> +		/* Byte-swap FIFO data and copy into msg buffer */
> +		__be64 rd = cpu_to_be64(__raw_readq(i2c->twsi_base + OCTEON_REG_BLOCK_FIFO(i2c)));
> +
> +		memcpy(&msgs[1].buf[i], &rd, min(8, msgs[1].len - i));
> +	}
> +
> +	octeon_i2c_block_disable(i2c);
> +	return ret;
> +}

...

>  #define OCTEON_REG_SW_TWSI(x)		((x)->roff.sw_twsi)
>  #define OCTEON_REG_TWSI_INT(x)		((x)->roff.twsi_int)
>  #define OCTEON_REG_SW_TWSI_EXT(x)	((x)->roff.sw_twsi_ext)
>  #define OCTEON_REG_MODE(x)		((x)->roff.mode)
> +#define OCTEON_REG_BLOCK_CTL(x)	(x->roff.block_ctl)
> +#define OCTEON_REG_BLOCK_STS(x)	(x->roff.block_sts)
> +#define OCTEON_REG_BLOCK_FIFO(x)	(x->roff.block_fifo)

Please use the ((x)->...) form.

Andi

>  
> -/* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
> +/* TWSX_MODE register */
>  #define TWSX_MODE_REFCLK_SRC	BIT(4)
> +#define TWSX_MODE_BLOCK_MODE	BIT(2)
>  #define TWSX_MODE_HS_MODE	BIT(0)
>  #define TWSX_MODE_HS_MASK	(TWSX_MODE_REFCLK_SRC | TWSX_MODE_HS_MODE)

