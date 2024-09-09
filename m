Return-Path: <linux-i2c+bounces-6437-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BC6972251
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 21:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F29CB21764
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 19:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4A4189919;
	Mon,  9 Sep 2024 19:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pIfKBCsA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F6B17588;
	Mon,  9 Sep 2024 19:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725908799; cv=none; b=jvC22U5IeBzdX6RMaIHj1DXKocI4LIoX9TlXV7iL81gmqb5wjpoY31pS32Ivyea9djnQuyEqVNh7TJDEbwKnVuaVKANfjCLbh46eU9T9WwsMF06gcNa1NPoHQ6/VkHQBKU7CY65Ys9Sk7mO7XdXRwQOdq4zgOIqsS/D/by2I43w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725908799; c=relaxed/simple;
	bh=5ThRJflPXE6KJw7a2DDSY/GO/asnYtYQ8ZStwKMJb6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Za9C6PgezYmdvAoMhrb15kECnj86XxTk4fOImJPDs75a5vHeA+HViSQLdi442UeUN2g4r6wfciSrUKdm2PEI+7rGsDDOr9NpMdYJQZwbZhcfaS91ZG+bOUScPfXq8mBU0ZTd+S3V2gRPZ9pvWd3+XeWwVPxvi3zePQ13TpSF01I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pIfKBCsA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF69C4CEC5;
	Mon,  9 Sep 2024 19:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725908798;
	bh=5ThRJflPXE6KJw7a2DDSY/GO/asnYtYQ8ZStwKMJb6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pIfKBCsAxHsYkO4hk/cM3D7gkSwKYA8+W4QizREIKOU6OLCYvDtsW/puBC4KlBvpJ
	 4KHAoignLu++M9V8T4f0uk8lukIikb7ZRJsnuY1UPsy5TVkQQ/zYO/hgbLu8+cWQYp
	 3jNXudfAdwlXzKAkakYWMMK7Ww+p3APighe0qWtO77coQ9ycfyP87kC3gH+82DCW5k
	 GJ1p1xsM10mm9bPb5Yj0Kx4NrAjk/jqh7uBdKLFVCi+uaQitvEZhmQS206E75OBVTn
	 vCB5BCU7p4IVAzXo+7CWifMqTIazspKwc4vyCTRK7b55Ln15MDIVIM+tmwUpntB4l+
	 V5W7FSGYZKh5A==
Date: Mon, 9 Sep 2024 21:06:34 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] i2c: designware: Group all DesignWare drivers
 under a single option
Message-ID: <5x6hpbtktsqsr2tuy6ffu5acycir4ntgtzfis6r4bfzqwn3sno@3i2ccmnohsba>
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
 <20240903142506.3444628-8-heikki.krogerus@linux.intel.com>
 <o4bks5pxn5olnvobln3z2axi6jx57vz5pq2kazyzxemptbp6fb@p7qsppr7ks55>
 <20240909-jugular-cucumber-b7d9bc614f74@wendy>
 <ushhe5isjiafpiovwfj3pnsnt7th6y2a6utblhb2gsspj5rj64@rahzahx447aj>
 <20240909-sandpit-prideful-1d903230ac16@wendy>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909-sandpit-prideful-1d903230ac16@wendy>

On Mon, Sep 09, 2024 at 02:04:05PM GMT, Conor Dooley wrote:
> On Mon, Sep 09, 2024 at 02:21:32PM +0200, Andi Shyti wrote:
> > On Mon, Sep 09, 2024 at 12:22:22PM GMT, Conor Dooley wrote:
> > > On Thu, Sep 05, 2024 at 10:46:02PM +0200, Andi Shyti wrote:
> > > > On Tue, Sep 03, 2024 at 05:25:06PM GMT, Heikki Krogerus wrote:
> > > > > There are quite a few drivers and options for the DesignWare
> > > > > I2C adapter in the Kconfig. Grouping all of them under the
> > > > > I2C_DESIGNWARE_CORE. That makes the menuconfig a bit more
> > > > > easier to understand.
> > > > > 
> > > > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > 
> > > > Thanks for your patch, I can take this only after the other
> > > > patches have been taken in.
> > > 
> > > I assume then that you're expecting the prereqs to go through the
> > > various arch trees? Is this not trivial enough that you could chuck it
> > > on a dedicated branch in your tree and if, for some reason, there's a
> > > non-trivial conflict the affected could pull it in?
> > 
> > Thanks for your advice: considering that cross-domain patches are
> > difficult to handle, I appreciate any suggestion on how to deal
> > with them :-)
> 
> It's also helpful if the submitter of a series proposes what path
> patches should take upstream. I find that people all look at something
> like this and see "someone else's problem" written all over it, and
> would be perfectly happy to accept a proposal from a submitter that it
> all goes via I2C.
> 
> > Are you suggesting to set these up in a different branch and send
> > a pull request out of that branch?
> 
> What I meant was put them in a dedicated branch (so probably on top of
> -rc1 or similar) and merge that branch into your for-next branch. If
> someone then was to run into a non-trivial conflict you could tag the
> dedicated branch and they could pull it into their tree.
> 
> > I don't want here to step into other people branches if they
> > don't ack or express any thought.
> 
> Sure, I wouldn't either, but it far from abnormal for driver subsystem
> maintainer to take these sort of rename/dependency addition patches and
> the normal path for 3 of the 5 architectures affected here is via Arnd
> and I figure there's a low probability of the maintainers of those
> architectures having their feels hurt.

Thanks Conor! I will take it into i2c, then. In any case, Stephen
will check if there will be duplicates.

Thanks,
Andi

