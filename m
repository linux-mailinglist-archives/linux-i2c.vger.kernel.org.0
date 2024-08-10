Return-Path: <linux-i2c+bounces-5279-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747B694DEB8
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Aug 2024 23:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B6BC282B83
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Aug 2024 21:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB4D143733;
	Sat, 10 Aug 2024 21:14:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACE183CA1;
	Sat, 10 Aug 2024 21:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723324498; cv=none; b=m3HIvtiGRwUjXkVK7EjGzPa82CnD57eiGXGat/r0TWFLqNdOl5lviSG6piVadlAjYqno3OvVJDeb/XBXKVMBrEoCVsksi5KrqeF4dMlkCKRTt6FnzZi70DqmcVkdV2WsO2l3upy5/7sYje3PgLyLQDdtk8diTgU6+YeMXrSYsUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723324498; c=relaxed/simple;
	bh=PA+2RBGwMVxSW4LJOF4UM3Ay/Bs+Ef8O6uPxqBMAAy0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jCT3IC5vtUKtW7JU90bUOIb7JQB++epIXs9czftKEYXN4Ma8o05M8K/GWcJ0J/j0xA58xBZvu3GHC0x51968xFxhJb/NIAQFqJvL2PebbbTx6pYup7X823duuJwHDGIU90cFfIAIay64lyFUl2F0r29VESgL5334fep25tMeeOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b02.versanet.de ([83.135.91.2] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sctQH-0007Ui-LJ; Sat, 10 Aug 2024 23:14:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: brgl@bgdev.pl
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	ukleinek@debian.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: eeprom: at24: Add compatible for Giantec GT24C04A
Date: Sat, 10 Aug 2024 23:14:37 +0200
Message-Id: <20240810211438.286441-2-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240810211438.286441-1-heiko@sntech.de>
References: <20240810211438.286441-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gt24c04a is just yet another 2404 compatible eeprom, and does not
follow the generic naming matching, so add a separate compatible for it.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index e396e47b2f13c..b6239ec3512b3 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -116,6 +116,7 @@ properties:
           - const: atmel,24c02
       - items:
           - enum:
+              - giantec,gt24c04a
               - onnn,cat24c04
               - onnn,cat24c05
               - rohm,br24g04
-- 
2.39.2


