Return-Path: <linux-i2c+bounces-7053-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB45798823B
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 12:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7797282EFD
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 10:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907BC1BC063;
	Fri, 27 Sep 2024 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqCHPbc0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483F917C232;
	Fri, 27 Sep 2024 10:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431781; cv=none; b=bIDzcb0hWnxdMcxitCyOHLmMd4qpVsFQKc5BKe1zDe/KEijM65100QF/oAW1ZMADaiCKLOL0NksBFKETjPgxBNN6RlKBKx1vJ1pn4h0wZxBHha3c8CxT+dlNz11JKEQNFkB0XcVeOV+uEYCpdrjT4PbIi5fB6jLWiAzHtiri2U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431781; c=relaxed/simple;
	bh=aOI1znHzlcS3KjD1jj6wA2LPTGwM80fPp/V7uRtFpLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F3Bt38IjHm4QrHgTDsg5ATBlrABkP7YEgCxuBzzIkydffIAtd9SyMrF9HySExl6kxQS2+T9RJIPAeB+1PqMQ8gVClBZyYAYPmlxTUOQFhX5G9/dssZYzsNjxTe4VOHRNY3IMWS6giqXG7BLQuwIPD8uTAm5w/cxOh2dBjuMwiXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqCHPbc0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B929C4CECD;
	Fri, 27 Sep 2024 10:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727431780;
	bh=aOI1znHzlcS3KjD1jj6wA2LPTGwM80fPp/V7uRtFpLE=;
	h=Date:From:To:Cc:Subject:From;
	b=QqCHPbc0n6miRgNFWuO1nS+0pKCg0UgDJ4Xb/AmC+/K1NS1bcCT2sbamiMoDNKMIg
	 0EloshYiwzcd7Ie/Hhl0cdblbi1O5+SSEgmWYgl9/U5w/F24318klaZJoeLZgBsPqU
	 ylfZ+ortu8eRH6gbfysPLxH8e56XkTuOhy4/luySaO9nwM72wWerC37tU5KMDb3Yvg
	 RECnJhS4h4MEkBNNHLlQUUgOkWmXPziyWB55buy2DAGbY7HQI0YDHwQlu+wipTjrcn
	 cpJnGbp+zL1p7Pup+uu/Vgr5FxnPT/QNhqVpYTKZkm6zrdrAXnF+3d6XmFMWey2Ta1
	 d4DmAae4ZyzOg==
Date: Fri, 27 Sep 2024 12:09:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: [GIT PULL] i2c-host-fixes for v6.12-rc1
Message-ID: <auogjhzhbs2w45ptdkl5ceyxsm7apyfi5wmfv3iwuzfh47pl6f@4nnrnpqqlum2>
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

Here’s the first pull request for the new 6.12 cycle. I hope
the tag description is good this time.

My i2c/i2c-host-fixes branch is based on Linus's merge commit
of the i2c stable patches.

I wish you a great weekend!
Andi

The following changes since commit 4e2c9cd7dce6c7480f236c3ead196ff4e92ed597:

  Merge tag 'i2c-for-6.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux (2024-09-23 14:34:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-fixes-6.12-rc1

for you to fetch changes up to 0c8d604dea437b69a861479b413d629bc9b3da70:

  i2c: xiic: Fix pm_runtime_set_suspended() with runtime pm enabled (2024-09-27 11:48:21 +0200)

----------------------------------------------------------------
The DesignWare driver now has the correct ENABLE-ABORT sequence,
ensuring ABORT can always be sent when needed.

In the SynQuacer controller we now check for PCLK as an optional
clock, allowing ACPI to directly provide the clock rate.

The recent KEBA driver required a dependency fix in Kconfig.

The XIIC driver now has a corrected power suspend sequence.

----------------------------------------------------------------
Ard Biesheuvel (1):
      i2c: synquacer: Deal with optional PCLK correctly

Geert Uytterhoeven (1):
      i2c: keba: I2C_KEBA should depend on KEBA_CP500

Jinjie Ruan (1):
      i2c: xiic: Fix pm_runtime_set_suspended() with runtime pm enabled

Kimriver Liu (1):
      i2c: designware: fix controller is holding SCL low while ENABLE bit is disabled

 drivers/i2c/busses/Kconfig                 |  1 +
 drivers/i2c/busses/i2c-designware-common.c | 14 ++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h   |  1 +
 drivers/i2c/busses/i2c-designware-master.c | 38 ++++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-synquacer.c         |  5 +++--
 drivers/i2c/busses/i2c-xiic.c              |  2 +-
 6 files changed, 58 insertions(+), 3 deletions(-)

