Return-Path: <linux-i2c+bounces-8597-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5079F6592
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 13:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB3D218933F8
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 12:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A21B1A23A1;
	Wed, 18 Dec 2024 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUINo1IS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36D3199396;
	Wed, 18 Dec 2024 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734523712; cv=none; b=KuwWfd5RyTiuHbRgEsqLItl1K+RV492pfj6R4u6AEkp3hnc8OdA7xyXwxtEqN3CfEqM9ncBgZEIxzVocEUWHa7mYM7IWpFYBrHAAkJoOXrVDCQqIwa2ryxuhfRE+jTtDK/Cngv+uOfQdf05KmPFknbuGRdcbh8RPnzTXQ28TKh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734523712; c=relaxed/simple;
	bh=Aki9cR5hgIlgmZZzFSZjatM8ttFH9PdwQjT6VXm94Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xgr1k+KtjmTzrzvEVMzR1dlxk8nWfWYG+akKkrCVPxSEv1u8DPD/Dn0SaZKbX/Edgfi9QKqGMGjwSDv8Kb7ZK2t5WTYWVK8yYTvlkKgP6+YIL5VRtDuxq3G93geuSj9rujqtswlB+ZDRk5NHV4fpsWjYlojcXRXlb8V9CIzhgTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUINo1IS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02D4C4CED7;
	Wed, 18 Dec 2024 12:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734523711;
	bh=Aki9cR5hgIlgmZZzFSZjatM8ttFH9PdwQjT6VXm94Xo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aUINo1ISnQ7uJtkW9Z3SEBYlPgd/cSynL7tilEY/JlgoQ0jkgPUhUc8F/Uk++7Wfn
	 S2eQMOr81PSoeWg3qnJnWQmQ8+PfiFXfyEGkD0ZswbRYtWuBzSDAYnuIam/ZHyPup5
	 6iu59KbOihwTo7onx89nLjFY6kxP+RlwFsI6sqGV47NdMxwf9Ty7HJY6SKSX50mUxf
	 ZhLeR0yeqofZMjR8OFTjzPXhdtJp2iVvCYEKqKN/Z1I9/mZikIjCpKArgQROSRQOhu
	 2poZcIFMPYoHoAHscdPnIVc6gaiG3p3nj3KV2qNPWpIAKI3CBXrtVkqaOTeLyDjK+1
	 cqVqWEzqHhzzw==
From: Conor Dooley <conor@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] i2c: microchip-core: fix "ghost" detections
Date: Wed, 18 Dec 2024 12:07:42 +0000
Message-ID: <20241218-outbid-encounter-b2e78b1cc707@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
References: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2438; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=+vHaPH1a1woczZ/LXoIUBZOD/s4yRKT5BR6VDjl0RiM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOlJu7lvLYmacUjr4G2Drd0Xi1/fSprJ4Lep2PKAXOzF+ bqP7P2lOkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjARPXZGhu8FjIt9p7x5+1D3 1u4jnI8Duh9uuCO6LXa5pbe9/doM88mMDFt/ffCdH/jSs4fJva3U5f3/SR3WhUXnP3PzPV6r8ea 8JQsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Running i2c-detect currently produces an output akin to:
    0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         08 -- 0a -- 0c -- 0e --
10: 10 -- 12 -- 14 -- 16 -- UU 19 -- 1b -- 1d -- 1f
20: -- 21 -- 23 -- 25 -- 27 -- 29 -- 2b -- 2d -- 2f
30: -- -- -- -- -- -- -- -- 38 -- 3a -- 3c -- 3e --
40: 40 -- 42 -- 44 -- 46 -- 48 -- 4a -- 4c -- 4e --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: 60 -- 62 -- 64 -- 66 -- 68 -- 6a -- 6c -- 6e --
70: 70 -- 72 -- 74 -- 76 --

This happens because for an i2c_msg with a len of 0 the driver will
mark the transmission of the message as a success once the START has
been sent, without waiting for the devices on the bus to respond with an
ACK/NAK. Since i2cdetect seems to run in a tight loop over all addresses
the NAK is treated as part of the next test for the next address.

Delete the fast path that marks a message as complete when idev->msg_len
is zero after sending a START/RESTART since this isn't a valid scenario.

CC: stable@vger.kernel.org
Fixes: 64a6f1c4987e ("i2c: add support for microchip fpga i2c controllers")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
My original tests with KASAN/UBSAN/PREEMPT_RT enabled saw far fewer of
these "ghost" detections and the skip caused by the occupied address at
0x18 on this bus is part of my attribution of the problem. Unless I'm
mistaken there's no scenario that you consider a message complete after
sending a START/RESTART without waiting for the ACK/NAK and this code
path I deleted is useless? Looking out of tree, it predates my involvement
with the code so I don't know where it came from, nor is there anything
like it in the bare-metal driver the linux one was based on.
---
 drivers/i2c/busses/i2c-microchip-corei2c.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index e5af38dfaa81..b0a51695138a 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -287,8 +287,6 @@ static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
 		ctrl &= ~CTRL_STA;
 		writeb(idev->addr, idev->base + CORE_I2C_DATA);
 		writeb(ctrl, idev->base + CORE_I2C_CTRL);
-		if (idev->msg_len == 0)
-			finished = true;
 		break;
 	case STATUS_M_ARB_LOST:
 		idev->msg_err = -EAGAIN;
-- 
2.45.2


