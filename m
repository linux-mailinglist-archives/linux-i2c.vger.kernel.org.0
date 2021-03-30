Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48DFF34EA48
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 16:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbhC3OWg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 10:22:36 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14644 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231906AbhC3OWL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 10:22:11 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F8s5T7122znWLm;
        Tue, 30 Mar 2021 22:19:25 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Tue, 30 Mar 2021 22:21:55 +0800
From:   Yicong Yang <yangyicong@hisilicon.com>
To:     <wsa@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, <Sergey.Semin@baikalelectronics.ru>,
        <linux-kernel@vger.kernel.org>
CC:     <digetx@gmail.com>, <treding@nvidia.com>,
        <jarkko.nikula@linux.intel.com>, <rmk+kernel@armlinux.org.uk>,
        <song.bao.hua@hisilicon.com>, <john.garry@huawei.com>,
        <mika.westerberg@linux.intel.com>, <yangyicong@hisilicon.com>,
        <prime.zeng@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v5 0/5] Add support for HiSilicon I2C controller
Date:   Tue, 30 Mar 2021 22:19:21 +0800
Message-ID: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add driver and MAINTAINERS for HiSilicon I2C controller on Kunpeng SoC. Also
provide the devm_*() variants for adding the I2C adapters. Add a public
api to provide I2C frequency mode strings and convert designware driver
to use it.

Change since v4:
- and Andy's review-by
- attach Andy's patch of switch designware driver to use i2c_freq_mode_string()
Link: https://lore.kernel.org/linux-i2c/1617109549-4013-1-git-send-email-yangyicong@hisilicon.com/
Link: https://lore.kernel.org/linux-i2c/20210330134633.29889-1-andriy.shevchenko@linux.intel.com/

Change since v3:
- split the bus mode string api to I2C as suggested by Andy
- simplify the devm variants and change the export format
- address the comments of the HiSilicon I2C driver from Andy and Dmitry, thanks!
Link: https://lore.kernel.org/linux-i2c/1616411413-7177-1-git-send-email-yangyicong@hisilicon.com/

Change since v2:
- handle -EPROBE_DEFER case when get irq number by platform_get_irq()
Link: https://lore.kernel.org/linux-i2c/1615296137-14558-1-git-send-email-yangyicong@hisilicon.com/

Change since v1:
- fix compile test error on 32bit arch, reported by intel lkp robot:
  64 bit division without using kernel wrapper in probe function.
Link:https://lore.kernel.org/linux-i2c/1615016946-55670-1-git-send-email-yangyicong@hisilicon.com/

Andy Shevchenko (1):
  i2c: designware: Switch over to i2c_freq_mode_string()

Yicong Yang (4):
  i2c: core: add managed function for adding i2c adapters
  i2c: core: add api to provide frequency mode strings
  i2c: add support for HiSilicon I2C controller
  MAINTAINERS: Add maintainer for HiSilicon I2C driver

 MAINTAINERS                                |   7 +
 drivers/i2c/busses/Kconfig                 |  10 +
 drivers/i2c/busses/Makefile                |   1 +
 drivers/i2c/busses/i2c-designware-master.c |  20 +-
 drivers/i2c/busses/i2c-hisi.c              | 506 +++++++++++++++++++++++++++++
 drivers/i2c/i2c-core-base.c                |  26 ++
 include/linux/i2c.h                        |  21 ++
 7 files changed, 575 insertions(+), 16 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-hisi.c

-- 
2.8.1

