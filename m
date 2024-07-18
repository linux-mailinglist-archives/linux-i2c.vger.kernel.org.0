Return-Path: <linux-i2c+bounces-5023-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C283934D5D
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 14:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D44B0B22C5E
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 12:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A24413A26B;
	Thu, 18 Jul 2024 12:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WtMAU2Tl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACED1E53A;
	Thu, 18 Jul 2024 12:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721306722; cv=none; b=Ev6yUoeiPGvx7rTl4rVYkBQekIjUDjuxYQSBKQGksE+wseCeWg/Lk10Us9ZZcQSizBKVSf9mdZWWckGmD45hOWqZSCdfozfQ8LhgYFpFVHmWMVMTiHqLVw3pSZA8Cv30yXyLG+cl7nCd10MIoGHK/VKeTVets/rQhVGM0c39giM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721306722; c=relaxed/simple;
	bh=+KlHtABbqNhIMkcNChn8/lSrBm7ptJAmDYBXqNBI8eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pv1RoYItkOn/CqQgp3iV7H0x8ty0tpLjU7qxvugQ+/CTTKf3nnSRZLHqN6CaflrMe5BgNqawTVulV1ZUXf7mzH0Ol3Yw265gNmov4pJM/JDnQIHoP/D4A3vSgc7THuea9OLMhLg7KMVIAaCzeMHszXBi6gJFPUJ2FOjQm398FSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WtMAU2Tl; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=A5oMJUl7L6nz3JbUoCphhEsLX+wzFGhschPr5LOT2c4=; b=WtMAU2Tl6WxswzTKdAEUBB573D
	XtzLnxyc639WSRyxHiN4YCG+TZQ0js2FAv9OktdeBQePIRVO+75g1ZWibTdsosfGfn5uKA9zZ03yO
	YQBYc7PWdFWC9kA+ZRBWMNykWWbhUhksCaAz5tlZxdO3HtwHymzf9qMt5hQQW+cEUKVVD/WkmKe8q
	ARkB51hBCRxbs+VBrvuebjwDcuCNNRj1uoCVh4+4RGnilQiLdNJLn7JkaCqw3x9LSZoRa+c2PKiHy
	zHe3BIPFl7Cn9MiZcMnywmre3jKPKq5CizxTR/Dn+VLH0R4243EzNFb7wvj8HgOXwhrSqi6LEa5/t
	XScaqHYg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUQVT-000000020Fz-1KzY;
	Thu, 18 Jul 2024 12:45:11 +0000
Date: Thu, 18 Jul 2024 13:45:11 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mary Strodl <mstrodl@freedom.csh.rit.edu>
Cc: Christoph Hellwig <hch@infradead.org>,
	Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org,
	lee@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-ID: <ZpkOV3mdOU1b8vMn@casper.infradead.org>
References: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
 <20240718011504.4106163-2-mstrodl@csh.rit.edu>
 <ZpiGIbczW4iItKVx@infradead.org>
 <ZpkNOyuxuJHaTW35@freedom.csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpkNOyuxuJHaTW35@freedom.csh.rit.edu>

On Thu, Jul 18, 2024 at 08:40:27AM -0400, Mary Strodl wrote:
> On Wed, Jul 17, 2024 at 08:04:01PM -0700, Christoph Hellwig wrote:
> > NAK to a driver creating random writable and exectutable memory:
> 
> Is there a better way to do what I'm trying to do? Or some way to
> expose this functionality with more guard rails so that it's a
> little bit safer?

No, there is no way to do what you're trying to do.


