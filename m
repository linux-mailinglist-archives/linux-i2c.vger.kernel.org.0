Return-Path: <linux-i2c+bounces-8492-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B069F11F3
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 17:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0570F188B10B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 16:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A696C1E3768;
	Fri, 13 Dec 2024 16:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FU3fAC2M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602FF1C3BEB;
	Fri, 13 Dec 2024 16:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734106990; cv=none; b=antZtgUL9Ty0gVON9AfXeC9YudoYf+XCmKRZDah+kbhklrvP6508MX0Ms7dObdCyd4O+KqoItLDQBZATWIoQPPCHKTTNli2zyRwKeDNK3eEnjRpLto3oOOwNffl471muc0MnfIYQXl4bs/ob5kRcxvUKOjVLQddLEdH54lkr2Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734106990; c=relaxed/simple;
	bh=sHGwEfNRaA2arc++oGiw19TIp1M5SvOfuvCGJ8VcZwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jZuPFf75dvQa5x/PKTrS+xiPGhylt++Q2be1hVVztkMsLKQ3fA2vRigpfJF5yMqlHLU7ZwNNCXvgaXd/IUpwalw6Yi3zcOuFnNQ8/9pyN6Pi/isAtnAqBTjXpw2TDH1Q2BchaBG5l83SjVPH9F/KUOp1YOTgTRnJ3lch7I5EbGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FU3fAC2M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84795C4CED0;
	Fri, 13 Dec 2024 16:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734106989;
	bh=sHGwEfNRaA2arc++oGiw19TIp1M5SvOfuvCGJ8VcZwc=;
	h=Date:From:To:Cc:Subject:From;
	b=FU3fAC2MoP6CQulA19TQtPNAFR/KiwlTuDvHpbTG5D6evu+pol1GaDPq4MWFOdvDu
	 35SJLobEaS1uJAsiTST8sBbUh0WJtjvEFmpmfZmw/qok/lLGL7+YYNBno0BAhx74k9
	 pRLc3vf2cGrkQMYf4mmc0gaJoFwSmQ9NxQB0KcfuRPCQUfbkRBd1i8K1sqjmj28e+P
	 P8AQVQYNl0319+trWHm9kIipKzt5P837v4kurXV0oFl22Hq9UWXhAU6rwLzbiLZznP
	 xLIYOoG4gcS4jxlaVwtGpyewyaa3P9vNSdQSa1pwqPHV6/HgVgfo7TynLDZafnNup4
	 jqxBurOI9flPQ==
Date: Fri, 13 Dec 2024 17:23:05 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.13-rc3
Message-ID: <7bg2ioxxplgmmgna5j7a4e5fipg54wq3l4zaxy3gy4uk6ctmi2@ueniip4pkhx5>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

three fixes for this week; please find the pull request below.

Have a good weekend!

Andi

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.13-rc3

for you to fetch changes up to de6b43798d9043a7c749a0428dbb02d5fff156e5:

  i2c: riic: Always round-up when calculating bus period (2024-12-12 12:54:02 +0100)

----------------------------------------------------------------
i2c-host-fixes for v6.13-rc3

- Replaced jiffies with msec for timeout calculations.
- Added a sentinel to the 'of_device_id' array in Nomadik.
- Rounded up bus period calculation in RIIC.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      i2c: nomadik: Add missing sentinel to match table
      i2c: riic: Always round-up when calculating bus period

Vladimir Riabchun (1):
      i2c: pnx: Fix timeout in wait functions

 drivers/i2c/busses/i2c-nomadik.c | 1 +
 drivers/i2c/busses/i2c-pnx.c     | 4 ++--
 drivers/i2c/busses/i2c-riic.c    | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

