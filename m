Return-Path: <linux-i2c+bounces-333-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6008C7F16AB
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 16:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1282F2823A5
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 15:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303711CA80;
	Mon, 20 Nov 2023 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nf37+MGo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45AC15E9D
	for <linux-i2c@vger.kernel.org>; Mon, 20 Nov 2023 15:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA398C433C8;
	Mon, 20 Nov 2023 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700492721;
	bh=wkDFkqWY1q+7TNnh5FBjMJrCHmKUB6aLYQbdLpZqwSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nf37+MGouG1zQ31cVpFoLYz4Q3JdOGJ2KdrauMtMigOEAKXQY9aNLsyOo+rGpUjsf
	 aLsPbrR8LlQv6etrojYjeLvn+nkaDC4vNLCxVbwc5nU9tumi4+cqHnujmWpoRGkziE
	 7YgUZnmGWKlnSHTuar2CA44JXgd88+kqru1oHVOcUudm4Y5S1k/P2XxKJbEMqJOXWu
	 KQ/LWrQrsZdXOEF/DyqUIxGBNgJxA1H9fkI3ZPFGdZNwhSLrCb7AcFefSTzAzd9HBC
	 06Me0sJT+1oVQYAjL08izkU7iQ2QKtcGqrMNjLL/uvq9zybglyCWiF1rLJ0vhotWc1
	 Kr14ETS5/dloQ==
Date: Mon, 20 Nov 2023 15:05:16 +0000
From: Will Deacon <will@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PULL REQUEST] i2c-for-6.7-rc2
Message-ID: <20231120150515.GA32570@willie-the-truck>
References: <ZVf/pqw5YcF7sldg@shikoro>
 <CAHk-=wi9a9u+1cAxxHw7KxXsfPvdWCbhatK7enFSjgwjrovCZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi9a9u+1cAxxHw7KxXsfPvdWCbhatK7enFSjgwjrovCZA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Nov 18, 2023 at 09:56:59AM -0800, Linus Torvalds wrote:
> On Fri, 17 Nov 2023 at 16:05, Wolfram Sang <wsa@kernel.org> wrote:
> >
> > Jan Bottorff (1):
> >       i2c: designware: Fix corrupted memory seen in the ISR
> 
> I have pulled this, but honestly, looking at the patch, I really get
> the feeling that there's some deeper problem going on.
> 
> Either the designware driver doesn't do the right locking, or the
> relaxed IO accesses improperly are escaping the locks that do exist.
> 
> Either way, just changing "writel_relaxed()" to "writel()" seems to be wrong.
> 
> Of course, it is entirely possible that those accesses should never
> have been relaxed in the first place, and that the actual access
> ordering between two accesses in the same thread matters. For example,
> the code did
> 
>         *val = readw_relaxed(dev->base + reg) |
>                 (readw_relaxed(dev->base + reg + 2) << 16);
> 
> and if the order of those two readw's mattered, then the "relaxed" was
> always entirely wrong.
> 
> But the commit message seems to very much imply a multi-thread issue,
> and for *that* issue, doing "writel_relaxed" -> "writel" is very much
> wrong. The only thing fixing threading issues is proper locks (or
> _working_ locks).
> 
> Removing the "relaxed" may *hide* the issue, but doesn't really fix it.
> 
> For the arm64 people I brought in: this is now commit f726eaa787e9
> ("i2c: designware: Fix corrupted memory seen in the ISR") upstream.
> I've done the pull, because even if this is purely a "hide the
> problem" fix, it's better than what the code did. I'm just asking that
> people look at this a bit more.

Thanks for putting me on CC. The original issue was discussed quite a bit
over at:

https://lore.kernel.org/all/20230913232938.420423-1-janb@os.amperecomputing.com/

and I think the high-level problem was something like:

1. CPU x writes some stuff to memory (I think one example was i2c_dw_xfer()
   setting 'dev->msg_read_idx' to 0)
2. CPU x writes to an I/O register on this I2C controller which generates
   an IRQ (end of i2c_dw_xfer_init())
3. CPU y takes the IRQ
4. CPU y reads 'dev->msg_read_idx' and doesn't see the write from (1)

(i2c folks: please chime in if I got this wrong)

the issue being that the writes in (1) are not ordered before the I/O
access in (2) if the relaxed accessor is used. Rather than upgrade only
the register writes which can trigger an interrupt, the more conservative
approach of upgrading everything to non-relaxed I/O accesses was taken
(which is probably necessary to deal with spurious IRQs properly anyway
because otherwise 'dev->msg_read_idx' could be read early in step (4)).

Your point about locking is interesting. I don't see any obvious locks
being taken in i2c_dw_isr(), so I don't think the issue is because relaxed
accesses are escaping existing locks. An alternative would be putting
steps (1) and (2) in a critical section and then taking the lock again
in the interrupt handler. Or did you have something else in mind?

Will

