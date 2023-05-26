Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25278711B3B
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 02:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233106AbjEZAcS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 May 2023 20:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbjEZAcS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 20:32:18 -0400
X-Greylist: delayed 395 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 25 May 2023 17:32:13 PDT
Received: from smtp.bonedaddy.net (smtp.bonedaddy.net [45.33.94.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A345E198
        for <linux-i2c@vger.kernel.org>; Thu, 25 May 2023 17:32:13 -0700 (PDT)
Received: by smtp.bonedaddy.net (Postfix, from userid 10001)
        id DCE49306827; Thu, 25 May 2023 20:28:37 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
        s=mail; t=1685060917;
        bh=N+VO/RRFj2GsnfOiKXSIyoq3odh4M8h6VScMYb0/SaE=;
        h=From:To:Cc:Subject:Date;
        b=ZZIifKJ1lz0Py0foSSD9hFVgYr6NBVbMgWmuxNrZAQf8CXxPUSNqHyRJOfTOuspAI
         n4CijjEjCQzwD06numcA0z2echovNXL0t+tYWCA1CzpAje3tWA0FQU/Ax+r3gx+a8F
         L0lC2S9j2NvmQqJWC0LuekQeVGkJhAM0NC7XMfYaQSLHmAF8Lc4+aYuYbIGGgvFsDk
         xNDEeNKXMQI+BXU47QQFZ7EadY3gp/f71FlqXSKTcPntYqAk0fF0X8qix3uVyctcHW
         Zst+mfzLWpeZICLz45fshaR1jvYzctizm1fE80cA6StuNM6FTA8MapVSg9ltmeYl8h
         2tHeSUB6jQaQg==
From:   Paul Wise <pabs3@bonedaddy.net>
To:     Jean Delvare <jdelvare@suse.de>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Paul Wise <pabs3@bonedaddy.net>
Subject: [PATCH i2c-tools] Update links for https and changed URLs
Date:   Fri, 26 May 2023 08:31:57 +0800
Message-Id: <20230526003157.60368-1-pabs3@bonedaddy.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The read-edid project moved to a new maintainer.
---
 eeprom/decode-dimms | 2 +-
 eeprom/decode-edid  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms
index 787b6f5..08621a2 100755
--- a/eeprom/decode-dimms
+++ b/eeprom/decode-dimms
@@ -35,7 +35,7 @@
 # 1997,1999, Rev 1.2B
 #
 # Jedec Standards 4.1.x & 4.5.x
-# http://www.jedec.org
+# https://www.jedec.org/
 #
 
 require 5.004;
diff --git a/eeprom/decode-edid b/eeprom/decode-edid
index a669985..60c3712 100755
--- a/eeprom/decode-edid
+++ b/eeprom/decode-edid
@@ -36,7 +36,7 @@
 # what it finds in /proc to binary data to feed the parse-edid program.
 # The parse-edid program was written by John Fremlin and is available at
 # the following address:
-#   http://john.fremlin.de/programs/linux/read-edid/
+#   http://www.polypux.org/projects/read-edid/
 
 use strict;
 use Fcntl qw(:DEFAULT :seek);
-- 
2.40.1

