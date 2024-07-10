Return-Path: <linux-i2c+bounces-4850-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5017692D7D3
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 19:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 050B41F229D8
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 17:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E961957E8;
	Wed, 10 Jul 2024 17:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="xgTvnBW7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx08lb.world4you.com (mx08lb.world4you.com [81.19.149.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DD11953BE
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 17:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720634243; cv=none; b=gwzPiHmt1oimeLXFTHibUbLOjDPL7xdlX4xR+MPpUenFFYBVJ4ynZ3bUMbUIVF14Y6YfQYrz3me1Tou/0BTW8vhPKP9/o+eHmMMGT06RlsF8dRTpUl8/D80fMha7exvhZsuv+3n6rLITYZyeRyr2KAW5pTbpOYDaJA/Qt+ht5ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720634243; c=relaxed/simple;
	bh=QLFELJcXaEgv4w16px4/DjIfzyOfYeraLLnI05WFXwA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AbUpaqJ6o8CIIER9h4mYBIbBW1Eed8fhDZ0kW2pDvWS640CfBBO2ury44F8b8+NFHAgVIcVurN/tgOICmQcy6x8pBJ4u6kMvrI1gjyNfRgdksN2TJRLYdAJ1FLoqz+RJOZBQiRY24nMcvsDiwDlBS1cYcsOUy8Wh1jRihpdf6tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=xgTvnBW7; arc=none smtp.client-ip=81.19.149.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TkTf/jDeCZz05MMA4eLba+wJLOKHYWncsjE0NrR00/g=; b=xgTvnBW70C1YSwuV80Gpg1wFmO
	AIHZ2V64k6lTVORzAv8fjfnqGkv85LrO8W1J6eJxWfXWOVQz2UM0vdeSQdwcCM783B0RR3VISJSb0
	SU0geRFcYdUPnoZ1OASqYGivrfu0nAS1IWqO3+D1rxCKf04Sf4+bC2y7A9GCtClcFA1U=;
Received: from [88.117.61.57] (helo=hornet.engleder.at)
	by mx08lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1sRbYw-0003m8-0P;
	Wed, 10 Jul 2024 19:57:06 +0200
From: Gerhard Engleder <gerhard@engleder-embedded.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>
Subject: [PATCH v3 0/2] I2C controller support for KEBA PLCs
Date: Wed, 10 Jul 2024 19:57:00 +0200
Message-Id: <20240710175702.22344-1-gerhard@engleder-embedded.com>
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

v3:
- first patch is already merged to char-misc-next by Greg KH
- add AUXILIARY_BUS Kconfig dependency
- don't declare int i within for loop (Andi Shyti)
- enable I2C controller as late as possible (Andi Shyti)
- use devm_i2c_add_adapter (Andi Shyti)
- add KI2C_CONTROL_DISABLE (Andi Shyti)

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
 drivers/i2c/busses/Kconfig                    |  11 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-keba.c                 | 593 ++++++++++++++++++
 drivers/misc/Kconfig                          |   1 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/keba/Kconfig                     |  12 +
 drivers/misc/keba/Makefile                    |   3 +
 drivers/misc/keba/cp500.c                     | 458 ++++++++++++++
 include/linux/misc/keba.h                     |  25 +
 10 files changed, 1130 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-misc-cp500
 create mode 100644 drivers/i2c/busses/i2c-keba.c
 create mode 100644 drivers/misc/keba/Kconfig
 create mode 100644 drivers/misc/keba/Makefile
 create mode 100644 drivers/misc/keba/cp500.c
 create mode 100644 include/linux/misc/keba.h

-- 
2.39.2


