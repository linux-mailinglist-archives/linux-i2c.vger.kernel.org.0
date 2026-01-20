Return-Path: <linux-i2c+bounces-15283-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C2690D3C3DF
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 10:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7C529506C7B
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 09:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF00A3D6666;
	Tue, 20 Jan 2026 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZDxd6uKi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCE83D666E
	for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901308; cv=none; b=OZHesvy8ctO1hin/cxuOC4HpTsCYhcBBi1P0XxS/uldsyMQvmUumqeVaW6ZsyTBBh8eZj+TDaD0gQegwizqqLWa2Mbhc1uZG/OH1y5paTjb1Ll+51+WQJ2/alsp6mfmQKMhuOSzOgB9Ty1PiikHlHqDeYSMAUDhkKZM0BBpcg2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901308; c=relaxed/simple;
	bh=kacx/wijXgh0RyzPLWu4et+8KIlfwg0BtK1c4RsEPsg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C9q2WgXXqmLrkKNyyzDCho+nhsHMGF0SD4RrLmW7JyFaOnSWOp/fkYjiR/Eus1mfq5Jst75+kVuu0uHt8uV7UbKX+gCVLz4XZzPXiuW6WJfI3DW35BNJUgYfExV/QANRewdmFzPU2Q5ege+YvPdDUMY3Ma4LDChKF+JY7oQVm1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZDxd6uKi; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 44E401A294B;
	Tue, 20 Jan 2026 09:28:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 09646606AB;
	Tue, 20 Jan 2026 09:28:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38C4B10B68378;
	Tue, 20 Jan 2026 10:28:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768901298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=pA8QLk8Uy0HBc993P0jXWMKnfU2R6MftU7nviMflUFA=;
	b=ZDxd6uKi6zJo1aZ6zxK4ZZ3PoTxdDzew6S4PPJirLRREv0SdXDJ9v5cLIaOLSmA37Lj34L
	/LXjA+SYLFuU2XX2tdigji3E5MGEg5fjJnLoLNhWVEfzrDGu189lKvpFQSt/b7lQfFEEo/
	4vNvXMSRVvB7Cgdsv8+VXlEnUiL0gqX8jpzZGpaJi7lGE/XCzb9b9RmPzi1bDv8+1TZ5e8
	usr1gDnmL8DjK4BA40zvNiLosJuiw3igEzLP6s+v+TzICzlHJau002PxjdGbR0RUW1V4mE
	4GqzkahMcsKM7H5KJ+IdbvclDGLY7JzdBK1E7iNkZIYen9m1NnSBYoT6M9jfqw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v5 0/6] i2c: designware: Improve support of multi-messages
 transfer
Date: Tue, 20 Jan 2026 10:28:00 +0100
Message-Id: <20260120-i2c-dw-v5-0-0e34d6d9455c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKBKb2kC/2XMQQ6CMBCF4auQrq3pDC0trryHcdEORZooNWBQY
 7i7hQTUuHyT+f4X630XfM922Yt1fgh9iG0aapMxamx78jxUaTMUqECA5AGJV3de2RxUrZXBsmD
 p+dr5Ojzm0OGYdhP6W+yec3eA6bok9JIYgAuunVFOA2lr9N7FeDuHdkvxwqbIgF8whxVigqWQU
 BgtayLxD/MPBChXmCfoSDpCi+Qs/UP5BbFYoZygKJRUpfGa1C8cx/ENP2raFUkBAAA=
X-Change-ID: 20251014-i2c-dw-da315f758296
To: Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Dmitry Guzman <dmitry.guzman@mobileye.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add support for the I2C_M_STOP flag to the .xfer() function of the
designware driver. This allows grouping multiple accesses in a single
call and changing the target address after a STOP flag. This is achieved
by splitting i2c_dw_xfer() in two functions. The core logic handling
the transaction is now in __i2c_dw_xfer_one_part(), while i2c_dw_xfer()
loops over the messages to search for the I2C_M_STOP flag and calls
__i2c_dw_xfer_one_part().

