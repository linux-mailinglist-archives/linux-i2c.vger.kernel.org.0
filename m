Return-Path: <linux-i2c+bounces-5016-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8315D934690
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 05:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21C49282FB3
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 03:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F28F2772A;
	Thu, 18 Jul 2024 03:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Vwpveld4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EB6156CE;
	Thu, 18 Jul 2024 03:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721271848; cv=none; b=sNQhrjsrOEuMFsX8VV3BbQKnredqbCUKluiNtsrWwXyIG6oDWIEdxn9E0xa/9D/eYn3/v81LDHxv+prGK5BOqGH5I64f1gQ9yideVq/t29EOysE77qgYc5YMdt4lDeFFr06bYj3jIZYFzjrsBeWTkqxWpyyoT33qoVAig5FsW0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721271848; c=relaxed/simple;
	bh=ub5XUCtguRpv10JyWtnqWE9rIsAPmVYZpA8qNWKMN1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSRPXs6VsTZnFOPoAdjYmg4MZAOfiM4knYc2X2088uRl9U/tqrMu/RSQ4P1J2tpnnbXmnPlbsDP8fZ+qz/C6zovELcIS2jLCq5+VQ6CFtXbSctrfmTJuhg3hE5/iIOwHym9G+l0dJCqZWEb7cuqo2iTXazXriz2yWPOohDZBahM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Vwpveld4; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ub5XUCtguRpv10JyWtnqWE9rIsAPmVYZpA8qNWKMN1U=; b=Vwpveld4HK9jN5RX+Yhk/CTDTv
	xGili2WV/elWgL8qz/r6kdo4I2uLucpxAMswgJkkmmSNMqKQl/sNJr1A+FImIrWvUyJ8BjAYBexn8
	7zcr0VVgWpojXpI47oys1PPHBEgPuXZIesx9fR6iFgvwWTdFRbCtrI9B5SbvtvbyQDGen5gPgQbqJ
	2KuhIkY1YFzTwPFMqEUq8AAT9ZaAdpBBtEzRnW5AwtdjboFG/DM8cyy40KhnFivX/cwLF/sQOYvuQ
	elKGu98bx66Xg0HGGxjPBVJ8DxOZy2U5vbHSAmQxY6fsrFpg8YsiWTqzT9fNZvHv8i8QplfoahTws
	2Wnw7yXA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUHR4-0000000FaPs-057T;
	Thu, 18 Jul 2024 03:04:02 +0000
Date: Wed, 17 Jul 2024 20:04:01 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	urezki@gmail.com, hch@infradead.org, linux-mm@kvack.org,
	lee@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-ID: <ZpiGIbczW4iItKVx@infradead.org>
References: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
 <20240718011504.4106163-2-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718011504.4106163-2-mstrodl@csh.rit.edu>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Jul 17, 2024 at 09:15:02PM -0400, Mary Strodl wrote:
> After the ability to allocate PAGE_KERNEL_EXEC memory was removed
> from __vmalloc,

Yes. for a very good reason.

NAK to a driver creating random writable and exectutable memory:

Nacked-by: Christoph Hellwig <hch@lst.de>


