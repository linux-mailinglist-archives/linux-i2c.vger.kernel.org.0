Return-Path: <linux-i2c+bounces-9829-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11270A5F9D7
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 16:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C60019C33FC
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 15:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3AE2268FCF;
	Thu, 13 Mar 2025 15:29:14 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23000268684;
	Thu, 13 Mar 2025 15:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741879754; cv=none; b=Y1el33amSolpelrte+yyZehlGjTkk0NUQ+63CmFY+htaeSZ9AB5nbOet4qqotgShRxkH5vXqViTTdlR0d0QOy9Laa/nCs5iCe7bvlMFPpDQZhUQ6LYojWZhKelsxL8ssxWtGKVpGu5AVmP4S9vl0Rw49//NZFV2tWvBShM2ZRBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741879754; c=relaxed/simple;
	bh=zdbR99QGJYPC1f34tuZXVggykQp/849xlZYMuWUfaQ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L3KvWViQuuZzJvVvipYw9+2rq9Vn4Ks/j8CsmKzAzArIo4X/JBtxse9N1KgX9FHEDR+bA4Kd/m8sH4HvCBYQe0/7U5yV+9kVYm3WOZ3FdWjM5XAGcVcog8dsrtoBhTeNVaeZMACPFApSjJH2OacIkSw++V1UbV7eJmtNtkX3OhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDCB11477;
	Thu, 13 Mar 2025 08:29:21 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72EE13F694;
	Thu, 13 Mar 2025 08:29:09 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v3 00/13] mailbox: pcc: Fixes and cleanup/refactoring
Date: Thu, 13 Mar 2025 15:28:46 +0000
Message-Id: <20250313-pcc_fixes_updates-v3-0-019a4aa74d0f@arm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALL50mcC/33Nyw6CMBAF0F8hs7amTyCu+A9jSB+DdMEjLTYaw
 r9b2OjCuLw3c+6sEDF4jHApVgiYfPTTmIM4FWB7Pd6ReJczcMoVFVSQ2dq280+M7WN2esFIlNK
 s6hyvsSohuzngcZDZ9ZZz7+MyhdfxIrG9/beWGKFEGCk74ZiQhjU6DGc7DbBvJf7t1S/Ps2eG1
 ZwbW1ey/Pht297ekLDt8AAAAA==
X-Change-ID: 20250303-pcc_fixes_updates-55a17fd28e76
To: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Huisong Li <lihuisong@huawei.com>, 
 Adam Young <admiyo@os.amperecomputing.com>, 
 Robbie King <robbiek@xsightlabs.com>, Andi Shyti <andi.shyti@kernel.org>, 
 linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
 "Rafael J. Wysocki" <rafael@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5426; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=zdbR99QGJYPC1f34tuZXVggykQp/849xlZYMuWUfaQ0=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn0vnDYCUZPlafqDSwEs9LsaePtULqedBwfFF2d
 ad3xsVEwIOJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9L5wwAKCRAAQbq8MX7i
 mBFHD/4oiodnKGh1JYmVO/F1ApXy+9binXe5A4h09BA30dSOLyXe3VXXDBg1aeQz79QugzSDr36
 9LsEZqSvlupZ9HbGWvHc8bz5upqwBbeLe/Gyg4fYrDFInoARWw692IqltBivm4WuALKTwcs+kE+
 Q6RU+FzkL2v2iYJ1rzKpjB/Leb/Goguk3hPv3ZXkPs1bbtFfB/Nh8MFrjt2ETrLQLtqFiyrsLPr
 caKVfPodbnaiCCeO9qhMky0hXb6B5mP05DnIKpXZV31snNzyoikvexR5Fd+i1Nu6gPwkjeIqPpi
 IE736y+quX/+hm6M4rAiVy6WZNvtBhCnIkzebSlbLp4V7RMrqOOzIDFk2lU6kARI7aFRQpXMJLr
 LZLGuNjOG7lXHltmw3yOHzoshjj0NFhC0/qHpDDuLqDmuBmun97wY8y4AKFI9BYUZq17sUCVo7Q
 1Eh33l7XZppgt1k9D8CX5jijkFH4/Cm429GsASaas0xfeqers/uvGYfbCxCl244TWtnmuaVxBT/
 n1wuItVkgwoRIKnhPyIRTGRmfqNOoBfcsh96+JPZISu948w1x1G2IVFv4PhXRNC6qrmEAkh7DGV
 QNhh/dn8TZL6sdV5prtBTzJPWFjuFQN3yXTaci8GUPATj3FAUaWwAC4c4/5oppOqLRb0LeQyEJB
 Oeou6XJvIC/z8BQ==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Here is a summary of the changes in this patch series:

1. Fix for race condition in updating of the chan_in_use flag

   Ensures correct updating of the chan_in_use flag to avoid potential race
   conditions.

2. Interrupt handling fix

   Ensures platform acknowledgment interrupts are always cleared to avoid
   leaving the interrupt asserted forever.

