Return-Path: <linux-i2c+bounces-12698-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4433FB467ED
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 03:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED8AFAA3B9B
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 01:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A9C1519B4;
	Sat,  6 Sep 2025 01:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TktMtN4Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0661DA3D;
	Sat,  6 Sep 2025 01:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757121510; cv=none; b=rPnyo+sk6DZ+1Dphx3V6gxnEQTmWU3O1ysCAg/TjCkCXUtlLYsQu8C4zw0+8j1a/9GWKG3a7izq4ZMc1F4jNLHifnDfSM/A5/ddQhhHPeDOTUTmdfCeXDTnIxdvI9BbUQlY0D1ZSNQiX8qsZSVmA9/dZaUKpRy34+OfGXY3ALLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757121510; c=relaxed/simple;
	bh=Ue4tdgnLgQFNcjHwN2e3kayUJ6DRnqkcVpIJuTa72q8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ssEllVq/+K8mnYL8CTbQV2UyWFVLlXRep3Wn5erdPaXaqoshuK73L98rBvUp0MvIC0CkhSdM1T3xuWVtUBjueG93nXVfSpMeHiY4GU/uYPknByx42IjJiYMiiI/UTusYd0toSVXokPGzPP/bn8q06aKk/8sztre+AdYI2SSg/bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TktMtN4Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9842C4CEF1;
	Sat,  6 Sep 2025 01:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757121510;
	bh=Ue4tdgnLgQFNcjHwN2e3kayUJ6DRnqkcVpIJuTa72q8=;
	h=Date:From:To:Cc:Subject:From;
	b=TktMtN4QA7PTP1Qm2ZhIlCoRJv/9/BDPDiAumjbCLaGvdVnYQLl+1g5XL7xLf156f
	 93iLwETI9a1KhRqJ9XWE9XKQaxnR1CIk86jS46HiKnIS6IxHXeS8N8TOyKO2SuTsCn
	 qaTonOBSnR1IDjystmv0uJW9hhmh8ubpmoKZetzn7JkzcS6yFKMMsR8mq4+3zrnvSG
	 rinHyllP0ENmtOuxxl0y65pmdg9uPIKFV91CdmmruzIDVlxD+GUQpiRhOtdcBszeOy
	 pj7f+KafA1t74rIP9dx8VRHT9wvH1/pMGlXiwEAHceossJkA8383B8mQ4c9417EQ+0
	 E+cFlTvXfDc7Q==
Date: Sat, 6 Sep 2025 03:18:24 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.17-rc5
Message-ID: <wrui7mvzr6r6qmzh3y24zehmv3yx3geth3b7llsn6sqdlt26gv@5tpp7hr2266p>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

Here is this week's pull request: four patches affecting two
drivers, i801 and rtl9300. The rtl9300 patches are a
prerequisite for others that will be merged into i2c-host.

Have a good weekend,
Andi

The following changes since commit b320789d6883cc00ac78ce83bccbfe7ed58afcf0:

  Linux 6.17-rc4 (2025-08-31 15:33:07 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.17-rc5

for you to fetch changes up to ede965fd555ac2536cf651893a998dbfd8e57b86:

  i2c: rtl9300: remove broken SMBus Quick operation support (2025-09-04 00:31:34 +0200)

----------------------------------------------------------------
i2c-host-fixes for v6.17-rc5

- i801: fix device IDs
- in rtl9300:
  - fix channel number check in probe
  - check data length boundaries in xfer
  - drop unsupported SMBus quick operation

----------------------------------------------------------------
Chiasheng Lee (1):
      i2c: i801: Hide Intel Birch Stream SoC TCO WDT

Jonas Jelonek (3):
      i2c: rtl9300: fix channel number bound check
      i2c: rtl9300: ensure data length is within supported range
      i2c: rtl9300: remove broken SMBus Quick operation support

 drivers/i2c/busses/i2c-i801.c    |  2 +-
 drivers/i2c/busses/i2c-rtl9300.c | 22 ++++++++--------------
 2 files changed, 9 insertions(+), 15 deletions(-)

