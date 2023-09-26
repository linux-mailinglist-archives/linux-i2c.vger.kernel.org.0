Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398547AECC7
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Sep 2023 14:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233887AbjIZM2W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Sep 2023 08:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjIZM2W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Sep 2023 08:28:22 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AF967FC;
        Tue, 26 Sep 2023 05:28:14 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5C2C1FB;
        Tue, 26 Sep 2023 05:28:52 -0700 (PDT)
Received: from e103737-lin.cambridge.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C5713F6C4;
        Tue, 26 Sep 2023 05:28:13 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 0/3] ACPI: PCC: Define and use the common PCC shared memory
 regions related macros
Date:   Tue, 26 Sep 2023 13:27:59 +0100
Message-Id: <20230926-pcc_defines-v1-0-0f925a1658fd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFDOEmUC/x2MQQqAIBAAvxJ7TrC1hPpKRKSutRcThQjEvycdh
 2GmQKbElGHpCiR6OPMdGgx9B/Y6wkmCXWNAiUrOqEW0dnfkOVAWOBqaSCmjvYJWxNTE+9/WrdY
 PdCAA0F0AAAA=
To:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=870; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=GjkDugJU9IkuSdLcIrjNq2/xDTorawE8JA/F1M+BCvw=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBlEs5cntHHHXyzbfkCgNCiVz//Hf5AIBGsyfNoe
 e1hrjasVteJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZRLOXAAKCRAAQbq8MX7i
 mE7vEADREuGwXRBPaTb2oZDRDkaiA3vRB0XNN8Yq4n2kmbv6ontXg7NkIBqFM1TKI7xAaH/rbYN
 YhL8H+6BmTmBcD2YctopFMim73wD/Fcy89gMrPOyb/5703L6t6Wj43Cwd6wLc7uFyaKUxwsw5rf
 fULAxCI/OL1fINTLmdoRSP3RJwyX7Fby/nyQ1bmNCk9FdsVPZttVWCDdNcI3qgCxKC3htQWQ4Bm
 J/WtiekWmJLQipnv0KQE28KSLNV1dRWyenPHPid8vOhgomIZTuSG+gdKl/WrpCoAYZivxyZWRak
 teb8gbH6+YIAGtJ+oxXpaNJcCpjpBEDEXFct6QHFOOAtPNZ8J68mmN3rhvMa/512Qrj9SnrzNov
 kQZ92iA+9xbLBJfZLviyAELDQ34mmQXZGbJyahw72w0J6GKAdsVB+xrkfP1F4Xf6u1RTFNOUvzd
 R0ytMFOq/0jv8UP2+89uf39Rjt/WoSmyEL6c1lZHaYkHjmP5fDQI9MhGLTYrtd9wlQ/WKafHOnv
 r3QqQ27BIae0CuV3wks0auKodH3E15YW2DLTp6PcSlkg1bQI9F1TLH7X6Ngnx6zHeSTSY3OwXH4
 dXqzLlhjyMAeYlpxzNaHhLCWKVtQlVBVrD4NR5uEJ3354M+wSpRBCW6SFcUuZhdeuxSDQunUkQ1
 1WutiIUpnr6sY9A==
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
Sudeep Holla (3):
      ACPI: PCC: Add PCC shared memory region command and status bitfields
      i2c: xgene-slimpro: Migrate to use generic PCC shmem related macros
      hwmon: (xgene) Migrate to use generic PCC shmem related macros

 drivers/hwmon/xgene-hwmon.c            | 16 +++++-----------
 drivers/i2c/busses/i2c-xgene-slimpro.c | 16 ++++------------
 include/acpi/pcc.h                     | 11 +++++++++++
 3 files changed, 20 insertions(+), 23 deletions(-)
---
base-commit: 6465e260f48790807eef06b583b38ca9789b6072
change-id: 20230926-pcc_defines-24be5e33b6f3

Best regards,
-- 
Regards,
Sudeep

