Return-Path: <linux-i2c+bounces-5029-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 823AC937023
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 23:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02888B21C3A
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 21:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335D61459FD;
	Thu, 18 Jul 2024 21:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="l5xCkuAs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C57181219;
	Thu, 18 Jul 2024 21:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721338507; cv=none; b=rIC0E3olWGEbkCINVoJmkaz7q2ex15hicNiUM98UaQhfM1eJGSkBoAZfp14C32loLG7Gl+dRHwCVlLhanuqwb9v2ihe8T8NDd3s8ebgsZt7MH8ktTBcVMDovM5VoB12kZgrOA0xkTrKu+8pm0SdtoT2t9BI7ljGX22HCK2V9Yt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721338507; c=relaxed/simple;
	bh=ZmxgnuBDWh6i1eOKbNR+WtcJ7E6/jUSlCHurAL2ynP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9RqcJrAeta/wYPUXdDR32HAm/b3l6DEwerCEuYFeAFBg8B4zVA0buNwDxK3U9zqZ7zn0a4s+xqO1uFoidq9Ll9/TOtSRNRpcnk7zJqtUFTv8xvONwVh5naVkywXK/2Q74G2LUNnyvLytdjjGlI/9QQwkJA8suDGB0GcsrhBs0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=l5xCkuAs; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UPhjJsHI/bJ95ZrIvMkQ/9lSSkr1RFbsBFFDZhdYq5U=; b=l5xCkuAsveqNszVTNHfxjxwAaC
	Qr7TsxF3dGpJlnMgCek+iq56/hMxp4Wb6Aqe/02JrMr/qPqhDHo5v2HYm7UmgsgfoiXsU6cViu1hr
	PXXjrH79M83FM+uhct8OuRKegKq1kifxcT9xQdZUuEHWTB0EGoxyi6zowEVAt1vX9ZER7feiwWHy3
	z/HQxFst1lOmt6zUjW0rEZg4/LqKSBSzm399ez3Qno/FnICDJtjOHWYXpgTC+R7GvemGxyW8WgTnX
	DV0gaZjDNOsJB1TIV81phf3UKRG/84Snju1zQZgPH81sBp8Qan3bGvJgyS3gmwT4TSGr9LqIoeZus
	vZNE+Vyw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUYmE-00000002LwS-2oOd;
	Thu, 18 Jul 2024 21:35:02 +0000
Date: Thu, 18 Jul 2024 22:35:02 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mary Strodl <mstrodl@freedom.csh.rit.edu>,
	Christoph Hellwig <hch@infradead.org>,
	Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	urezki@gmail.com, linux-mm@kvack.org, lee@kernel.org,
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-ID: <ZpmKho9_t0_MeOP7@casper.infradead.org>
References: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
 <20240718011504.4106163-2-mstrodl@csh.rit.edu>
 <ZpiGIbczW4iItKVx@infradead.org>
 <ZpkNOyuxuJHaTW35@freedom.csh.rit.edu>
 <ZpkOV3mdOU1b8vMn@casper.infradead.org>
 <ZpkPStwq_S3mJYb5@infradead.org>
 <ZpkQQ5GzJ4atvR6a@casper.infradead.org>
 <ZpkWj-iFiA-JHbbf@freedom.csh.rit.edu>
 <20240718143103.82e33c556b2d1b6145ae43e0@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718143103.82e33c556b2d1b6145ae43e0@linux-foundation.org>

On Thu, Jul 18, 2024 at 02:31:03PM -0700, Andrew Morton wrote:
> The hardware is weird, but we should try to support it in some fashion.

Why?  It's been around since 2005, and Linux has done perfectly well
without support for it.  What's so compelling about it, as compared to
ohidontknow the nVidia GPU driver where we definitely don't support
taking a binary blob of random x86 code and run it inside the kernel?

> Dumb idea, there will be other ideas: is it practical to take that code
> blob out of the BIOS, put it into a kernel module (as a .byte table in
> a .s file and suitable C interfacing), compile that up and insmod that
> module?  

Have you tried asking someone who cares about security like Kees?
Preferably in person so you can take a picture of the hair on their head
standing straight out and steam coming out of their ears.

