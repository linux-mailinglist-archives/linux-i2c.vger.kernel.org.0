Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364402355F5
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Aug 2020 10:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgHBIVi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Aug 2020 04:21:38 -0400
Received: from www.zeus03.de ([194.117.254.33]:39400 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725916AbgHBIVh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 2 Aug 2020 04:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=tBq3NeLgdcvMzzrMBJhnHyHCEj6
        dMDECkPV5uR2GWvY=; b=IX6yQLyxYD40qNQhfPxdbJ8lNgNcX7ZAwzgKixsWkxp
        X3I9ZtyhNDlSmGK8j6s48cnWXz4Nb+y9hs+Uy4YPp3AfBafmrCHLFmN9zDU82DL1
        JQbaiZnBqC+obzE2Nft2rObYscOQBTkz+WFcyNVSdLqSVWA/5nul7fqYEP2Y01G0
        =
Received: (qmail 2042132 invoked from network); 2 Aug 2020 10:21:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Aug 2020 10:21:35 +0200
X-UD-Smtp-Session: l3s3148p1@RBDWteCriMNQT+F6
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] Documentation: i2c: dev: 'block process call' is supported
Date:   Sun,  2 Aug 2020 10:21:22 +0200
Message-Id: <20200802082122.3863-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

And it has been for a while (since 2012 at least), only it was not
documented. Add it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/dev-interface.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/i2c/dev-interface.rst b/Documentation/i2c/dev-interface.rst
index bdb247f2f11a..73ad34849f99 100644
--- a/Documentation/i2c/dev-interface.rst
+++ b/Documentation/i2c/dev-interface.rst
@@ -159,6 +159,8 @@ for details) through the following functions::
   __s32 i2c_smbus_read_word_data(int file, __u8 command);
   __s32 i2c_smbus_write_word_data(int file, __u8 command, __u16 value);
   __s32 i2c_smbus_process_call(int file, __u8 command, __u16 value);
+  __s32 i2c_smbus_block_process_call(int file, __u8 command, __u8 length,
+                                     __u8 *values);
   __s32 i2c_smbus_read_block_data(int file, __u8 command, __u8 *values);
   __s32 i2c_smbus_write_block_data(int file, __u8 command, __u8 length,
                                    __u8 *values);
-- 
2.27.0

