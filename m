Return-Path: <linux-i2c+bounces-5426-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E73D952E67
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 14:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB8451F22DB1
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 12:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3645317C9B1;
	Thu, 15 Aug 2024 12:39:23 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCAC7DA63;
	Thu, 15 Aug 2024 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723725563; cv=none; b=Br8SpnO5aCZDhKQn8dRPPk/+QKER5Fgfkq9+Q/JQijezLuadInJLy8ipQ2tuEbLeO00bKLyy9HcxS+wUICQjtoiFMem6FTMsnaO8wANqtr1JDUzQhYd7PDkQitouy6JXqI5tvmLPgNuF+MkTucM1OSdDffq7rsLskDRP2bojyaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723725563; c=relaxed/simple;
	bh=LhOveH/26yuc5fTwV5yhZ8zbysqsh+AFZX5g3fbgbXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4D5cT2fsSbxYtcBVNyE9qvU7/83dlZdPLD+jCMYXTjKzD4iO/gMfJQ1LI48GvZAu2ZUbWQe7TvCOmy1d0U1LVak+DCDsf1kWJplyyor8qLlxxwJrHd8BCr8xFLD8v+IA7gbsMkDvmZrdtN+vWftejEONLklcaPn1u9I8u/SiIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu; spf=none smtp.mailfrom=freedom.csh.rit.edu; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=freedom.csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 3E67F4010D16;
	Thu, 15 Aug 2024 08:39:19 -0400 (EDT)
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id c9L37Hq50jD0; Thu, 15 Aug 2024 08:39:18 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 781D345735E9;
	Thu, 15 Aug 2024 08:39:18 -0400 (EDT)
Date: Thu, 15 Aug 2024 08:39:17 -0400
From: Mary Strodl <mstrodl@freedom.csh.rit.edu>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
	linux-mm@kvack.org, lee@kernel.org, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, s.hauer@pengutronix.de,
	christian.gmeiner@gmail.com
Subject: Re: [PATCH v4 1/2] x86: Add basic support for the Congatec CGEB BIOS
 interface
Message-ID: <Zr329S8995L0OsCu@freedom.csh.rit.edu>
References: <20240814184731.1310988-2-mstrodl@csh.rit.edu>
 <87sev6m14n.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sev6m14n.ffs@tglx>

On Thu, Aug 15, 2024 at 02:17:12PM +0200, Thomas Gleixner wrote:
> So this caught the attention of my mail filter because the subsystem
> prefix is 'x86:' while it obviously should be 'mfd:'

Sorry! Originally there was some debate as to where it belonged and the
commit message was never updated.

> This Signed-off-by chain is invalid. See Documentation/process/

My bad. I was following the example set by last time this was brought
up for review by Christian. Would you like only my Signed-off-by? Or
something else?

> Aisde of that. How is any of this supposed to work. What is the user
> mode helper doing and why does this need this netlink indirection?

The first time I posted the series I was asked to move the BIOS stuff
into userspace. Personally, I'm not convined that makes it any less
terrible, but I obliged.

> Seriously? RWX mappings?

Yeah. In my testing, it wouldn't work without writable mappings.

> So this copies a code blob out of the BIOS region into user space and
> lets user space use this blob to interact with the BIOS extension,
> right?

Yep.

> So an i2c transfer does a full round trip:
> 
>    i2c::xfer -> cgeb -> netlink -> user helper -> execute random code ->
>    user helper -> netlink -> cgeb -> ...

Looks right. I'm not thrilled about it either, but the vmalloc people
wanted it in userspace. For our usecase, we didn't intend to have
much throughput so it still worked okay for us.

> Has anyone tried to analyze what this BIOS provided code blob is
> actually doing?

I have no idea what the licensing on the BIOS blob is, I didn't want to
run afoul of any copyright stuff by disassembling it to find out what
it does. I suppose I could pull the blob off my hardware and watch what
it does in qemu?

> All it does is to poke at a range of IOPORTS with in*(), out*() and that
> poking mechanism depends on the generation of that CGEB implementation.
> 
> Congatec even provides the GPL2 licenced source for this pokery as a
> kernel driver.

The only driver I've found from them is the one that runs blobs in the BIOS.
Where did you find the IOPORT stuff?
 
> Thanks,
> 
>         tglx

Thanks for taking time to read through this!

