Return-Path: <linux-i2c+bounces-6595-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E9C975B46
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 22:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC87E1F23946
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 20:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F58D1BB695;
	Wed, 11 Sep 2024 20:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MG03UESm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511E11BA263
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 20:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726084991; cv=none; b=vCFwh9GGTYtIlN6v2YRExLvXQqFFO92LWdbPZ1EGQnYtIlwJRtPZB/t2oPR2IYhSuNu6cCFhLtThTLiHzRvJWGmAK+hniHLJrmOnCsUq4UTzgFTh2cPrRl/MsYw/9H39rq+x48YtdrNk6x+2gUE3eruPccjhPbYiAbNsUA5M+/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726084991; c=relaxed/simple;
	bh=6Vqe7IoewbbiGxTCKw+aZVahCiDLo20/b2noXHYUjwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B94+n5MFXkzY5ad6BEc+KxvwlNMwqoMYs/NXgirEHqreQGah1rgah9UBPUKHU65Tw8KPrLuQV5miv3twUwyFFz2srRLV677XxqN1T9zy4JgNbnAXEWVRJpWQlehDJSDoop+BJHGkickXRWO0Wjc51db+ZKmD6chQr/hLuJhJNFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MG03UESm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623EEC4CECC;
	Wed, 11 Sep 2024 20:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726084989;
	bh=6Vqe7IoewbbiGxTCKw+aZVahCiDLo20/b2noXHYUjwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MG03UESmrD//qjcTs139+HuYRCYY1Ainp5cOcIpRm9ode1YaxLdKdwOfQiRxCKFGb
	 wlhC4k87rbhcLUEOTF1w8yMVLOA/uYHekMsmJoDDoz+HKOS71Zqp6GFA2fM/FVrzzL
	 BeG3CKkFxS/9fW5UOo20lJbbbPwnXJJsEIqvr1NTvGts76qhNQrygg3xQ8uG+9wq2L
	 QlqDv+u2k4jZqWwqofcB9r/07jDvRDyS+5xP879YcMYXDGlrt37cZXzxeIS8uUCTHD
	 lxHUCd8313QHgLqNyJi2db/H5mxJTG/YBY/UoSHJYUrJaQOfkipu2u8lXWD0xOTRSk
	 qnWtFKbDr2AIw==
Date: Wed, 11 Sep 2024 22:03:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Cc: "michal.simek@amd.com" <michal.simek@amd.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"ben-linux@fluff.org" <ben-linux@fluff.org>, "manikanta.guntupalli@amd.com" <manikanta.guntupalli@amd.com>
Subject: Re: [PATCH v2 1/2] i2c: xiic: Wait for TX empty to avoid missed TX
 NAKs
Message-ID: <qozzwwkibhtg6ijxq42h367brx6jrg7bdydf6xux4se2ee3lqt@4rl2z473risy>
References: <20231121180855.1278717-1-robert.hancock@calian.com>
 <20231121180855.1278717-2-robert.hancock@calian.com>
 <4x5gqlah6dfpbn2ih2gynrfdgxx7pkqyfcd7t3cle62zhyuexk@vhsdz3njvneh>
 <6206ffaf483a389dea37e5b8203f4bffd4487069.camel@calian.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6206ffaf483a389dea37e5b8203f4bffd4487069.camel@calian.com>

> > > diff --git a/drivers/i2c/busses/i2c-xiic.c
> > > b/drivers/i2c/busses/i2c-xiic.c
> > > index 71391b590ada..fd623e8ad08a 100644
> > > --- a/drivers/i2c/busses/i2c-xiic.c
> > > +++ b/drivers/i2c/busses/i2c-xiic.c
> > > @@ -772,14 +772,17 @@ static irqreturn_t xiic_process(int irq, void
> > > *dev_id)
> > >                       goto out;
> > >               }
> > > 
> > > -             xiic_fill_tx_fifo(i2c);
> > > -
> > > -             /* current message sent and there is space in the
> > > fifo */
> > > -             if (!xiic_tx_space(i2c) && xiic_tx_fifo_space(i2c) >=
> > > 2) {
> > > +             if (xiic_tx_space(i2c)) {
> > > +                     xiic_fill_tx_fifo(i2c);
> > > +             } else {
> > > +                     /* current message fully written */
> > >                       dev_dbg(i2c->adap.dev.parent,
> > >                               "%s end of message sent, nmsgs:
> > > %d\n",
> > >                               __func__, i2c->nmsgs);
> > > -                     if (i2c->nmsgs > 1) {
> > > +                     /* Don't move onto the next message until the
> > > TX FIFO empties,
> > > +                      * to ensure that a NAK is not missed.
> > > +                      */
> > > +                     if (i2c->nmsgs > 1 && (pend &
> > > XIIC_INTR_TX_EMPTY_MASK)) {
> > 
> > can "pend" be both XIIC_INTR_TX_EMPTY_MASK and
> > XIIC_INTR_TX_HALF_MASK?
> > 
> 
> It's been a while since I looked at this, but I believe it potentially
> could be.

yeah... I've been fishing patches that have been left behind :-)

> However, it seems like the behavior should still be correct -
> if the TX FIFO is empty then it is also half empty, but really the fact
> it is empty is what we care about in that situation...

oh yes, sorry, because you are chekcking for:

	if (pend & (XIIC_INTR_TX_EMPTY_MASK | XIIC_INTR_TX_HALF_MASK)) {
		...
		...
		if (... && (pend & XIIC_INTR_TX_EMPTY_MASK)) {
			...
			...
		}
		...
		...
	}

So that yes, it's possible. I misread the first 'if' :-)

Then this is good to go, I'm taking both in.

The second patch had some issues as patch formatting, but I will
take care of them.

Thanks,
Andi

