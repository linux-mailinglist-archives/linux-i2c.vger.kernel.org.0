Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1729F20C9B9
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jun 2020 20:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgF1Sz0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Jun 2020 14:55:26 -0400
Received: from www.zeus03.de ([194.117.254.33]:51916 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726585AbgF1SzZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 28 Jun 2020 14:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=Yfmsj+7wXhN8b8NtYfPXAou0as7
        Bt6r1pF7j1SGNfVY=; b=kZfn7i9WI0RFs0SBPKLOZxABCk7qLbGLqF1d2t6mUrW
        rRqXJfrLnPpMDBvXe7cJcJJBYgKEmD4Ylz0ZT2tYq53mYIVyTySWGFhQwILxgpIJ
        +RdLvtMtTr+f9srGmaXcmVTN9+vwEBY7R9LfRd6ubJsvhOnXAFbiHZdl4rQ/vMnk
        =
Received: (qmail 1787558 invoked from network); 28 Jun 2020 20:55:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2020 20:55:24 +0200
X-UD-Smtp-Session: l3s3148p1@KccWfCmpgK8gAwDPXykLAJ34nb66bSnN
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: add Kconfig help text for slave mode
Date:   Sun, 28 Jun 2020 20:55:22 +0200
Message-Id: <20200628185522.5902-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I can't recall why there was none, but we surely want to have it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index dbcbb8a6024e..e2d6063bdb4d 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -114,6 +114,11 @@ config I2C_STUB
 config I2C_SLAVE
 	bool "I2C slave support"
 
+	help
+	  This enables Linux to act as an I2C slave device. Note that your I2C
+	  bus master driver also needs to support this functionality. Please
+	  read Documentation/i2c/slave-interface.rst for further details.
+
 if I2C_SLAVE
 
 config I2C_SLAVE_EEPROM
-- 
2.20.1

