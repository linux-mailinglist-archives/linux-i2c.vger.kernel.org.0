Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E23723EC18
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 13:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbgHGLNf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 07:13:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:45458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728380AbgHGLNS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Aug 2020 07:13:18 -0400
Received: from localhost (unknown [77.247.85.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DAFEC22C9F;
        Fri,  7 Aug 2020 11:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596798757;
        bh=cmwGKiIkUkGZSbIlZGNx4AwXhiMby0qBswCbIdPuM5w=;
        h=From:To:Cc:Subject:Date:From;
        b=A2y3Sbt3DH5lQ2caS4ZplRnpgqRmxmxE4j+iRHJz4Wpvo4OwYH0KaYYjTHgtBpzHC
         JFno5zOVcud/yuOhNBh8pzLl9NrYAic9HcjYWWWH84H+3TpolDc9oHe4FErvEmFoGY
         bkj4k11Uc6xT8dIobj3CrdQ6VBeKTdFHSa7C0SXU=
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH i2c-tools v2] allow to preset custom CFLAGS and LDFLAGS
Date:   Fri,  7 Aug 2020 13:12:30 +0200
Message-Id: <20200807111230.1241-1-wsa@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sometimes I need to add some flags (like -static for the linker), so
allow this for all CFLAGS and LDFLAGS used in this project.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---

Changes since v1:
	* update all Module.mk, not just tools
	* add entry to CHANGES

 CHANGES          | 1 +
 eeprog/Module.mk | 6 +++---
 lib/Module.mk    | 2 +-
 tools/Module.mk  | 6 +++---
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index e3ff3a0..f5c7d33 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,6 +2,7 @@ i2c-tools CHANGES
 -----------------
 
 master
+  Makefile: allow to preset all CFLAGS and LDFLAGS variables
   tools: Consistently use snprintf instead of sprintf
          Restrict addresses 0x03-0x07, too (defined by I2C standard)
   decode-dimms: Print SPD revision for DDR3 too
diff --git a/eeprog/Module.mk b/eeprog/Module.mk
index ac3a368..3f442aa 100644
--- a/eeprog/Module.mk
+++ b/eeprog/Module.mk
@@ -7,11 +7,11 @@
 
 EEPROG_DIR	:= eeprog
 
-EEPROG_CFLAGS	:= -Iinclude
+EEPROG_CFLAGS	+= -Iinclude
 ifeq ($(USE_STATIC_LIB),1)
-EEPROG_LDFLAGS	:= $(LIB_DIR)/$(LIB_STLIBNAME)
+EEPROG_LDFLAGS	+= $(LIB_DIR)/$(LIB_STLIBNAME)
 else
-EEPROG_LDFLAGS	:= -L$(LIB_DIR) -li2c
+EEPROG_LDFLAGS	+= -L$(LIB_DIR) -li2c
 endif
 
 EEPROG_TARGETS	:= eeprog
diff --git a/lib/Module.mk b/lib/Module.mk
index 46a1c91..6727de7 100644
--- a/lib/Module.mk
+++ b/lib/Module.mk
@@ -9,7 +9,7 @@
 
 LIB_DIR		:= lib
 
-LIB_CFLAGS	:= -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual \
+LIB_CFLAGS	+= -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual \
 		   -Wcast-align -Wwrite-strings -Wnested-externs -Winline \
 		   -W -Wundef -Wmissing-prototypes -Iinclude
 
diff --git a/tools/Module.mk b/tools/Module.mk
index 693102f..f5b133d 100644
--- a/tools/Module.mk
+++ b/tools/Module.mk
@@ -9,13 +9,13 @@
 
 TOOLS_DIR	:= tools
 
-TOOLS_CFLAGS	:= -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual \
+TOOLS_CFLAGS	+= -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual \
 		   -Wcast-align -Wwrite-strings -Wnested-externs -Winline \
 		   -W -Wundef -Wmissing-prototypes -Iinclude
 ifeq ($(USE_STATIC_LIB),1)
-TOOLS_LDFLAGS	:= $(LIB_DIR)/$(LIB_STLIBNAME)
+TOOLS_LDFLAGS	+= $(LIB_DIR)/$(LIB_STLIBNAME)
 else
-TOOLS_LDFLAGS	:= -L$(LIB_DIR) -li2c
+TOOLS_LDFLAGS	+= -L$(LIB_DIR) -li2c
 endif
 
 TOOLS_TARGETS	:= i2cdetect i2cdump i2cset i2cget i2ctransfer
-- 
2.27.0

