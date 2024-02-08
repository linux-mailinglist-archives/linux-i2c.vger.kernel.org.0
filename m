Return-Path: <linux-i2c+bounces-1667-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2658084EA09
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 22:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D1201C2362A
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 21:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D074A990;
	Thu,  8 Feb 2024 21:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxepUUUp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F32F383BA;
	Thu,  8 Feb 2024 21:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707426317; cv=none; b=STAtfnTe3CLe/ztVPN/Cw2mdMjrk24xrYR9SJifW4oEqtD9GKodlWGRG0olsIu1jfUz6cckKf/N0+6tsnuGF14ml93O4R8XgD8yi3RC8WVySviK6SYOneu6e7Aw2Jb2cVXYsWUQbIVmJ3VLD6UOZ5VaVVhQqEfa1UIfzijETLto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707426317; c=relaxed/simple;
	bh=eHD06yrD/OfXGPb/oIPIzX6rOkMWUaTi7Z630Arq8cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnE/ZbMqX0Be70tP1h3TBnWWxhJADXFz2pj6WZkj1I2PqrmwJUdFpCQa+DIZBohQ/rSyWnNy0BPcgg81IhAJ/nYyxh1a/Nipuf8yQf9zsaWXmDg8li9TzBmW4E5ZeJJMt+s6QOdoORl0lZd+j5lPW/qc7gjOs9dx2OO7zCV+cYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sxepUUUp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F747C433C7;
	Thu,  8 Feb 2024 21:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707426316;
	bh=eHD06yrD/OfXGPb/oIPIzX6rOkMWUaTi7Z630Arq8cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxepUUUpUNfUb0t9M24TX8LFcJrOec3SVk8AbnpQRHohNwweLaXLWWYq14YE80bef
	 hQ2Bh9E9nc2uLjvANKUTPK1x2aSuYChVSRpqNciLfNQXnd4ozEl6jFUOEQ96P7/d1K
	 XiuGT75AF10tuxpDVPW57VEVSqXsKx7baN50iKvmtVH9FuTtI3wQafkZBhuri18c9i
	 58BP5obnhuaxRNkLvYPLHplHAi4cLsEe0uvNGehspWDKsEEWQ3/saz5gDCBmlgoX8z
	 rQKu3EIHWZRDGfbCw7Rb9RybENCEDd+oHUkBLbp5R2oE6XRcxDV+UCeeN8k9211OMS
	 uQXvF2m40ZiGA==
Date: Thu, 8 Feb 2024 22:05:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Robert Richter <rric@kernel.org>
Cc: Piyush Malgujar <pmalgujar@marvell.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cchavva@marvell.com, sgarapati@marvell.com, 
	jannadurai@marvell.com, Jan Glauber <jan.glauber@gmail.com>
Subject: Re: [PATCH v2 0/4] i2c: thunderx: Marvell thunderx i2c changes
Message-ID: <o6ngyvj2vb5ku74r4dfipibprm4opyqpufkhpxzs3urakosj33@u7ei4447zd44>
References: <20230728120004.19680-1-pmalgujar@marvell.com>
 <20231024201440.ey7pjah7fq33mbwm@zenone.zhora.eu>
 <20231026125429.GA22428@Dell2s-9>
 <nu6py2gosmy33ge4mozuisyfyfdw6i7j4i77o6v2xudyshosso@3x3frfn5gomd>
 <ZZfjlgN9iOjz2oMx@rric.localdomain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZfjlgN9iOjz2oMx@rric.localdomain>

Hi Robert,

On Fri, Jan 05, 2024 at 12:10:14PM +0100, Robert Richter wrote:
> On 04.01.24 23:06:35, Andi Shyti wrote:
> > On Thu, Oct 26, 2023 at 05:54:29AM -0700, Piyush Malgujar wrote:
> > > On Tue, Oct 24, 2023 at 10:14:40PM +0200, Andi Shyti wrote:
> > > > On Fri, Jul 28, 2023 at 05:00:00AM -0700, Piyush Malgujar wrote:
> 
> > > > >  drivers/i2c/busses/i2c-octeon-core.c     | 96 ++++++++++++++++++------
> > > > >  drivers/i2c/busses/i2c-octeon-core.h     | 27 +++++++
> > > > >  drivers/i2c/busses/i2c-thunderx-pcidrv.c | 23 ++++--
> > > > >  3 files changed, 115 insertions(+), 31 deletions(-)
> > > > 
> > > > I was going through the patches that failed to receive an answer,
> > > > is this series still valid? Do you still need a round of review
> > > > here?
> > > > 
> > > > Andi
> > > 
> > > Hi Andi,
> > > 
> > > Yes, these patches are still valid. These have been acked by you
> > > and were waiting to get reply from Robert.
> > > Please review the patches.
> > 
> > sorry for the very late response... I guess we won't receive any
> > answer from Robert... do you mind respinning the series as this
> > doesn't apply anymore?
> 
> I would prefer if someone from Marvell could take over maintainership
> for those ThunderX drivers.

As long as it will be

CAVIUM I2C DRIVER
M:      Robert Richter <rric@kernel.org>
S:      Odd Fixes
W:      http://www.marvell.com
F:      drivers/i2c/busses/i2c-octeon*
F:      drivers/i2c/busses/i2c-thunderx*

people will refer to you about this driver. If you really don't
want to be referred to these patches you can consider removing
the entry or I can do it for you.

Meantime, I can accept candidates from Marvell/Cavium.

Andi

