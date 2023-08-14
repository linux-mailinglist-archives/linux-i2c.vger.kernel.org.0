Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EECBA77B453
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 10:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233185AbjHNIkq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 04:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234707AbjHNIke (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 04:40:34 -0400
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7899E10B
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 01:40:33 -0700 (PDT)
X-ASG-Debug-ID: 1692002423-086e23186b19bb0001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx1.zhaoxin.com with ESMTP id EVLXqQXVcFqPqLiG (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 14 Aug 2023 16:40:23 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 14 Aug
 2023 16:40:23 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 zxbjmbx1.zhaoxin.com (10.29.252.163) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 14 Aug 2023 16:40:22 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
From:   Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.163
To:     <andi.shyti@kernel.org>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     <cobechen@zhaoxin.com>, <TonyWWang@zhaoxin.com>
Subject: [PATCH v2 0/2] i2c: add support for Zhaoxin I2C controller
Date:   Mon, 14 Aug 2023 16:40:17 +0800
X-ASG-Orig-Subj: [PATCH v2 0/2] i2c: add support for Zhaoxin I2C controller
Message-ID: <cover.1691999569.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1692002423
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1308
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.112729
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi, Wolfram,

The Zhaoxin I2C controller uses the same I2C IP as Wonder Media.
Both Zhaoxin and Wonder Media's I2C IP are come from VIA I2C IP.
Therefore, some codes of i2c-wmt.c can be re-used by i2c-zhaoxin.c.

As suggested earlier, created two files, named i2c-viai2c-common.{c,h}.
They contains the macro definitions, functions declaration and data
structure used by both i2c-zhaoxin.c and i2c-wmt.c.

v1->v2:
1. Fixed a compilation error for header file references.
2. use I2C platform device's name to define the irq's name.

Hans Hu (2):
  i2c: wmt: split out i2c-viai2c-common.{c,h}
  i2c: add support for Zhaoxin I2C controller

 MAINTAINERS                            |   7 +
 drivers/i2c/busses/Kconfig             |  15 +
 drivers/i2c/busses/Makefile            |   2 +
 drivers/i2c/busses/i2c-viai2c-common.c | 239 +++++++++++++++
 drivers/i2c/busses/i2c-viai2c-common.h |  76 +++++
 drivers/i2c/busses/i2c-wmt.c           | 402 ++-----------------------
 drivers/i2c/busses/i2c-zhaoxin.c       | 274 +++++++++++++++++
 7 files changed, 644 insertions(+), 371 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.h
 create mode 100644 drivers/i2c/busses/i2c-zhaoxin.c

-- 
2.34.1

