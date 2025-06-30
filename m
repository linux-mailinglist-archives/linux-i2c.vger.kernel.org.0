Return-Path: <linux-i2c+bounces-11710-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F61AEE6AE
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 20:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5A993A9178
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 18:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B484C20103A;
	Mon, 30 Jun 2025 18:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozpNjsOB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8A772613;
	Mon, 30 Jun 2025 18:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751307693; cv=none; b=d7MDoSW4nAH0Zmp9PvryPXdUfgnNcYf/HPpqUS5oT3vkg3ciC5fiOl0DGgjLoUoLaz8UK1yA/1nXy/riqi6K8vLe2jMDy1S8/aAya0V0q8jDNtLYROOILZPr4iYhmoGE98/PhQxNc8I0eaRLP5KB/gdLQg9bnm+jXajEqCoFOeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751307693; c=relaxed/simple;
	bh=D7SvIQ7qLfmf890GvUDMQhyat5rR4m9URDnsk2eGFM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NU0KW3bYQ0if/dxPUiiqRy0j/fK++zV/d/el20pTuekQ+/MZgB2c/Vev8WRkBwEQzhwbBDuuqC4+c9DmodIY7uD329+QiTzZDPPSMZh4aYy2iHJyaiEFbSH1mLkKXbs8O3Acft2VFF1svgT+EItqgTO6t8NrfZ0dt3YmdECpfOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozpNjsOB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6084BC4CEE3;
	Mon, 30 Jun 2025 18:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751307693;
	bh=D7SvIQ7qLfmf890GvUDMQhyat5rR4m9URDnsk2eGFM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozpNjsOBNIKuNYC69dz92zeAA3vVXStX5Vq5qo+PHmb6L1VoXpVXVkjtCtBeyePj3
	 I75KQDUH2xC1bM7SIqh7vpU3N30dggu/r6b+80AH+o48/lGoymnDaSbJ7xvyCoAd2m
	 ZWal0TC+MQ+/SZcZ5ZJRJomC+D5k2FgToUz3Esq3xzLe0jJytYY9vmHO7FKIWtbuTa
	 cErJYvOY7SMYhJTC3IPMtSiUUgh4JUaPiAS+Ef/UpXg1mMrcrSNXMQ9Gy1jadjXyo+
	 Undfw+1Z+jRRvumiO8QCBWp87qy5/u72/KTXYhx0GbKIhmdjtY4QnJ5Dqs+mCIKzRz
	 FGuP6LUOoxhvA==
Date: Mon, 30 Jun 2025 20:21:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>, 
	"Tauro, Riana" <riana.tauro@intel.com>, "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>, 
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>, intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] i2c: designware: Add quirk for Intel Xe
Message-ID: <crx77prygiqsi4zjwjtzy2shy4agcdtvj6wcg5qjmpzzysh4j2@7fipw7rhrpmw>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
 <aF6nEOVhLURyf616@smile.fi.intel.com>
 <aF8N0dYk_WAJjvVu@intel.com>
 <aGI9C6MR8qhe0MHR@smile.fi.intel.com>
 <aGJGWFOpccaNzpni@kuha.fi.intel.com>
 <aGJg0FZK__xYGP7C@smile.fi.intel.com>
 <aGJ8GZXEzJo1IVXM@kuha.fi.intel.com>
 <aGKOSIfS2kTqeHLt@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGKOSIfS2kTqeHLt@smile.fi.intel.com>

Hi Andy,

On Mon, Jun 30, 2025 at 04:16:56PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 30, 2025 at 02:59:21PM +0300, Heikki Krogerus wrote:
> > On Mon, Jun 30, 2025 at 01:02:56PM +0300, Andy Shevchenko wrote:
> > > On Mon, Jun 30, 2025 at 11:10:00AM +0300, Heikki Krogerus wrote:
> > > > On Mon, Jun 30, 2025 at 10:30:19AM +0300, Andy Shevchenko wrote:
> > > > > On Fri, Jun 27, 2025 at 05:32:01PM -0400, Rodrigo Vivi wrote:
> > > > > > On Fri, Jun 27, 2025 at 05:13:36PM +0300, Andy Shevchenko wrote:
> > > > > > > On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:
> 
> ...
> 
> > > > > > > >  static int dw_i2c_plat_probe(struct platform_device *pdev)
> > > > > > > >  {
> > > > > > > > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> > > > > > > 
> > > > > > > > -	dev->flags = (uintptr_t)device_get_match_data(device);
> > > > > > > >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > > > > > > > -		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > > > > > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > > > > > >  
> > > > > > > >  	dev->dev = device;
> > > > > > > >  	dev->irq = irq;
> > > > > > > > +	dev->flags = flags;
> > > > > > > 
> > > > > > > Maybe I'm missing something, but why do we need these (above) changes?
> > > > > > 
> > > > > > in between, it is introduced a new one:
> > > > > > flags |= ACCESS_POLLING;
> > > > > > 
> > > > > > So, the initialization moved up, before the ACCESS_POLLING, and
> > > > > > it let the assignment to the last, along with the group.
> > > > > 
> > > > > I still don't get. The cited code is complete equivalent.
> > > > 
> > > > This was requested by Jarkko.
> > > 
> > > Okay, but why? Sounds to me like unneeded churn. Can't we do this later when
> > > required?

I don't think it makes sense to add the extra flag later as it
would be a non relevant change, so that I'm fine with having it
here.

> > You need to ask why from Jarkko - I did not really question him on
> > this one. Unfortunately his on vacation at the moment.
> 
> Yeah :-(
> 
> > I can drop this, but then I'll have to drop also Jarkko's ACK.

Just for reference, Ack is not Reviewed. If Jarkko Acks, I assume
he is OK with the general idea, not specifically with the code. I
think that if you change a bit the code without altering the
result you can keep the Ack. Up to you.

> I can give mine if it helps. The code as far as I can see is 100% equivalent.
> 
> > I think we already agreed that this function, and probable the entire
> > file, need to be refactored a bit, so would you mind much if we just
> > went ahead with this as it is?
> > 
> > I'm asking that also because I don't have means or time to test this
> > anymore before I start my vacation.
> 
> I see, then we may ask Andi and Wolfram on this. I slightly prefer to have
> no additional churn added without a good reason.

To be honest I don't really mind. I think that if we add the
extra "flag" or we don't, the amount of code is the same.

If we decide not to add the extra "flag", then we need to move
the initialization of dev->flag above or shuffle something else
around.

In the meantime:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

