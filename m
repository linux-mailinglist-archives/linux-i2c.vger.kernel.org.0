Return-Path: <linux-i2c+bounces-7164-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C997398CF11
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 10:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A680B239FA
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 08:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4C9194C67;
	Wed,  2 Oct 2024 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTlYYcBV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180AC1940BC;
	Wed,  2 Oct 2024 08:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727858544; cv=none; b=COMv3Qrw05HaG/JhAZj7aXvc7sY+YvOeLofZdIlKsNaJCrWQVNSDoWUJyhZH0rhCVQLs2pIWCU+jdDX4/LwagkpsQsm4mmXPPFsL6N102oinrg/oscPPzHUwYt00x/5MP89jf4oZlnHwY5vCByxXJggLheSyWl9P/YZYisumDpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727858544; c=relaxed/simple;
	bh=cDPhx8w45rGUFEl36RE2AtCWblzak7ngHuy8Z5ADAMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfEBo5sU3auOO1TEHPBk+HYcih9glNq3Z4uZFp2e/EhyNOcHrFBIxZ1RPfDFqcQOddY/Q+v1wRNTmhaEtnliwikJLm2J60B71gRk5fdFkV8G2Gm2o+15T3zxAjPKY3rcH+bdlWSgkOZBeD9vhXbd2n9TgqjWKyqJGhaLSJKmezo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTlYYcBV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D380C4CECE;
	Wed,  2 Oct 2024 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727858543;
	bh=cDPhx8w45rGUFEl36RE2AtCWblzak7ngHuy8Z5ADAMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTlYYcBVXHtRNhy6LC7Oo34hs3AqZ56T/9WJ8wDZwPxrRwSBCFMyZ7+JbP1eBxa3g
	 HhUru/CABQm46ajGnTmI7yFEatha1ZkMMFH0L0Su2HVE5bKbIOyX0L3j2x9McRuzvn
	 S/5Bx7c4bqGfDibDZJ61gK1o/dN4QaLdZdxsiPawdLCE+kKD9ejOqWAb/KkjsR+j8d
	 ct1Hw7m1nzjxBpc6ODPNutn+DeAt+R2e34z7QZqM/loqX2ayOpYXVgHtVvIP3l0uZ3
	 QSpEOgNY/WoyiFfgzG+iNaagt17PpqlsD3M/hwWCfOrysFLDPfWusd73RLkQz+gup3
	 jZBsWEjlDQqRg==
Date: Wed, 2 Oct 2024 10:42:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Wolfram Sang <wsa@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-core: actually use repeated sends
Message-ID: <cnmnr23sif5trz3hiy6swzlyt36dbbemwdyxsqbjmn2nv33mgc@byu4yu4panyi>
References: <20240930-uneasy-dorsal-1acda9227b0d@spud>
 <jzkzcnd5rdprxpw734ppcr5ti23qkppfxs55nse36wcqxff7e3@4ea2lyl7feoo>
 <20241001-boring-livestock-0158ccc3fa88@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-boring-livestock-0158ccc3fa88@spud>

Hi Conor,

On Tue, Oct 01, 2024 at 02:02:18PM GMT, Conor Dooley wrote:
> On Tue, Oct 01, 2024 at 02:45:20PM +0200, Andi Shyti wrote:
> > Hi Conor,
> > 
> > On Mon, Sep 30, 2024 at 02:38:27PM GMT, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > At present, where repeated sends are intended to be used, the
> > > i2c-microchip-core driver sends a stop followed by a start. Lots of i2c
> > > devices must not malfunction in the face of this behaviour, because the
> > > driver has operated like this for years! Try to keep track of whether or
> > > not a repeated send is required, and suppress sending a stop in these
> > > cases.
> > > 
> > > Fixes: 64a6f1c4987e ("i2c: add support for microchip fpga i2c controllers")
> > 
> > I don't think the Fixes tag is needed here if everything worked
> > until now, unless you got some other device that requires this
> > change and you need to explain it.
> 
> I think the fixes tag is accurate, because it only happened to work on
> the limited set of devices I and others tried. This patch came about cos
> I got reports of it being broken in 6.6
> 
> > If this is more an improvement (because it has worked), then we
> > shouldn't add the Fixes tag.
> > 
> > In any case, when patches are going to stable, we need to Cc
> > stable too.
> > 
> > Cc: <stable@vger.kernel.org> # v6.0+
> > 
> > (This is specified in the
> > Documentation/process/stable-kernel-rules.rst and I'm starting to
> > enforce it here).
> 
> Yah, some maintainers want to add the tags themselves, so got into a
> (bad?) habit of leaving them out. I can add it if there's a v2.

I started adding them already from a few releases and this is the
first time I am writing it.

I won't cry if someone doesn't add it :-)

> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > ...
> > 
> > > +	/*
> > > +	 * If there's been an error, the isr needs to return control
> > > +	 * to the "main" part of the driver, so as not to keep sending
> > > +	 * messages once it completes and clears the SI bit.
> > > +	 */
> > > +	if (idev->msg_err) {
> > > +		complete(&idev->msg_complete);
> > > +		return;
> > > +	}
> > > +
> > > +	this_msg = (idev->msg_queue)++;
> > 
> > do we need parenthesis here?
> 
> I suppose not, do you want a v2 if that's the only change?

No need.

> > 
> > ...
> > 
> > > +	/*
> > > +	 * The isr controls the flow of a transfer, this info needs to be saved
> > > +	 * to a location that it can access the queue information from.
> > > +	 */
> > > +	idev->restart_needed = false;
> > > +	idev->msg_queue = msgs;
> > > +	idev->total_num = num;
> > > +	idev->current_num = 0;
> > > +
> > > +	/*
> > > +	 * But the first entry to the isr is triggered by the start in this
> > > +	 * function, so the first message needs to be "dequeued".
> > > +	 */
> > > +	idev->addr = i2c_8bit_addr_from_msg(this_msg);
> > > +	idev->msg_len = this_msg->len;
> > > +	idev->buf = this_msg->buf;
> > > +	idev->msg_err = 0;
> > > +
> > > +	if (idev->total_num > 1) {
> > > +		struct i2c_msg *next_msg = msgs + 1;
> > > +
> > > +		idev->restart_needed = next_msg->flags & I2C_M_RD;
> > > +	}
> > > +
> > > +	idev->current_num++;
> > > +	idev->msg_queue++;
> > 
> > Can we initialize only once? This part is just adding extra code.
> 
> I don't agree that it is extra code, I think it is clearer like this as
> I intentionally wrote it this way.

Yes, I understood the reason. Mine was not a binding comment.

Thanks,
Andi

> > The rest looks good. I just need to know if Wolfram has some more
> > observations here.
> > 
> > Thanks,
> > Andi



