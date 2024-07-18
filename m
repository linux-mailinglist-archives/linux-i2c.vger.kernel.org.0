Return-Path: <linux-i2c+bounces-5024-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B78F934D69
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 14:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BB431C21B10
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 12:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036E713AA26;
	Thu, 18 Jul 2024 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OG/pmoEe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D8A135A79;
	Thu, 18 Jul 2024 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721306959; cv=none; b=Mxv1rCOmKFD9vfUhok9BWWat4Pnn8TtxA0isOUdfNYWjbjqcrnFzbBf/wQxFsVf9IAmzpG1ZAYhgB2n6iyHMfsYCVhREyCDF7MvUPQ7TOqRBJJV9qFhDzIEvOHt/T+tp6ZuI0+5/1JYHZ8l4CVPeOFO0MSdQq+JgVXsTJ6AYzXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721306959; c=relaxed/simple;
	bh=6diMPpu0RWYphmJIy5X29VBS+Xe2R8zT4TXBrdBHxTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJpa9CLkWdVpo40mrnPs/VxJkQtzI0hZq2c1+/nlCAvgWNDLz/XCQyvKa1Q5r4ZpVhjTAvvA1zuokOyjQq3BprUllU8iBCrNl9J9h4232NGWD4GW0/NYnj0AUDEp0xGkbCvtZhjstWq396r75qkTRkh8GaXdzHQXVt9z8bLog6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OG/pmoEe; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mO+0gPSvIzWeBNFTdJ90WhWjxWH6d58WYYpmL1RWviA=; b=OG/pmoEek4OdbdK3tAKXy54Gm0
	m0HRNC1lK2XgJNrL3JFWddPmrkpTUM+n1KFzO2B925WjiRLX7yfuwgLR4OA64TIwr50X8EiUp94V8
	iMcrh4meaARD6qobN7/LGGn/7lzXDwgV9ZwEBFQC60kXCSJ+W1hM8T8wuET7lJhYeWnP2gAWFq7PR
	nee2DzEsYvtT+hvVFzDSvQfY/4NpbUGtgUyDCmwXczeJ0G8IhF4TDogHdWCQcLHhWNO945fdPAiHT
	6ZSgNQfs0b53lFcvKB7V6spjLgg1QtxFoJiYtl2faKYRcuL9ruGUn2eV1H1Fg1eVq7wQ+8QnqbQk2
	ZLUM8xgw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUQZO-0000000H0dB-1UKo;
	Thu, 18 Jul 2024 12:49:14 +0000
Date: Thu, 18 Jul 2024 05:49:14 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Mary Strodl <mstrodl@freedom.csh.rit.edu>,
	Christoph Hellwig <hch@infradead.org>,
	Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org,
	lee@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-ID: <ZpkPStwq_S3mJYb5@infradead.org>
References: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
 <20240718011504.4106163-2-mstrodl@csh.rit.edu>
 <ZpiGIbczW4iItKVx@infradead.org>
 <ZpkNOyuxuJHaTW35@freedom.csh.rit.edu>
 <ZpkOV3mdOU1b8vMn@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpkOV3mdOU1b8vMn@casper.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Jul 18, 2024 at 01:45:11PM +0100, Matthew Wilcox wrote:
> On Thu, Jul 18, 2024 at 08:40:27AM -0400, Mary Strodl wrote:
> > On Wed, Jul 17, 2024 at 08:04:01PM -0700, Christoph Hellwig wrote:
> > > NAK to a driver creating random writable and exectutable memory:
> > 
> > Is there a better way to do what I'm trying to do? Or some way to
> > expose this functionality with more guard rails so that it's a
> > little bit safer?
> 
> No, there is no way to do what you're trying to do.

IFF it is absolutely required to run BIOS provided executable code,
the best way to do that is in a separate userspace process.


