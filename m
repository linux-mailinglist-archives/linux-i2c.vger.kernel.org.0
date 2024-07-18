Return-Path: <linux-i2c+bounces-5028-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 693DB93701D
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 23:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A6131C20C94
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 21:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF18E7F484;
	Thu, 18 Jul 2024 21:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Vft36ehP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924EA7C6DF;
	Thu, 18 Jul 2024 21:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721338265; cv=none; b=oRJePTbxnWu6T557DpDk1Hmf78HkP3lFcykWmN9hB4HBy7CWr+URiCUljLfPScIiReYs6F1xZ+xuRdGDeydBd8DNPuVbLZMH4hNr0YoYHyn5XV/PXQjP9qKjHIop19OkJHS0k0L0e6dwIZ8Vrg1pxbKBRMglTnBHIzlPE68T1uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721338265; c=relaxed/simple;
	bh=ARBvX8mj5eWPQmirLy7aQUikr/98jNK8xQyoOm2j3I4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eV+J1AmlGIPY9yMEZjArbdxcLSUcWmw7crI4hojknOLVEXfw7iiSFZvQvhmP5Kif0X5IdqDR3Ongl2V7Vmp2xM+ugRlek7afO9XEgZzG821DrWn8xaD7IRSRj1JY8ZOSp7in7NUIB3V8Z5RM2IkQrmuHR7W9QSNF0Hx1FRV/86c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Vft36ehP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974B4C116B1;
	Thu, 18 Jul 2024 21:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1721338265;
	bh=ARBvX8mj5eWPQmirLy7aQUikr/98jNK8xQyoOm2j3I4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Vft36ehPzncdDBemuIjaHV1xNxpNl2fRCgnXCDYjtSa6Ymu9M+DmFHxO5AKyxz/1a
	 /tTZjLClrCDhwYAP+RKWGbNtWPkdKdyi3qVxUVifctsE/gV7wrwzb8Aj/zSVb401CJ
	 CVrTvCuBJjc5iKUwXTadwldJR0uOVbpHalkU/c6M=
Date: Thu, 18 Jul 2024 14:31:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mary Strodl <mstrodl@freedom.csh.rit.edu>
Cc: Matthew Wilcox <willy@infradead.org>, Christoph Hellwig
 <hch@infradead.org>, Mary Strodl <mstrodl@csh.rit.edu>,
 linux-kernel@vger.kernel.org, urezki@gmail.com, linux-mm@kvack.org,
 lee@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
 s.hauer@pengutronix.de, christian.gmeiner@gmail.com
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-Id: <20240718143103.82e33c556b2d1b6145ae43e0@linux-foundation.org>
In-Reply-To: <ZpkWj-iFiA-JHbbf@freedom.csh.rit.edu>
References: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
	<20240718011504.4106163-2-mstrodl@csh.rit.edu>
	<ZpiGIbczW4iItKVx@infradead.org>
	<ZpkNOyuxuJHaTW35@freedom.csh.rit.edu>
	<ZpkOV3mdOU1b8vMn@casper.infradead.org>
	<ZpkPStwq_S3mJYb5@infradead.org>
	<ZpkQQ5GzJ4atvR6a@casper.infradead.org>
	<ZpkWj-iFiA-JHbbf@freedom.csh.rit.edu>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Jul 2024 09:20:15 -0400 Mary Strodl <mstrodl@freedom.csh.rit.edu> wrote:

> On Thu, Jul 18, 2024 at 01:53:23PM +0100, Matthew Wilcox wrote:
> > That does work, but I would assume that since this BIOS exists to
> > communicate with the hardware that it'd need various special privileges
> > and that running in ring 3 would not work.
> 
> Exactly.
>  
> > Ultimately, better off running the whole thing inside a VM and passing
> > the device through to the guest.  Or ignoring the BIOS entirely and
> > implementing direct access to the hardware.  But neither of these
> > approaches is "a way to do what I'm trying to do", they're entirely
> > different approaches to making this hardware work.
> 
> If I ran the whole thing inside a VM, I would still need support in the
> kernel, right?
> 
> As far as I know, there is no documentation on Congatec's side about the
> underlying interface. Obviously I could disassemble the blob in the BIOS
> and figure it out, but I suspect that will have much less hardware
> compatibility and be subject to random breakage if they make a BIOS
> update or something. Plus, I would probably run afoul of copyright if I
> wrote a driver after doing that.
> 
> I'm not really thrilled that this is their design either, but I'm not
> sure that there is a better answer...
> 

The hardware is weird, but we should try to support it in some fashion.
But without making dangerous functionality more widely available.  So
we're looking for some solution which can be fully contained within
that hardware's driver.

Dumb idea, there will be other ideas: is it practical to take that code
blob out of the BIOS, put it into a kernel module (as a .byte table in
a .s file and suitable C interfacing), compile that up and insmod that
module?  

