Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D82DD48C34
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 20:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfFQSjm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 14:39:42 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:35755 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfFQSjm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jun 2019 14:39:42 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MKc0o-1hvYmm1ROO-00KvUQ; Mon, 17 Jun 2019 20:39:40 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@the-dreams.de, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH 1/3] include: linux: i2c: more helpers for declaring i2c drivers
Date:   Mon, 17 Jun 2019 20:39:37 +0200
Message-Id: <1560796779-17117-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:LNAGFFDSSGhrBJAVfAfdpZS3/d/gWgechh97rUsMMlo81oJiI31
 H8SwkPnBK7lasHLpmX5/y50mEYh2o3n88GGUs0p+KHb3FmzIIeh3nSQZR7oqXRR6fFo2D80
 mpyqat861/1S8USST1EKfXo0dsawOE0tgNb50Hlwy8Cw2r7b7XobktyLtfALDv4INcg1A/2
 /PITBQ5p9pCcIC/tJ/vXA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xFB658LfSTA=:PoXhzmZr4oPSj16nxtRPl5
 mUycdTT0pK945VaN81pKG6dLJu7IRYlgAkG5rMk4hkAXp/RVPXpS38JUztiE2OFzMRGYJhx0G
 FdYP3NgSBfxCxM9CH2mYR7EoUqNyGeLNWCGcs9FmYh3IWzNBTQ3cj/3SwO79NOdoqJp3e9ir2
 hIf8quAyjb6YHzCtVq5fhaQ2XA9nI6hVQOiVtp67geW/UMfBm1urLCiqLZXwHFuc5HqvjuADB
 iQUqGl9lSXyRQ/N/sFJGPitT9vXekGa7zCrGmiB8bXPhtFQqBZKe1v+LxNANTPccTsL/IzuqT
 1WjxiOpN1yge1GACfsBm6dIL3euNqNYroF6+wmweRmZ1w8w5Au0BhVN0VYOWRMc4Yz/L4ERnI
 jczN6rjB+WQWa0EdAefmxmkSULkCDKvIFXfbRIMi5E8u/r28i0gSlI+B6qhnHi8OCQ5JbHacm
 l1qh8LWCNa4iu54sVARCmJbBCUVcOZU1KVN3JTSvcoGiWRibPC6/chr6m6WEuhn8N8bkBVwz7
 YXcGJCdFG/cM6kzU063GILKduwgX6WuYC0U10+cJVGVYWo+8NQfxXkGNf266OWPrm6eteowyC
 32El8moHv+gHxzE8Ou4707JfCoW/YyHzn1JDekB8HKqmV7+6ya2WYpp8lGnPQN2rFxm6bVxc6
 WF/KeCkUp5iLk13rEXfnZv0F3X67+3LTc+nf4NtYuNG41JXWZVlrhFMtcGZB4ByiPJNDEQKOr
 lp1v2PQqHum5Ll80u+DZVx7WlQtxwVM8HQLkdA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Add more helper macros for trivial driver init cases, similar to the
already existing module_i2c_driver()+friends - now for those which
are initialized at other stages (eg. by subsys_initcall()).

This helps to further reduce driver init boilerplate.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 include/linux/i2c.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 1308126..fee59bd 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -920,6 +920,23 @@ static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
 #define builtin_i2c_driver(__i2c_driver) \
 	builtin_driver(__i2c_driver, i2c_add_driver)
 
+/* subsys_i2c_driver() - Helper macro for drivers that don't do
+ * anything special in module init/exit.  This eliminates a lot of
+ * boilerplate.  Each module may only use this macro once, and
+ * calling it replaces subsys_initcall() and module_exit()
+ */
+#define subsys_i2c_driver(__i2c_driver) \
+static int __init __i2c_driver##_init(void) \
+{ \
+       return i2c_add_driver(&(__i2c_driver)); \
+} \
+subsys_initcall(__i2c_driver##_init); \
+static void __exit __i2c_driver##_exit(void) \
+{ \
+       i2c_del_driver(&(__i2c_driver)); \
+} \
+module_exit(__i2c_driver##_exit);
+
 #endif /* I2C */
 
 #if IS_ENABLED(CONFIG_OF)
-- 
1.9.1

