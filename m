Return-Path: <linux-i2c+bounces-1139-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3894482528F
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 12:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF7621F23CE1
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 11:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568FC28E12;
	Fri,  5 Jan 2024 11:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rzJ9yVM4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C8228DAF;
	Fri,  5 Jan 2024 11:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56CAAC433C7;
	Fri,  5 Jan 2024 11:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704453020;
	bh=O+cAie+Pp6x6gTv9o75/G3gwaNt+TefRyCNwy4EBW4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rzJ9yVM4QHkwqj+tqXnWuUJRFibxyjwfRvVOFIVlxUGDzoxwIQjAtn8QszmiHKrBC
	 FzlAWmzxJU77B6m1k/QnL6ggqh0QUsUyLOr/xk7a6YWPI1tGUxHR65bSX14+G5ItM8
	 Nf2ayszhWyf011L+iC5wmqm8HWIfjgklKMazb37KqPGK0kJGJfx+zRMek/nkNLesi1
	 xFbYuCUd3+LgGdnaQMVluKsu4dV4vdur6zwlecKQo1bmb0hmmad+YTlta/SK95z6Ar
	 RbMeOaYjs32bMk/RZyLfj2ezqEOJKCPasFVJKZw9AgzDzVdkGvXW4us9XbsvHNNdQP
	 Drqc6feGsdN9w==
Date: Fri, 5 Jan 2024 12:10:14 +0100
From: Robert Richter <rric@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Piyush Malgujar <pmalgujar@marvell.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, cchavva@marvell.com,
	sgarapati@marvell.com, jannadurai@marvell.com
Subject: Re: [PATCH v2 0/4] i2c: thunderx: Marvell thunderx i2c changes
Message-ID: <ZZfjlgN9iOjz2oMx@rric.localdomain>
References: <20230728120004.19680-1-pmalgujar@marvell.com>
 <20231024201440.ey7pjah7fq33mbwm@zenone.zhora.eu>
 <20231026125429.GA22428@Dell2s-9>
 <nu6py2gosmy33ge4mozuisyfyfdw6i7j4i77o6v2xudyshosso@3x3frfn5gomd>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nu6py2gosmy33ge4mozuisyfyfdw6i7j4i77o6v2xudyshosso@3x3frfn5gomd>

On 04.01.24 23:06:35, Andi Shyti wrote:
> On Thu, Oct 26, 2023 at 05:54:29AM -0700, Piyush Malgujar wrote:
> > On Tue, Oct 24, 2023 at 10:14:40PM +0200, Andi Shyti wrote:
> > > On Fri, Jul 28, 2023 at 05:00:00AM -0700, Piyush Malgujar wrote:

> > > >  drivers/i2c/busses/i2c-octeon-core.c     | 96 ++++++++++++++++++------
> > > >  drivers/i2c/busses/i2c-octeon-core.h     | 27 +++++++
> > > >  drivers/i2c/busses/i2c-thunderx-pcidrv.c | 23 ++++--
> > > >  3 files changed, 115 insertions(+), 31 deletions(-)
> > > 
> > > I was going through the patches that failed to receive an answer,
> > > is this series still valid? Do you still need a round of review
> > > here?
> > > 
> > > Andi
> > 
> > Hi Andi,
> > 
> > Yes, these patches are still valid. These have been acked by you
> > and were waiting to get reply from Robert.
> > Please review the patches.
> 
> sorry for the very late response... I guess we won't receive any
> answer from Robert... do you mind respinning the series as this
> doesn't apply anymore?

I would prefer if someone from Marvell could take over maintainership
for those ThunderX drivers.

Thanks,

-Robert

