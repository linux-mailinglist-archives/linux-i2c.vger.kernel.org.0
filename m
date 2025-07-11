Return-Path: <linux-i2c+bounces-11913-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7DBB020E7
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 17:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32F1D3A0545
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 15:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82D92ED16F;
	Fri, 11 Jul 2025 15:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvaFoo7r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FADE2ED165;
	Fri, 11 Jul 2025 15:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752249145; cv=none; b=kJAJTSRIbPEcgXR5gOAC6BiQ7lzhVQ8xctL2y523BJfqtq2zK0MYgjpOvIiw2fVc2BpWhLyUDYT51SpmqqUvuEH9+fb9/th/cTuSdocuyMA/npnGhtp6c7xKUrdpGTkXVSqRp+kXoPN8qLDBUhFKIZ7l2mOiDMgJJrCmDM5c/MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752249145; c=relaxed/simple;
	bh=RlRu9uSQ5zj2jECSvP1viuoOh9bQsYZgl0JQUp5qUqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dRhR8oIcVDMMjihxcEMl45ITV1Av0adQg2Fm40bNW93kRCFRzzt66DJadJwh/a1s9fiUXn20Bkd1IptRwLKDQISh6QgCBo/1ZcuvyxeSOWjQTbVIFQaMXPcHgxvKk3bXJ4eDtRqK8KvB3jIqENVBP+Zz22Z6ScQrXU1l5vqt1xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvaFoo7r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183F2C4CEED;
	Fri, 11 Jul 2025 15:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752249145;
	bh=RlRu9uSQ5zj2jECSvP1viuoOh9bQsYZgl0JQUp5qUqg=;
	h=Date:From:To:Cc:Subject:From;
	b=QvaFoo7rAkkA3KEP35rGoBYRRehyJTctH9VSALdwdESmE+7DZe3OCH7tbIvrCX5yP
	 4Wj1M4SIsiW8/E87SkUV+VBDL+c2HaFnrUb9j8YjsnjZm5Vv778G7naIbQT0zuJ3lj
	 cEqkH6t4KzIjJc8sMGzD0gtYXZODGHDmIh/ElFhpwb75HNIfpXO9R350OaMVKTKpVM
	 4UerWfU6vF7do0kwLlFph8d1GNtgGb9thPnT8CMjVLECB4fY6nTQReGBISc9mRqJGi
	 reGL4NR2RRGxYaKu1G36hcu4gdipu/n1P/2wWjS8KVutmyLrw5pLGn+IdXsbiwh4PZ
	 OnxrTRSywje4g==
Date: Fri, 11 Jul 2025 17:52:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.16-rc6
Message-ID: <7zjrabdfofykjclb7pv7agfua4mvwepahc2hicis34frpr3ap2@kkbsms4a5c5z>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Wolfram,

Here is this week's pull request. One more fix from Akhil arrived
a bit too late, so I left it out for now.

Have a great weekend,
Andi

The following changes since commit d7b8f8e20813f0179d8ef519541a3527e7661d3a:

  Linux 6.16-rc5 (2025-07-06 14:10:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.16-rc6

for you to fetch changes up to 6aae87fe7f180cd93a74466cdb6cf2aa9bb28798:

  i2c: stm32f7: unmap DMA mapped buffer (2025-07-10 11:58:33 +0200)

----------------------------------------------------------------
i2c-host-fixes for v6.16-rc6

omap: add missing error check and fix PM disable in probe error
path.

stm32: unmap DMA buffer on transfer failure and use correct
device when mapping and unmapping during transfers.

----------------------------------------------------------------
Christophe JAILLET (2):
      i2c: omap: Handle omap_i2c_init() errors in omap_i2c_probe()
      i2c: omap: Fix an error handling path in omap_i2c_probe()

Clément Le Goffic (2):
      i2c: stm32: fix the device used for the DMA map
      i2c: stm32f7: unmap DMA mapped buffer

 drivers/i2c/busses/i2c-omap.c    |  7 +++++--
 drivers/i2c/busses/i2c-stm32.c   |  8 +++-----
 drivers/i2c/busses/i2c-stm32f7.c | 24 +++++++++---------------
 3 files changed, 17 insertions(+), 22 deletions(-)

