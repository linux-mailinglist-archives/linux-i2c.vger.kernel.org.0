Return-Path: <linux-i2c+bounces-5302-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B908C94EC04
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 13:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC06C1C214FB
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 11:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5242A176FC5;
	Mon, 12 Aug 2024 11:45:11 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2361716EB6F;
	Mon, 12 Aug 2024 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723463111; cv=none; b=lyyn3dihxDCUnkTylMSxrKxRr35zwTHDgzo9P1ZtFutn1wHeGvYdAHM+UrZUnjH6XWsK5ikCDy1R3v34mmQKben1may8+O1wrZPbl69RYJoLi1bf+HME9CSaODb1bUHn4n75MSUAeHxnLkH0BL6xX/7b/1oeP6UL1Ok0MZ+bqUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723463111; c=relaxed/simple;
	bh=uOL+xRrpDRKsfJnu12xst1gJUwPVFXoBXx7bQuZiBOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPtuvdiGVHW/xB4L0Y8RljmAD7yBIz6HS6PBu8qgDggHW5hQ1pUCn3xfeOmyososqV8wc/xbujv/IWza9NFFlm0vX8tgJe//p4yVGeSzy79GtWz3XtIxyIOdJmPSlxMCLeaHKYoEnvOGMTDdpsrfRstL+tGokQ46uAqFCz4srck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu; spf=none smtp.mailfrom=freedom.csh.rit.edu; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=freedom.csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 325F2457363D;
	Mon, 12 Aug 2024 07:45:02 -0400 (EDT)
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rPLnRiNy7L2I; Mon, 12 Aug 2024 07:45:01 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id A9B50457328D;
	Mon, 12 Aug 2024 07:45:01 -0400 (EDT)
Date: Mon, 12 Aug 2024 07:45:00 -0400
From: Mary Strodl <mstrodl@freedom.csh.rit.edu>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
	linux-mm@kvack.org, lee@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH v3 1/2] x86: Add basic support for the Congatec CGEB BIOS
 interface
Message-ID: <Zrn1vNgn7q5npxU7@freedom.csh.rit.edu>
References: <20240808183527.3950120-1-mstrodl@csh.rit.edu>
 <20240808183527.3950120-2-mstrodl@csh.rit.edu>
 <ft2lkhphs25xmvmpbf5ssuafdnmkdnq5j7uqb6jjy6ewnwzn2l@6uoad3ii3h4m>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ft2lkhphs25xmvmpbf5ssuafdnmkdnq5j7uqb6jjy6ewnwzn2l@6uoad3ii3h4m>

Hi Andi,

On Fri, Aug 09, 2024 at 01:46:44AM +0100, Andi Shyti wrote:
> If you use the SPDX identifier you don't need to mention the GPL
> parts here.

Gotcha, will remove the GPL blurb in next series

> the include files are normally alphabetically sorted.

Will-do!

> I'm counting too many global variables here and too many global
> structure definitions. It might get a bit hard to follow.
> 
> I'd suggest to simplify this part as much as possible and keep
> everything in as less structures as possible (ideally just one). 
> 
> Please make local as many variables as you can.

I don't disagree with you here. Unfortunately everything between
the pack(push, 4) and pack(pop) needs to stay, since those are
the BIOS's ABI. I'd be open to putting them in a header file or
something though, but I wasn't sure what convention was on stuff like that.

What do you think? I think moving the BIOS ABI and maybe the over-the-wire
types (struct cgeb_request and friends) out would probably make it much
easier to follow.

> just return -EBUSY
Will-do!

> when you use constants like "5", you need to give it an
> explanation, either as a define (the name speaks by itself) or a
> comment. We don't want people asking "why 5?" :-)
I genuinely don't remember how this loop got into it. I'll see if it
behaves well without the loop.

> You either use brackets for every if/else/else fi or for no one.
Gotcha. I think I fixed all of them, will be in next series.

> just return err
Will-do!

> 
> > +
> > +	/* Wait for a response to the request */
> > +	err = wait_for_completion_interruptible_timeout(
> > +		&req->done, msecs_to_jiffies(20000));
> > +	if (err == 0) {
> > +		pr_err("CGEB: Timed out running request of type %d!\n",
> > +		       msg.type);
> > +		err = -ETIMEDOUT;
> 
> just "return -ETIMEDOUT;" and you can cleanup the code below
Here's where I landed on that:

/* Wait for a response to the request */
err = wait_for_completion_interruptible_timeout(
	&req->done, msecs_to_jiffies(20000));
if (err == 0) {
	pr_err("CGEB: Timed out running request of type %d!\n",
	       msg.type);
	return -ETIMEDOUT;
} else if (err < 0) {
	return err;
} else {
	err = 0;
}

Unfortunately, I do still need to handle the err < 0 case,
but this is a little cleaner than it was.

> brackets!
Will-do

> I don't see any need for the out: label
Removed

> here it can be useful to have a goto statement:
> 
> 	goto out;
> 	...
> 	out:
> 		mutex_unlock(...);
> 		return;

Will-do!

Thanks again for taking the time to review.

