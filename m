Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F28332713
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Mar 2021 14:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhCINZn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 08:25:43 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:13895 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhCINZY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Mar 2021 08:25:24 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DvwrP4BcqzjWjl;
        Tue,  9 Mar 2021 21:23:17 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Mar 2021 21:24:35 +0800
From:   Yicong Yang <yangyicong@hisilicon.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <linuxarm@openeuler.org>, <prime.zeng@huawei.com>,
        <yangyicong@hisilicon.com>
Subject: [PATCH v2 0/3] Add support for HiSilicon I2C controller
Date:   Tue, 9 Mar 2021 21:22:14 +0800
Message-ID: <1615296137-14558-1-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add driver and MAINTAINERS for HiSilicon I2C controller on Kunpeng SoC. Also
provide the devm_*() variants for adding the I2C adapters.

Change since v1:
- fix compile test error on 32bit arch, reported by intel lkp robot:
  64 bit division without using kernel wrapper in probe function.
Link:https://lore.kernel.org/linux-i2c/1615016946-55670-1-git-send-email-yangyicong@hisilicon.com/

Yicong Yang (3):
  i2c: core: add managed function for adding i2c adapters
  i2c: add support for HiSilicon I2C controller
  MAINTAINERS: Add maintainer for HiSilicon I2C driver

 MAINTAINERS                   |   7 +
 drivers/i2c/busses/Kconfig    |  10 +
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-hisi.c | 525 ++++++++++++++++++++++++++++++++++++++++++
 drivers/i2c/i2c-core-base.c   |  39 ++++
 include/linux/i2c.h           |   1 +
 6 files changed, 583 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-hisi.c

-- 
2.8.1

