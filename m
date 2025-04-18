Return-Path: <linux-i2c+bounces-10483-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45584A93F73
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 23:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BE4D466D3A
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 21:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947C21C84D3;
	Fri, 18 Apr 2025 21:25:38 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 14.mo550.mail-out.ovh.net (14.mo550.mail-out.ovh.net [178.32.97.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D00270805
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.97.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745011538; cv=none; b=FLTtGKTNygjfIiVBG79N0MiO1PfvaLL/QvGDRePaXdeLZQPxa98m9pzL3WPPpHGyqJWZ4OFzaffu3prkdVeZiy7IBFDc1Y2cnkDKUmJEwkm4mdoEVevoUnTX6BSJM6zsRgpkVSOZzm5Zutr15opZhMpS3nHcbBFqPi5W1C4+MIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745011538; c=relaxed/simple;
	bh=Mm5ri0tWkRbUslVuCQmwIcJId0LsiZ58BVtEOTRsgI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+0w3iNAAWe/WbP4grVHBTIBgxlmTgu8I+1u+/Za+X92Vf0atNOAgflEH9b6VXXVMwCUqQB/w7Xg2aNzeXoUivXJ2easCVpPp2v8vQ/z4hxVO+KxKskeBc8LQef0bwjQa/gzWkiFjgKzr+UixdKqr5s/WQ5teBLCs9JYD7mis4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.32.97.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.2.205])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4ZfSJ03hTjz1Tvq
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:16:48 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-jxcsh (unknown [10.110.96.237])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9AB901FE45;
	Fri, 18 Apr 2025 21:16:47 +0000 (UTC)
Received: from etezian.org ([37.59.142.109])
	by ghost-submission-5b5ff79f4f-jxcsh with ESMTPSA
	id 9y72Gz/BAmjFhisAs7p+7Q
	(envelope-from <andi@etezian.org>); Fri, 18 Apr 2025 21:16:47 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S0037dd5481a-1e3f-4459-b323-a0b795dbc5fe,
                    9BBFD0B8C49B6260DDB62D1D32C292C5393E7E6E) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 00/10] Few improvements on the Broadcom iProc
Date: Fri, 18 Apr 2025 23:16:25 +0200
Message-ID: <20250418211635.2666234-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13925130049983285831
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpedtveeuieehfeetudejhfehleeijedvveetleefhfehuedtleektdevjedujefgvdenucfkphepuddvjedrtddrtddruddpudejkedrfeelrdeltddrledvpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehhedtmgdpmhhouggvpehsmhhtphhouhht

Hi,

just some little improvements on the Broadcom iProc I2C Driver.

Thanks,
Andi

Andi Shyti (10):
  i2c: iproc: Drop unnecessary initialisation of 'ret'
  i2c: iproc: Use dev_err_probe in probe
  i2c: iproc: Use u32 instead of uint32_t
  i2c: iproc: Fix alignment to match the open parenthesis
  i2c: iproc: Remove stray blank line in slave ISR
  i2c: iproc: Replace udelay() with usleep_range()
  i2c: iproc: Fix indentation of bcm_iproc_i2c_slave_init()
  i2c: iproc: Move function and avoid prototypes
  i2c: iproc: When there's an error treat it as an error
  i2c: iproc: Remove unnecessary double negation

 drivers/i2c/busses/i2c-bcm-iproc.c | 222 ++++++++++++++---------------
 1 file changed, 104 insertions(+), 118 deletions(-)

-- 
2.49.0


