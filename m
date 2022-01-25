Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B0C49B459
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 13:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344441AbiAYMxk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 07:53:40 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:17809 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384066AbiAYMuu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 07:50:50 -0500
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Jjmrn0Nynz9sMV;
        Tue, 25 Jan 2022 20:49:29 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 25 Jan 2022 20:50:48 +0800
From:   Yicong Yang <yangyicong@hisilicon.com>
To:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <yangyicong@hisilicon.com>, <prime.zeng@hisilicon.com>,
        <linuxarm@huawei.com>
Subject: [PATCH 0/2] Add I2C bus recovery support on Kunpeng 920/930
Date:   Tue, 25 Jan 2022 20:49:28 +0800
Message-ID: <20220125124930.50369-1-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series adds the I2C bus recovery support on Kunpeng 920/930.
We're using HiSilicon I2C controller on Kunpeng 930 and Designware
I2C controller on Kunpeng 920. For both platform, the SCL/SDA pins
are multiplexed with GPIOs. Both driver use generic GPIO recovery
method and we need to switch the pin mutiplexing before/after the
recovery process. We use ACPI method to help on the pin mux switching
which is also introduced in this series.

Yicong Yang (2):
  i2c: hisi: Add generic GPIO bus recovery support
  i2c: designware: Add ACPI assisted recovery support

 drivers/i2c/busses/i2c-designware-core.h    |  2 +
 drivers/i2c/busses/i2c-designware-master.c  | 84 ++++++++++++++++++++-
 drivers/i2c/busses/i2c-designware-platdrv.c |  6 +-
 drivers/i2c/busses/i2c-hisi.c               | 78 +++++++++++++++++++
 4 files changed, 164 insertions(+), 6 deletions(-)

-- 
2.24.0

