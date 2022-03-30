Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFD8B4EBE94
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Mar 2022 12:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245308AbiC3KWZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Mar 2022 06:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232733AbiC3KWZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Mar 2022 06:22:25 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A390F1D9140
        for <linux-i2c@vger.kernel.org>; Wed, 30 Mar 2022 03:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=zHL7l2uunVRk97HYjPN/336OCE7
        z5i6rLw/+bOfvq+g=; b=wt64QtMYt7wcPpgKpowGhU5Q09eA58Sim3ZjOCq4eMf
        z+lSL7+5hAlT6eJYnKHP+EQmQ9eg63vuzlhEq23Lzzmr7OF+Wn8bh2PzKbK2Cz3x
        aL58mNyjGEaWAQEg0KmFyIcm7+y5eLj77H2Y//Tsv5pLTwgJUZtm+EcXeoYefg4k
        =
Received: (qmail 2147120 invoked from network); 30 Mar 2022 12:20:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2022 12:20:36 +0200
X-UD-Smtp-Session: l3s3148p1@a0J15Wzb0KkgAQnoAFSoAOQGPeMhapNB
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools] i2cget: add mode character for SMBus block read to manpage
Date:   Wed, 30 Mar 2022 12:20:28 +0200
Message-Id: <20220330102028.36187-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The text was updated, but the mode character was forgotten.

Fixes: 789af53 ("i2cget: Add support for SMBus block read")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 tools/i2cget.8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/i2cget.8 b/tools/i2cget.8
index 83c6f7d..a836341 100644
--- a/tools/i2cget.8
+++ b/tools/i2cget.8
@@ -49,7 +49,7 @@ an integer between 0x00 and 0xFF. If omitted, the currently active register
 will be read (if that makes sense for the considered chip).
 .PP
 The \fImode\fR parameter, if specified, is one of the letters \fBb\fP,
-\fBw\fP, \fBc\fP, or \fBi\fP, corresponding to a read byte data, a read
+\fBw\fP, \fBc\fP, \fBs\fP, or \fBi\fP, corresponding to a read byte data, a read
 word data, a write byte/read byte, an SMBus block read, or an I2C block read
 transaction, respectively. A \fBp\fP can also be appended to the \fImode\fR
 parameter to enable PEC, except for I2C block transactions. If the \fImode\fR
-- 
2.35.1