3. Endian conversion cleanup

   Removes unnecessary endianness conversion in the PCC mailbox driver.

4. Memory mapping improvements

   Uses acpi_os_ioremap() instead of direct mapping methods for better ACPI
   compatibility.

5. Return early if the command complete register is absent

   Ensures that if no GAS (Generic Address Structure) register is available,
   the function exits early.

6. Refactor IRQ handler and move error handling to a separate function

   Improves readability of error handling in the PCC mailbox driver’s
   interrupt handler.

7. Shared memory mapping refactoring/enhancements

   Ensures the shared memory is always mapped and unmapped in the PCC
   mailbox driver when the PCC channel is requested and release.

8. Refactored check_and_ack() Function

   Simplifies and improves the logic for handling type4 platform notification
   acknowledgments.

09-13. Shared memory handling simplifications across multiple drivers

    Simplifies shared memory handling in:
        Kunpeng HCCS driver (soc: hisilicon)
        Apm X-Gene Slimpro I2C driver
        X-Gene hardware monitoring driver (hwmon)
        ACPI PCC driver
        ACPI CPPC driver

The X-gene related changes now change the mapping attributes to align
with ACPI specification. There are possibilities for more cleanups on
top of these changes around how the shmem is accessed within these
driver.

Also, my main aim is to get 1-8 merged first and target 9-13 for
following merge window through respective tree.

Overall, the patch series focuses on improving correctness, efficiency, and
maintainability of the PCC mailbox driver and related components by fixing
race conditions, optimizing memory handling, simplifying shared memory
interactions, and refactoring code for clarity.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
Jassi,

Please take patch [1-8]/13 through the mailbox tree if and when you are
happy with the changes. I haven't got Ack from I2C still, but if you are
happy to take [9-13]/13, I can check with I2C maintainer. Or else I am
happy to take it individually later once the PCC changes are merged. I
am still keeping it together if anyone is interested in testing.

Changes in v3:
- Updated the comment around updation of chan_in_use flag to keep it
  appropriate even after acknowledging the interrupt as first action
  in the irq handler
- Added all the review/ack/tested-by tags from Huisong Li, Adam Young
  and Robbie King
- Added a note that double mapping introduced temporarily will not
  impact any existing mbox client drivers as all the drivers move to
  using new and only mapping after all the changes
- s/pcc_chan_check_and_ack/pcc_chan_acknowledge/ which was originally
  check_and_ack()
- Link to v2: https://lore.kernel.org/r/20250305-pcc_fixes_updates-v2-0-1b1822bc8746@arm.com

Changes in v2:
- Improved time vs flow graph for the platform ack interrupt
  acknowledgment issue in patch 2
- Replaced PCC_ACK_FLAG_MASK with PCC_CMD_COMPLETION_NOTIFY in patch 3
- Fixed return value check from pcc_mbox_error_check_and_clear() in patch 6
- Dropped the change moving the function pcc_mbox_ioremap()
- Adjusted error message in kunpeng_hccs driver after the change
- Added the received ack/review tags
- Link to v1: https://lore.kernel.org/r/20250303-pcc_fixes_updates-v1-0-3b44f3d134b1@arm.com

---
Huisong Li (1):
      mailbox: pcc: Fix the possible race in updation of chan_in_use flag

Sudeep Holla (12):
      mailbox: pcc: Always clear the platform ack interrupt first
      mailbox: pcc: Drop unnecessary endianness conversion of pcc_hdr.flags
      mailbox: pcc: Return early if no GAS register from pcc_mbox_cmd_complete_check
      mailbox: pcc: Use acpi_os_ioremap() instead of ioremap()
      mailbox: pcc: Refactor error handling in irq handler into separate function
      mailbox: pcc: Always map the shared memory communication address
      mailbox: pcc: Refactor and simplify check_and_ack()
      soc: hisilicon: kunpeng_hccs: Simplify PCC shared memory region handling
      i2c: xgene-slimpro: Simplify PCC shared memory region handling
      hwmon: (xgene-hwmon) Simplify PCC shared memory region handling
      ACPI: PCC: Simplify PCC shared memory region handling
      ACPI: CPPC: Simplify PCC shared memory region handling

 drivers/acpi/acpi_pcc.c                |  13 +---
 drivers/acpi/cppc_acpi.c               |  16 +----
 drivers/hwmon/xgene-hwmon.c            |  40 ++----------
 drivers/i2c/busses/i2c-xgene-slimpro.c |  39 ++----------
 drivers/mailbox/pcc.c                  | 113 ++++++++++++++++-----------------
 drivers/soc/hisilicon/kunpeng_hccs.c   |  42 +++++-------
 drivers/soc/hisilicon/kunpeng_hccs.h   |   2 -
 include/acpi/pcc.h                     |   6 --
 8 files changed, 84 insertions(+), 187 deletions(-)
---
base-commit: 4d872d51bc9d7b899c1f61534e3dbde72613f627
change-id: 20250303-pcc_fixes_updates-55a17fd28e76
-- 
Regards,
Sudeep


