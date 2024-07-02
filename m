Return-Path: <linux-i2c+bounces-4573-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B68923BA9
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 12:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB9191C23182
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 10:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA1F15A851;
	Tue,  2 Jul 2024 10:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="TTXZ54J9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E8E158D64;
	Tue,  2 Jul 2024 10:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719916916; cv=none; b=lCL1xF/ZBaZ/AQS7NgrQH4kDZ1rvq5eK4vDOgh2CP2AAWcmE2OkDZajEN8ofczXarUM5LEoNLGdD6xoT4xF2BCH66ak4u+B3N5nPI4n1cctisI9jRbi/+2jVvkiyRvonjoClnBi5zXOe9JsasvdXUyJbb1zJ1taKZaZD/nkSBw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719916916; c=relaxed/simple;
	bh=r1H6uRKM26udQh3W7goctzd5nYWNJI64Mhor3DW4BhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJ2u6/Alyik93rZKObxGa78UOSH791PuzwP6T8yq/MCWhRXok2d+jvr0bRUeiDfO8vDwg95gT2WQ8OhU9olF3pKOSezAuoeNQflM+kAVYTOEgATDsSsQqgvdaVigp22Sg7he5UB2d+k29pR4S021n0NoScX1K94QezrKyzSnutY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=fail smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=TTXZ54J9; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fris.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8920BFC0A;
	Tue,  2 Jul 2024 12:32:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1719916375; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=AmHiFJOEgMWYiv7VLebMdr2+RFr3oXP0l5HAfugPv+I=;
	b=TTXZ54J9WDsjlmzJq0NoYEtnwnzZOF2ne57Wmzja56JbMygHLFkx+Al7/x7nX3+HXPyveW
	idTVYiDueqlpJ4koJExPV47UFmu9uJx0Kn6X3CHUvMzz+7I06mIY8uMeOmJ/DeeQDJ2wcX
	LHk8G5Ktd7kzJknNgv9DtXILdir/zB/POf0Ljqyj5fla/KlLlWQ/lAJvsyEH5XHDg4HJjT
	KMwvl491FQvfBwgAnQWYOCgzMcLUnqsNgxbG5GPIMl2wNJKa0SJjDrMtnq8iiqgpOFC4ei
	C8saH7XfhUbvAoALMfxVRcLPd8bQY4YpEzMpwPFMmGTliZlZx3y+gu8Mp7SJsw==
From: Frieder Schrempf <frieder@fris.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Marek Vasut <marex@denx.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 1/7] dt-bindings: eeprom: at24: Move compatible for Belling BL24C16A to proper place
Date: Tue,  2 Jul 2024 12:31:13 +0200
Message-ID: <20240702103155.321855-2-frieder@fris.de>
In-Reply-To: <20240702103155.321855-1-frieder@fris.de>
References: <20240702103155.321855-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Merge the compatibles for the 24c16 types into a single list.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 3c36cd0510de8..9cca8ffa1712a 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -102,9 +102,6 @@ properties:
                   pattern: spd$
       # These are special cases that don't conform to the above pattern.
       # Each requires a standard at24 model as fallback.
-      - items:
-          - const: belling,bl24c16a
-          - const: atmel,24c16
       - items:
           - enum:
               - rohm,br24g01
@@ -122,7 +119,9 @@ properties:
               - rohm,br24g04
           - const: atmel,24c04
       - items:
-          - const: renesas,r1ex24016
+          - enum:
+              - belling,bl24c16a
+              - renesas,r1ex24016
           - const: atmel,24c16
       - items:
           - const: giantec,gt24c32a
-- 
2.45.2


