Return-Path: <linux-i2c+bounces-5415-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5244E9528B2
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 06:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC95F1F22861
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 04:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EFB4315D;
	Thu, 15 Aug 2024 04:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="2oZjKt8/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0189941C85;
	Thu, 15 Aug 2024 04:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723697957; cv=none; b=lgSLrgS+a7jEWhWHnO9xFKSiiY/WZBKC1U6cYwVUqnL39UCUTIij/zkZQxUmbLhnXXZRYRe7/bb8MsETYshEwgSvIPdaqpvH1a4XlVW6gO01DUGbLIWZJp7WeRz7PlZfJpgSXKS36KiaUDEf2viw8JODfn8MfsZtcbaLHfBjK64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723697957; c=relaxed/simple;
	bh=ElrRls/AwSqDipe65WQsQ29B3GHjuh2BnFsb0+7fI2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oad9hwcjm6LyPCdLCbeD9TtkFQ4nW90q+zoGgbSxulovv75wGriRwabp/QDvRgwej/nVhsvIPlb/54wwtZjllPD4nVXvvKFbUeOrFLcLpIv/2AZw1AVM+vQv6vFWp/VK0ys0VGgdefjeWJPSGCyrlhaQDgWIOITDMUfVEM+OXcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=2oZjKt8/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=I9YsIjUPg7mWLOLjxqUqjobvMzYvNQqbEzmIlrvU5xY=; b=2oZjKt8/RNYe3lteggYoumClez
	fnGAeFrqokx2z/1zNvo6AhBYwcLE/pMgtMSi5cx1gzyKkQV9odZOBpXKBIlHq34NQl91Fnw5J/F4P
	kZ2ncn3dNhv9ZDXlsXWEnijseWqFP+MwfmLLwI6mhG69pLzXx/WGxRJNbztuQoLrJPwStnv0D9/vS
	+Tv/0GUOOPsxnZEWQPNNsD3Z8R9R1fIVWOCV2QMzIZei00yJiTopt0EaP4Qvbbp8QwkjxzAcd/d4w
	imzPosUXNcsVydAFehS21CUM+IVSk+KnsjqOk/OA4kt8kQg/5LPTfJQl9ZeO/3+CmUn1Qa36UH5oW
	sElEeA8A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seSZn-000000091dB-0wSh;
	Thu, 15 Aug 2024 04:59:07 +0000
Date: Wed, 14 Aug 2024 21:59:07 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	urezki@gmail.com, hch@infradead.org, linux-mm@kvack.org,
	lee@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com,
	Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org
Subject: Re: [PATCH v4 1/2] x86: Add basic support for the Congatec CGEB BIOS
 interface
Message-ID: <Zr2LGxZnU0nh2G0a@infradead.org>
References: <20240814184731.1310988-1-mstrodl@csh.rit.edu>
 <20240814184731.1310988-2-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814184731.1310988-2-mstrodl@csh.rit.edu>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Aug 14, 2024 at 02:47:30PM -0400, Mary Strodl wrote:
> The Congatec CGEB is a BIOS interface found on some Congatec x86
> modules. It provides access to on board peripherals like I2C busses
> and watchdogs. This driver contains the basic support for accessing
> the CGEB interface and registers the child devices.

A very short description for very unusual code that copies exectutable
code from the the BIOS.  You'd really want to extend on all that here
in detail and explain how it is supposed to work and is safe.


