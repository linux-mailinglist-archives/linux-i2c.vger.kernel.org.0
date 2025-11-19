Return-Path: <linux-i2c+bounces-14166-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 35204C6F9C7
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 16:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AA508352006
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 15:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E900A3074A4;
	Wed, 19 Nov 2025 15:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PjSrzPYR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF6C2D47E8;
	Wed, 19 Nov 2025 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564748; cv=none; b=gjVjihwwKcBylOljZ8977jHcOvVqHGCPX0t9Wu6H1nflvmb1DGzflb9u9iygc7w39cCbt4UrMgJ+vHJ7AZRoO7Mo+aXJMz3OXKsbUHF7Fnf6hz3MIYnH0qhnGRDW9RR1aPzZC9/E+Dq38uxfQciDZfHq/SKq5u3Ux+3kDBzcTvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564748; c=relaxed/simple;
	bh=IwcSBbTMvRfi3Jd2Ds66H/5UpuQ7iEWdvfPCOr6AMX4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KSviml7VgW1J9fi0A2EbdUYP3Ktzd+JtO4H0dNUPirgQa1lZyEmywv4GvJdv18ttkHsjHYE0EPG+moVxCt507oUQJLX2pgr1L/KInjbHOdqTQ4jc0V1wjWEBu2Q2DnER3lPo67xDM59p1lw5aXqOtz+AuapzUhICftSPtJ0/w4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PjSrzPYR; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 804F51A1BBA;
	Wed, 19 Nov 2025 15:05:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5095960699;
	Wed, 19 Nov 2025 15:05:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4660410371A6A;
	Wed, 19 Nov 2025 16:05:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763564744; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=dyFJ2wVjsQzH/ZXzQqZ2tADAC+wf3I83byeIznLnpoE=;
	b=PjSrzPYRM8PpgVTacCO//NFGGUFA6+KtnSgEVW9+iN6E0LTtznJkYoIkhFQ9ydk/jTporC
	ZuRM7WwzLtkThkija8Iud3JvSWLy/9eSFJwfsYfh3x3zzaNb7CQL8AIZEdwZbi07a9RD29
	chrtfGNFLrcrHjS5oJNyFYmTr39+J/un9JiH8D65Pc23PfpLBz/ksvehzOIjWA0GRnycjB
	97e2+soPht10CKHvFfSmC9qfyw3ESDFZ/xhOTCbbuK2wq7EC3C2X2va0A4iFW58IOeMZfZ
	CEQom86Ig8/Dzwu/9J8HnXv0RkIOGtXtpALraP82hfwQQcRhrx5Fvu76Fc1JTQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v3 0/7] i2c: designware: Improve support of multi-messages
 transfer
Date: Wed, 19 Nov 2025 16:05:29 +0100
Message-Id: <20251119-i2c-dw-v3-0-bc4bc2a2cbac@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALncHWkC/1WMwQ6CMBAFf4Xs2ZpuobR48j+MByhFNlFKWlI1h
 H+3kGD0OC9vZoZgPdkAp2wGbyMFckOC/JCB6evhZhm1iUFwIZFjwUgY1j5ZW+coOyW1qEpI59H
 bjl5b6HJN3FOYnH9v3YjruifUnojIOFONlo1Co2qtzo1z052Go3EPWCNR/Ig5fkWRxIoXWGpVd
 Mbwf3FZlg+Xu0z+1wAAAA==
X-Change-ID: 20251014-i2c-dw-da315f758296
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, 
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
Benoît Monin (7):
      dt-bindings: i2c: dw: Add Mobileye I2C controllers
      i2c: designware: Optimize flag reading in i2c_dw_read()
      i2c: designware: Sort compatible strings in alphabetical order
      i2c: designware: Use runtime PM macro for auto-cleanup
      i2c: designware: Add dedicated algorithm for AMD NAVI
      i2c: designware: Implement I2C_M_STOP support
      i2c: designware: Support of controller with IC_EMPTYFIFO_HOLD_MASTER disabled

 .../bindings/i2c/snps,designware-i2c.yaml          |   7 +
 drivers/i2c/busses/i2c-designware-core.h           |   1 +
 drivers/i2c/busses/i2c-designware-master.c         | 168 ++++++++++++++++-----
 drivers/i2c/busses/i2c-designware-platdrv.c        |   5 +-
 4 files changed, 139 insertions(+), 42 deletions(-)
---
base-commit: 1ce5be103bd98b0d1a412c6685ebe49d4dddf2db
change-id: 20251014-i2c-dw-da315f758296

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


