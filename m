Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0592A5085
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 20:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729343AbgKCTyq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 14:54:46 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8027 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgKCTyp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Nov 2020 14:54:45 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa1b5890000>; Tue, 03 Nov 2020 11:54:49 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 19:54:45 +0000
Received: from vdi.nvidia.com (10.124.1.5) by mail.nvidia.com (172.20.187.18)
 with Microsoft SMTP Server id 15.0.1473.3 via Frontend Transport; Tue, 3 Nov
 2020 19:54:44 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <kblaiech@nvidia.com>, <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-next v2 0/6] i2c: Incremental fixes for Mellanox BlueField I2C
Date:   Tue, 3 Nov 2020 14:54:37 -0500
Message-ID: <cover.1604432921.git.kblaiech@nvidia.com>
X-Mailer: git-send-email 2.1.2
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604433289; bh=/Qfx25sex0TLKhYBM2KpwJsxKfj9zq84LFpDX3g4YUU=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         Content-Type;
        b=nuXQDbOvb4SzXSgHKFmM3nEg7rjM4D1ZJxZQtQ76n5LS24de8AUaLtupc664TKcDc
         WlGaxkFWP/TP237UMKdWjCmq3X6OHrBNDywovGDSsRyn1dYPDed9aADbFJ6nJT1z3/
         MWL1XAZQ71y/sWpKmsqvcrw/HVVEj6XGXh8FtCtc2dyNpJOklGpBvfS9x1vXz9/uhC
         x0JGANzbL/RNQ2MJbtYlFDRlgJhjZnDGRe5PE19mHJdeqPgCHp9hUwIq7qdNqNlGNM
         nWkRjnA7CUO5geIQsm5RS/I6ny2v/Tk8ym2YVsxk3iv2VZao1GVCwtj8DhPRsy4nta
         9YtC4MrKluK5w==
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
  dt-bindings: i2c: Convert DT file to YAML schema

 .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt |  42 -----
 .../bindings/i2c/mellanox,i2c-mlxbf.yaml           |  80 ++++++++
 MAINTAINERS                                        |   3 +-
 drivers/i2c/busses/i2c-mlxbf.c                     | 204 +++++++++------------
 4 files changed, 168 insertions(+), 161 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml

-- 
2.1.2

