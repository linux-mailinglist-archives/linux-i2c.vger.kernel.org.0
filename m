Return-Path: <linux-i2c+bounces-6401-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD8971933
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 14:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FF2C1C21F67
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 12:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7001B78F3;
	Mon,  9 Sep 2024 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EeF1p8Q+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13611779B8;
	Mon,  9 Sep 2024 12:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725884496; cv=none; b=BtNiU0oPpZk97sKrMU8oUcFN0iKCDZmhUKSp8N5vHe23XZWAEyaXDf5lKUwF9Xa8XFEgxuMyRla6ZDBFzg70zD6R9wghJYeH0CrnnzS2pHOHp8och6+ysx7UmIeKqlos+ji1VNR0cdon8CRwYVGN6cK23vmcpNPU3Bb0EICTmL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725884496; c=relaxed/simple;
	bh=+j4c2FnbKzaeZQusCAPsNNHhxgaAnb0pHFCji9zGklw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tda3ctjU6TJiY82KDqcaJHheysNkdgW24+LSpkElreJoVLKkkQMUiGn7kc6/e3BtsiFjj9uiHJ5kA0p4FSL/2FCayWOzlCSxmSSr9VJyPtnCcE3U4X6bDqg/ASIIGrMvpxUe3xR3WgzdZkzT1fDGu2igQeeGSD1/7NjQ4O8jGRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EeF1p8Q+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DC8C4CEC5;
	Mon,  9 Sep 2024 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725884495;
	bh=+j4c2FnbKzaeZQusCAPsNNHhxgaAnb0pHFCji9zGklw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EeF1p8Q+lJFUlIrFIAsr8VFtZQ5WsqQ8dBAMdqnkMfow32tNsMoTpstMhhLpAaIhR
	 5PFre2mdjB2Zb/xfOospzFd1n3MxffNzuJOmHk+AS0okUxGhFcFRitqFAuxaEDFTC/
	 jZykuXpKTJzENbOICL2kRzbIX0qSbtfJBstVqbfDnAX0nBF0TMb3GDicqzAfXTXw3h
	 6DonIgwPiaWMP12vrPTqkPj5Q2jZt1eC2HqGIttIuKQZL2IRkPh3JskBKtZYO/S6yX
	 J3dl/U+/CL42DN9rW9yyEpnpSk7T07yCVjcBYrob/GvA/sQwvE1mzJDXSWCelNnefi
	 jzbgaDUEC0acQ==
Date: Mon, 9 Sep 2024 14:21:32 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] i2c: designware: Group all DesignWare drivers
 under a single option
Message-ID: <ushhe5isjiafpiovwfj3pnsnt7th6y2a6utblhb2gsspj5rj64@rahzahx447aj>
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
 <20240903142506.3444628-8-heikki.krogerus@linux.intel.com>
 <o4bks5pxn5olnvobln3z2axi6jx57vz5pq2kazyzxemptbp6fb@p7qsppr7ks55>
 <20240909-jugular-cucumber-b7d9bc614f74@wendy>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909-jugular-cucumber-b7d9bc614f74@wendy>

Hi Conor,

On Mon, Sep 09, 2024 at 12:22:22PM GMT, Conor Dooley wrote:
> On Thu, Sep 05, 2024 at 10:46:02PM +0200, Andi Shyti wrote:
> > Hi Heikki,
> > 
> > On Tue, Sep 03, 2024 at 05:25:06PM GMT, Heikki Krogerus wrote:
> > > There are quite a few drivers and options for the DesignWare
> > > I2C adapter in the Kconfig. Grouping all of them under the
> > > I2C_DESIGNWARE_CORE. That makes the menuconfig a bit more
> > > easier to understand.
> > > 
> > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > 
> > Thanks for your patch, I can take this only after the other
> > patches have been taken in.
> 
> I assume then that you're expecting the prereqs to go through the
> various arch trees? Is this not trivial enough that you could chuck it
> on a dedicated branch in your tree and if, for some reason, there's a
> non-trivial conflict the affected could pull it in?

Thanks for your advice: considering that cross-domain patches are
difficult to handle, I appreciate any suggestion on how to deal
with them :-)

Are you suggesting to set these up in a different branch and send
a pull request out of that branch?

I don't want here to step into other people branches if they
don't ack or express any thought.

Andi

