Return-Path: <linux-i2c+bounces-8212-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCD69D8CCA
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 20:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EA22287B47
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 19:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697F71BB6B3;
	Mon, 25 Nov 2024 19:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sznULkPU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173161B87CC;
	Mon, 25 Nov 2024 19:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732562576; cv=none; b=D1g/ty996gtBCQD/gW/YFEOQDrDaiupBoxcWPtxMTnexrlL2sokF3JOdFf6A0BtlFgW4bclL4GyQktZxslvUL1o73XNsjWViHDCPaadtrH/cKngItb6F7Tth4M3ixLCqSgz4HL/52pfeKUMqOuygsqWtFoxuiP9G9EJXLPHVSbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732562576; c=relaxed/simple;
	bh=cR+2lAqux8BQO+qUMCt4HF9pTTlAFOCVXTVfvXPCgyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDkl7+3R/RE6CTnHaTBYK6WWRgmzGW0Spe4ln+IG+l400QruxDQZu5W3Ze6LHkJyCsBiHiODy6haQDlU9SDspBkY7oErisLI+DVxGYUrAVevEutpk0amOXkWl5Ja8/9h8axUj6HSvTR067jwzAV/GUay8jlDuzHIQQPfVW+28Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sznULkPU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232C4C4CECE;
	Mon, 25 Nov 2024 19:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732562575;
	bh=cR+2lAqux8BQO+qUMCt4HF9pTTlAFOCVXTVfvXPCgyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sznULkPUYqcnIXwkdgMaSwbvbWw0jlYvp5qrC3DwrrOsYRKrGNVvwnwcM+15wVFQS
	 Xzbq9n1JanZU7fN/rQGiY51+5a5mDETpQh2ItTCPrxuThIKmUb4ShHWIFnjmoueBvK
	 Mw8h8NGE/qVkBEeGCoOhrC1Rlc9JICoj447Z9JYZPclXWg2CUqZe7Z2M/dwAFitSWi
	 Av/d8lE1QE3AfheLu/Ai6XKPHn8uz7hLl5xmiB/Qpr0hhUM6zeUlSqQRF/AyPhBYX5
	 ZMqKPBBHYq5GzArISM+aZLgMPZhfXdupLk1RoK6hrXRJ0nfN0zENicj+tL87yMJY/M
	 uzYnE2tVsSQiQ==
Date: Mon, 25 Nov 2024 20:22:52 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com, 
	michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, radhey.shyam.pandey@amd.com, srinivas.goud@amd.com, 
	shubhrajyoti.datta@amd.com, manion05gk@gmail.com
Subject: Re: [PATCH 2/2] i2c: xiic: Add atomic transfer support
Message-ID: <nseg7dpgansb6lpxj4co37duafzwiyt4spgolltuir47dedcsc@eyvam2o4o623>
References: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
 <20241011104131.733736-3-manikanta.guntupalli@amd.com>
 <d50b2caa-4d3a-4c1d-986c-6fb3c0a2f850@ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d50b2caa-4d3a-4c1d-986c-6fb3c0a2f850@ijzerbout.nl>

Hi Kees,

On Fri, Nov 22, 2024 at 10:29:27PM +0100, Kees Bakker wrote:
> Op 11-10-2024 om 12:41 schreef Manikanta Guntupalli:
> > Rework the read and write code paths in the driver to support operation
> > in atomic contexts.
> > 
> > Similar changes have been implemented in other drivers, including:
> > commit 3a5ee18d2a32 ("i2c: imx: implement master_xfer_atomic callback")
> > commit 445094c8a9fb ("i2c: exynos5: add support for atomic transfers")
> > commit ede2299f7101 ("i2c: tegra: Support atomic transfers")
> > commit fe402bd09049 ("i2c: meson: implement the master_xfer_atomic
> > callback")
> > 
> > Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> > ---
> >   drivers/i2c/busses/i2c-xiic.c | 245 +++++++++++++++++++++++++++++-----
> >   1 file changed, 212 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> > index 052bae4fc664..e5e9a4993bd4 100644
> > --- a/drivers/i2c/busses/i2c-xiic.c
> > +++ b/drivers/i2c/busses/i2c-xiic.c
> > [...]
> > +static void xiic_recv_atomic(struct xiic_i2c *i2c)
> > +{
> > +	while (xiic_rx_space(i2c)) {
> Let's remind what xiic_rx_space is
> #define xiic_rx_space(i2c) ((i2c)->rx_msg->len - (i2c)->rx_pos)
> 
> > +		if (xiic_getreg32(i2c, XIIC_IISR_OFFSET) & XIIC_INTR_RX_FULL_MASK) {
> > +			if (!i2c->rx_msg) {
> This check is suspicious. If i2c->rx_msg is NULL then the while
> above already dereferenced a NULL pointer.
> What is going on?
> > [...]
> > +}
> > [...]
> > +static void xiic_send_rem_atomic(struct xiic_i2c *i2c)
> > +{
> > +	if (!i2c->tx_msg)
> > +		goto send_atomic_out;
> > +	while (xiic_tx_space(i2c)) {
> > [...]
> > +	}
> > +send_atomic_out:
> > +	if (i2c->nmsgs > 1) {
> > +		i2c->nmsgs--;
> > +		i2c->tx_msg++;
> We can get here with i2c->tx_msg being NULL. See the first if
> in the function.

Valid point. Thanks for looking into this and thanks Wolfram for
having removed it. I read this patch several times, but I missed
it.

Andi

