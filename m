Return-Path: <linux-i2c+bounces-5056-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7335093AA20
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jul 2024 02:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E4481C226E9
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jul 2024 00:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389522595;
	Wed, 24 Jul 2024 00:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B6s/WTDW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F8323A9;
	Wed, 24 Jul 2024 00:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721780170; cv=none; b=WVWDDO+rSHrlTgon03wPOxV8AeB69Ki0VHjm68WstMJAkFutrtIYTlq7bc4iPGMJRpo61pUFcIXL0C+o+Ldbar2cLS7gFtJVGP4tb6WoxhEV9f5NTTvk56hKUrK6rfHlITTiWav4dWRNkl+MAAaIdhN3DuD1ylNsSLk+zz0T7KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721780170; c=relaxed/simple;
	bh=wqyFpyf6PrzKEVik7xeRK0++sjEqWq5lBT4FsmzwMqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sr7MH6NSDDTMdHd/L+TaMaJdQNA2WQW+Hjj3GNwl/ule9PMVcOx2EW7NKCXUk6mkORTHBdtMMjV5EFfinnIoKjXY3VoOP5aA9DljzTpnBBeN66Lc7euyXRLMc8hunYqo4ssZ/clV+7dakyYBQjqNbaf3RlHdiTn5z842Q3uazjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=B6s/WTDW; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+13C47ZHmH1+/AbC2K1sE8rWUkwncoQ44bN8mj3d5O8=; b=B6s/WTDWl83ZaD7yEFAS5kvS/j
	zeehTkADxlXDIhox/7Vr4pUxISf8qKbn7gjOKHBuw2Dj11UlM/o3qJVtERnlkp0O2mjc0klL2bKc5
	hg7VrztKoOwoE9xHIGY1eMMXnDN1I6ygfSKrmSXGVL5VCMz9oIfCrKasAqDxgQHKgXKTXxhb3sxTK
	WPYgfQ2X54HsStH68nb99M8jELASZpcKwz86ijr9BxsrrBGkctkEzjaxyMR5+yksCwbm0ZJSymAp5
	NAvwc9UYsogKL/RDaHpODA6TL8BXIaQHowLg/yBmn8IucoZH7J8So5wNsERvv99tuqYJCLJRjPF1y
	C0JgeUKA==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWPfm-00000007Kfm-0ye4;
	Wed, 24 Jul 2024 00:16:02 +0000
Date: Wed, 24 Jul 2024 01:16:02 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mary Strodl <mstrodl@freedom.csh.rit.edu>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	urezki@gmail.com, linux-mm@kvack.org, lee@kernel.org,
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-ID: <ZqBHwnPW_R4lFXVK@casper.infradead.org>
References: <ZpkPStwq_S3mJYb5@infradead.org>
 <ZpkQQ5GzJ4atvR6a@casper.infradead.org>
 <ZpkWj-iFiA-JHbbf@freedom.csh.rit.edu>
 <20240718143103.82e33c556b2d1b6145ae43e0@linux-foundation.org>
 <ZpmKho9_t0_MeOP7@casper.infradead.org>
 <20240718143924.43e22f68cf639b064a83f118@linux-foundation.org>
 <CAH9NwWf_S-PyY5X_cJGSW-8YDk4-C0VvnPCX8iVuo0FhTqsy2Q@mail.gmail.com>
 <ZppU8FhsFd9cB-Fi@freedom.csh.rit.edu>
 <ZppfQFdwYq-bf9Wv@casper.infradead.org>
 <20240723170043.4f17a3d0b6280e57561ba1f5@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723170043.4f17a3d0b6280e57561ba1f5@linux-foundation.org>

On Tue, Jul 23, 2024 at 05:00:43PM -0700, Andrew Morton wrote:
> On Fri, 19 Jul 2024 13:42:40 +0100 Matthew Wilcox <willy@infradead.org> wrote:
> 
> > On Fri, Jul 19, 2024 at 07:58:40AM -0400, Mary Strodl wrote:
> > > Maybe some of the stuff the driver does right now could be moved into
> > > vmalloc? In other words, we could provide a different function that
> > > allocates an executable page, copies memory into it, then marks it
> > > read-only. Would that do better to alleviate concerns?
> > 
> > No.  We are not running arbitrary x86 code.  That is a security
> > nightmare.
> 
> Sure, if such a thing were to be done we'd want it localized within the
> driver rather than offered globally.
> 
> But if there was some hack within the driver to do this, what problems
> might that cause?  What are the scenarios?

That we're running arbitrary x86 code (provided by the manufacturer)
inside the kernel where it can undermine every security guarantee we
provide?

