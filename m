Return-Path: <linux-i2c+bounces-14366-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 021A4C9AC0D
	for <lists+linux-i2c@lfdr.de>; Tue, 02 Dec 2025 09:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6300A3467E5
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Dec 2025 08:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E775230648A;
	Tue,  2 Dec 2025 08:50:18 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.naobsd.org (sakura.naobsd.org [160.16.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA30191F91;
	Tue,  2 Dec 2025 08:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.16.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764665418; cv=none; b=hpObukSSsd9CwrRRM10Yzjf0j1ZOwOpAGBFloHCmuYZ9uu13DAGkjZ9ILvTzsQM30WOacnWry57RU/6fM6Hu6U2BZoeVPomnwkyQZk2+IB6wUcM4vzhF3VG7LwKNM7IFGoAuhJvl6mFUtCYl0MlLvNCXSswdwEkAidBgk1Ng1tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764665418; c=relaxed/simple;
	bh=J5YLHr7jGBYlxMbTIILIoJy64pZk64fteTaMeL/SVyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AYsa+pdryz7XUdP30RND679ZF3u161DTsxf0Tsl3U07uOoMcjV0VJULtvA2YhmrsiSzDGtTZCNrY+rGU69CSptUC3dxaz1nqczNBNojs6OW8sPzWytcMRFWnpE3YoBmtx5zfwaBmRTS1upjKqqdwKGkwlP4kuLVPmhj79enCz3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=radxa.com; spf=fail smtp.mailfrom=radxa.com; arc=none smtp.client-ip=160.16.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=radxa.com
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 5B28noM4008635;
	Tue, 2 Dec 2025 17:49:52 +0900
From: FUKAUMI Naoki <naoki@radxa.com>
To: heiko@sntech.de
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        dsimic@manjaro.org, didi.debian@cknow.org, wens@kernel.org,
        nicolas.frattaroli@collabora.com, detlev.casanova@collabora.com,
        stephen@radxa.com, sebastian.reichel@collabora.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: [RESEND PATCH 1/3] dt-bindings: eeprom: at24: Add compatible for Belling BL24C04A/BL24C16F
Date: Tue,  2 Dec 2025 08:49:39 +0000
Message-ID: <20251202084941.1785-2-naoki@radxa.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202084941.1785-1-naoki@radxa.com>
References: <20251202084941.1785-1-naoki@radxa.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for Belling BL24C04A 4Kb EEPROM and BL24C16F 16Kb
EEPROM.

Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index c21282634780..8f16fa2ba17a 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -116,6 +116,7 @@ properties:
           - const: atmel,24c02
       - items:
           - enum:
+              - belling,bl24c04a
               - giantec,gt24c04a
               - onnn,cat24c04
               - onnn,cat24c05
@@ -124,6 +125,7 @@ properties:
       - items:
           - enum:
               - belling,bl24c16a
+              - belling,bl24c16f
               - renesas,r1ex24016
           - const: atmel,24c16
       - items:
-- 
2.43.0


