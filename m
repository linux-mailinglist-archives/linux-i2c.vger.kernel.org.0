Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F13D37D2C53
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 10:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjJWINL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 04:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjJWIM6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 04:12:58 -0400
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8F210EA;
        Mon, 23 Oct 2023 01:12:54 -0700 (PDT)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 39N8CSJA060036;
        Mon, 23 Oct 2023 16:12:28 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4SDSVY6W39z2KkWG6;
        Mon, 23 Oct 2023 16:08:05 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Mon, 23 Oct
 2023 16:12:26 +0800
From:   Huangzheng Lai <Huangzheng.Lai@unisoc.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        huangzheng lai <laihuangzheng@gmail.com>,
        Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: [PATCH V2 0/7] i2c: sprd: Modification of UNISOC Platform I2C Driver
Date:   Mon, 23 Oct 2023 16:11:51 +0800
Message-ID: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL: SHSQR01.spreadtrum.com 39N8CSJA060036
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Recently, some bugs have been discovered during use, patch3 and 
patch5-6 are bug fixes. Also, this patchset add new features:
patch1 allows I2C to use more frequencies for communication,
patch2 allows I2C to use 'reset framework' for reset, and patch4 allows
I2C controller to dynamically switch frequencies during use.

change in V2
-Using 'I2C' instead of 'IIC' in the patch set.
-Using imperative form in patch subject.
-Use 'switch case' instead of 'else if' in PATCH 1/7.
-Modify if (i2c_dev->rst != NULL) to if (i2c_dev->rst) in PATCH 2/7.
-Modify some dev_err() to dev_warn() or dev_dbg().
-Clear i2c_dev->ack_flag in sprd_i2c_clear_ack() in PATCH 3/7.
-Modify the indentation format of the code in PATCH 4/7.
-Move sprd_i2c_enable() above its caller in PATCH 5/7.
-Remove 'Set I2C_RX_ACK when clear irq' commit.
-Add Fixes tags. 

Huangzheng Lai (7):
  i2c: sprd: Add configurations that support 1Mhz and 3.4Mhz frequencies
  i2c: sprd: Add I2C driver to use 'reset framework' function
  i2c: sprd: Use global variables to record I2C ack/nack status instead
    of local variables
  i2c: sprd: Add I2C controller driver to support dynamic switching of
    400K/1M/3.4M frequency
  i2c: sprd: Configure the enable bit of the I2C controller before each
    transmission initiation
  i2c: sprd: Increase the waiting time for I2C transmission to avoid
    system crash issues
  i2c: sprd: Add I2C_NACK_EN and I2C_TRANS_EN control bits

 drivers/i2c/busses/i2c-sprd.c | 166 ++++++++++++++++++++++------------
 1 file changed, 106 insertions(+), 60 deletions(-)

-- 
2.17.1

