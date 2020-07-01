Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCD5D21155C
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 23:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgGAVsi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 17:48:38 -0400
Received: from www.zeus03.de ([194.117.254.33]:57712 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727853AbgGAVsi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Jul 2020 17:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=lV4rVEU06zzJo6BqacCA+LQtCQz
        l4u3O5dvm7O9wVH8=; b=hVYr7emwsPHwtsEy8tCKkz2k5OsarQwkvNrtArv2KCw
        ZgrXs/ETDWqIqefzbzUolHrFr3yAdPe625VcAOoZt6bx/7RHNsMXsdKgZ1aDTLUx
        T/1x5nxKN8Dm75vmvEsaxTuZILlDWpgiOW8AjH0xq6d7yc9kVYMKGUnfoNK0BV0o
        =
Received: (qmail 678364 invoked from network); 1 Jul 2020 23:48:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jul 2020 23:48:35 +0200
X-UD-Smtp-Session: l3s3148p1@/XICQWipVt8gAwDPXwRGAHjapuWXvfu/
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Alain Volmat <alain.volmat@st.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: add binding to mark a bus as SMBus
Date:   Wed,  1 Jul 2020 23:48:30 +0200
Message-Id: <20200701214830.3174-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SMBus is largely compatible with I2C but there are some specifics. In
case we need them on a bus, we can now use this new binding.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/i2c/i2c.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index 438ae123107e..d1f8cf3bd236 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -77,6 +77,11 @@ wants to support one of the below features, it should adapt these bindings.
 	this information to detect a stalled bus more reliably, for example.
 	Can not be combined with 'multi-master'.
 
+- smbus
+	states that additional SMBus restrictions and features apply to this bus.
+	Examples of features are SMBusHostNotify and SMBusAlert. Examples of
+	restrictions are more reserved addresses and timeout definitions.
+
 Required properties (per child device)
 --------------------------------------
 
-- 
2.27.0

