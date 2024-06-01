Return-Path: <linux-i2c+bounces-3738-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A288D71C0
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2024 22:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C9D31F21B1C
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2024 20:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAF414F9DD;
	Sat,  1 Jun 2024 20:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="bKXDTlYY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx02lb.world4you.com (mx02lb.world4you.com [81.19.149.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A6F12B89
	for <linux-i2c@vger.kernel.org>; Sat,  1 Jun 2024 20:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717272230; cv=none; b=NZeZwoiUygbabMNeys/O75lGUy4Ogz8wWmb+gN/sl0/cxvbemnmQjNHYJfBa3JPMcZUZ5N5nieIJD2tufVuZahWzDcDyoD6SPSenqk72FoBAfiInL1/4/amAasGdrgV2CL22kA5I/yRanKCJ4/qay1yHTzGbn5gCIco8cbXBa9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717272230; c=relaxed/simple;
	bh=iFlO3dY0hy24CUzAZLDQcQGJ1oB8kk70oFvcjaOCvoI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C+WjONcH2wzZg/1u8OjUvtbKv8GY1sRXn+hJampjjNv4Zn1vBvjUWCSTNl8urZbgTWphTd0I2oL/MT+Aitc0YALrp+5koU1Hyg6B/hJxutXAyiJu7VzUpom3gz29yW3AvUlOdjkOpq//33Jdd7nQCc0UF3u/tItxWNvxGYWT7AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=bKXDTlYY; arc=none smtp.client-ip=81.19.149.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RoWD72AsMeowEWRnW92DhnLOSpJ60e4aB7iQ49EvI+4=; b=bKXDTlYY02vvtzsNTmqTIGN+R0
	TXq+1Kz554W4PGhpRBmxXpnGCGI5wrnzCn5LmuzWKmd4vpOxm1uziDr0q4mkrgTYiENqTFjf2MJhf
	sPhn8KxvmxVnAcoBHz5tIzvMI2N1CgdGGjEq/Zi4QsVvWAGWKPw6HXyw+rDNd9mIdWg4=;
Received: from [88.117.63.44] (helo=hornet.engleder.at)
	by mx02lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1sDUPS-0002J3-0x;
	Sat, 01 Jun 2024 21:28:58 +0200
From: Gerhard Engleder <gerhard@engleder-embedded.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>
Subject: [PATCH 0/2] I2C controller support for KEBA PLCs
Date: Sat,  1 Jun 2024 21:28:44 +0200
Message-Id: <20240601192846.68146-1-gerhard@engleder-embedded.com>
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
platform devices for every function inside the FPGA. As a first step it
only creates platform devices for the I2C controllers.

The I2C controller driver is added under drivers/i2c/busses like all the
other I2C controller drivers.

This patches enable access to the EEPROMs and to the hardware monitoring
chip of KEBA PLCs.

Gerhard Engleder (2):
  i2c: keba: Add KEBA I2C controller support
  misc: keba: Add basic KEBA CP500 system FPGA support

 drivers/i2c/busses/Kconfig             |  10 +
 drivers/i2c/busses/Makefile            |   1 +
 drivers/i2c/busses/i2c-keba.c          | 585 +++++++++++++++++++++++++
 drivers/misc/Kconfig                   |   1 +
 drivers/misc/Makefile                  |   1 +
 drivers/misc/keba/Kconfig              |  12 +
 drivers/misc/keba/Makefile             |   3 +
 drivers/misc/keba/cp500.c              | 433 ++++++++++++++++++
 include/linux/platform_data/i2c-keba.h |  23 +
 9 files changed, 1069 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-keba.c
 create mode 100644 drivers/misc/keba/Kconfig
 create mode 100644 drivers/misc/keba/Makefile
 create mode 100644 drivers/misc/keba/cp500.c
 create mode 100644 include/linux/platform_data/i2c-keba.h

-- 
2.39.2