Handle controllers that lack the ability to emit a RESTART when two
consecutive messages have the same address and direction by aborting
transfers that contain such a sequence of messages. For those controllers,
we also check that we do not get any unwanted STOP caused by a Tx FIFO
underrun, as they lack the ability to hold the clock during a transaction.
And we set the irq as non-threaded to prevent underrun on PREEMPT-RT
kernel when filling the FIFO.

The I2C controllers found in the EyeQ6Lplus and EyeQ7H SoCs from Mobileye
lack such capability, so a compatible string is added because this cannot
be detected at runtime.

This patch series also brings four cleanups:
* Optimize the read of the message flags in i2c_dw_read().
* Sort the compatible strings alphabetically in dw_i2c_of_match[].
* Simplify runtime PM handling in i2c_dw_xfer() with guard.
* Add a dedicated i2c_algorithm for AMD NAVI controller.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Changes in v5:
- Rebased on v6.19-rc6 and fully retested on EyeQ6Lplus.
- Drop dt-binding patch: already merged upstream in v6.19-rc2.
- From Andi Shyti's review:
  - __i2c_dw_xfer_one_part() now returns 0 on success instead
    of the number of messages transferred.
  - Drop inline keyword from i2c_dw_msg_is_valid() declaration.
- Link to v4: https://lore.kernel.org/r/20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com

Changes in v4:
- Use a boolean property instead of a flag for handling controllers
  IC_EMPTYFIFO_HOLD_MASTER_EN.
- Reorder the patches so goto and runtime PM auto-cleanup are not mixed
  in i2c_dw_xfer().
- Drop goto in __i2c_dw_xfer_one_part() and use return.
- Tidy up comments for i2c_dw_msg_is_valid() and irq_flags.
- Link to v3: https://lore.kernel.org/r/20251119-i2c-dw-v3-0-bc4bc2a2cbac@bootlin.com

Changes in v3:
- Add a compatible entry for Mobileye EyeQ7H i2c controllers.
- Use runtime PM macro for auto-cleanup in i2c_dw_xfer().
- Add a dedicated i2c_algorithm for AMD NAVI controllers.
- Rename __i2c_dw_xfer_unlocked() as it is not about locking at all.
- Rework the validity check of i2c_msg.
- Flag the irq as non-threaded for controllers that cannot hold the
  clock to avoid underrun.
- Link to v2: https://lore.kernel.org/r/20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com

Changes in v2:
- Add a single compatible for mobileye i2c controllers based in
  DesignWare IP.
- Handle the I2C_M_STOP flag instead of emitting a STOP on target address
  change.
- Abort transfer when it requires a RESTART on controller that cannot
  emit them.
- Detect FIFO underrun instead of disabling threaded interrupt on
  PREEMPT_RT kernel.
- Sort the compatible entries in a separate patch.
- Add a cleanup patch on flag reading in i2c_dw_read().
- Link to v1: https://lore.kernel.org/r/20251017-i2c-dw-v1-0-7b85b71c7a87@bootlin.com

---
Benoît Monin (6):
      i2c: designware: Optimize flag reading in i2c_dw_read()
      i2c: designware: Sort compatible strings in alphabetical order
      i2c: designware: Add dedicated algorithm for AMD NAVI
      i2c: designware: Implement I2C_M_STOP support
      i2c: designware: Use runtime PM macro for auto-cleanup
      i2c: designware: Support of controller with IC_EMPTYFIFO_HOLD_MASTER disabled

 drivers/i2c/busses/i2c-designware-common.c  |   6 +
 drivers/i2c/busses/i2c-designware-core.h    |   3 +
 drivers/i2c/busses/i2c-designware-master.c  | 197 ++++++++++++++++++++--------
 drivers/i2c/busses/i2c-designware-platdrv.c |   5 +-
 4 files changed, 153 insertions(+), 58 deletions(-)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20251014-i2c-dw-da315f758296

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


