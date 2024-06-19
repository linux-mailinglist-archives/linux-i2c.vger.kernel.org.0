Return-Path: <linux-i2c+bounces-4105-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB10090E470
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 09:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24B43B244FB
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 07:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C910E13DDAE;
	Wed, 19 Jun 2024 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="N0hK8mvH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6FA136664;
	Wed, 19 Jun 2024 07:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718781814; cv=none; b=RHMBAe3hi/kz9S+s6baW4RHMnfRcTgu9OMeHRvFK6x3LyxxTv1nj80upZfPAEXsyLMWNgDz0Yvs7GjmLFCxOaE4d+l4EJlQzhrpeFZGfvJTLyV7Ozfmx5upJyDs05Cyw2omv8oRdf5ZO29rQfumxvDomo465fj1TeTPvnIJwCcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718781814; c=relaxed/simple;
	bh=p1887b9iD5BlnBSAk0HwLOV/I/hhD4A89kd/poNXHMY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PnbaSOOp3YT+sYhXvpv6s/3uqHyopvpqbJZK9OUwHb15mAKUmP3wrt0le0eA/u2esoHduey2GoFJg8i4Uc9WeUsSgONxBIyAefR79CFrKIjNoDGP1ShggosFdCAKWAPid8vUtFonprGqdcB/tNWCyx4RZ2MnRkJ1UyFq0eModsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=N0hK8mvH; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718781812; x=1750317812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p1887b9iD5BlnBSAk0HwLOV/I/hhD4A89kd/poNXHMY=;
  b=N0hK8mvHL5CjWY6XrYRkZo7uq/APkdirmevYUzVbzEPRXMc7sF6QrOLP
   QaAQoBtEn3VvhGKxqdutNIV2oJQEXfwSesoncU84/veseqoeP/1KFiTR4
   +H6c/a7NV2R7cfDZrWvb1epuvF/6VaJ9CmBzT/OcQ6Lp36xUWwXpN+kDj
   VJNtrFyF8O3VKxEh3g68f3eDQ3YG5dzXR4hdHuldnsMRm1mb4aXyR0+GG
   TSq8v0fOO5Q0J+tp8AZz3H7vxyjEbzRMZmzbBTk8Mag5VckqxqknNSeMH
   gGDBW9IL+eIQnlstiXf8i/2peZnNFsg54YFf7aQOpU9UzKJJ57HVVnuDG
   g==;
X-CSE-ConnectionGUID: HPQiKEpwSfeQRjMG7YWokQ==
X-CSE-MsgGUID: i/IVfxG/SvC9fIX3Tzf8CA==
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="30691781"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2024 00:23:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 19 Jun 2024 00:23:08 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 19 Jun 2024 00:23:05 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <brgl@bgdev.pl>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Andrei Simion <andrei.simion@microchip.com>
Subject: [PATCH 3/3] dt-bindings: eeprom: at24: Add at24,mac02e4 and at24,mac02e6
Date: Wed, 19 Jun 2024 10:22:31 +0300
Message-ID: <20240619072231.6876-4-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619072231.6876-1-andrei.simion@microchip.com>
References: <20240619072231.6876-1-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update regex check and add pattern to match both EEPROMs.

Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 3c36cd0510de..46daa662f6e7 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -18,7 +18,7 @@ select:
   properties:
     compatible:
       contains:
-        pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
+        pattern: "^atmel,(24(c|cs|mac)[0-9]+[a-z0-9]*|spd)$"
   required:
     - compatible
 
@@ -37,8 +37,8 @@ properties:
       - allOf:
           - minItems: 1
             items:
-              - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|lc|mac)[0-9]+|spd)$"
-              - pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
+              - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|lc|mac)[0-9]+[a-z0-9]*|spd)$"
+              - pattern: "^atmel,(24(c|cs|mac)[0-9]+[a-z0-9]*|spd)$"
           - oneOf:
               - items:
                   pattern: c00$
@@ -54,6 +54,10 @@ properties:
                   pattern: mac402$
               - items:
                   pattern: mac602$
+              - items:
+                  pattern: mac02e4$
+              - items:
+                  pattern: mac02e6$
               - items:
                   pattern: c04$
               - items:
-- 
2.34.1


