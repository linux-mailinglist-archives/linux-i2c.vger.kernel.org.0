Return-Path: <linux-i2c+bounces-1121-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB8824AB1
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 23:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 563862861F1
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 22:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE2F2D022;
	Thu,  4 Jan 2024 22:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAlrklkC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925092CCDC;
	Thu,  4 Jan 2024 22:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA3FC433C9;
	Thu,  4 Jan 2024 22:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704406000;
	bh=KhBC4o8lt9ggirKlNd4Czi4ZBXFpEOlHVQBjEI7rzrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAlrklkCMSQJ2QJxUJH4KNzNrDD4KdGJr4RSIEKdCA2Gg/w8BSUdbPoz+gdmNDPbO
	 zqAJa09kwVRoe1Tc25NzNiJVXGGsq5horcY8qzwGpUD9zttO7HnQluHwEQ6wF2nOQk
	 5pBsOs1L/lhe4nPo84+vJDdVG3z7jShfKZqyL+I5380Zy3bVlgtM4Hm5OY8crRfTFA
	 jzD2fFcO9DAYJiFpZvSC7wiUxqfQc4Tu9ly+XaxE9Whod2J9IVvAHS+sdaIjsN428P
	 aRmV5jWWUIxl6s4rcS5CDFLrpMM7RnWLnV7bzFvG2RFpBPa7+6P3y1UFM3rCRLlVdA
	 d8GBSjosYB+GQ==
Date: Thu, 4 Jan 2024 23:06:35 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Piyush Malgujar <pmalgujar@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rric@kernel.org, cchavva@marvell.com, sgarapati@marvell.com, 
	jannadurai@marvell.com
Subject: Re: [PATCH v2 0/4] i2c: thunderx: Marvell thunderx i2c changes
Message-ID: <nu6py2gosmy33ge4mozuisyfyfdw6i7j4i77o6v2xudyshosso@3x3frfn5gomd>
References: <20230728120004.19680-1-pmalgujar@marvell.com>
 <20231024201440.ey7pjah7fq33mbwm@zenone.zhora.eu>
 <20231026125429.GA22428@Dell2s-9>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026125429.GA22428@Dell2s-9>

Hi Piyush,

On Thu, Oct 26, 2023 at 05:54:29AM -0700, Piyush Malgujar wrote:
> On Tue, Oct 24, 2023 at 10:14:40PM +0200, Andi Shyti wrote:
> > Hi Piyush,
> > 
> > On Fri, Jul 28, 2023 at 05:00:00AM -0700, Piyush Malgujar wrote:
> > > The changes are for Marvell OcteonTX2 SOC family:
> > > 
> > > - Handling clock divisor logic using subsytem ID
> > > - Support for high speed mode
> > > - Handle watchdog timeout
> > > - Added ioclk support
> > > 
> > > Changes since V1:
> > > - Addressed comments, added defines as required
> > > - Removed unnecessary code
> > > - Added a patch to support ioclk if sclk not present in ACPI table
> > > 
> > > Piyush Malgujar (1):
> > >   i2c: thunderx: Adding ioclk support
> > > 
> > > Suneel Garapati (3):
> > >   i2c: thunderx: Clock divisor logic changes
> > >   i2c: thunderx: Add support for High speed mode
> > >   i2c: octeon: Handle watchdog timeout
> > > 
> > >  drivers/i2c/busses/i2c-octeon-core.c     | 96 ++++++++++++++++++------
> > >  drivers/i2c/busses/i2c-octeon-core.h     | 27 +++++++
> > >  drivers/i2c/busses/i2c-thunderx-pcidrv.c | 23 ++++--
> > >  3 files changed, 115 insertions(+), 31 deletions(-)
> > 
> > I was going through the patches that failed to receive an answer,
> > is this series still valid? Do you still need a round of review
> > here?
> > 
> > Andi
> 
> Hi Andi,
> 
> Yes, these patches are still valid. These have been acked by you
> and were waiting to get reply from Robert.
> Please review the patches.

sorry for the very late response... I guess we won't receive any
answer from Robert... do you mind respinning the series as this
doesn't apply anymore?

Thanks,
Andi

