Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC59410B1D
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Sep 2021 12:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbhISKQ4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Sep 2021 06:16:56 -0400
Received: from linderud.dev ([163.172.10.146]:41814 "EHLO linderud.pw"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230020AbhISKQ4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 19 Sep 2021 06:16:56 -0400
X-Greylist: delayed 350 seconds by postgrey-1.27 at vger.kernel.org; Sun, 19 Sep 2021 06:16:56 EDT
Received: from linderud.pw (localhost [127.0.0.1])
        by linderud.pw (Postfix) with ESMTP id 229F7C02AA;
        Sun, 19 Sep 2021 12:09:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.5-pre1 (2020-06-20) on velox
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.5-pre1
Received: from localhost (host-37-191-241-102.lynet.no [37.191.241.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: morten)
        by linderud.pw (Postfix) with ESMTPSA id BE398C01F7;
        Sun, 19 Sep 2021 12:09:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linderud.pw;
        s=linderud; t=1632046147;
        bh=IRb+5MC2crHNQ8ZFoVtXBZtipgVt8L5y/IT/w6ig6+g=;
        h=From:To:Cc:Subject:Date;
        b=gQpJfqdU2WnlAJJgNwujCGhy4iMqnGpLzYtNKbLBch+a3HvBjfBzbywngqQuSK8k/
         C/Ng18qqD4oURcV09aPXLe8hWP5u4WqwtF8bTw/A0pM3bJiTKUXYADQD03Zav7omt5
         9OgqYERV7d9xKY63x5Fmlv81DR+bTz/9yO3qtea5u6DEQ2WZ9qOdyNDApxqJAWPWmo
         iegma3xhmJNomB6Q/PGlD31YAXx80GGBuQb35VXcG+/OsQg1twned9e/xMgybF7MZt
         1ZvBHxx2iaGKOA2gwsYKKkC35HXwg5O0sNNGh49ao553xBlNykjRI6/kaMktognURt
         E2eKg7WNDuvXvdO1ChpL0+fjWJpaj1f72FMJto8nY3skJVs71Lj+hG/iu1ILzzlDmq
         4MPfXaE5mVqhEcHx8XNGqyg/FncKkUOgOwJ7ab3+ps6zVuiAb48DY13F0Yi0peXrex
         I3wfnEiUYrZ7ZEzO66UwTWZiN1vj59fF+ZgT95binvn/cIAjGBzHQU8OIX6BJI0/Gg
         xnAM1P4eBUwjbHoFCBEghJvFSmHDCTmi+P2uPM7pUUAufthVKVAMVZI8tDEUK1DZh4
         avV3Y6QIzIZJOXjA+tKVFnFvsEiJzrDyS/kF7NdPT/9T77DSKdL1yI/8qUJMggqz8Z
         VvnHSIxs27T0ApwLrgJ4dxQw=
From:   Morten Linderud <morten@linderud.pw>
To:     linux-i2c@vger.kernel.org
Cc:     Morten Linderud <morten@linderud.pw>
Subject: [PATCH i2c-tools] py-smbus/Module.mk: Install with PREFIX defined
Date:   Sun, 19 Sep 2021 12:08:51 +0200
Message-Id: <20210919100851.2890107-1-morten@linderud.pw>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If we are building to a defined destdir py-smbus is going to ignore this
and try install to the actual root. This breaks packaging setups as the
install section would fail.

Signed-off-by: Morten Linderud <morten@linderud.pw>
---
 py-smbus/Module.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/py-smbus/Module.mk b/py-smbus/Module.mk
index 04ceb64..1e2ded1 100644
--- a/py-smbus/Module.mk
+++ b/py-smbus/Module.mk
@@ -22,7 +22,7 @@ clean-python:
 	rm -rf py-smbus/build
 
 install-python:
-	$(DISTUTILS) install
+	$(DISTUTILS) install --prefix="$(PREFIX)"
 
 all: all-python
 
-- 
2.33.0
