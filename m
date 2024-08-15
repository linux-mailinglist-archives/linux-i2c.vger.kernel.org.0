Return-Path: <linux-i2c+bounces-5425-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2239C952E28
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 14:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55EC51C20DD0
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 12:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F611714C5;
	Thu, 15 Aug 2024 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QseeLamu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5UM9eemT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DC11AC888;
	Thu, 15 Aug 2024 12:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723724236; cv=none; b=SLwwLQfXV8SdErjAPjSNPg5Ee4WV3GFdfxQ+5wpBmpqVFUWcsNBnv5WehvtUNt4LG9Df2aFRsmeTbNaFvpuSXfMgrDs2wDqcjcW5bROf4qErYWwj0MC6M9PguyTNHReJzGivsF2E9IYEqNuxd90pTcUNe1PUs6nlV0bLfk/DjaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723724236; c=relaxed/simple;
	bh=8GzwF1RSODdXKQsmpYs3h1fjM4vibb9GvTjZrpElbrA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=gHmUTTfSzO4IC8OeBL0zlL9RSzjNOPwAUG6K9DSwXXhqyWL6OEBcKk9CwyC8Ri2CnZ8NQlRV6pQ4JTdzCccnzRHb77Q2GArcSaw5OCYlfcteMogCaA1oO3KosOWJ/mUJZTjRy+Kc9zvbvjLLXEtApmNpYr5xoOF0V93/uEpOU3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QseeLamu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5UM9eemT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723724232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=rRigOJOO3qhALtqJE6dw15axLsE6DCGme8lKMcQne9I=;
	b=QseeLamu+Ve6G/d3HbW7okSVN98YQ2FNSrDeLd1E3GlVr8M63wB4CHCPs+NxPhKct4C4zc
	CHaKE6hfu/PQgUQ7Ky438ULIYOeaTZ5rJiC7fP+lkSt2vM7RhtimWvUlgFtQnRpTKz3g7F
	/S6aqMaio9VKU83MuH7FRTg1R+rmJk2KdX7KeiVQZgvBI/hAQZHuWqMeWy91SNpTyVOEhf
	5QeoV7TQ6iQdmAfmWEayfH6mm6fbKLoIQyLw+CO4Cc3mSsO5ZLdeLyHdWQKY5Es26Tu5Rl
	+0fyU8dO9pPvNQ94ID/rjVgjWKCD9HDr6Iyr2rD5h6iK4cT+is8orsJTOMvALg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723724232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=rRigOJOO3qhALtqJE6dw15axLsE6DCGme8lKMcQne9I=;
	b=5UM9eemTh6QW2duf1BOI6wBtqOvSeGaa8dJXAMrsOWaSKxHE9KNZkfxuix/5OayqMO8ppG
	Hy5eX/jx/Yc48mDA==
To: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
 linux-mm@kvack.org, lee@kernel.org, andi.shyti@kernel.org,
 linux-i2c@vger.kernel.org, s.hauer@pengutronix.de,
 christian.gmeiner@gmail.com, Mary Strodl <mstrodl@csh.rit.edu>
Subject: Re: [PATCH v4 1/2] x86: Add basic support for the Congatec CGEB
 BIOS interface
In-Reply-To: <20240814184731.1310988-2-mstrodl@csh.rit.edu>
Date: Thu, 15 Aug 2024 14:17:12 +0200
Message-ID: <87sev6m14n.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mary!

On Wed, Aug 14 2024 at 14:47, Mary Strodl wrote:

So this caught the attention of my mail filter because the subsystem
prefix is 'x86:' while it obviously should be 'mfd:'

> The Congatec CGEB is a BIOS interface found on some Congatec x86
> modules. It provides access to on board peripherals like I2C busses
> and watchdogs. This driver contains the basic support for accessing
> the CGEB interface and registers the child devices.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>

This Signed-off-by chain is invalid. See Documentation/process/

Aisde of that. How is any of this supposed to work. What is the user
mode helper doing and why does this need this netlink indirection?

And looking at that reference implementation on github makes me just
shudder:

        board.mem_fd = open("/dev/mem", O_RDONLY);

and then it allocates anon memory:

	board->code = mmap(NULL, msg->code.length,
		           PROT_READ | PROT_WRITE,
			   MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);

which it hands back to the kernel so the kernel can copy stuff into it
followed by some other command:

         mprotect(board->code, msg->code.length,
		  PROT_EXEC | PROT_READ | PROT_WRITE)

Seriously? RWX mappings?

So this copies a code blob out of the BIOS region into user space and
lets user space use this blob to interact with the BIOS extension,
right?

So an i2c transfer does a full round trip:

   i2c::xfer -> cgeb -> netlink -> user helper -> execute random code ->
   user helper -> netlink -> cgeb -> ...
     
right?

Has anyone tried to analyze what this BIOS provided code blob is
actually doing?

All it does is to poke at a range of IOPORTS with in*(), out*() and that
poking mechanism depends on the generation of that CGEB implementation.

Congatec even provides the GPL2 licenced source for this pokery as a
kernel driver.

Three generations of interfaces and for each the poking is about 200
lines of unreadable, malformated gunk, which can be probably condensed
to 100 lines of readable kernel code for each generation.

Add a bunch of helpers which set up the various transfers for the
subdevices and you can spare all this horrible nonsense with user mode
helper, executing random BIOS provided gunk, netlink and completely ill
defined data structures.

Thanks,

        tglx

