Return-Path: <linux-i2c+bounces-14274-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1E2C895E8
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 11:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 657664E496A
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 10:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9D331C58A;
	Wed, 26 Nov 2025 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eKD/KeAe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD8B248F7C;
	Wed, 26 Nov 2025 10:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154012; cv=none; b=g1K6PzSOBpv1TMJ6SD4IxznuC91YoEFqDir264q8LsMjNtbqqwwNd/2cwQwQEYbjF5SKhwg2SE/xB/knycoVTdsZNWKpeJlKjLjfuY2+8cd/QBu/ZKjq0/hcHlEXiJDtvzJe4fhx8AVINa3VPhmJEL+8ASQOJuYg5VCRJbTLnKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154012; c=relaxed/simple;
	bh=mIiAraEhSTgJhM9r59CMhCNViKT0ulb2M8CujRugpok=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yo9ePjxh3lfwgEVi5RYYNqZ7p7QrLxRQw/up413hxU7MK4Q9hISjy62JS8xjCMuQ3XmtH62wDuNDjFkS5MtHlOpWlOXVYm2QAht8H59EJtf+j9M097xrOaVr4PewcyMfCZjxFC6C6IWMOIassfHzq3Wso13Yk5pVNmPxVdQRqtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eKD/KeAe; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B3DD7C15D76;
	Wed, 26 Nov 2025 10:46:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6229660721;
	Wed, 26 Nov 2025 10:46:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B044C102F0828;
	Wed, 26 Nov 2025 11:46:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764154002; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=yb84UQ4K4Vt3Jb+5rolXm9Z3vaTMJXGhobv4cyvcfeA=;
	b=eKD/KeAejqF+84cJpJ7wGV8gLEV9V1LWeVBYAGqnFD68y/W8XuLv7nm+ZMY7nRxM+vEgqq
	VgEgXjs9ErRaMYE92VLFdw389B+MbFax4LARm+boT3jXKLJOaFTPJ+WeXioarAPCM4kuir
	hmMUEWGyJEVcqZKR/PQz2uk5nNYbBVeX8YRu4OoeJdB7X0VVRX5GgIBRvVn3XssUw1wflt
	B2g+6m9J+RphlOqUM1s4UzCPdWCf1aiT3k/MVaGEC0tRd9kO1MHYQcmjQWlFQe5lQK0MYl
	XdTx3NuLK+QLSzCOL/4cKfJOtnqtXJavcA72gm4qL92pwLl3YQn85fjqiqLy6Q==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v4 0/7] i2c: designware: Improve support of multi-messages
 transfer
Date: Wed, 26 Nov 2025 11:46:23 +0100
Message-Id: <20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH/aJmkC/2XMTQ6CMBCG4auQrq3p9IeCK+9hXLRDkSZKDZCqI
 dzdQgJqXH6Ted6R9K7zrieHbCSdi773oU1D7jKCjWkvjvoqbcIZV8BAUs+RVg9aGQGq1qrgZU7
 S871ztX8uodM57cb3Q+heSzfCfF0Tek1EoIxqWyirAbUp9NGGMFx9u8dwI3Mk8i8oYIM8wZJJy
 Asta0T2D8UHApQbFAlalBa54WgN/sJpmt4KjiQQEAEAAA==
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
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
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
Benoît Monin (7):
      dt-bindings: i2c: dw: Add Mobileye I2C controllers
      i2c: designware: Optimize flag reading in i2c_dw_read()
      i2c: designware: Sort compatible strings in alphabetical order
      i2c: designware: Add dedicated algorithm for AMD NAVI
      i2c: designware: Implement I2C_M_STOP support
      i2c: designware: Use runtime PM macro for auto-cleanup
      i2c: designware: Support of controller with IC_EMPTYFIFO_HOLD_MASTER disabled

 .../bindings/i2c/snps,designware-i2c.yaml          |   7 +
 drivers/i2c/busses/i2c-designware-common.c         |   6 +
 drivers/i2c/busses/i2c-designware-core.h           |   3 +
 drivers/i2c/busses/i2c-designware-master.c         | 197 +++++++++++++++------
 drivers/i2c/busses/i2c-designware-platdrv.c        |   5 +-
 5 files changed, 160 insertions(+), 58 deletions(-)
---
base-commit: 6772718099e29703ed50dcd0941a135d1fb6e612
change-id: 20251014-i2c-dw-da315f758296

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


