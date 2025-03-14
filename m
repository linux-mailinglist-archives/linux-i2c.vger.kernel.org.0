Return-Path: <linux-i2c+bounces-9834-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1220EA61531
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Mar 2025 16:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0269C188C8FF
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Mar 2025 15:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C621FAC3D;
	Fri, 14 Mar 2025 15:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMHuEUI1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6681D7081A;
	Fri, 14 Mar 2025 15:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741967010; cv=none; b=e8rIfmXGBoHMfbGzZ9vPCJDFN7JPjxnATpSdPV7rr2I53T4zyiuJXHDUEI9e4vacG9B+N8s8wDZaoHMgsMiMgt41oqGhZ/jKt+tZ+7DZHkazAc52D0CtC5y6aV9xH6rdkP5XteqKKVWuKnVB4j1XD4xD0ZdzmQDX1XpE1Ba35Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741967010; c=relaxed/simple;
	bh=A7ACwrOcDWxFSXNkSxe9leQpcdrWku29f/WynU5fGDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H5rKeiwbruLBeQmXYd5wGVK4kFgkTXozc0yUhsfWxSGOWVaPoNPRwDCKw9CgR+KyyN/vhA3IyKv9H6ZtkdVt/9DZzNjkuIjjW2quZvrxFwT10UMOiNvAe5e0jVXuuH21AKjhek0IVQs5LNXoGgTEXcGh9Ktz9ELzdaRNbOHGROc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMHuEUI1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3546AC4CEE3;
	Fri, 14 Mar 2025 15:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741967009;
	bh=A7ACwrOcDWxFSXNkSxe9leQpcdrWku29f/WynU5fGDI=;
	h=Date:From:To:Cc:Subject:From;
	b=gMHuEUI1RURRLpnDg8xy4KTaCFUJ3de3GpaH1SscQF9pcRoyZ1+XmhL+QP2J1xQ1J
	 t05uEZmukeKHJ5+IgY592YcKv2tZDLegdJHldlfUu0vK3oeC5u0pUpIrM7i/DM2cvI
	 WB6M2tpSbAdOGVTpEwJQlJuzXqIMXhb0rs5nZXKInx+QNFEhOrnLhzz09MYS+fOFu+
	 Et1CxiMDXF4UqOjdLP96oC/kbjQKvJONTvCuE9XviXFtC/qogI7J6ElyRROgog++Go
	 oiMPN/Z5HfjXXVnL6I6ztJ2YI6D7l1isuzwd4pmjk1D1jFat8WKQbvpXopo5d1O1mi
	 1fHnvFn2truvg==
Date: Fri, 14 Mar 2025 16:43:26 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.14-rc7
Message-ID: <47qvm27cjuxtx4djqlmjinl73zsg6l3ihqtqvk7za6kfvqmnzo@q77ejrvpzzvx>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Wolfram,

somehow, for some higher forces, the trend in I2C is flipped:
instead of slowing down, the number of fixes goes up at the end
of the cycle. Four patches this time!

Big thanks to the TI folks for testing and reviewing the
i2c-omap patch, which could have caused a system hang.

Now it's time to wrap things up for the merge window—hopefully,
I don't leave anything behind.

Have a good weekend!
Andi

The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a:

  Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.14-rc7

for you to fetch changes up to 2b22459792fcb4def9f0936d64575ac11a95a58d:

  i2c: sis630: Fix an error handling path in sis630_probe() (2025-03-12 12:24:53 +0100)

----------------------------------------------------------------
i2c-host-fixes for v6.14-rc7

- omap: fixed irq ACKS to avoid irq storming and system hang.
- ali1535, ali15x3, sis630: fixed error path at probe exit.

----------------------------------------------------------------
Andreas Kemnade (1):
      i2c: omap: fix IRQ storms

Christophe JAILLET (3):
      i2c: ali1535: Fix an error handling path in ali1535_probe()
      i2c: ali15x3: Fix an error handling path in ali15x3_probe()
      i2c: sis630: Fix an error handling path in sis630_probe()

 drivers/i2c/busses/i2c-ali1535.c | 12 +++++++++++-
 drivers/i2c/busses/i2c-ali15x3.c | 12 +++++++++++-
 drivers/i2c/busses/i2c-omap.c    | 26 +++++++-------------------
 drivers/i2c/busses/i2c-sis630.c  | 12 +++++++++++-
 4 files changed, 40 insertions(+), 22 deletions(-)

