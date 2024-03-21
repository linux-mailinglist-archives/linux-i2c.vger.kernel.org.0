Return-Path: <linux-i2c+bounces-2481-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB0588637C
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 23:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 464E4282F93
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 22:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0846B17CD;
	Thu, 21 Mar 2024 22:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXiwt3xB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F2C134C0;
	Thu, 21 Mar 2024 22:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711061634; cv=none; b=fGemcm3QVwohmWv907yoLwux6++oTJtS+8qkC0F+PICSXV00TPIBoAzXl8wxMBrfgxP4VGsv53yn/3GN89vBtiiWrFhLBTGrLHUPXH6rnzNlEOJLwhYjCdT5OJH+IhJjpmd1b8gzXqB1AZOMLjJJ0qJsueiy81EVp18qQq+ArWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711061634; c=relaxed/simple;
	bh=ZPHZiEa5EbqW8NwgOUF5hHogJDKIi4bWg4M8GCkw1Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3qyt4cqPwKwpVFheHCAYg2x6QyhpG1/dZDa+5wpAAUlvohmhu9dVSMqwXyMCGscDKQZ+MPxMf2UCn4z0Kvh3O554k7T617ziplCdhe54JEjiyFb/KZipn8UzIyTnNeQlBmUxQJMWKAy523XukJbKnmMcGPn5Ydg25CvDxi2iXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXiwt3xB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5061C433C7;
	Thu, 21 Mar 2024 22:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711061634;
	bh=ZPHZiEa5EbqW8NwgOUF5hHogJDKIi4bWg4M8GCkw1Pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tXiwt3xBpjhSWlgZPyKMvzvE2aNOTe60WeIwISxaN6WnwTQ/5aOfexiVY/ftmOrLA
	 OgYU9TpiA0mHcvxTLK4Pay1xSOXfsgerSTnlzdhDMNS0JqTEDU1hxCRPL9mXnCW1Q5
	 +VIzP9MLn3Ntpy1c/SGzhzrz5rK0kU0bXEeoQgvuqhb0abP3DMXJ50eFZpG76EL425
	 Wbq7pkqyfXzFXoM2N+E7SOEuHh854VcYKBb0Fvghco3GXQ8e/gNFa1vTGcSC/CMQcE
	 VCrsBauGbn+6asd/uIw53tjdpa8xurW3cYi4n1aU0Bu2sD17u5yJsT970ls+dCRjcW
	 maI5vqBw1npTQ==
Date: Thu, 21 Mar 2024 23:53:50 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Piyush Malgujar <pmalgujar@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sgarapati@marvell.com, cchavva@marvell.com, jannadurai@marvell.com
Subject: Re: [PATCH v4 1/4] i2c: thunderx: Clock divisor logic changes
Message-ID: <plzzqgrfs6m5a7mfizzuu2rf4yqt4fgecelvlc4ibthvocokbj@r6iwu46wryku>
References: <20240223125725.1709624-1-pmalgujar@marvell.com>
 <20240223125725.1709624-2-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223125725.1709624-2-pmalgujar@marvell.com>

Hi Piyush,

looks good, just a few little things.

...

> +#define INITIAL_DELTA_HZ	1000000
> +#define TWSI_MASTER_CLK_REG_DEF_VAL	0x18
> +#define TWSI_MASTER_CLK_REG_OTX2_VAL	0x3

nit: we can have a better alignment here

#define INITIAL_DELTA_HZ		1000000
#define TWSI_MASTER_CLK_REG_DEF_VAL	0x18
#define TWSI_MASTER_CLK_REG_OTX2_VAL	0x03

...

>  void octeon_i2c_set_clock(struct octeon_i2c *i2c)
>  {
>  	int tclk, thp_base, inc, thp_idx, mdiv_idx, ndiv_idx, foscl, diff;
> -	int thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = 1000000;
> +	unsigned int mdiv_min = 2;
> +	/*
> +	 * Find divisors to produce target frequency, start with large delta
> +	 * to cover wider range of divisors, note thp = TCLK half period.
> +	 */
> +	unsigned int thp = TWSI_MASTER_CLK_REG_DEF_VAL, mdiv = 2, ndiv = 0;
> +	unsigned int delta_hz = INITIAL_DELTA_HZ;
> +
> +	bool is_plat_otx2 = octeon_i2c_is_otx2(to_pci_dev(i2c->dev));

nit: please, don't leave space between variable declaration.
nit: please make important assignments not during the
     declaration, but on a different line.

...

> +/**
> + * octeon_i2c_is_otx2 - check for chip ID
> + * @pdev: PCI dev structure
> + *
> + * Returns TRUE if OcteonTX2, FALSE otherwise.

/TRUE/true/, /FALSE/false/

Can you please write it a bit better? At the end this becomes
documentation. Something like:

"Returns true if the device is an OcteonTX2, false otherwise."

> + */
> +static inline bool octeon_i2c_is_otx2(struct pci_dev *pdev)
> +{
> +	u32 chip_id = (pdev->subsystem_device >> 12) & 0xF;

You could use the bitops helpers here. I never remember which one
is the right one, if I remember correctly FIELD_GET() should be
the right one.

Andi

