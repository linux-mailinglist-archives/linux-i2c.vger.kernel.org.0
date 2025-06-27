Return-Path: <linux-i2c+bounces-11645-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9189BAEB4B0
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 12:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A98283BF082
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 10:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369D729E0EA;
	Fri, 27 Jun 2025 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BAafPqO5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB05212B3A
	for <linux-i2c@vger.kernel.org>; Fri, 27 Jun 2025 10:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019894; cv=none; b=Uql925JaEnK6QltG/x4pwDriBQtvqeVWPJxh6NVB86OWWsNQT8DX3w0UfO2Cbs/PnvEr6+pO1AyAU7BIqbKAoEdyFBEVbn0LHg3StYJgbDsMIDCw8+P65SYNe2oD7cH1qCPdvGiEmeQj/4slzt/7QCOkofmPFDG5/Lk8nK7uYfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019894; c=relaxed/simple;
	bh=Qh4zx0NXpQRDJAtQDYOZ6OyiO7nv+hOL31XuctNrU1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+ZIgFnVl/PFCnx66ugPRmIrdhXWV/0zDMmiN7M0hX7sbFHjlzGvenxiDWkSkWKAqwg2VwoLBkgKqjWmgN0I8T5ZAjnEd/kJV3m7BSMako11bhnKqvNrqmqKfxB/e6FPQyBKrx/3RDb9C+pJirSv/eIhgIXZqs5rPX9yhzaeohE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BAafPqO5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=Gf10sbfZVfzDaBRO3uW31lStUjZogmK6cq/uTGY1k
	8A=; b=BAafPqO50jolt3SCu6GFfUBIFwbx2lH8w6BLzTUclucpzhyIipJXuRX0T
	XGrKyGZkJwLss1NqKbkpsQZJpld3aXNXjGOzQHZM0AUMB3gxglQAB/ruvNX/kbkQ
	hZepdkawZ7hdf+T58PKW/dDiTNnFz+oJL4jYa/ktqeHlGqr7B/psTs2IVUUguXP8
	0Qxedk9p4FlwwJEEQIju43QVC8hVbRbtG8pksW4rSG87deeWN6E4aNowLUHPfQdz
	SD4S/VtfRWvdtEWvMrdkMd8hobcOyEUMhCBkw4rG58Bn1JJtbSyqJEmK4rforKyP
	Aqi7erS5BIY8NJ5t9WQ0byLsuadEQ==
Received: (qmail 1424160 invoked from network); 27 Jun 2025 12:24:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jun 2025 12:24:50 +0200
X-UD-Smtp-Session: l3s3148p1@fo+GFos40JQgAwDPXzuUAOCQSK0rM+sw
Date: Fri, 27 Jun 2025 12:24:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Jim Cromie <jim.cromie@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: scx200_acb: add depends on HAS_IOPORT
Message-ID: <aF5xcWCK_b6pPbGj@shikoro>
References: <20250615183659.902110-1-rdunlap@infradead.org>
 <aF5v-dEVBsQGnmit@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aF5v-dEVBsQGnmit@shikoro>

On Fri, Jun 27, 2025 at 12:18:33PM +0200, Wolfram Sang wrote:
> On Sun, Jun 15, 2025 at 11:36:58AM -0700, Randy Dunlap wrote:
> > The scx200_acb driver uses inb()/outb() without depending on HAS_IOPORT,
> > which leads to build errors since kernel v6.13-rc1:
> > commit 6f043e757445 ("asm-generic/io.h: Remove I/O port accessors
> > for HAS_IOPORT=n")
> > 
> > Add the HAS_IOPORT dependency to prevent the build errors.
> > 
> > (Found in ARCH=um allmodconfig builds)
> > 
> > drivers/i2c/busses/scx200_acb.c: In function ‘scx200_acb_reset’:
> > include/asm-generic/io.h:596:15: error: call to ‘_outb’ declared with attribute error: outb() requires CONFIG_HAS_IOPORT
> > 
> > drivers/i2c/busses/scx200_acb.c:224:26: note: in expansion of macro ‘inb’
> > include/asm-generic/io.h:542:14: error: call to ‘_inb’ declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
> >   224 |                 status = inb(ACBST);
> > 
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Arnd Bergmann <arnd@kernel.org>
> > Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> > Cc: Jim Cromie <jim.cromie@gmail.com>
> > Cc: Andi Shyti <andi.shyti@kernel.org>
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Cc: linux-i2c@vger.kernel.org
> 
> Applied to for-current, thanks!

Ah, sorry, I already applied an earlier patch...


