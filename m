Return-Path: <linux-i2c+bounces-13706-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FFFBF6C35
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 15:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76DB43AFC6A
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 13:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899ED33710C;
	Tue, 21 Oct 2025 13:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uschmAth"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D60334C38;
	Tue, 21 Oct 2025 13:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053131; cv=none; b=IID/gbBOoRD+a5V8gnJK0sEQng7xqquYxJurUuo5/Xkkvrkw8ge5+g0YqExraZfP0y1i4IAKl5IVOQlDAbohp+dshARF3nMM/bRpT7t5v0bD1o2ilgchr0HW4RKAnNB1f4dYh5fqDo3+AiuqI8FZn95kN2v/aMCLWnmHqRXi1Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053131; c=relaxed/simple;
	bh=UxdXMpBkmMYt2F6O9GJR6GOTDbEq+GfjCaarrbDuIcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDfBCh4mdK70XDW+RL8pfKQKUsX3Qn1gojP1jLmpZ8Qx4UkUjBG4rR7hxGAwRAFdPDG7QG/WbJYI8q8bzRq/RBTXIRNpo6kAfHkSX2CPE4NnEuFhkPbiFeIkoicSZdTXDsz0mQckYGK6RGnQBCGpzLVhHLEXP4BLnv/hf6YsY+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uschmAth; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2610C4CEF1;
	Tue, 21 Oct 2025 13:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761053131;
	bh=UxdXMpBkmMYt2F6O9GJR6GOTDbEq+GfjCaarrbDuIcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uschmAthkJJF9k8kw65HohAiVw4eODormgudhOZ+JwsTTMIwLd6b81t5E1UjNFy6Z
	 fkUsZ9fu18JMnNkSNxZE7XN6MAP62TfkbjeXQUMqA9L3nATor5/FUAl5m1SiMmdtbb
	 zpYiU5wCmoqKYPBTCMM2OBnrPOexV+twe/YjETCjXWpi7KaBVswMARAT6hbffEMQni
	 XuMV/K1ojumVbGg9cBqnd/5ayA70j/RXwKcDIJ71R5Dt56pR3GvkWsZzM7rEQfk1qf
	 GtYrx1IMMTR+/aqpJOvO96S29gBMN9AHDPXvjgn8+XkK18rFyo5R6w1xEzktq+WJeP
	 FpQkHk7dxqsKw==
Date: Tue, 21 Oct 2025 08:25:29 -0500
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v1 0/2 RESEND] i2c: muxes: Add GPIO-detected hotplug I2C
Message-ID: <20251021132529.GA4133357-robh@kernel.org>
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

On Thu, Oct 16, 2025 at 09:32:24AM +0200, Wolfram Sang wrote:
> Hi Svyatoslav,
> 
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

Agreed.

What really slows things down is when there is only 1 user of a new 
binding. Too many times have I accepted one only for the 2nd user to 
show up right after accepting it and wanting something different. So 
now I just require more than 1 user and it is on the submitter(s) to do 
that. After all, it is their itch, not mine.

Rob

