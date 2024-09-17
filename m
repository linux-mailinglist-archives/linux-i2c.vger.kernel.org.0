Return-Path: <linux-i2c+bounces-6826-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7BC97B340
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 19:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84F3FB222EE
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 17:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5157917C23D;
	Tue, 17 Sep 2024 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T6kLt+Wa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441BE15AD90;
	Tue, 17 Sep 2024 17:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726592466; cv=none; b=Ju96726331onmyz7JQRF4G0SYoS26cQipLSwXIFARISEWbHABKdRXtcidfzHTkVUB/dBNff7JhqQ+3wuON10wHEmLkzxRs/z/L3A4+VR4GIjcBoMmE9AlhJCzw2FW+th6vs9PAAlzK1b3aXsKDHijhoZGvKzaF24OWDPpKaN2cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726592466; c=relaxed/simple;
	bh=PCwEG5cM4IEq07AFnUZTSlDXP7VkqJ13jqXIS6+Le1k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FZQelHhULPKH7z0zxta7gwQsMOYGGjwZMY08iZs26moiNYSCrklf6cmRI747jENlQSjdl6Ll/+gr8ULuC6o6loXPnN+PJrpTwe48CptlYy6LlSSXpYaHezVnz3O1xD7Np38u3hv9hgEHIR9zP8hHEMldZn20S3eqm0HEHmbpb6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T6kLt+Wa; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B971FF804;
	Tue, 17 Sep 2024 17:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726592456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VOJA4oKRl1c97qcSG2JsyY/IxozKo3PoM0EutgiNiJk=;
	b=T6kLt+Wa/cNA9JSypXaiBatuSPPDxb0BnZSHtwn6UOtGmAqcxfW3wICOhChbxk45SkhNVG
	+gFN2DVb36n5VH1P2tVzcaHXk9hfiFsi6zBzQZJS9V/BC9zSnht9lBCIj1IKRrkVb7xSJu
	ASzkaweTjkfrEl/2PVAi+Kj8co1e6hQ0xvFfa4zgH3bLhKAFbx9hKZFhDqvRzAGFAyCM2w
	bxEody8eXV0CEmGBE00uZDOiLedNwtwCkOW8kO4HbopMCGTLqftZ1QGl52pnKmE1IH77Ea
	ykT+NwFE2tmS6TALFbgyHTcP3gufq9jzXdvsVul3mEvT0hy8yX8keHQIRdMyVg==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH v2 0/5] Congatec Board Controller drivers
Date: Tue, 17 Sep 2024 19:00:46 +0200
Message-Id: <20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL616WYC/42OTQqDMBCFryJZNyXGX7rqPYqLZBw1oJkyCdIi3
 r2JJ+jye4/3c4iA7DCIR3EIxt0FRz6BvhUCFuNnlG5MLLTStWpUJYH8bCKCtGR4zBiZ1hVZ9hp
 a29cw1mhEylsTUFo2HpbcsJkQkbPxZpzc5xp9DYkXFyLx9/qwl1n9Z24vpZITQqOrVncKu6cli
 qvzd6BNDOd5/gBTgtEr3QAAAA==
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

This is a new iteration of the Congatec Board Controller series.

For the MFD driver, the main change is the use of
platform_device_register_simple() which makes the code smaller.

For the GPIO driver the main change is the use of guard() and scope_gard().

For the I2C bus driver, the I2C_FUNC_SMBUS_QUICK flag was unset as the
controller doesn't support smbus quick accesses.

For the Watchdog driver, min_timeout and max_timeout are configured now,
and watchdog_init_timeout() is used to initialize the timeout. 

More details in the changelog.

Best Regards,

Thomas

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Changes in v2:
- mfd: use platform_device_register_simple(), so struct cgbc_platform_data
  and cgbc_create_platform_device() were removed.
- mfd: rename cgbc_detect_device() to cgbc_wait_device().
- mfd: remove the useless abstracted function cgbc_command().
- mfd: set the release session message as warning instead of error.
- mfd: minor fixes (sort includes, add comments, fix some alignments and
  nit ...).
- gpio: use scoped_guard() and guard().
- gpio: use devm_mutex_init().
- i2c: unset the I2C_FUNC_SMBUS_QUICK flag as smbus quick accesses are not
  supported by the controller.
- i2c: rephrase comment for read_maxtime_us.
- i2c: set the invalid frequency message as an info (previously a warning).
- i2c: other minor fixes (sort includes, fix name of i2c_state enum).
- watchdog: add missing includes.
- watchdog: remove warning for the pretimeout.
- watchdog: remove timeout_action and pretimeout_action (ACTION_RESET and
  ACTION_SMI are directly used in cgbc_wdt_start()).
- watchdog: set max_timeout and min_timeout.
- watchdog: use watchdog_init_timeout() to set the timeout.
- Link to v1: https://lore.kernel.org/r/20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com

---
Thomas Richard (5):
      mfd: add Congatec Board Controller mfd driver
      gpio: Congatec Board Controller gpio driver
      i2c: Congatec Board Controller i2c bus driver
      watchdog: Congatec Board Controller watchdog timer driver
      MAINTAINERS: Add entry for Congatec Board Controller

 MAINTAINERS                   |   9 +
 drivers/gpio/Kconfig          |  10 +
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-cgbc.c      | 196 ++++++++++++++++++++
 drivers/i2c/busses/Kconfig    |  10 +
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-cgbc.c | 406 +++++++++++++++++++++++++++++++++++++++++
 drivers/mfd/Kconfig           |  12 ++
 drivers/mfd/Makefile          |   1 +
 drivers/mfd/cgbc-core.c       | 411 ++++++++++++++++++++++++++++++++++++++++++
 drivers/watchdog/Kconfig      |  10 +
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/cgbc_wdt.c   | 211 ++++++++++++++++++++++
 include/linux/mfd/cgbc.h      |  44 +++++
 14 files changed, 1323 insertions(+)
---
base-commit: 83d650136610d87d8ed0626c178ed18879b69564
change-id: 20240503-congatec-board-controller-82c6b84cd4ea

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


