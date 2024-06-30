Return-Path: <linux-i2c+bounces-4508-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBF191D3C6
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jun 2024 22:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED5851C209F4
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jun 2024 20:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E00D2110F;
	Sun, 30 Jun 2024 20:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="J/ZBTQig"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx18lb.world4you.com (mx18lb.world4you.com [81.19.149.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1F9200C1
	for <linux-i2c@vger.kernel.org>; Sun, 30 Jun 2024 20:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719778587; cv=none; b=LTq02yprGsrXLzy9QXfVKk16zS+etGzwW6smNpNSePhmP+KxK7Ti5ugSSmV31UqGVMyZlsUKR4LZgeIFq4or0Tl+VpEc3CnjCGfJ7tERsru6hLmlM9pMU/OOwycDR3888EKSsKf96Ple8yqjn+6a4aBJDiXJng52ebE/8Oxyqzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719778587; c=relaxed/simple;
	bh=op6/61Fx4gfGfpxAacjzPjGev6CBwlzassLuql+qFRw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rH8urbWM8kYCQvWiIYfsnyLt+4jm5peisNlR0+XKUfQj9b9oA0orgny+0Qohb4q3zvFIFwZz28G+GZlE2iXiqejbsy0Lcs6qZ6cRQwyqu8IFOsADADM+Yj7l3YrqHSAIEOk9H/ok5UCO+GKc8KJk0HdQ4wtCjWeWQhNLVr5WAWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=J/ZBTQig; arc=none smtp.client-ip=81.19.149.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+tuAKSiFvF3iTmsS8XcPjH6ke6oJfoFyCAebr5UsmMk=; b=J/ZBTQigxj76wfQPyn/vsdncdH
	HmBZx+lF4CXTFV4kPtr2mMGXoUrYog/BcDWbGhdX9KBY/mwmbzErY96v1lEhKaq2SMN3z4CcQz8Gb
	knrHGswV3c6EzAr7slD/mow1hRcDeikPID+q62PIuXtA7uNLsnPrT8C6ttrKQCtz4ytw=;
Received: from [88.117.61.57] (helo=hornet.engleder.at)
	by mx18lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1sO0Wa-0004cO-1d;
	Sun, 30 Jun 2024 21:47:48 +0200
From: Gerhard Engleder <gerhard@engleder-embedded.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>
Subject: [PATCH v2 0/2] I2C controller support for KEBA PLCs
Date: Sun, 30 Jun 2024 21:47:38 +0200
Message-Id: <20240630194740.7137-1-gerhard@engleder-embedded.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Do-Run: Yes
X-ACL-Warn: X-W4Y-Internal

KEBA PLCs use a PCIe FPGA to implement several functions in a common
way. This is a first step to include basic support for this FPGA.

Under drivers/misc the cp500 PCI driver is added. This drivers creates
auxiliary devices for every function inside the FPGA. As a first step it
only creates auxiliary devices for the I2C controllers.

The I2C controller driver is added under drivers/i2c/busses like all the
other I2C controller drivers.

This patches enable access to the EEPROMs and to the hardware monitoring
chip of KEBA PLCs.

v2:
- use aux bus (Greg KH)
- add Documentation/ABI/ entry for version and keep_cfg sysfs files (Greg KH)
- use sysfs_emit (Greg KH)
- add some information about I2C controller in commit message (Andi Shyti)
- remove old copyright line (Andi Shyti)
- sort header alphabetically (Andi Shyti)
- rework register defines as suggested (Andi Shyti)
- fix block comment style multiple times (Andi Shyti)
- add comment that IN_USE bit is a semaphore (Andi Shyti)
- add comment that IN_USE bit polling sleeps (Andi Shyti)
- addr as first argument of ki2c_wait_for_bit() (Andi Shyti)
- avoid compact style for register flag check (Andi Shyti)
- move bus reset dev_err's to reset implementation (Andi Shyti)
- use dev_err_probe() (Andi Shyti)
- fix 'ki2c_devtype defined but not used' (kernel test robot)
- fix 'WARNING comparing pointer to 0', twice (kernel test robot)
- fix 'Using plain integer as NULL pointer' (kernel test robot)
- fix 'symbol cp035_devices was not declared. Should it be static?', 3 times (kernel test robot)

Gerhard Engleder (2):
  misc: keba: Add basic KEBA CP500 system FPGA support
  i2c: keba: Add KEBA I2C controller support

 .../ABI/stable/sysfs-driver-misc-cp500        |  25 +
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-keba.c                 | 595 ++++++++++++++++++
 drivers/misc/Kconfig                          |   1 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/keba/Kconfig                     |  12 +
 drivers/misc/keba/Makefile                    |   3 +
 drivers/misc/keba/cp500.c                     | 458 ++++++++++++++
 include/linux/misc/keba.h                     |  25 +
 10 files changed, 1131 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-misc-cp500
 create mode 100644 drivers/i2c/busses/i2c-keba.c
 create mode 100644 drivers/misc/keba/Kconfig
 create mode 100644 drivers/misc/keba/Makefile
 create mode 100644 drivers/misc/keba/cp500.c
 create mode 100644 include/linux/misc/keba.h

-- 
2.39.2


