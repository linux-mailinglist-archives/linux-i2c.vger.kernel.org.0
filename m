Return-Path: <linux-i2c+bounces-7466-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B14C79A3258
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 03:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7539C285311
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 01:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9004413D531;
	Fri, 18 Oct 2024 01:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="sFxZPRUb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B68C13AA27;
	Fri, 18 Oct 2024 01:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.139.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729216728; cv=none; b=a0l0Viitm8PwVL1AQgfD0VK6OCEEysYpC66LsAeaSbIcCDDE3mzvQb/R32sFEeaeH61KYo5OeASl7KmG3vmVqI5AoDxKCDxNDDC/mPiHFLdANjAfvvGB2wSXrMgkVEKZDF1fwjVYFiE9CbKxTWhvNl7I/gelb6J8hJtiYdlKEnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729216728; c=relaxed/simple;
	bh=3VKVxlQn4222drRfHlL4MQZPDF/tpVIgsAbP/Nb4Wus=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=k0XcwGPJ/Eu+kfDG8MUD0lR3QRWt9tT5F/fP3ORMYBxHGwVNecTa36ddmwq04DoeCySgaXjZtf9u9JIPTvuEraAzdbWrTVywO9ldg0R3rH4IV9+wZQ96jwnAf7Qxz5Yhgn8oqiC2e4nz0rKgO7143EvZkHM57kFYyC0uo4CQeuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=sFxZPRUb; arc=none smtp.client-ip=68.232.139.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729216727; x=1760752727;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3VKVxlQn4222drRfHlL4MQZPDF/tpVIgsAbP/Nb4Wus=;
  b=sFxZPRUb1sDLcB+NCGejixQeJwLFGHSk0gwrHHsXvDBi+q6gA/+Eyz5T
   1VlvZVfsEQTbplstCK+n2lUmuS4N/DzPCo9o2FC+5SCghCm95j0JOhyFk
   S8KV2wJVsqOGyLWmWbIcuSZM9R8GsFxmfo+mPBsCKPlmDB/Orwq7LYcgt
   oBDoSjl2JWBmZiuBIO0osHEijXUhpYypIMSi6HCLIkIy8LsXF4bsokgEx
   VVXcafjmaBVZe1WIzzgf+3SkqXD203qm6veWe9l1MFBwVgLaKgu062q2d
   8ZNLl4rACGesD8aMs6YXpHo8uwNbF/FjssKAx/uB4Wfx04WcGg4b/5cXK
   A==;
X-CSE-ConnectionGUID: eDyda2KRTwW8SIQfcEZmLw==
X-CSE-MsgGUID: d78Q1tnKTGKVpUZOkFLWQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="176343305"
X-IronPort-AV: E=Sophos;i="6.11,212,1725289200"; 
   d="scan'208";a="176343305"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 10:58:39 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B2A3D6473;
	Fri, 18 Oct 2024 10:58:36 +0900 (JST)
Received: from oym-om1.fujitsu.com (oym-om1.o.css.fujitsu.com [10.85.58.161])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id ECF6AD8BB1;
	Fri, 18 Oct 2024 10:58:33 +0900 (JST)
Received: from sm-x86-mem01.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by oym-om1.fujitsu.com (Postfix) with ESMTP id C0F0040072DBA;
	Fri, 18 Oct 2024 10:58:33 +0900 (JST)
From: Yoshihiro Furudera <fj5100bi@fujitsu.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yoshihiro Furudera <fj5100bi@fujitsu.com>
Subject: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller on Fujitsu MONAKA
Date: Fri, 18 Oct 2024 01:58:26 +0000
Message-Id: <20241018015826.2925075-1-fj5100bi@fujitsu.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00

This patch enables DWAPB I2C controller support on Fujitsu MONAKA.

Signed-off-by: Yoshihiro Furudera <fj5100bi@fujitsu.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 2d0c7348e491..c04af315a4f9 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -351,6 +351,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
 	{ "AMDI0510", 0 },
 	{ "APMC0D0F", 0 },
+	{ "FUJI200B", 0 },
 	{ "HISI02A1", 0 },
 	{ "HISI02A2", 0 },
 	{ "HISI02A3", 0 },
-- 
2.34.1


