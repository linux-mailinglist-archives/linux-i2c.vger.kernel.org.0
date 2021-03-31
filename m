Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1410350714
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 21:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234922AbhCaTCl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 15:02:41 -0400
Received: from mail.sch.bme.hu ([152.66.249.140]:62560 "EHLO mail.sch.bme.hu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235282AbhCaTCO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 15:02:14 -0400
Received: from Exchange2016-1.sch.bme.hu (152.66.249.140) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Wed, 31 Mar 2021 21:02:12 +0200
Received: from Cognitio.sch.bme.hu (152.66.211.220) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 31 Mar 2021 21:02:12 +0200
From:   =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>
To:     <linux-i2c@vger.kernel.org>
CC:     =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/2] Adding i2c-cp2615: i2c support for Silicon Labs' CP2615 Digital Audio
Date:   Wed, 31 Mar 2021 19:19:19 +0000
Message-ID: <20210331191921.1066172-1-bence98@sch.bme.hu>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Changes since v3:
* Add `cp2615_check_iop()`: check that IOP is functional, before use
* Use kernel types __be16, u8 and s8
* Add  __attribute__((packed)) to `struct`s
* Make `cp2615_i2c_quirks` and `cp2615_check_iop()` static
* Fix `strncpy` invocation
* Add myself to MAINTAINERS
* Misc formatting, warning fixing (ex. identicalConditionAfterEarlyExit) etc.

Bence Csókás (2):
  i2c: Add I2C_AQ_NO_REP_START adapter quirk
  Adding i2c-cp2615: i2c support for Silicon Labs' CP2615 Digital Audio
    Bridge

 MAINTAINERS                     |   5 +
 drivers/i2c/busses/Kconfig      |  10 +
 drivers/i2c/busses/Makefile     |   1 +
 drivers/i2c/busses/i2c-cp2615.c | 336 ++++++++++++++++++++++++++++++++
 include/linux/i2c.h             |   2 +
 5 files changed, 354 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-cp2615.c

-- 
2.31.0

