Return-Path: <linux-i2c+bounces-5025-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A43FE934D82
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 14:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D4E11F21DA0
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 12:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844F113C669;
	Thu, 18 Jul 2024 12:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nWTcftoG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD87C54645;
	Thu, 18 Jul 2024 12:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721307208; cv=none; b=VNmE2lLwSTo9TanqXdSJWSgIvsJWr2rrMZ9Hxs0mRcJbx2gTtaWuG731a1yHTyy2Jmo62AUDNpj3sHzq2sauvSjwuV/IXb7hdWCb5cIevFgQnHSVCgbtn450LqIvW7Yz1AOYbocYOYWDWLl/edwvGWuif2bKX1cY6k+ZEM75wfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721307208; c=relaxed/simple;
	bh=ppf6BHKxG2BU4SOiAfC9VFD+eoS7Funzq1jIzMUdDJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KReGEWrHgzTOWkQpqlghC5oQaAHehVdkYDJrBFpBMduNp+zR9fPmn7ah5GOFkN/FsTJoEd0gCgw24ex38WKiGZXJ9a3rmwxGS8ftjy1UQEfwYYeKI1IKU+dNMXOzTx1rdoXHC3fM32TKijiiMT4LoBYJ7JznSXjkiX+EQ4bBXqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nWTcftoG; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+fqyxG6xrZw8oXvTB8oaYf/fKGiv75mVQDMG6n2NGHY=; b=nWTcftoGfTKbWPUApocFpCc3Li
	38DhrbBFLlMMzwyjSvTWBw2sB5O9wPlEwT9g8VnM7knp9dtblUqAz6Qaw9EEhxlXMqBAi4N5hK0Gb
	j0Xic4EQwFdWoVGJ4BBrzk4r2eyq6zyeGfOg/CcxciORYe94yCWhMdbpNXnlkUiMopOiiD4uYVAZE
	DcD+v1h4GMpEAlHluV6ibrRLf/BHgmKLonWD1a/4IMbbJsgodtiRavEUVYigHV0cXBJhgyZGLqcdg
	NqJBSc8RGnZlaBQCW96wP6ZPJSujj6kxoZLNEqQQkk1Pr/LhcoHflGTfYwgwG7zsFKegNW7ZWc/rb
	b6Bxf1qQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUQdP-000000020ct-2azl;
	Thu, 18 Jul 2024 12:53:23 +0000
Date: Thu, 18 Jul 2024 13:53:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Mary Strodl <mstrodl@freedom.csh.rit.edu>,
	Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org,
	lee@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-ID: <ZpkQQ5GzJ4atvR6a@casper.infradead.org>
References: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
 <20240718011504.4106163-2-mstrodl@csh.rit.edu>
 <ZpiGIbczW4iItKVx@infradead.org>
 <ZpkNOyuxuJHaTW35@freedom.csh.rit.edu>
 <ZpkOV3mdOU1b8vMn@casper.infradead.org>
 <ZpkPStwq_S3mJYb5@infradead.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpkPStwq_S3mJYb5@infradead.org>

On Thu, Jul 18, 2024 at 05:49:14AM -0700, Christoph Hellwig wrote:
> On Thu, Jul 18, 2024 at 01:45:11PM +0100, Matthew Wilcox wrote:
> > On Thu, Jul 18, 2024 at 08:40:27AM -0400, Mary Strodl wrote:
> > > On Wed, Jul 17, 2024 at 08:04:01PM -0700, Christoph Hellwig wrote:
> > > > NAK to a driver creating random writable and exectutable memory:
> > > 
> > > Is there a better way to do what I'm trying to do? Or some way to
> > > expose this functionality with more guard rails so that it's a
> > > little bit safer?
> > 
> > No, there is no way to do what you're trying to do.
> 
> IFF it is absolutely required to run BIOS provided executable code,
> the best way to do that is in a separate userspace process.

That does work, but I would assume that since this BIOS exists to
communicate with the hardware that it'd need various special privileges
and that running in ring 3 would not work.

Ultimately, better off running the whole thing inside a VM and passing
the device through to the guest.  Or ignoring the BIOS entirely and
implementing direct access to the hardware.  But neither of these
approaches is "a way to do what I'm trying to do", they're entirely
different approaches to making this hardware work.

