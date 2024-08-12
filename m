Return-Path: <linux-i2c+bounces-5316-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4039094F809
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 22:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBBA41F219E8
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 20:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33C3191F80;
	Mon, 12 Aug 2024 20:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5QZMKWa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0C915C143;
	Mon, 12 Aug 2024 20:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723493812; cv=none; b=Zl2EZrBlPIjPG210xa3mIn1PhYUUUCoeZxapXADrOc/rhCVcyKH/jHiEH7/QX21oOFSo/SrBQUKZySYAlk4sdgzCrRGd/D2DkkWxpXN+m9WuZBfLyDqZs3NhmwgHzhOqm4Oo+iJHGTJHhP6uX/9UZMj6dTEZnXDyVZ+8amXmn5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723493812; c=relaxed/simple;
	bh=LIjLr0XWh6AeIzZ0yZULxR8mFjgXuYMZLKGdmyAkiow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RN+2Nwxk698ZbnZh6LkS+6QWQtuFVRnsWffJTAP50keFo4Rqe7g8f5RQ3dIDbzSM630RR0mkNtDQ2bDF/ZAv0w7gK3G1y9RfLV5c7W3dFVhDmvIuzksfY3ZNG4R7B+LQ7Y//IVzCvusfNsBo+ZSkdZfhMkuI91M72dQS6tX7o5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5QZMKWa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DBAC32782;
	Mon, 12 Aug 2024 20:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723493812;
	bh=LIjLr0XWh6AeIzZ0yZULxR8mFjgXuYMZLKGdmyAkiow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5QZMKWa43vbq77u9uCD03JinbZbWZV1Jo7M9DItTsyB4CC2/w6NcPq8OuMaSdtPc
	 QeRkroMmtuvzL1NuKaFvcUNkIt6tKVQyGSVHTAICnSn26q4PsyL4jrfTuXhT8uYxr6
	 E3aXunhJ7PeZ0lMnqee3MxSUytur78RH1Eylm/1Ndh0KHr/eIm7nF7VuxJ9p3ga95P
	 4Ck1iQRkw9N+1NLYpY0ksnGn5Qq3WAB9fYXomvvFiesTxoOzpW7T2bzNSssqTA5aL2
	 O5+5MKENjT4XhaXrZ9lb3JutSLd3oByTwQBd30pXzYSv/nMcJ3nfv8jzjTU8YM1e+R
	 x/Ht6Hrnm1MJw==
Date: Mon, 12 Aug 2024 21:16:47 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mary Strodl <mstrodl@freedom.csh.rit.edu>
Cc: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org, linux-mm@kvack.org, 
	lee@kernel.org, linux-i2c@vger.kernel.org, s.hauer@pengutronix.de, 
	christian.gmeiner@gmail.com
Subject: Re: [PATCH v3 1/2] x86: Add basic support for the Congatec CGEB BIOS
 interface
Message-ID: <lek2i4jpc7x257ycxeuto2op742x555a25wxdgh5lzcgtqg3lp@t7opf5nlgspt>
References: <20240808183527.3950120-1-mstrodl@csh.rit.edu>
 <20240808183527.3950120-2-mstrodl@csh.rit.edu>
 <ft2lkhphs25xmvmpbf5ssuafdnmkdnq5j7uqb6jjy6ewnwzn2l@6uoad3ii3h4m>
 <Zrn1vNgn7q5npxU7@freedom.csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zrn1vNgn7q5npxU7@freedom.csh.rit.edu>

Hi Mary,

> > I'm counting too many global variables here and too many global
> > structure definitions. It might get a bit hard to follow.
> > 
> > I'd suggest to simplify this part as much as possible and keep
> > everything in as less structures as possible (ideally just one). 
> > 
> > Please make local as many variables as you can.
> 
> I don't disagree with you here. Unfortunately everything between
> the pack(push, 4) and pack(pop) needs to stay, since those are
> the BIOS's ABI. I'd be open to putting them in a header file or
> something though, but I wasn't sure what convention was on stuff like that.
> 
> What do you think? I think moving the BIOS ABI and maybe the over-the-wire
> types (struct cgeb_request and friends) out would probably make it much
> easier to follow.

mine was a guess, actually... if you see that my comment doesn't
fit, feel free to ignore it.

As I said I didn't look in details all the structures and their
dependencies.

> > > +
> > > +	/* Wait for a response to the request */
> > > +	err = wait_for_completion_interruptible_timeout(
> > > +		&req->done, msecs_to_jiffies(20000));
> > > +	if (err == 0) {
> > > +		pr_err("CGEB: Timed out running request of type %d!\n",
> > > +		       msg.type);
> > > +		err = -ETIMEDOUT;
> > 
> > just "return -ETIMEDOUT;" and you can cleanup the code below
> Here's where I landed on that:
> 
> /* Wait for a response to the request */
> err = wait_for_completion_interruptible_timeout(
> 	&req->done, msecs_to_jiffies(20000));
> if (err == 0) {
> 	pr_err("CGEB: Timed out running request of type %d!\n",
> 	       msg.type);
> 	return -ETIMEDOUT;
> } else if (err < 0) {
> 	return err;
> } else {

you don't ened anymore for this else, at the end, but this looks
correct.

Thanks,
Andi

