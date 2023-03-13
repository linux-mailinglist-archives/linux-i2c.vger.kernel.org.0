Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 605456B703C
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 08:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjCMHql (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 03:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjCMHqk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 03:46:40 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A258C4B81B
        for <linux-i2c@vger.kernel.org>; Mon, 13 Mar 2023 00:46:39 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PZpc96bT7zrSmJ;
        Mon, 13 Mar 2023 15:45:45 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 15:46:37 +0800
From:   Yicong Yang <yangyicong@huawei.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <chenweilong@huawei.com>, <f.fangjian@huawei.com>,
        <linuxarm@huawei.com>, <prime.zeng@huawei.com>,
        <yangyicong@hisilicon.com>
Subject: [PATCH 0/2] Improvement and fix for HiSilicon I2C driver
Date:   Mon, 13 Mar 2023 15:45:50 +0800
Message-ID: <20230313074552.54457-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Yicong Yang <yangyicong@hisilicon.com>

This patchset includes 2 patches for 1) Improve the interrupt handling to
avoid redundant interrupts and 2) fix the issue that on error case the
completion is not handled and corrupt the next transfer.

Yicong Yang (2):
  i2c: hisi: Avoid redundant interrupts
  i2c: hisi: Only use the completion interrupt to finish the transfer

 drivers/i2c/busses/i2c-hisi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.24.0

