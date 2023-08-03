Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D14F76DE9C
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 04:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbjHCC5q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 22:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbjHCC5q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 22:57:46 -0400
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32DF21B6
        for <linux-i2c@vger.kernel.org>; Wed,  2 Aug 2023 19:57:44 -0700 (PDT)
X-ASG-Debug-ID: 1691031459-086e23186908ec0001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx1.zhaoxin.com with ESMTP id RtOQWOvQiY8MPTvp (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 03 Aug 2023 10:57:39 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 3 Aug
 2023 10:57:39 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 3 Aug 2023 10:57:38 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
From:   Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To:     <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <cobechen@zhaoxin.com>, <TonyWWang@zhaoxin.com>
Subject: [RFC 0/2] add support for Zhaoxin I2C controller
Date:   Thu, 3 Aug 2023 10:57:36 +0800
X-ASG-Orig-Subj: [RFC 0/2] add support for Zhaoxin I2C controller
Message-ID: <cover.1691030850.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1691031459
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1114
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.112239
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

Hi Andi,

As discussed earlier, the Zhaoxin i2c controller uses the same IP
as Wonder Media. Therefore, some codes of i2c-wmt.c can be re-used
by i2c-zhaoxin.c.

As you suggested, I created two files, named i2c-viai2c-common.{c,h}.
They contains the macro definition, function declaration and data
structure used by i2c-zhaoxin.c and i2c-wmt.c.

Hans Hu (2):
  i2c: separate i2c-viai2c-common from i2c-wmt
  i2c: add support for Zhaoxin I2C controller

 MAINTAINERS                            |   7 +
 drivers/i2c/busses/Kconfig             |  15 +
 drivers/i2c/busses/Makefile            |   2 +
 drivers/i2c/busses/i2c-viai2c-common.c | 239 +++++++++++++++
 drivers/i2c/busses/i2c-viai2c-common.h |  76 +++++
 drivers/i2c/busses/i2c-wmt.c           | 402 ++-----------------------
 drivers/i2c/busses/i2c-zhaoxin.c       | 275 +++++++++++++++++
 7 files changed, 645 insertions(+), 371 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.h
 create mode 100644 drivers/i2c/busses/i2c-zhaoxin.c

-- 
2.34.1

