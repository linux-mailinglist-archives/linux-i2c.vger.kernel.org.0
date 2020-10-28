Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5561429D973
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Oct 2020 23:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389729AbgJ1Wyv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Oct 2020 18:54:51 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16466 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733138AbgJ1Wyp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Oct 2020 18:54:45 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f99f6b80000>; Wed, 28 Oct 2020 15:54:48 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct
 2020 22:54:45 +0000
Received: from vdi.nvidia.com (10.124.1.5) by mail.nvidia.com (172.20.187.18)
 with Microsoft SMTP Server id 15.0.1473.3 via Frontend Transport; Wed, 28 Oct
 2020 22:54:44 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <kblaiech@nvidia.com>, <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-next v1 0/6] i2c: Incremental fixes for Mellanox BlueField I2C
Date:   Wed, 28 Oct 2020 18:54:16 -0400
Message-ID: <cover.1603925077.git.kblaiech@nvidia.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603925688; bh=zK/hsq1YAuH+OiDSjhCGdlIhkhlZU6GMEtYaJE9GpGg=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         Content-Transfer-Encoding:Content-Type;
        b=owrp5Q/Kk+HaEwQX+5EtWYGt1Zam/3HMk0b227HG/0t1V6DXHLkH3iFlDdVeTBlGx
         VCgxvNZM3qiQbZHwimoyHyWw1QwhYCEFepa52m3r/6NMuUcKQqgt0xROJqYOD9/tp0
         T16x8z+EBb8YhcN8aVWgctK2fPVEWMvkKnfcm44Q3+gmSGW3Y7tCN62EGFUY62nxVz
         TJcChTkFeqWk9DxUZExYXoEQeZzAMjhelwG+0WfJDcEd8jOkMI1nR+fLYvDpKE0Y9P
         OEtJKdCzSw7w+AFhDVVKISoBDq/TBDOLtlibULF8mH76OhPyoDDQ4X4s3tZHT90ITg
         EJhkkU7RNI5Zg==
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

Khalil Blaiech (6):
  i2c: mlxbf: Add CONFIG_ACPI to guard ACPI function call
  i2c: mlxbf: Fix resrticted cast warning of sparse
  i2c: mlxbf: Remove unecessary wrapper functions
  i2c: mlxbf: Update reference clock frequency
  i2c: mlxbf: Update author and maintainer email info
  dt-bindings: i2c: Convert DT file to YAML schema

 .../bindings/i2c/mellanox,i2c-mlxbf.txt       |  42 ----
 .../bindings/i2c/mellanox,i2c-mlxbf.yaml      |  78 +++++++
 MAINTAINERS                                   |   3 +-
 drivers/i2c/busses/i2c-mlxbf.c                | 204 ++++++++----------
 4 files changed, 166 insertions(+), 161 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxb=
f.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxb=
f.yaml

--=20
2.24.1

