Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE26D23D3C6
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 00:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgHEWGE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 18:06:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:43240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbgHEWGE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 18:06:04 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D26D82250E;
        Wed,  5 Aug 2020 22:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596665163;
        bh=ohzksv5a4E0Te4dg6sQ+sJVXEuV5TaAYln75JAG7GjA=;
        h=From:To:Cc:Subject:Date:From;
        b=iVCaJOU20JNevbgFA61K49wKuG62I/xP91hbD1IyzC4+/VT5FEPAvsj1wkQEvzQYs
         m1yIKBFjS4N4koh8H1nVYMlfB1ONNWg3L1o61GVCr538ARTu+NW6+S0HTxF3kq65UK
         GdzteDiAxjR2nvF/QxXzu9co5qtPbCMOkWbybGS8=
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH i2c-tools] tools: allow to preset TOOLS_CFLAGS and TOOLS_LDFLAGS
Date:   Thu,  6 Aug 2020 00:05:55 +0200
Message-Id: <20200805220555.9050-1-wsa@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sometimes I need to add some flags (like -static for the linker), so
allow this.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---

Jean, what do you think?

 tools/Module.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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

