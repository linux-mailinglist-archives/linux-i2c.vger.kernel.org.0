Return-Path: <linux-i2c+bounces-9683-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B67A4BCEC
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 11:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AF2B3A97CF
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 10:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2B21F30C3;
	Mon,  3 Mar 2025 10:53:28 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D881C1E376C;
	Mon,  3 Mar 2025 10:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999208; cv=none; b=Ze9KpNMH1UFMijwxrKgIwprIJIwhs1cqzzPPWk0uGOVMvaw2Or0cIuCk/JF61E8Fu6mAYcfja0K5NdQsyOXWtsDeZV3zzNiPcYY90t3EGsNmjw4lJcFpremTzQPUtRgt4emq2X8S9JoXci/LQTqSYNVoYG4Gh/zWR6nZDMafPHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999208; c=relaxed/simple;
	bh=gfjnQ4Y3OsTjJW/K9LXumQ2C8l5MFRSzRCUnKB+BolQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GzUGBKvKlcgqlqEtIZwX13q471qs4s0pZ0Gy0T/SAfKnAThfQjB8w3GSt5cpo0JvCWqcXcpgYND79LsESlgb+M3f/4cciePcF/Eu9UMK1X1MR6la1tu7NghaA7ijPVnJo3WPAB/RYWR9xoJUGGOsscAov0gqdUsAq1eliK2JNKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E391113E;
	Mon,  3 Mar 2025 02:53:39 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE4B43F673;
	Mon,  3 Mar 2025 02:53:22 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 00/14] mailbox: pcc: Fixes and cleanup/refactoring
Date: Mon, 03 Mar 2025 10:51:35 +0000
Message-Id: <20250303-pcc_fixes_updates-v1-0-3b44f3d134b1@arm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALyJxWcC/x3LQQqAIBBA0avErBPUsKKrRIjoVLMxcSqC8O5Jy
 wf/v8CYCRmm5oWMNzEdsUK1DfjdxQ0FhWrQUhvZyU4k7+1KD7K9UnAnsjDGqWENesShh/qljH9
 Qt3kp5QO9XWGqYwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4107; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=gfjnQ4Y3OsTjJW/K9LXumQ2C8l5MFRSzRCUnKB+BolQ=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnxYohLE3vb49QWcVVkz/BOuBSKE5Vf7zsOnv1E
 lieR6TXTxGJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ8WKIQAKCRAAQbq8MX7i
 mHGuEACQyafLUfaiaca7ixAlv2/kFQRQYOm8lUeY/nNj0nn7BgOfDjoPghGm6HMklqrOv4PW15C
 kbfGkDddaJtao6LdjkE1VQBltAeZjK2TPYkon0YmdG68/8KxvNInMNOd3l5EpLb/a5p0s8nouF6
 Uq3b8Z8N+NgcBZ0w0PaJOe5U4UrUzYwQ+UGtwk0x5g+/z6uMrDRYRPRfvz5iCQ39xPXCBofV/1M
 KZCYw6o5Jz0kMA0ThjOWoN2lcTAZ3rLl+9WqpKXVHMhlajSbuBTwRJ1jhk0QnlLWJCcvJn7H/n1
 RgL8JaEdYpbXq26IQR61u7hXLrs8bmqs9MdFCahdmnQ/a+5l2jjCebceYF+PwOgRpt7Z31S9PCe
 u0YuApuH5iisafQ9xXtYsvfPqeg7J4/L3+jAcRJEB2qkf6Xp8/LWkzZ+rkFE4ouFeO50ISlYsXN
 l2K4/PyMzKkHbjlMrfbOGxpM02sdWxA57VW3PDrAXnnkhp5itc4PGd69EnP6cu5EmfKqHfE3Rpj
 1lYEQXFy47IotfyAsn2dTxbEp0zFKqB38k9aqxBhJV8yFtugABWqfuawhYyRlGIYSEDUsBg8w20
 wHt10+c+0dEkvFkhU4LV8dkdoTOKZmtsV80zX9Reup9s3xn1eXXyire9EgDf8ekvxDDvwNIyHr3
 KBMoBQZEavAB+Cw==
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
driver. Also, we can just target 10-14 for following merge window
after 1-9 is merged.

Overall, the patch series focuses on improving correctness, efficiency, and
maintainability of the PCC mailbox driver and related components by fixing
race conditions, optimizing memory handling, simplifying shared memory
interactions, and refactoring code for clarity.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
Huisong Li (1):
      mailbox: pcc: Fix the possible race in updation of chan_in_use flag

Sudeep Holla (13):
      mailbox: pcc: Always clear the platform ack interrupt first
      mailbox: pcc: Drop unnecessary endianness conversion of pcc_hdr.flags
      mailbox: pcc: Return early if no GAS register from pcc_mbox_cmd_complete_check
      mailbox: pcc: Use acpi_os_ioremap() instead of ioremap()
      mailbox: pcc: Refactor error handling in irq handler into separate function
      mailbox: pcc: Move pcc_mbox_ioremap() before pcc_mbox_request_channel()
      mailbox: pcc: Always map the shared memory communication address
      mailbox: pcc: Refactor and simplify check_and_ack()
      soc: hisilicon: kunpeng_hccs: Simplify PCC shared memory region handling
      i2c: xgene-slimpro: Simplify PCC shared memory region handling
      hwmon: (xgene-hwmon) Simplify PCC shared memory region handling
      ACPI: PCC: Simplify PCC shared memory region handling
      ACPI: CPPC: Simplify PCC shared memory region handling

 drivers/acpi/acpi_pcc.c                |  13 +---
 drivers/acpi/cppc_acpi.c               |  16 +----
 drivers/hwmon/xgene-hwmon.c            |  40 ++---------
 drivers/i2c/busses/i2c-xgene-slimpro.c |  39 ++--------
 drivers/mailbox/pcc.c                  | 128 ++++++++++++++++++---------------
 drivers/soc/hisilicon/kunpeng_hccs.c   |  38 ++++------
 drivers/soc/hisilicon/kunpeng_hccs.h   |   2 -
 include/acpi/pcc.h                     |   5 --
 8 files changed, 97 insertions(+), 184 deletions(-)
---
base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
change-id: 20250303-pcc_fixes_updates-55a17fd28e76

Best regards,
-- 
Regards,
Sudeep


