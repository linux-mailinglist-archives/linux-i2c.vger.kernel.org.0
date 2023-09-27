Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE467B0A08
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 18:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbjI0Q0n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 12:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbjI0Q0n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 12:26:43 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 87DCCE6;
        Wed, 27 Sep 2023 09:26:41 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 707A21FB;
        Wed, 27 Sep 2023 09:27:19 -0700 (PDT)
Received: from e103737-lin.cambridge.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AA363F59C;
        Wed, 27 Sep 2023 09:26:40 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v2 0/4] ACPI: PCC: Define and use the common PCC shared
 memory regions related macros
Date:   Wed, 27 Sep 2023 17:26:09 +0100
Message-Id: <20230927-pcc_defines-v2-0-0b8ffeaef2e5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJXFGUC/22MwQ7CIBAFf6XZsxgKQqyn/odpDIXF7qHQgCGah
 n8Xe/Y472Vmh4yJMMOt2yFhoUwxNBCnDuxiwhMZucYguJB8EJpt1j4cegqYmbjMqFDKWXsJzdh
 SO95H7T41Xii/Yvoc8dL/1v+d0jPOuB+EMr1WV+9Gk9azjStMtdYvP/zP7qQAAAA=
To:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Huisong Li <lihuisong@huawei.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1339; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=lwT8ZnKV+w+WbSm9j2obr3XMxv9qHzx8UZUyVSqGOk4=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBlFFe/GK8S35+7w73n13E+CWi7SnJXnak49uWZd
 KPcDX+7sHiJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZRRXvwAKCRAAQbq8MX7i
 mB7PD/9GdBYmtGCqO/u6bYiAspw2Jk7CK5hdy7XxEu3RAaB1ojcdnNS87mc28fF7z+EvCfuYrDO
 eA2OX2Jpz3XWXmDCVFi0hCHxGjXPUETYwut8AteGPNb0Q4WZHcCPsakFSu5m4WjrCbQ5bcav+7T
 J/zY5lIyaw+xB+7zu5Lu2+5vTDvUaHlQMPb/VANx8jDahjIK2X/sSP7F1KJqHnC2k0Z/hG6wphs
 Ro2XfOb0c8Mg3H3jrcWRjvggNoP7plggYwGocwTiJVmqLILnMQW+OVIEf1RcryDCjyIVddtaNUo
 8Mjv9DYm35gIMA6rM7GzEoGGCsHEX2p40/Pan33NI6myfdTVnumh2ml+03D5HhZnFrdXpiTpxl0
 oGv/2abXj+SQD9s0ZzOGdV4jL9IAPsdW+9s8xmJyaRG7JB59+jIrH9qO+6gTkjE4OVu6M7UT4Ir
 cB67bUJ22oz8ksu8WGZ7esgXnqv4TOcLHIynxcwiQAQWKaXNS9ahwOR/NarGzS8/fsjyVuNxo3N
 eBypEzKSTHqgrha1KXfq85OGPhsrecXEGsLQtmdiN4ADheoDUyQJQI6GbQdPydzyRz5ymyhfDFu
 Tj6oHnjhznO1cZeyhRBVvPsHdXsEy5Tgba0dskTMoUs/gmXhRdFdbdk4qaHALTkPJwBWRgT1otc
 iFOW/9awPLBz/Ew==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This set of 3 small patches intend to consolidate and replace the existing
locally defined macros within couple of PCC client drivers when accessing
the command and status bitfields.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
Changes in v2:
- Added review/ack tags from Andi Shyti(I2C) and Guenter Roeck(hwmon)
- Added bitfields for Initiator Responder Communications Channel flags as well
- Migrated kunpeng_hccs soc driver to use generic PCC shmem related macros
- Link to v1: https://lore.kernel.org/r/20230926-pcc_defines-v1-0-0f925a1658fd@arm.com

---
Sudeep Holla (4):
      ACPI: PCC: Add PCC shared memory region command and status bitfields
      i2c: xgene-slimpro: Migrate to use generic PCC shmem related macros
      hwmon: (xgene) Migrate to use generic PCC shmem related macros
      soc: kunpeng_hccs: Migrate to use generic PCC shmem related macros

 drivers/hwmon/xgene-hwmon.c            | 16 +++++-----------
 drivers/i2c/busses/i2c-xgene-slimpro.c | 16 ++++------------
 drivers/soc/hisilicon/kunpeng_hccs.c   |  8 ++------
 include/acpi/pcc.h                     | 13 +++++++++++++
 4 files changed, 24 insertions(+), 29 deletions(-)
---
base-commit: 6465e260f48790807eef06b583b38ca9789b6072
change-id: 20230926-pcc_defines-24be5e33b6f3

Best regards,
-- 
Regards,
Sudeep

