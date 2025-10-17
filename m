Return-Path: <linux-i2c+bounces-13607-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4247FBE8113
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 12:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F038A5E40CE
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 10:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E1B31064A;
	Fri, 17 Oct 2025 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LX/8vC0g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390F729BDB1;
	Fri, 17 Oct 2025 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760696962; cv=none; b=ic3WPkZ0tK1MhTSpZTVtucl/YpR60lwtKs6/pmEEMtg5uSspsM5kmcGiUoHFcC7eGSgCz5hLEfgbOiY4MkXrR/2g9EN3k6an9QhtkRLMdotN2ZqvZG6ODsbdEEnvIUwrLrmqD+qnpeIXBA18tkm6m6Tg4vm/wV5Py/KwC15A+h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760696962; c=relaxed/simple;
	bh=vV9v5uIhUTlf+FriltYV7pUb+ukR9hrkxuJfHNF0b2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmezfpFe+Pqg75WMa+kYdzpedwI/k217KKbgZZxrFxUj6/oI9U7iMALo1cNGExK1rZ8y6JCgWMT79yjqNTkbo8r8O699oHjyYdx+QVeLU2/6YaZGLXxvb3kWNOmOhpVoKftcafRBKOytAVD4yl1YV25B7lC5FJmUYzWcUFK93+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LX/8vC0g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6C8C4CEE7;
	Fri, 17 Oct 2025 10:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760696961;
	bh=vV9v5uIhUTlf+FriltYV7pUb+ukR9hrkxuJfHNF0b2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LX/8vC0gqlA7oPS9o8mUdVZWHkCEYy91LlN3K4SxDexXVaf7fAzN/Wg/0zCOTyFw6
	 uDkCj1dQZu1i14hQIhLk2iICgk+hpNc+da1RO7zIfjB+WyHGIJfzWgW4DYqANdWVHe
	 dHybxGIFs1dfnIobgI71dSoGLiDvEwMU6t5iCMwzjCSoIvjCtV30KKvObkCMQ/SxTl
	 0fw9FLj/9YSjclJBi33bTzzFsrSWa2erIao2KYxgiUIm9vfn/aMeGs1OCnMKWZ5B2/
	 fQs49yshL8RB0WXT6tCECAANlx3eBZSZMGKi438TMcnfO80USF5JdPMFgw32e3edKL
	 89DmH9QeExHiw==
Date: Fri, 17 Oct 2025 12:29:18 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>, 
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v1 0/2 RESEND] i2c: muxes: Add GPIO-detected hotplug I2C
Message-ID: <mgrmrpvqoj5ucknfbtyuu3n54r2cnrqpcvnobzj37c6tfm3qze@m7e5elocpfvu>
References: <20251013060018.43851-1-clamor95@gmail.com>
 <w3bn5bqxqjhf4uvxov47rwlvmnbic6xnlk25xbpnbmi2eyup7q@tjuiu7pl3mmo>
 <CAPVz0n1-jN5WLFq4e0CZrneExrN_A=GNeGTwGHTCj14NAta+jQ@mail.gmail.com>
 <aPCfiJxyKOXsgNJe@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPCfiJxyKOXsgNJe@shikoro>

Hi Svyatoslav,

On Thu, Oct 16, 2025 at 09:32:24AM +0200, Wolfram Sang wrote:
> > Herve and Luca did not come up with anything meaningful, they provided
> > just a few rough ideas. It will take an inconsiderate amount of time
> 
> Well, IIRC they said that your use case can be mapped onto their
> approach. Which is meaningful in my book.
> 
> > before there will be any consensus between them and schema
> > maintainers, and even more time would be requited to settle this into
> > schemas and implement into drivers. Why should I suffer from this? Why
> > should changes I need be halted due to some incomplete 'ideas'? This
> > driver uses existing i2c mux framework and fits into it just fine.
> 
> I am sorry to bring you bad news, but you need to suffer because this is
> how development goes. If I get presented a generic solution (see Herve's
> mail) and a specific solution (your driver), for this case I as a
> maintainer will prefer the generic solution. Generic solutions need more
> time because there are more things to handle, of course. This is typical
> for development, I would say, it is not Linux or Free Software specific.
> 
> I appreciate that you tackled your issue and were open to share it with
> the community. I see the work being done there. However, there are so
> many things going on independently that I can't really prevent double
> development from happening despite it having a high priority for me. As
> soon as I get aware of people working on similar issues, I connect them.
> That's what I did here as well.
> 
> So, if you want upstream supported I2C hot-plugging, you need to wait
> for Luca's and Herve's work being accepted. Or provide a superior
> solution. Or, if you want, join the ride. You already have experience in
> this field (and hardware plus use case), you would be a very welcome
> contributor, I would say.

I agree with all what is said above. I just want to add that
Herve has provided links to all his work and what I would do is
to rebase all my work on top of theirs; make sure their work
together with yours work in your system and, perhaps, merge the
series.

Please, let me know if this works.

Andi

