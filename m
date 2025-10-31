Return-Path: <linux-i2c+bounces-13927-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 749CFC25995
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 15:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1B51C351CCB
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 14:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB69034C153;
	Fri, 31 Oct 2025 14:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="d/KJlHr2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5571026ED4C;
	Fri, 31 Oct 2025 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761921358; cv=none; b=Y6aU6RSwpbnFBB61UleVu5bggGq1u46VHsDEe6JtlrGxxIN3+ApbORXhSslM/kfCE5+IvY8s7ApT5eASpePXCBL9IYEd2uSTGnclNt8i+sAfPB/h6v21ywioLzwz6i9b97DgFwUqlNeioIYMPTq+MV24HBZfXlQe6A9JtWc1LOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761921358; c=relaxed/simple;
	bh=slo6azH1lamPI8QHYeoyTuwCFXJby3A8gQ/JLfmpVt0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jD+uG7rPDGT1+VqmMRXPWa9s/XbuDUtsXV4JupfJEJy5WKOcx72nA+s6Qra/TttaTgSlrqO1X3mMi3HeH6T9IpbGW2NkyVUPkfgmP98DyVzHybGmR52GJ0zDnheg82g9WCQisuEpQrrILCllbPYLzNaCeYt/g7xm2hJj/GwA2eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=d/KJlHr2; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 90B961A17A3;
	Fri, 31 Oct 2025 14:35:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B72060704;
	Fri, 31 Oct 2025 14:35:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5CD311818003;
	Fri, 31 Oct 2025 15:35:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761921353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ERKFYguZ07Yf3cEqYYOPoBJP130e6DXcJSuEIvX8k/Y=;
	b=d/KJlHr2MwGDbd+KfvGFSU7LykMsk3QeK3W4RA8fUwkhmixZ8QCgt109bbeIhQ2WAKgboE
	czctszYnO9JG+1uG+YOjA4P4Chg8teWCz56fwp5iCKwAOfRXIDFsm/ZzKM4nJLhmVu1jeU
	qw0cctfDY1Bf7QXlzkvjSbg/p2kAuoeDYlDuIt6jTIhEcJaty+D9bWRO8eBEt/ZjHquBth
	dUpVknumsXMKv27Sxqd9jQsFWk6kqZqs/fw40l7/ROZ8TlHTjyBluuW3pQ4U0KkdE1ETJx
	hgFNVakPZNecDALw3GPim9sytcJeMyJr0q46/FjQ19bsWeYsFd+am/FW/BAbDA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v2 0/5] i2c: designware: Improve support of multi-messages
 transfer
Date: Fri, 31 Oct 2025 15:35:38 +0100
Message-Id: <20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADrJBGkC/zXMSwrCMBSF4a2UO/ZKEo2JjtyHdJBX7QVtJClRK
 dm7sdDhfzh8C+SQKGS4dAukUChTnFqIXQduNNM9IPnWIJiQnPEjknDo3+jNgctBSS3OJ2jnVwo
 DfVbo1rceKc8xfVe38P+6EWojCkeGymppFXfKaHW1Mc4PmvYuPqGvtf4A8AlHsp4AAAA=
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
the transaction is now in __i2c_dw_xfer_unlocked(), while i2c_dw_xfer()
loops over the messages to search for the I2C_M_STOP flag and calls
__i2c_dw_xfer_unlocked().

Handle controllers that lack the ability to emit a RESTART when two
consecutive messages have the same address and direction by aborting
transfers that contain such a sequence of messages. For those controllers,
we also check that we do not get any unwanted STOP caused by a Tx FIFO
underrun, as they lack the ability to hold the clock during a transaction.

The I2C controllers found in the EyeQ6Lplus and EyeQ7H SoCs from Mobileye
lack such capability, so a compatible string is added because this cannot
be detected at runtime.

This patch series also brings two cleanups. One in i2c_dw_read() optimizes
the read of the message flags. And the other sorts the compatible strings
alphabetically in dw_i2c_of_match[].

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Changes in v2:
- Add a single compatible for mobileye i2c controllers based in
  DesignWare IP.
- Handle the I2C_M_STOP flag instead of emiting a STOP on target address
  change.
- Abort transfer when it requires a RESTART on controller that cannot
  emit them.
- Detect FIFO underrun instead of disabling threaded interrupt on
  PREEMPT_RT kernel.
- Sort the compatible entries in a separate patch.
- Add a cleanup patch on flag reading in i2c_dw_read().
- Link to v1: https://lore.kernel.org/r/20251017-i2c-dw-v1-0-7b85b71c7a87@bootlin.com

---
Benoît Monin (5):
      dt-bindings: i2c: dw: Add Mobileye I2C controllers
      i2c: designware: Optimize flag reading in i2c_dw_read()
      i2c: designware: Sort compatible strings in alphabetical order
      i2c: designware: Implement I2C_M_STOP support
      i2c: designware: Support of controller with IC_EMPTYFIFO_HOLD_MASTER disabled

 .../bindings/i2c/snps,designware-i2c.yaml          |   1 +
 drivers/i2c/busses/i2c-designware-core.h           |   1 +
 drivers/i2c/busses/i2c-designware-master.c         | 159 ++++++++++++++++-----
 drivers/i2c/busses/i2c-designware-platdrv.c        |   5 +-
 4 files changed, 128 insertions(+), 38 deletions(-)
---
base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
change-id: 20251014-i2c-dw-da315f758296

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


