Return-Path: <linux-i2c+bounces-5026-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9127934DF1
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 15:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73B67284922
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 13:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452B813DBBE;
	Thu, 18 Jul 2024 13:20:20 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8F113D8A3;
	Thu, 18 Jul 2024 13:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721308820; cv=none; b=VR5ww6BbhXGCZz2KDtpEb7UNfsSIt7HwflhU2qighefUb/0iOA7t7SkklZYjSr9NZhx4fwmW+CAAidY/FoTWinm2hm7CX+TEhwpKV600FWLSJh/SwZTZqiE6D59dTPX4VTHJ2Vgo0GDvPfTiJ+8s6MaRHyBWqSwr2bolrP6G01A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721308820; c=relaxed/simple;
	bh=AaROG9m9yK61LKeff90v3jaSxjil2xx9ZEn3ML4tXsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8TbwpvYO6DX0pO/XQV0OrCc2GWizi6mdZvg+MZP4vcgeERzP3NmWSf6F0RHJ6kO/PFXewqnoWpTBqaQGnMhT1N2KLOEhIk2jJDMit/ojy2xx9o0XCATNS2h+tdxIC1fRt0BeWQMwn22cC1KT+Zfe3MKuQbwF58b1xhOU/iValM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu; spf=none smtp.mailfrom=freedom.csh.rit.edu; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=freedom.csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 22C2240D7C8B;
	Thu, 18 Jul 2024 09:20:17 -0400 (EDT)
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4FOPOOqDHB88; Thu, 18 Jul 2024 09:20:16 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 6884B45735E9;
	Thu, 18 Jul 2024 09:20:16 -0400 (EDT)
Date: Thu, 18 Jul 2024 09:20:15 -0400
From: Mary Strodl <mstrodl@freedom.csh.rit.edu>
To: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org,
	lee@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-ID: <ZpkWj-iFiA-JHbbf@freedom.csh.rit.edu>
References: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
 <20240718011504.4106163-2-mstrodl@csh.rit.edu>
 <ZpiGIbczW4iItKVx@infradead.org>
 <ZpkNOyuxuJHaTW35@freedom.csh.rit.edu>
 <ZpkOV3mdOU1b8vMn@casper.infradead.org>
 <ZpkPStwq_S3mJYb5@infradead.org>
 <ZpkQQ5GzJ4atvR6a@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpkQQ5GzJ4atvR6a@casper.infradead.org>

On Thu, Jul 18, 2024 at 01:53:23PM +0100, Matthew Wilcox wrote:
> That does work, but I would assume that since this BIOS exists to
> communicate with the hardware that it'd need various special privileges
> and that running in ring 3 would not work.

Exactly.
 
> Ultimately, better off running the whole thing inside a VM and passing
> the device through to the guest.  Or ignoring the BIOS entirely and
> implementing direct access to the hardware.  But neither of these
> approaches is "a way to do what I'm trying to do", they're entirely
> different approaches to making this hardware work.

If I ran the whole thing inside a VM, I would still need support in the
kernel, right?

As far as I know, there is no documentation on Congatec's side about the
underlying interface. Obviously I could disassemble the blob in the BIOS
and figure it out, but I suspect that will have much less hardware
compatibility and be subject to random breakage if they make a BIOS
update or something. Plus, I would probably run afoul of copyright if I
wrote a driver after doing that.

I'm not really thrilled that this is their design either, but I'm not
sure that there is a better answer...

Thank you!

