Return-Path: <linux-i2c+bounces-2482-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C17CC886453
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 01:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 723C4283876
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 00:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1077B38D;
	Fri, 22 Mar 2024 00:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozc77ipl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD947382;
	Fri, 22 Mar 2024 00:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711067214; cv=none; b=gJiZ8IbzXqVdSOGvEdOBDJyEcwscI5nLMA6G7dksz8rJpCndabgTW+1bXtLh+MxkAsqRs6M8JGykuPCRS4w55YJwtV7Gq+XuV2vnzXfGYa7EGSMK1MNQ/Dw8LENB9IrNKc3UiO1P3aTpbeCUNa1VPsrouFP1UA/7T5BJbeXOnHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711067214; c=relaxed/simple;
	bh=S+/b9C8UrSooVTGuizt2T0F7FuVLNOtDPr0INMrpi9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Un1j40UOjegyU5AIQ+qFfQhUOEEt/pG6l4x/eolypJUQ2pIK6L71q20qN8fRBDpgzGIyDRvXFePTIZaNPfDC/t+0eua91+YxzYelVn4OFZKW7OheNM+31OYqOX/BKCJi1Esm0a9cJvtP9lpwjY0XZVpMEyzBSm0QtxepLDTxHws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozc77ipl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C76FC433C7;
	Fri, 22 Mar 2024 00:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711067214;
	bh=S+/b9C8UrSooVTGuizt2T0F7FuVLNOtDPr0INMrpi9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozc77iploED5SUTuCzYfY8RYgxnB0vY0pIS5S5EaEusjnW4UwqI5L4mQIGaki/5Uy
	 mQja67NADd3PclRQpI95ABHHThOmwLZQbFZtbkW0l17h5efdweBhETQWyHOUPT0+0W
	 8a5X5v0VcJ8aFRR61N+uEOrwA/KORGmd79Pp7T9ggbkIc7NsvZvX3p+93/e0TkktqT
	 E8Tv5a4y/vI4vB6SNegEzrLrcgHzFHk6zPiuwJHqfYqyUJU2YcNdsd3cCnf8EQJrcy
	 PppTLLm5dxYSdpgdMMkJxT1T6LIo/sEVq9brQ6NTPH8F6YSMJztNqZNPPqJ0wt5p10
	 o1VSj6qla1EBg==
Date: Fri, 22 Mar 2024 01:26:49 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Piyush Malgujar <pmalgujar@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sgarapati@marvell.com, cchavva@marvell.com, jannadurai@marvell.com
Subject: Re: [PATCH v4 2/4] i2c: thunderx: Add support for High speed mode
Message-ID: <5pv3ovaukhzhe2bh5ko7463xduqlnweiaxv2hbafc6fadynej7@aagcu7av45ov>
References: <20240223125725.1709624-1-pmalgujar@marvell.com>
 <20240223125725.1709624-3-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223125725.1709624-3-pmalgujar@marvell.com>

Hi Piyush,

On Fri, Feb 23, 2024 at 04:57:23AM -0800, Piyush Malgujar wrote:
> From: Suneel Garapati <sgarapati@marvell.com>
> 
> Support High speed mode clock setup for OcteonTX2 platforms.
> hs_mode bit in MODE register controls speed mode setup in controller

you could have called it Carl, Jim or John, but you decided to
call it hs_mode, why? Which bit? Bit 4? How setting it and
unsetting it affects the controller?

> and frequency is setup using set_clock function which sets up dividers

You mean octeon_set_clock()?

> for clock control register.

I asked you to explain better, but you just added a few words
here and there.

Please, explain what this patch really does and how does it. I do
not understand anocryms.

...

> @@ -668,7 +670,7 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
>  	 * Find divisors to produce target frequency, start with large delta
>  	 * to cover wider range of divisors, note thp = TCLK half period.
>  	 */
> -	unsigned int thp = TWSI_MASTER_CLK_REG_DEF_VAL, mdiv = 2, ndiv = 0;
> +	unsigned int ds = 10, thp = TWSI_MASTER_CLK_REG_DEF_VAL, mdiv = 2, ndiv = 0;

either you add a comment here or you give it a more meaningful
name than "ds".

>  	unsigned int delta_hz = INITIAL_DELTA_HZ;
>  
>  	bool is_plat_otx2 = octeon_i2c_is_otx2(to_pci_dev(i2c->dev));
> @@ -676,6 +678,8 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
>  	if (is_plat_otx2) {
>  		thp = TWSI_MASTER_CLK_REG_OTX2_VAL;
>  		mdiv_min = 0;
> +		if (!IS_LS_FREQ(i2c->twsi_freq))
> +			ds = 15;
>  	}

We could keep the assignments all in one place:

	if (is_plat_otx2)
		thp = ...
		mdiv_min = ...
		ds = ...
	else
		thp = ...
		mdiv_min = ...
		ds = ...

>  
>  	for (ndiv_idx = 0; ndiv_idx < 8 && delta_hz != 0; ndiv_idx++) {

...

>  #define SW_TWSI(x)	(x->roff.sw_twsi)
>  #define TWSI_INT(x)	(x->roff.twsi_int)
>  #define SW_TWSI_EXT(x)	(x->roff.sw_twsi_ext)
> +#define MODE(x)		(x->roff.mode)

A nice cleanup here is to add prefixes:

OCTEON_REG_SW_TWSI
OCTEON_REG_TWSI_INT
OCTEON_REG_SW_TWST_EXT
OCTEON_REG_MODE

MODE() is so generic. But this would be out of the scope of this
patch.

> +/* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
> +#define TWSX_MODE_HS_MASK	(BIT(4) | BIT(0))

I think it's cleaner to have different defines for bit 4 and bit
0.

Thanks,
Andi

