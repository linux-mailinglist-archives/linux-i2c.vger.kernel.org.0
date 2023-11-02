Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E833D7DEB07
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Nov 2023 03:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347248AbjKBCyL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Nov 2023 22:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347177AbjKBCyK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Nov 2023 22:54:10 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB47110
        for <linux-i2c@vger.kernel.org>; Wed,  1 Nov 2023 19:54:06 -0700 (PDT)
X-ASG-Debug-ID: 1698893643-1eb14e538b03ad0001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx2.zhaoxin.com with ESMTP id 6V5MLEvQ56B5EzgU (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 02 Nov 2023 10:54:03 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 2 Nov
 2023 10:54:03 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 2 Nov 2023 10:54:02 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
From:   Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To:     <andi.shyti@kernel.org>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     <cobechen@zhaoxin.com>
Subject: [PATCH v3 00/12] i2c: add zhaoxin i2c controller driver
Date:   Thu, 2 Nov 2023 10:53:50 +0800
X-ASG-Orig-Subj: [PATCH v3 00/12] i2c: add zhaoxin i2c controller driver
Message-ID: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1698893643
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1937
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.116192
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi, Wolfram,

Due to some corporate and personal delays, I only recently had time
to prepare the patch v3. Please kindly review.

In version v2, the patch consists of 2 files.
In version v3, the patch consists of 12 files.
I wish it was a little clearer how I do with it.

Among them, patch 0001-0009 is mainly some format modification and
removal of redundancy.
Patch 0010 splits i2c-wmt.c into i2c-wmt-plt.c and i2c-viai2c-common.c.
Patch 0011 shows some differences between zhaoxin and wmt.
Patch 0012 is the reset driver by zhaoxin's own controller.

Hans Hu (12):
  i2c: wmt: Reduce redundant: bus busy check
  i2c: wmt: Reduce redundant: wait event complete
  i2c: wmt: Reduce redundant: clock mode setting
  i2c: wmt: Reduce redundant: REG_CR setting
  i2c: wmt: Reduce redundant: function parameter
  i2c: wmt: delete .remove_new
  i2c: wmt: create wmt_i2c_init for general init
  i2c: wmt: rename marcos with prefix WMTI2C_
  i2c: wmt: adjust line length to meet style
  i2c: wmt: split out common files
  i2c: via-common: add zhaoxin platform
  i2c: add zhaoxin i2c controller driver

 MAINTAINERS                            |   8 +
 drivers/i2c/busses/Kconfig             |  10 +
 drivers/i2c/busses/Makefile            |   4 +
 drivers/i2c/busses/i2c-viai2c-common.c | 246 +++++++++++++
 drivers/i2c/busses/i2c-viai2c-common.h |  79 +++++
 drivers/i2c/busses/i2c-wmt-plt.c       | 139 ++++++++
 drivers/i2c/busses/i2c-wmt.c           | 466 -------------------------
 drivers/i2c/busses/i2c-zhaoxin-plt.c   | 296 ++++++++++++++++
 8 files changed, 782 insertions(+), 466 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.h
 create mode 100644 drivers/i2c/busses/i2c-wmt-plt.c
 delete mode 100644 drivers/i2c/busses/i2c-wmt.c
 create mode 100644 drivers/i2c/busses/i2c-zhaoxin-plt.c

-- 
2.34.1

