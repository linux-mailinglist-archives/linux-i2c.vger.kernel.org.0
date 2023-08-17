Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA9EA77F3C1
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 11:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349626AbjHQJqX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 05:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349028AbjHQJqS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 05:46:18 -0400
Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63072D57;
        Thu, 17 Aug 2023 02:46:15 -0700 (PDT)
Received: from dlp.unisoc.com ([10.29.3.86])
        by SHSQR01.spreadtrum.com with ESMTP id 37H9jihY083854;
        Thu, 17 Aug 2023 17:45:44 +0800 (+08)
        (envelope-from Huangzheng.Lai@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
        by dlp.unisoc.com (SkyGuard) with ESMTPS id 4RRKnc1tV4z2Q0Ft2;
        Thu, 17 Aug 2023 17:43:32 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Thu, 17 Aug
 2023 17:45:42 +0800
From:   Huangzheng Lai <Huangzheng.Lai@unisoc.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        huangzheng lai <laihuangzheng@gmail.com>,
        Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: [PATCH 0/8] i2c: sprd: Modification of UNIOC Platform IIC Driver
Date:   Thu, 17 Aug 2023 17:45:12 +0800
Message-ID: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.2.29]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL: SHSQR01.spreadtrum.com 37H9jihY083854
X-Spam-Status: No, score=0.3 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Recently, some bugs have been discovered during use, and patch3 
and patch5-8 are bug fixes. Also, this patchset add new features: 
patch1 allows IIC to use more frequencies for communication, 
patch2 allows IIC to use 'reset framework' for reset, and patch4 allows 
IIC controller to dynamically switch frequencies during use.

Huangzheng Lai (8):
  i2c: sprd: Add configurations that support 1Mhz and 3.4Mhz frequencies
  i2c: sprd: Add I2C driver to use 'reset framework' function
  i2c: sprd: Use global variables to record IIC ack/nack status instead
    of local variables
  i2c: sprd: Add IIC controller driver to support dynamic switching of
    400K/1M/3.4M frequency
  i2c: sprd: Configure the enable bit of the IIC controller before each
    transmission initiation
  i2c: sprd: Add additional IIC control bit configuration to adapt to
    the new IP version of the UNISOC platform
  i2c: sprd: Set I2C_RX_ACK when clear irq
  i2c: sprd: Increase the waiting time for IIC transmission to avoid
    system crash issues

 drivers/i2c/busses/i2c-sprd.c | 70 +++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 15 deletions(-)

-- 
2.17.1

