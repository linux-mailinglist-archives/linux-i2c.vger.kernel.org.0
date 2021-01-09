Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF5982EFF95
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jan 2021 13:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbhAIMoU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Jan 2021 07:44:20 -0500
Received: from www.zeus03.de ([194.117.254.33]:50404 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726510AbhAIMoU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 9 Jan 2021 07:44:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=YYKWRuFl8zP6a5
        eQO3moWMROcXKwUYMs+zpQJNU+YFU=; b=MdEbvatsG6XeHPnqu02o0068LuPg/P
        a1km++CVQt2aGtUvgkHY2Eazc80PiIXQKmItdpEhGyQDbwuFY5mUCwl8sZYPkm+L
        2eqZwg6DfDDUJ5PYbV2DUstZB/ufMk9aSF0HEPVssFjs1GMMIquOo6FjMpaTWvga
        WDrUA6o0ycWuE=
Received: (qmail 1725163 invoked from network); 9 Jan 2021 13:43:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2021 13:43:31 +0100
X-UD-Smtp-Session: l3s3148p1@SNcvBXe4UJYgAwDPXyBeAD+yeC5KBZLe
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] i2c: uapi: add macro to describe support for all SMBus transfers
Date:   Sat,  9 Jan 2021 13:43:09 +0100
Message-Id: <20210109124314.27466-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
References: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some I2C bus master drivers which support I2C_M_RECV_LEN do not set
the functionality bits of the now supported SMBus transfers. Add a
convenience macro to make this very simple.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/uapi/linux/i2c.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index 7786551eb177..92326ebde350 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -129,6 +129,11 @@ struct i2c_msg {
 					 I2C_FUNC_SMBUS_I2C_BLOCK | \
 					 I2C_FUNC_SMBUS_PEC)
 
+/* if I2C_M_RECV_LEN is also supported */
+#define I2C_FUNC_SMBUS_EMUL_ALL		(I2C_FUNC_SMBUS_EMUL | \
+					 I2C_FUNC_SMBUS_READ_BLOCK_DATA | \
+					 I2C_FUNC_SMBUS_BLOCK_PROC_CALL)
+
 /*
  * Data for SMBus Messages
  */
-- 
2.29.2

