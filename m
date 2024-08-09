Return-Path: <linux-i2c+bounces-5236-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B5694C9D6
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 07:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E33EB1F23E4A
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 05:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F59416C6A8;
	Fri,  9 Aug 2024 05:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="Gqt1dymM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx11lb.world4you.com (mx11lb.world4you.com [81.19.149.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891D616C6A4
	for <linux-i2c@vger.kernel.org>; Fri,  9 Aug 2024 05:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723182520; cv=none; b=i/CN27NIF3o+c6WZDlqXXG/Xk7an3UiKWZVwtMe+wINDRvj8KXVti1THTKqQRqHqL2sYEuIInPMhQzKFJkhKjliY7uO2OEvgUJ4QV6vdwxVb40kYESeZYul7i7DDg9NQVi/jBuVRycNswdA6vC7dYGh0L/ld0aBtQMeSCa8aMVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723182520; c=relaxed/simple;
	bh=5Cv101utc0EHGMu+gSG3GRdEWXSuvNEgF3OZwQpNRYw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K8pwVHJG11HZ7T3Ii2I9Nm2OBtTCKtql2NJXzJYBRXRX4UX67CSXyjqe//XyAANQVL3uxfdFypNxRBzTEoYchiW6aEp1Eqlkj2zxcxZmaoOmqHIRdqu7eqhlwiuwlQK3zAwtKL2ceCMyN47OCn8t1Ahc6VNuMDngsPIIcrk3iso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=Gqt1dymM; arc=none smtp.client-ip=81.19.149.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RRVuvI+lDilI0K+zajp647NR9wTWRy9fFpH4pijDFto=; b=Gqt1dymMzOkmxR2Y4cM87o5hx3
	qtGBK+ybWiOkj17sjbNNr5JDtN5wzqXZJB7WT2OJpeP06jYWv51SPhR/vt1G+TtFvoLRBiqipR3tU
	2H/gtcxCxUhz7nusL0Da3dAxV2IAsagevyGFF1hbkwE82Jhecs9/MQxf8Ex3OQYgsa1Y=;
Received: from [88.117.63.232] (helo=hornet.engleder.at)
	by mx11lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1scI5j-00071g-2a;
	Fri, 09 Aug 2024 07:23:07 +0200
From: Gerhard Engleder <gerhard@engleder-embedded.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>
Subject: [PATCH v5 0/1] I2C controller support for KEBA PLCs
Date: Fri,  9 Aug 2024 07:23:02 +0200
Message-Id: <20240809052303.4933-1-gerhard@engleder-embedded.com>
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

v5:
- simplify (ret != 0) (Andi Shyti)
- change KI2C_RECOVERY_CLK_CNT to (9 * 2) (Andi Shyti)
- change KI2C_RECOVERY_NDELAY to KI2C_RECOVERY_UDELAY (Andi Shyti)
- rework reset while loop to for loop (Andi Shyti)
- use dev_err() for errors (Andi Shyti)
- don't define int i within for loop (Andi Shyti)
- use else if within read loop (Andi Shyti)
- remove unnecessary parenthesis of (ret < 0) ? ... (Andi Shyti)
- reduce ki2c->client_size in case of failed device registration (Andi Shyti)
- don't use ',' after delimiters (Andi Shyti)
- remove platform_data from comment

v4:
- first patch removed because it is already merged and part of 6.11-rc1

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
 drivers/i2c/busses/i2c-keba.c | 598 ++++++++++++++++++++++++++++++++++
 3 files changed, 610 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-keba.c

-- 
2.39.2


