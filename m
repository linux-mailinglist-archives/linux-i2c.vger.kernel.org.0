Return-Path: <linux-i2c+bounces-5034-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ABA9377E9
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jul 2024 14:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5D321F22198
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jul 2024 12:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D794C13BC3F;
	Fri, 19 Jul 2024 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oy/GDuVV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F407813B295;
	Fri, 19 Jul 2024 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721392970; cv=none; b=fDWlTrZlAw+1z3VBH9+5BzY5gMCkaxTf76txWGhLhkdQWaAewBMEmFhk7yenzZLmujeYl1Jx3AwVo7NsX/QymutoxJ85GdkH8OiX46OiVoxT5zLVxz3e9BC2zGIkuKiJSWFOs7gYcoPgCCqXB3a+49vS6LosjgPo6RnhT7RzgFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721392970; c=relaxed/simple;
	bh=0lcxL8XNRUEq+vBhcw8R+mdptmkP+8F+zWfDZRL4wBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3pIrH1yaecLq5e8Q6LBTjo98BGAJRBAd790QRvfW3vr/QEIADHSm7oO7boIL7+99PNCBENihEisD9jCIyVnoK2Tr0m3moJjwXoW4xeeqlwI/zOhKM/BbmL7DG5ONoJSDSRSfFxMSob3ePkqOy05zj4N3yoDTeJ3Vr8qNI/6rGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oy/GDuVV; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=W3a+XTwexnz8rPMwMCQeFI74MJDMGFFcGv41YRD0k+4=; b=oy/GDuVV2x498dOs09fyfUMYTd
	ufGTBzQPDaTM1z5OxOe0dNvG20z+0PTekc4GG70tVSMnx/8F4HhQdjjz03zR0NAcfx+pB4ZfzNkzf
	HCOY7gboZztMflA8wGTSZYxIXPR6Ss84fuygT9xRo2Sh9/m2gM0xYHIfh3bFPF16wOWK3IASHYTQU
	bI17ywkR2Fcq394BfAKAiQaiK2NTvIZ1rTPHx+/hVyRIsVlWKGj+ImUAMz/0dM995sHC5UcU8Bc0y
	IrvTNtyi8NJisqN0//o+i9yXZUHlgdvPPe0LBUg/YaKUk2+rCoBkio3UKwKJseOo3XhmrDpNvKS2/
	vL3zHZzQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUmwb-0000000330F-0B6j;
	Fri, 19 Jul 2024 12:42:41 +0000
Date: Fri, 19 Jul 2024 13:42:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mary Strodl <mstrodl@freedom.csh.rit.edu>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	urezki@gmail.com, linux-mm@kvack.org, lee@kernel.org,
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-ID: <ZppfQFdwYq-bf9Wv@casper.infradead.org>
References: <ZpkNOyuxuJHaTW35@freedom.csh.rit.edu>
 <ZpkOV3mdOU1b8vMn@casper.infradead.org>
 <ZpkPStwq_S3mJYb5@infradead.org>
 <ZpkQQ5GzJ4atvR6a@casper.infradead.org>
 <ZpkWj-iFiA-JHbbf@freedom.csh.rit.edu>
 <20240718143103.82e33c556b2d1b6145ae43e0@linux-foundation.org>
 <ZpmKho9_t0_MeOP7@casper.infradead.org>
 <20240718143924.43e22f68cf639b064a83f118@linux-foundation.org>
 <CAH9NwWf_S-PyY5X_cJGSW-8YDk4-C0VvnPCX8iVuo0FhTqsy2Q@mail.gmail.com>
 <ZppU8FhsFd9cB-Fi@freedom.csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZppU8FhsFd9cB-Fi@freedom.csh.rit.edu>

On Fri, Jul 19, 2024 at 07:58:40AM -0400, Mary Strodl wrote:
> Maybe some of the stuff the driver does right now could be moved into
> vmalloc? In other words, we could provide a different function that
> allocates an executable page, copies memory into it, then marks it
> read-only. Would that do better to alleviate concerns?

No.  We are not running arbitrary x86 code.  That is a security
nightmare.

