Return-Path: <linux-i2c+bounces-7009-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23648986B93
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 05:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD8F9281DD6
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 03:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A4617A906;
	Thu, 26 Sep 2024 03:57:21 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-m25469.xmail.ntesmail.com (mail-m25469.xmail.ntesmail.com [103.129.254.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE65517A918;
	Thu, 26 Sep 2024 03:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.129.254.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727323041; cv=none; b=NkjVI3qgkhDS9OGilrvVXcWxdtvXc0YeTjgvaHmVxPSSV12sC1t0wRt5ZeF1VhXqZpCbui2DPyQ0t10TVmFg6sVUlJpq9z/ZdFmMYBX84HpamXbJq3WUHZWRxqaD2/3owuA9Vb1x61Ey4JxQbYQpExskObzIpr4vV3RVVYWbST8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727323041; c=relaxed/simple;
	bh=7eOm/EccfjKv+6iijGLDVmIuEuuhiNLMnd4FEtbsjhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QpfcRamTl40rfvwiB/wamcYinVqgqONikL4qdgbSCdn8gW5kEKVtc7UlHd0PksTEcsRMzsLnLvs65rYehWZ3y2bTPghYSxau2AKTtmHoFrB5Zf6gdO3n8RmFiZd0bYg8gNQEQ5W/f9W7ZFil11i9UF3lhcLfWD4dixpwzmdIMoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com; spf=pass smtp.mailfrom=hj-micro.com; arc=none smtp.client-ip=103.129.254.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hj-micro.com
Received: from KP920.lan (unknown [101.71.201.83])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 63C081A02DC;
	Thu, 26 Sep 2024 10:40:34 +0800 (CST)
From: "hunter.yu" <hunter.yu@hj-micro.com>
To: andriy.shevchenko@linux.intel.com,
	jarkko.nikula@linux.intel.com,
	lenb@kernel.org,
	rafael@kernel.org,
	jsd@semihalf.com,
	andi.shyti@kernel.org
Cc: linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	andy.xu@hj-micro.com,
	peter.du@hj-micro.com,
	hunter.yu@hj-micro.com
Subject: [PATCH v2 0/2] i2c: Add ACPI support for HJMC01
Date: Thu, 26 Sep 2024 10:40:04 +0800
Message-ID: <20240926024026.2539-1-hunter.yu@hj-micro.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGE5PVksaT0pNQhkaQ0IaHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0pVTEpVSUtKVUNIWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a922c33a41d03abkunm63c081a02dc
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PCo6Ahw5SzIoCDMJA01WCAEL
	CkgaCRNVSlVKTElMSEpDT0hOSEpPVTMWGhIXVRMOFQ8eCVUCDjsTEVYWEhgJFFUYFBZFWVdZEgtZ
	QVlKS0pVTEpVSUtKVUNIWVdZCAFZQUpOQ0o3Bg++

Hi, everyone:

HJMC01 is an ARM-based server processor that contain a
Designware I2C controller. This series add ACPI support
for the Designware i2c controller.

v1->v2:
Adjust the order of ACPI HID according to the alphabetical order

hunter.yu (2):
  ACPI: APD: Add clock frequency for HJMC01 I2C controller
  i2c: designware: Add a new ACPI HID for HJMC01 I2C controller

 drivers/acpi/acpi_apd.c                     | 6 ++++++
 drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
 2 files changed, 7 insertions(+)

-- 
2.43.5


