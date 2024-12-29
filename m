Return-Path: <linux-i2c+bounces-8808-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FFB9FE0E2
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 00:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1582F160808
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 23:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2B9199935;
	Sun, 29 Dec 2024 23:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAoq/UTL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A4923BE;
	Sun, 29 Dec 2024 23:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735515762; cv=none; b=njBj/eQjqEwa77CEC824/SW1P5AtxrYld5uyNJYr+C9p8H1aF57INwcxS1dleV+a8DRtKMF6MgROBOxcuSVvtLfuPvGsNQ0UtBRogE2iDvBlN3tSZy3RPpkS9VBRPHNVYrzPJXiDo4KeCQr4bUH/sfFgZzt0aq6mjrgkZb/4YQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735515762; c=relaxed/simple;
	bh=CAR6ue2ZRcBqC9Gr3VK5ZNho7Wrvkz2j8y/FAHOwz/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQqJiJJr1yqKbnyxdZUIM4j5DEHgjmHywyGtAkVKzDk2Sg0sRKJs+Y7UHiBEy2VOxWEPwxQ4f9I48sOJv9dQB2YbKA+8YgXn4Elsz2XyFNRamX8k1YyzZCLgT1XlArYkqw0vIwl21w5EdP7mfKhxFdlCrnuThoKy9NRnzPM72mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAoq/UTL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A649C4CED1;
	Sun, 29 Dec 2024 23:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735515761;
	bh=CAR6ue2ZRcBqC9Gr3VK5ZNho7Wrvkz2j8y/FAHOwz/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AAoq/UTL0Q5nB2MWm9vxhUQwVUVUQ6IjAic3ifm5SmljZU3BRljwlc1SNKnr6pByq
	 lLYeBu+mIPKIcks+EUXKiJQ6uXNcaa+H95HfnX4P9hNLjZtwzwer/BwWe0AhteXEPt
	 7LVF6yKXJSCZrvU3oGtRc7oZm9qzzoXvARw3DPkUMUhGXQ6z6B727Mr+Lk/Pj/AIMW
	 9wY0DD7x55JfBrthcbXcfKZv1jYOywu5JvXFa0DFcKEVnBAzdgoYT2HKZIoPcomQqB
	 uaC763YnNvx5o8DSdbbgR5j7w7AZir1sS4/azzXi5mL20lEp+3yui8wOmcIGaBq5Zo
	 U2mHgpB/PU7+g==
Date: Mon, 30 Dec 2024 00:42:35 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, 
	Chris Brandt <chris.brandt@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 0/8] i2c: riic: driver cleanup and improvements
Message-ID: <vipmrjwnsm3vlv47nysmieuorbwt2gdvdvuhomq3r5b7zlr2g4@hmcb46mujxgq>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <huhbfedblerrw6koztkiij3hgdrty2oihmacug53734wctq34a@aqlgw63zj3ad>
 <Z3CMhhEyVpQjgpun@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3CMhhEyVpQjgpun@surfacebook.localdomain>

Hi Andy,

On Sun, Dec 29, 2024 at 01:40:54AM +0200, Andy Shevchenko wrote:
> Fri, Dec 27, 2024 at 11:10:22PM +0100, Andi Shyti kirjoitti:
> 
> ...
> 
> > >   i2c: riic: Use dev_err_probe in probe and riic_init_hw functions
> > >   i2c: riic: Use local `dev` pointer in `dev_err_probe()`
> > >   i2c: riic: Use BIT macro consistently
> > >   i2c: riic: Use GENMASK() macro for bitmask definitions
> > >   i2c: riic: Make use of devres helper to request deasserted reset line
> > >   i2c: riic: Mark riic_irqs array as const
> > >   i2c: riic: Use predefined macro and simplify clock tick calculation
> > >   i2c: riic: Add `riic_bus_barrier()` to check bus availability
> > 
> > merged to i2c/i2c-host.
> 
> There are some comments, up to you how to proceed, they seem not to be any
> critical.

first of all, welcome back :-)

I'd like the comments to be addressed, even if they are not
critical.

So that I'm going to remove this series for now until there are
no more questions.

Thanks for looking into this series,
Andi

