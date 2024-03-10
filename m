Return-Path: <linux-i2c+bounces-2314-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFB7877655
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Mar 2024 12:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02577B20D98
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Mar 2024 11:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450B2200D2;
	Sun, 10 Mar 2024 11:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r1Wmo6g7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A37200AE;
	Sun, 10 Mar 2024 11:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710070370; cv=none; b=i08RUcfRYIxB/1jDSVBgV9PcK2qPxskwKUV4gyOydqgsa/x2PuUjsABMX1u2CVsnqub92kHB23BZA3PfD+SComDTqPv+5ZCbKuJrguadqBgbC5mDJptz/MkEXDeyctQ2OQGDa70CuEkJrs2oUROkDMmQhck/ix8h7kppc1V3hHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710070370; c=relaxed/simple;
	bh=tgvuG2vFL41wYnIq+Hysp9HaTicCmN3CgwRQbDF1W1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mTrz9fTQzzF2CKfv+HWk6aHpdik1sZi7Ly2r/56zFPLAr/h+2QpWPO5hxwdB+FBFwaq9kX+QgrVafBR9G30eBBJy/P8rTFSaIRLnkIpcBEhgbGW1lYkcLYW2Vn/5AqwfrCIkX15Vsiuh8RhrEOi9S+tm4xRhqvJvoddzI9ahKrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r1Wmo6g7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9684AC433F1;
	Sun, 10 Mar 2024 11:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710070369;
	bh=tgvuG2vFL41wYnIq+Hysp9HaTicCmN3CgwRQbDF1W1I=;
	h=Date:From:To:Cc:Subject:From;
	b=r1Wmo6g74jTMj8YtQSlcrjPi1/ii1yikyWyExipheYGhh87cth7r5qMrJvV2mf10y
	 MH5ziPN5+6iXPT7WDRcrYaBzf2D2pTKnrKAI5AxzakP7ERMQnn8LSFVgIiQZTO5Av9
	 yqYrsf9TcPtMOzROANHJQklvkddHsGTq4It996wiNUwFMdCaiGphrgntIzKE3oDibk
	 DMyqyQu9IZhryBPQ0S9T3g4X7ord731jlAmxJw7ssVIgqPraD5SrY24OxsIPxgux25
	 DaYdPiCnS1fWryznXTBIfQNgGvAYKORmnbOdE5g1NTCFhCMw+bZNeB3+JMAjQ8TSAh
	 TP6KygFCDvEsw==
Date: Sun, 10 Mar 2024 12:32:45 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Hans Hu <HansHu-oc@zhaoxin.com>
Subject: [GIT PULL] i2c-host changes for v6.9 - part 2 (i2c zhaoxin)
Message-ID: <sxe4w2iwfkaoowaqssz2lbig7tlnoasseod5atval23saqigee@tzz7qwy4fhaq>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wolfram,

after Linus pulled the commit from Christophe, which was causing
conflicts with the I2C Zhaoxin controller, I'm sending you the
second part of pull request for v6.9, which includes only the six
patches from Hans that add support.

This series is in i2c/i2c-host-next. I haven't created a new
branch since it has already been tested here for several days
here.

If time permits, there are two series from Theo and Mukesh queued
in i2c/i2c-host.

Thanks,
Andi

The following changes since commit b3b00cea6378475f972eb49c068062627ff3a14d:

  Merge branch 'i2c/i2c-host' into i2c/i2c-host-next (2024-03-08 23:30:28 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.9-pt.2-zhaoxin

for you to fetch changes up to 391ead8dc4e49b6de96ffdd1f6b1d89fa2282e40:

  i2c: add zhaoxin i2c controller driver (2024-03-08 23:30:50 +0100)

----------------------------------------------------------------
Added support for the Zhaoxin I2C controller. This required
extensive code refactoring in the wmt driver, mainly targeting
the extraction of the common IP from the viai2c, which will be
used by both wmt and Zhaoxin.

----------------------------------------------------------------
Hans Hu (6):
      i2c: wmt: create wmt_i2c_init for general init
      i2c: wmt: split out common files
      i2c: wmt: rename something
      i2c: wmt: fix a bug when thread blocked
      i2c: wmt: add platform type VIAI2C_PLAT_WMT
      i2c: add zhaoxin i2c controller driver

 MAINTAINERS                             |  10 +++-
 drivers/i2c/busses/Kconfig              |  10 ++++
 drivers/i2c/busses/Makefile             |   3 ++
 drivers/i2c/busses/i2c-viai2c-common.c  | 250 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-viai2c-common.h  |  85 +++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-viai2c-wmt.c     | 148 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c | 299 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-wmt.c            | 421 -------------------------------------------------------------------------------------------------------------------------------------------------------------------
 8 files changed, 804 insertions(+), 422 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.h
 create mode 100644 drivers/i2c/busses/i2c-viai2c-wmt.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-zhaoxin.c
 delete mode 100644 drivers/i2c/busses/i2c-wmt.c

