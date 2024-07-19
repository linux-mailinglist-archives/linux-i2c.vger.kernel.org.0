Return-Path: <linux-i2c+bounces-5033-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AEE937765
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jul 2024 13:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 459521F21898
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jul 2024 11:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5C2128812;
	Fri, 19 Jul 2024 11:58:51 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB52126F2A;
	Fri, 19 Jul 2024 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721390331; cv=none; b=f1JoFMLP7m6i4O6mv3rZ7jdNTMWKA9dWTNrjRxIr2X1D7bukpy8eCOxIcXyO3ftEE/GZ0IqmbXmIrPL8ehIS4V/A2v8o9LQ/jYzsls4qzlWxPncBnm9+DDenuYSrprDtoyB7rqN9IxJp1ULm/0MRObgXgVCLFFdtuyWgGk1+uQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721390331; c=relaxed/simple;
	bh=RUkNIXP4ZZZQU7AmZzUNOsWOiYcu3bUy4EzOO8kC/7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/HoXjgewNwO8gf1UPAKFWAQ3CkwfU2DVbKQZQbCFhep7U2VImGDC01UWKh8gt2J8WrhHPpSZpDUUCOlHvOLDl+Edq/+WiCQrMgFffQi6ISj09BgXXXZdKuiA8BQIl1iw8VT5Mbv9puiZDajPyKNFT0lfbZjb8Sg1DoQndaZqPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu; spf=none smtp.mailfrom=freedom.csh.rit.edu; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=freedom.csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id A2F9C40D7C9C;
	Fri, 19 Jul 2024 07:58:41 -0400 (EDT)
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id c5mWgwAwWkWi; Fri, 19 Jul 2024 07:58:41 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 3A44045735E9;
	Fri, 19 Jul 2024 07:58:41 -0400 (EDT)
Date: Fri, 19 Jul 2024 07:58:40 -0400
From: Mary Strodl <mstrodl@freedom.csh.rit.edu>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	urezki@gmail.com, linux-mm@kvack.org, lee@kernel.org,
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-ID: <ZppU8FhsFd9cB-Fi@freedom.csh.rit.edu>
References: <ZpiGIbczW4iItKVx@infradead.org>
 <ZpkNOyuxuJHaTW35@freedom.csh.rit.edu>
 <ZpkOV3mdOU1b8vMn@casper.infradead.org>
 <ZpkPStwq_S3mJYb5@infradead.org>
 <ZpkQQ5GzJ4atvR6a@casper.infradead.org>
 <ZpkWj-iFiA-JHbbf@freedom.csh.rit.edu>
 <20240718143103.82e33c556b2d1b6145ae43e0@linux-foundation.org>
 <ZpmKho9_t0_MeOP7@casper.infradead.org>
 <20240718143924.43e22f68cf639b064a83f118@linux-foundation.org>
 <CAH9NwWf_S-PyY5X_cJGSW-8YDk4-C0VvnPCX8iVuo0FhTqsy2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH9NwWf_S-PyY5X_cJGSW-8YDk4-C0VvnPCX8iVuo0FhTqsy2Q@mail.gmail.com>

On Fri, Jul 19, 2024 at 08:41:04AM +0200, Christian Gmeiner wrote:
> This wonderful interface is used in recent products from them too.
> Adding support for it
> in an upstream-able way could be still a benefit, as these products
> are used in different
> industrial environments running on Linux.

Just seconding this. The hardware we have here (conga-TCA7) was
released in 2021. As far as I know, congatec have been using this
interface for a while and provided a pretty bad out-of-tree driver
for it that needed a proprietary library in userspace to talk to
devices instead of actually registering with the kernel facilities
for i2c, watchdog, backlight, etc.

I think it's valuable functionality to support, but it'll need to
happen safely.

Maybe some of the stuff the driver does right now could be moved into
vmalloc? In other words, we could provide a different function that
allocates an executable page, copies memory into it, then marks it
read-only. Would that do better to alleviate concerns?

Not sure what the restrictions on x86 are, but we could also start
with a writable page, then mark it executable when we un-mark it
writable.

I think this is good discussion, thanks for sharing your thoughts
everybody.

