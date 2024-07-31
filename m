Return-Path: <linux-i2c+bounces-5094-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0244E943785
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2024 23:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E5221F22818
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2024 21:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F369516726E;
	Wed, 31 Jul 2024 21:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="W2drONqi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx12lb.world4you.com (mx12lb.world4you.com [81.19.149.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3F31BC40
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jul 2024 21:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722459981; cv=none; b=crb11oBBVKqmFlus3mTNwP3MOgtVPfwrR9/Gygi0vQqsuh6QdgvsWWBoaNHBV5Hz69irYQgEWsPk9N6r2sv3jlCrbeqh6RbGnd5kKz/c+lYQj3pz40kW5AgQq8AuKmdtkL7c49qTafWlxKj81MnZGPV+5KKK6UmnUgcNoQD3XRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722459981; c=relaxed/simple;
	bh=YDNOTRc1kjmG2B6/dPKvEUZ8aHH4H5xAs/sPohQACWc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LVb06a8BjAYfSdzKYz8b06ktQcAr5nScgJ7LYxRiZ9/yj99Nw0qpPpX+jagop6Ew1vW0cghROWmI33KMlLV+UuXArzeAv3leGSWhEjYfQLiox1Lpynr1dSRp/icUgB9GiVl2V01zYIk+a0gIjZpXp5PE8xbyBlh3eA5vO4yehFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=W2drONqi; arc=none smtp.client-ip=81.19.149.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a9bu4svIt23IgWYIulj807I9l9gsLv8zBWzd8WzUcck=; b=W2drONqi69G9WXJfLrFuoe335M
	i1Y8ONxUinbChS0RskgHOSsdJRm175Nu49haGRQ5N874EdyQdx0DmfFU64plw4OQOEz6ukn58+oV1
	xk7wHjVKHFI+juU1ob4/5bX+yEjC6aTquXkpYEbR6j6sW4nQgfpxk5F6vyXjp5L77k6Y=;
Received: from [88.117.63.232] (helo=hornet.engleder.at)
	by mx12lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1sZExR-0004If-36;
	Wed, 31 Jul 2024 21:25:58 +0200
From: Gerhard Engleder <gerhard@engleder-embedded.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>
Subject: [PATCH v4 0/1] I2C controller support for KEBA PLCs
Date: Wed, 31 Jul 2024 21:25:50 +0200
Message-Id: <20240731192551.94035-1-gerhard@engleder-embedded.com>
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

v4:
- first patch for drivers/misc removed because it is already merged and part of 6.11-rc1

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

Gerhard Engleder (1):
  i2c: keba: Add KEBA I2C controller support

 drivers/i2c/busses/Kconfig    |  11 +
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-keba.c | 593 ++++++++++++++++++++++++++++++++++
 3 files changed, 605 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-keba.c

-- 
2.39.2


