Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB1F3404B6
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 12:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhCRLgJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 07:36:09 -0400
Received: from mail.sch.bme.hu ([152.66.249.140]:15944 "EHLO mail.sch.bme.hu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229745AbhCRLfw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 07:35:52 -0400
Received: from Exchange2016-1.sch.bme.hu (152.66.249.140) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Thu, 18 Mar 2021 12:35:46 +0100
Received: from Cognitio.sch.bme.hu (152.66.211.220) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 18 Mar 2021 12:35:46 +0100
From:   =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>
To:     <linux-i2c@vger.kernel.org>
CC:     =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] Add i2c-cp2615
Date:   Thu, 18 Mar 2021 11:52:08 +0000
Message-ID: <20210318115210.2014204-1-bence98@sch.bme.hu>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For a hardware project, I need the I2C master of SiLabs' CP2615 chip
to be visible from under Linux. This patchset adds i2c-cp2615, a
driver which sets up an i2c_adapter for said chip.

Changes in v3:
* Fixed SPDX header
* Added I2C_AQ_NO_REP_START adapter quirk to i2c.h
* Added I2C_AQ_NO_ZERO_LEN | I2C_AQ_NO_REP_START to CP2615's quirk flags
* Made the driver only bind to the IOP interface
* Return -ENXIO instead of -ECOMM when the device does not ACK
* Formatting, fix almost all warnings and checks from `checkpatch --strict`
  * CamelCase checks remain. These identifiers were taken from SiLabs'
    Application Note, I thought it made sense to preserve these as-is.

Bence Csókás (2):
  i2c: Add I2C_AQ_NO_REP_START adapter quirk
  Adding i2c-cp2615: i2c support for Silicon Labs' CP2615 Digital Audio
    Bridge

 drivers/i2c/busses/Kconfig      |  10 ++
 drivers/i2c/busses/Makefile     |   1 +
 drivers/i2c/busses/i2c-cp2615.c | 279 ++++++++++++++++++++++++++++++++
 include/linux/i2c.h             |   2 +
 4 files changed, 292 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-cp2615.c

-- 
2.31.0

