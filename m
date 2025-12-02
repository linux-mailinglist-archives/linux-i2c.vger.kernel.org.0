Return-Path: <linux-i2c+bounces-14354-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D6DC9A0A3
	for <lists+linux-i2c@lfdr.de>; Tue, 02 Dec 2025 05:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7BC93A5034
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Dec 2025 04:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B5F2F7459;
	Tue,  2 Dec 2025 04:57:53 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.naobsd.org (sakura.naobsd.org [160.16.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F7B2F6908;
	Tue,  2 Dec 2025 04:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.16.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764651473; cv=none; b=OUBKy2eZns8J/Hghjl5a7M4gFODeb/zdDZlb59RJo9sZ9RygevgwYwBtNLE7azu8NV0dqPR3pVFoRQmO0U6p00bVezXWex1kzymU8LhQbTDfXkUC7Yx7SdjEDowGUWV56kNvW2bNSMCMqvK1UU7eZTdHR68rNSd4hC0DMbpCHzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764651473; c=relaxed/simple;
	bh=mkWbmksJy2F4LzApqKW/kGnfIoYKHcjv+KNBHCHK4zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GYqDPPwRK+E1J4gw487wJgmW4Z3Tn3l31fxw8oSt7Qw6trCsDlrtt/LXnrivdfxzI9JriWOKyDrjPH/7yLLwG8L8t3u04NYwmzLw0f/XrESb10c3dl8C95pQbV7hldyfuAGhqiva7dscIseClt3H7OQW/+FVgkydovofTC47RKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=radxa.com; spf=fail smtp.mailfrom=radxa.com; arc=none smtp.client-ip=160.16.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=radxa.com
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 5B24uxmH007827;
	Tue, 2 Dec 2025 13:57:02 +0900
From: FUKAUMI Naoki <naoki@radxa.com>
To: heiko@sntech.de
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        dsimic@manjaro.org, didi.debian@cknow.org, wens@kernel.org,
        nicolas.frattaroli@collabora.com, detlev.casanova@collabora.com,
        stephen@radxa.com, sebastian.reichel@collabora.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: [PATCH 2/4] dt-bindings: eeprom: at24: Add compatible for Belling BL24C16F
Date: Tue,  2 Dec 2025 04:56:53 +0000
Message-ID: <20251202045655.154543-3-naoki@radxa.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202045655.154543-1-naoki@radxa.com>
References: <20251202045655.154543-1-naoki@radxa.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for Belling BL24C16F 16Kb EEPROM.

Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 04892749f4ca..8f16fa2ba17a 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -125,6 +125,7 @@ properties:
       - items:
           - enum:
               - belling,bl24c16a
+              - belling,bl24c16f
               - renesas,r1ex24016
           - const: atmel,24c16
       - items:
-- 
2.43.0


