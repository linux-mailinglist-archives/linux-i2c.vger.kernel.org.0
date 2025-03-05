Return-Path: <linux-i2c+bounces-9732-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4038AA5054B
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Mar 2025 17:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84EB03AB6F2
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Mar 2025 16:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2F3193073;
	Wed,  5 Mar 2025 16:39:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2222DFC0A;
	Wed,  5 Mar 2025 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741192740; cv=none; b=uuiedmNcdX8BiCVZ8liUGqSnuqDlX0iAaoVkgVgwWRoESHbXJ2wvZvOuSw3sfteVHY/Zijie0O/xUiHowsULul7RRp3YWFwz108r6UmJMWIHUd1coD8RgjAtMeh4jzlNoCG6ytkWw72cbsgfkStpkdm8cLoFpNtAiqdrKEAicgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741192740; c=relaxed/simple;
	bh=pFobQpAxYA6OYuJ31r3lBwSpVuYRp+E1fZOB5VysmwI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gP2G1oxZVX3bGANQkLHLSQoFIAU6NBfHSTx5tS3klux11ZDLhYm1zn1oMyq3JL0l9B4vq69KcOhfr7MrO6vsWqA3KDNJvyGx96tumZKnIWEQiUC58jSrLmPFm6DvOA9Hw8dKJAZEKxKH38ywnyIEraU9a5ycz5/VV7r2BREZv+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A998BFEC;
	Wed,  5 Mar 2025 08:39:11 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D1513F5A1;
	Wed,  5 Mar 2025 08:38:56 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v2 00/13] mailbox: pcc: Fixes and cleanup/refactoring
Date: Wed, 05 Mar 2025 16:38:04 +0000
Message-Id: <20250305-pcc_fixes_updates-v2-0-1b1822bc8746@arm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPF9yGcC/32NTQ7CIBSEr9K8tRh+rXHlPUzTUHhYFi0EKtE03
 F3sAVx+k/lmdsiYPGa4dTskLD77sDbgpw7MrNcnEm8bA6dcUUEFicaMzr8xj69o9YaZKKVZ7yy
 /Yn+B5sWER6Fpj6Hx7PMW0ue4KOyX/lsrjFAiJimdsEzIid11Ws4mLDDUWr/Ei/aasAAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4759; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=pFobQpAxYA6OYuJ31r3lBwSpVuYRp+E1fZOB5VysmwI=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnyH4epM6U6yB38UMkoCa0DjxZ+SZPn1Gtk0lDm
 FrndaJvebqJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ8h+HgAKCRAAQbq8MX7i
 mGUYD/4nZlRivM7RYRaLGcNUCxpBiEIGjRPN1xtnq3prfiUvUkcIbg6wjrX6J36svRetpMFXeKA
 ugBoDenhnbJw7UnEaY0sZbRF+09aE0pwqilS+rK0jz4r5+tjj6vLX/i4Wjb0c7htDEFwbbxYZXq
 +ZYYU7V1u71SG/HxHaQpdf5pf9bxipXOkNPApw2/vdElVVvS3DjGKsNDvR5wSTE4msYuTgoY903
 MmRStdzxJL9JtUEKOHiuQZ6MtY9pA9XDMf1JsoTht09SiiDzIge6jYJMpW7S/QOVI4u570V0kiN
 8ZyeoUa48RFrbIDDZcdoOHij/+lkSnbWz/M5sP+iDjhYhXa+hPndd9nUVMN+d+sUYo+bJf5E5Zr
 F2KMNhKZ2WO8smG2TvHJbphEimeR+OA4qhB1w9c1s+hqHvlOQzzVa/wjgvtKBdc9ByitfvY3BzI
 BQOBwndD5f5csJcCR09b+Wh1FbIPdosqeNKYVvezmGrpTIMUr2W6woaL4EuXRUyo1L0UYIb8xWw
 dy7KanjjYw+JxFRASy/zfpIlLW23kdohM2gTJtKV+3MvVAkT5yVDpodIjnXX0PKQGjaNKs5+evt
 JFwChvniSL/5lsVL0BlKClg+hIb1yoGx/LnlPco2k4k671pOTtTg1NvdH77AXo8CoJOyU8nPSnx
 Fgym3iXp7vUyCIg==
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

7. Code restructuring to avoid unnecessary forward declaration

   Moves pcc_mbox_ioremap() function to a more appropriate location with
   no functional impact.

8. Shared memory mapping refactoring/enhancements

   Ensures the shared memory is always mapped and unmapped in the PCC
   mailbox driver when the PCC channel is requested and release.

9. Refactored check_and_ack() Function

   Simplifies and improves the logic for handling type4 platform notification
   acknowledgments.

10-14. Shared memory handling simplifications across multiple drivers

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
Adam, Robbie, Huisong,

Please test this in your setup as you are the ones reporting/fixing the
issues or last modified the code that I am changing here.

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
 drivers/mailbox/pcc.c                  | 112 ++++++++++++++++-----------------
 drivers/soc/hisilicon/kunpeng_hccs.c   |  42 +++++--------
 drivers/soc/hisilicon/kunpeng_hccs.h   |   2 -
 include/acpi/pcc.h                     |   6 --
 8 files changed, 83 insertions(+), 187 deletions(-)
---
base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
change-id: 20250303-pcc_fixes_updates-55a17fd28e76

Best regards,
-- 
Regards,
Sudeep


