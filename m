Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03CAB1C2528
	for <lists+linux-i2c@lfdr.de>; Sat,  2 May 2020 14:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgEBMSx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 May 2020 08:18:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:52664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726896AbgEBMSx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 2 May 2020 08:18:53 -0400
Received: from localhost (p5486C608.dip0.t-ipconnect.de [84.134.198.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3EE2C2064C;
        Sat,  2 May 2020 12:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588421932;
        bh=iIMxmKSfhwt9Y6WBsiFbb6OU8iD5jqB42Z04kdSzJG0=;
        h=From:To:Cc:Subject:Date:From;
        b=Jf5QJEKFAF9qRkTYpsdkEocVaUAt1PasLUrUUArEVzlSONdl31rDeP5hrDwOFJNA/
         /xns3DCnNoOBuM2otzCp8X4r6BBCQoKAdOEktzEVbdDHEDIlgRcxKdQeC+OWfeqNM2
         Ix4zcoC+7JiBN4P/23YxeUg3m1f09VwyRzQcHzhc=
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: use my kernel.org address from now on
Date:   Sat,  2 May 2020 14:18:35 +0200
Message-Id: <20200502121840.9544-1-wsa@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The old email is still active, but for easier handling, I am going to
use my kernel.org address from now on. Also, add a mailmap for the now
defunct Pengutronix address.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 .mailmap                    | 2 ++
 MAINTAINERS                 | 2 +-
 drivers/i2c/i2c-core-base.c | 2 +-
 drivers/i2c/i2c-core-of.c   | 2 +-
 include/linux/i2c.h         | 2 +-
 5 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/.mailmap b/.mailmap
index db3754a41018..4f906b4e9785 100644
--- a/.mailmap
+++ b/.mailmap
@@ -288,6 +288,8 @@ Vladimir Davydov <vdavydov.dev@gmail.com> <vdavydov@virtuozzo.com>
 Vladimir Davydov <vdavydov.dev@gmail.com> <vdavydov@parallels.com>
 Takashi YOSHII <takashi.yoshii.zj@renesas.com>
 Will Deacon <will@kernel.org> <will.deacon@arm.com>
+Wolfram Sang <wsa@kernel.org> <wsa@the-dreams.de>
+Wolfram Sang <wsa@kernel.org> <w.sang@pengutronix.de>
 Yakir Yang <kuankuan.y@gmail.com> <ykk@rock-chips.com>
 Yusuke Goda <goda.yusuke@renesas.com>
 Gustavo Padovan <gustavo@las.ic.unicamp.br>
diff --git a/MAINTAINERS b/MAINTAINERS
index 26f281d9f32a..46049787d27e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7949,7 +7949,7 @@ F:	Documentation/i2c/busses/i2c-parport.rst
 F:	drivers/i2c/busses/i2c-parport.c
 
 I2C SUBSYSTEM
-M:	Wolfram Sang <wsa@the-dreams.de>
+M:	Wolfram Sang <wsa@kernel.org>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 W:	https://i2c.wiki.kernel.org/
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index a66912782064..ee013313b727 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -7,7 +7,7 @@
  *   Mux support by Rodolfo Giometti <giometti@enneenne.com> and
  *   Michael Lawnick <michael.lawnick.ext@nsn.com>
  *
- * Copyright (C) 2013-2017 Wolfram Sang <wsa@the-dreams.de>
+ * Copyright (C) 2013-2017 Wolfram Sang <wsa@kernel.org>
  */
 
 #define pr_fmt(fmt) "i2c-core: " fmt
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 6787c1f71483..3ed74aa4b44b 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -5,7 +5,7 @@
  * Copyright (C) 2008 Jochen Friedrich <jochen@scram.de>
  * based on a previous patch from Jon Smirl <jonsmirl@gmail.com>
  *
- * Copyright (C) 2013, 2018 Wolfram Sang <wsa@the-dreams.de>
+ * Copyright (C) 2013, 2018 Wolfram Sang <wsa@kernel.org>
  */
 
 #include <dt-bindings/i2c/i2c.h>
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 45d36ba4826b..49d29054e657 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -2,7 +2,7 @@
 /*
  * i2c.h - definitions for the Linux i2c bus interface
  * Copyright (C) 1995-2000 Simon G. Vogl
- * Copyright (C) 2013-2019 Wolfram Sang <wsa@the-dreams.de>
+ * Copyright (C) 2013-2019 Wolfram Sang <wsa@kernel.org>
  *
  * With some changes from Kyösti Mälkki <kmalkki@cc.hut.fi> and
  * Frodo Looijaard <frodol@dds.nl>
-- 
2.20.1

