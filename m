Return-Path: <linux-i2c+bounces-2275-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD4A875F19
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 09:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 247B61F21C0B
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 08:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F59E50A6E;
	Fri,  8 Mar 2024 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RN++YXGr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5074F20D;
	Fri,  8 Mar 2024 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709885287; cv=none; b=Z8MQCxwMWD9WFhTJmM58bFTuafnxx9KuzzR3nXg7gq9VIAXmKHVKihZ1M3Jo3j9frOEjPESPlm6hz3RABTaC+bkUY1rVeDLsV+KMLSlX7USj9Tv6bLFXt4TINDO2Zhv6iHISlcYZHzV3QhFS0L0V4rSz1eGJikTEt5NSXQdePmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709885287; c=relaxed/simple;
	bh=E0HX97nLy0bKdRS8NFjdP6aVUlBEd9Q/8WOyCVN9eoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NUYlTE8TCIaoZa4xoLVHjMA3j1DET4FZDeKMTAauC3y3+X11oOo0ZTU5U4+nqPVF7FImEc5aaTH1jzCQFyv8SF5wtyQM5WkUkgZbiV1i3QRQ7dLPtU0GV4VGhK9FRlD71XYmWUMUWQKtl/AtuxR3GVP9oHtnnHcLxP14QuC/xUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RN++YXGr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9AE4C433F1;
	Fri,  8 Mar 2024 08:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709885287;
	bh=E0HX97nLy0bKdRS8NFjdP6aVUlBEd9Q/8WOyCVN9eoo=;
	h=Date:From:To:Cc:Subject:From;
	b=RN++YXGrqCpzXpuWxLP1CY27wAUhBWB6ZcDxsz64PXOdbmL9gmWw4ha0d8QkqURCr
	 CF+t+j04OataYwdGH0YC1Rh1P9RrFoFgVEdHH81MvOHWG60kDUu98WFkaeWohsXXgf
	 UclzP81h70tUXx49mIYkjR2Auo8TmaBTl5f11qbkxCelbAPHMmket7O1sd5/Jag6PS
	 dT4C3ttxsNZvKkWYUGWPISDV+TWO210oV2vKkJlfCWOCBGypvvLnbzlRE6st/naC/g
	 w2Q+WI5TLrEMY/JUwqMx2JkZm9bI1sQK/8y98h3+V4O0Lx7yulpFqdeclde4SuKDhX
	 6TxEdTVWFMahw==
Date: Fri, 8 Mar 2024 09:08:03 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [GIT PULL] i2c-host fixes for v6.8
Message-ID: <iofmooj4qz7j2rphzx3ahvpdur7pwoaj4jjduraffyto4yd7si@amqj4p4ldgef>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

at this stage, four fixes make up a fat pull request, but there
has been some turmoil in the last week. The rush to get things
sent by the merge window might have generated the need for some
fixes.

One patch was removed from the pull request because it broke the
Exynos5 I2C on all platforms. For this, I really need to thank
Marek for the prompt report.

Thanks,
Andi

The following changes since commit cf8281b1aeab93a03c87033a741075c39ace80d4:

  i2c: imx: when being a target, mark the last read as processed (2024-02-22 09:02:16 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.8

for you to fetch changes up to 1f78f0901011c56801ff957f59152f390e8574b9:

  i2c: aspeed: Fix the dummy irq expected print (2024-03-07 20:54:00 +0100)

----------------------------------------------------------------
Two patches from Heiner for the i801 are targeting muxes
discovered while working on some other features. Essentially,
there is a reordering when adding optional slaves and proper
cleanup upon registering a mux device.

Christophe fixes the exit path in the wmt driver that was leaving
the clocks hanging, and the last fix from Tommy avoids false
error reports in IRQ.

----------------------------------------------------------------
Christophe JAILLET (1):
      i2c: wmt: Fix an error handling path in wmt_i2c_probe()

Heiner Kallweit (2):
      i2c: i801: Fix using mux_pdev before it's set
      i2c: i801: Avoid potential double call to gpiod_remove_lookup_table

Tommy Huang (1):
      i2c: aspeed: Fix the dummy irq expected print

 drivers/i2c/busses/i2c-aspeed.c | 1 +
 drivers/i2c/busses/i2c-i801.c   | 6 ++++--
 drivers/i2c/busses/i2c-wmt.c    | 6 +++++-
 3 files changed, 10 insertions(+), 3 deletions(-)

