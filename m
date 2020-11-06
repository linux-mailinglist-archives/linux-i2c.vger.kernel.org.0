Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 389E22A9A63
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Nov 2020 18:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgKFRGf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Nov 2020 12:06:35 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10187 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgKFRGe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Nov 2020 12:06:34 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa582980000>; Fri, 06 Nov 2020 09:06:32 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 17:06:34 +0000
Received: from vdi.nvidia.com (10.124.1.5) by mail.nvidia.com (172.20.187.12)
 with Microsoft SMTP Server id 15.0.1473.3 via Frontend Transport; Fri, 6 Nov
 2020 17:06:33 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <kblaiech@nvidia.com>, <wsa+renesas@sang-engineering.com>,
        <robh+dt@kernel.org>
Subject: [PATCH i2c-next v3 0/6] i2c: Incremental fixes for Mellanox BlueField I2C
Date:   Fri, 6 Nov 2020 12:06:29 -0500
Message-ID: <cover.1604681934.git.kblaiech@nvidia.com>
X-Mailer: git-send-email 2.1.2
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604682392; bh=XUd/nwLV4kOTgtx2FIU+r3t1aHqPjPqHwEsODXpimcg=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         Content-Type;
        b=QGXdKjBtW0Pw4LpefxlYH3WypwS1vdhVEj7bOzajPIswibOldMLuaaMkCM2sIDyIO
         W857HV2OvZV2DeDuY/fIw7NAv7gOgQTyM5ddEJAz8yIigd2RuFjFoXm7f0eaRptkRf
         l9WMF+luDEhhk2fRvGMc+ZQtz9WnPxNF/R5STwy/SHOqocChBZL1NtBAcTu7XtI4mB
         m8CrOfr82h3oO1tESNvjEkqzG5MV3LgYD330GwGd46Zs/xrTfD5en4C1MIh7ii5j8V
         W12+YwCh493vkD9TxPOxkD+qmdtsj3GU7aL3d/Qy6TE2drTNmOSFuOcEXXJ5Ng5xYY
         gCPMMSe1Pis2Q==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This set of fixes tends to complement the upstream effort of the
driver code and aims to address the following issues:
  - Convert the DT file to a YAML schema to be consistent with the
  latest kernel releases.
  - Fix build issues reproted by the kernel test robot.
  - Apply a couple of changes to the driver code to include bug fixes.
  - Keep the MAINTAINER info up-to-date.
---
v2->v3:
	- Address dtschema/dt warning/errors by removing
        'additionalProperties: false' line.
v1->v2:
	- Address yamllint and dtschema/dt warning/errors.
	- Dual license the YAML schema by adding BSD-2-Clause.
---

Khalil Blaiech (6):
  i2c: mlxbf: Add CONFIG_ACPI to guard ACPI function call
  i2c: mlxbf: Fix resrticted cast warning of sparse
  i2c: mlxbf: Remove unecessary wrapper functions
  i2c: mlxbf: Update reference clock frequency
  i2c: mlxbf: Update author and maintainer email info
  dt-bindings: i2c: mellanox,i2c-mlxbf: convert txt to YAML schema

 .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt |  42 -----
 .../bindings/i2c/mellanox,i2c-mlxbf.yaml           |  78 ++++++++
 MAINTAINERS                                        |   3 +-
 drivers/i2c/busses/i2c-mlxbf.c                     | 204 +++++++++------------
 4 files changed, 166 insertions(+), 161 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml

-- 
2.1.2

