Return-Path: <linux-i2c+bounces-14248-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4602DC82744
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Nov 2025 21:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF6D53A8A9B
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Nov 2025 20:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EF52E2840;
	Mon, 24 Nov 2025 20:56:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37365258ECC;
	Mon, 24 Nov 2025 20:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764017779; cv=none; b=enUx7RjzVk+ELS+m1+BFJBJGto3v7VALDtkY2JL/UW3521lE5YojnvDrbs2FtJWvTDp8ir9VSCjvaXckfn95DqLWvkzgq7l8fFYdEdwMcWaIONVuK0l+fl0T5dmnNBfrmzuFQeEhKEJpsbWvuXO/Dje88lb1aFKHQYtWgPbiEng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764017779; c=relaxed/simple;
	bh=SpCQMp6KbO+5mZm+mzHaE1UtRKWdYV3Z61kjXTGbsGw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MTOZLxXH0y6BaGkWS7Ev5P1XYmkXOaWb8+n2LxOWolgQRNDMi+QeNmMV6SvbKDC3B1Af0WZjpVLaH9bGyQWjUzJib1c19pYGqVeGl0hoOt8Hv1PcR4Ra7P9+3jnElJEiSqZsvNUkP7K+A+hZ4CrVkNO8rc9tcoBERdd8jCYAg40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id E856C9200B3; Mon, 24 Nov 2025 21:49:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E213292009E;
	Mon, 24 Nov 2025 20:49:52 +0000 (GMT)
Date: Mon, 24 Nov 2025 20:49:52 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Magnus Lindholm <linmag7@gmail.com>, linux-i2c@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
    andi.shyti@kernel.org, wsa+renesas@sang-engineering.com
Subject: Re: [PATCH] i2c: i2c-elektor: Allow building on SMP kernels
In-Reply-To: <c468dc2e6f5c4ea132f2bf25e6d6976e0c317005.camel@physik.fu-berlin.de>
Message-ID: <alpine.DEB.2.21.2511242045320.36486@angie.orcam.me.uk>
References: <20251122122846.28493-1-linmag7@gmail.com> <c468dc2e6f5c4ea132f2bf25e6d6976e0c317005.camel@physik.fu-berlin.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 22 Nov 2025, John Paul Adrian Glaubitz wrote:

> > there has since been some fixes/cleanup work to get rid of cli/sti and
> 
> s/has/have/

 An ambiguity here comes from the mixture of plural and uncountable for 
"fixes" vs "... work".

> > rely on spinlocks instead (as pointed out by Wolfram Sang). Tested this
> 
> The sentence just ends after "instead". I think you meant to say "instead,
> let's allow building the driver on SMP kernels again." or something like
> that.

 FWIW I can see nothing wrong with the sentence, "... get rid of cli/sti 
and rely on spinlocks instead." seems like standard English usage to me.

  Maciej

