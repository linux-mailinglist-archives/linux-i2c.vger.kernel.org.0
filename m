Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B910937BBAB
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 13:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhELLVg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 May 2021 07:21:36 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:28592 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhELLVg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 May 2021 07:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1620818428; x=1652354428;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e9KmMbZuSSlzBn/N4FUkcfVbRkHPnnXmcXBrvKKR3VI=;
  b=vNwr/tlfsqQ8IEbV+DTkg0DTKvaGiC8t56M+Ak/zXc+tzVLnudwwrEED
   6mrJddGikmPW4FffKR4yQYBDrXYGfNx3uIBxFtsR0l/XSTIwvTdA5Nlow
   lkoESqkhk4evDfKjZUeXhweiDcCzTKvps3EpSDsIKKCzGJD1y8ZLL3BPF
   /S8yK5IAAqEDm92dKZArAXVOoXEcBKhlRVcil+3l77JWCs0R/ElY7xXjq
   6FfGc/W/jxsLrj544py/qLWGMDcj1xxoUT1j7vdrBDojeuq77V2bOcfVg
   zHpNdubm1Ar4ggTU+I7iwt3L7Uvkvfb1nMbtsWm1o6SPVsNb2zGj3ec2n
   A==;
IronPort-SDR: hWLDeCOnMw8rMFAskiZvfCEF630IvMqPnvcDlBQ+aVc3ac6pzGScUBJCqWaT9BZHJTSmulcGia
 44oyN5lmp4r0FXdyMoCY3EjGa7SirtEyD7mcCu5RjMkX2VRJG/IhHa3gL6CnuEMN6EZcNOzxO6
 aNbnQ4RhupSVg187nr6JTW0gsud8hxBfVeY3zoD7HFUSo8tiVPZCIYn1X9CvTbrj/FNGw6C6SC
 9yttFyjF1MGdPFCN6tFwYXbNLJMbm8yWm0Sa2xBRk572QCm9Uax5JnMWh+qxzNmXEavkyzCBEu
 Yws=
X-IronPort-AV: E=Sophos;i="5.82,293,1613458800"; 
   d="scan'208";a="55295635"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2021 04:20:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 12 May 2021 04:20:27 -0700
Received: from daire-ubuntu.school.villiers.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 12 May 2021 04:20:24 -0700
From:   <daire.mcnamara@microchip.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
CC:     <palmer@dabbelt.com>, <cyril.jean@microchip.com>,
        <padmarao.begari@microchip.com>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <david.abdurachmanov@gmail.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 0/2] i2c: microchip: Add driver for PolarFire SoC
Date:   Wed, 12 May 2021 12:20:22 +0100
Message-ID: <20210512112024.1651757-1-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Daire McNamara <daire.mcnamara@microchip.com>

This patchset adds support for the Microchip PolarFire SoC I2C
hardware block.

Daire McNamara (2):
  dt-bindings: i2c: microchip: Add Microchip PolarFire host binding
  i2c: microchip: Add driver for Microchip PolarFire SoC

 .../bindings/i2c/microchip,mpfs-i2c.yaml      |  74 +++
 drivers/i2c/busses/Kconfig                    |   6 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-microchip.c            | 519 ++++++++++++++++++
 4 files changed, 600 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
 create mode 100755 drivers/i2c/busses/i2c-microchip.c


base-commit: acd3d28594536e9096c1ea76c5867d8a68babef6
prerequisite-patch-id: 6f7f70120adfa8e938b97517f0c664e43e8745a0
prerequisite-patch-id: 4ea37008d23838aa2e0658811fe15462f6cdbd87
prerequisite-patch-id: 378c9d7495e56454b7bffbdbc430185dc4e36b90
prerequisite-patch-id: b547bbdf0a800c652cdd1a542b8ce725dfd6fcc9
prerequisite-patch-id: 26afc006e51cf743902bf609b537e1558e70f69c
prerequisite-patch-id: 55e615f1af62373acc71366ceb4c27fbcecec60d
prerequisite-patch-id: 6bda20a1c98622e33f3bf0126ae696716c963e4b
-- 
2.25.1

