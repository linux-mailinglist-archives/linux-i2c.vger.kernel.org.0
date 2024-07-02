Return-Path: <linux-i2c+bounces-4574-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63578923BAD
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 12:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 978521C2349F
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 10:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9474215B0F4;
	Tue,  2 Jul 2024 10:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="LxI4jHQC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EDC158D98;
	Tue,  2 Jul 2024 10:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719916917; cv=none; b=dKJ3MFQPP4FxqTA0haKpUjRsFwE6WchOioblOhPWZyuA/UfVHBcDpEdmNPrfI8Kx8/ZQ4YuTN9pT82Z2nvVzVwOcUOkArJmZDEK/vGWBmVXm/COqMnQii07xU+I1tm9QZepCr5ox5vjF9nFhkh2Puz6d7xfDnPvOet58knJ+MEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719916917; c=relaxed/simple;
	bh=4yCJXGE+2S/GMSXwIsV31N8cJZ3mLudJr1hId2uxM54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T59Y5GkbcXbIq5vEdfr1wyNsbg8Q1YeFkalkk2ShO1Lo4HErEmrOb5/WQHDGmCDH1BsHycNzlQix+itdxqCCKc43KhAz/k4IfKXuFISxr5FCZK7yvDVWGd5yQpMET6YFulLyH9uuyFnYEnTS64hLLtPcWvI+O641kIU0NuXOrhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=fail smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=LxI4jHQC; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fris.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5AAAABFC0D;
	Tue,  2 Jul 2024 12:32:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1719916376; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0IEroQzFNTReRDzy5DgWCzMxhO8L1pDD2JVHObmjDGQ=;
	b=LxI4jHQCZLXZctWwNQH6p3GnIatktShezN7ouoVdhvxOgpTY5UgtC2gVnAtoK/eSS5+YNx
	nJ5MnnTDtNvv0qrUHgexcCGDN5UFCW2NNKwLr8hHUnf9ggHCSt5AnAzPlBn5+SUXYel8kp
	6P11zvJ6b5rdeRE2xC2R3ZKG2DI7dV8RewdXLVMbzOl8YWNmf+MPYT3FNgo2gWWO2IuiJV
	BMBaCROH5+yVgss7DgtZiJyeAIRB777ns06w/tHl1BcEE5C4A/z+hkooknWvOutc+se1ys
	XseBGEamEAI1cHC7InaG2x6OrjBdwi6dkAKUnh+Cq5r8Qds1fkCqXGEFBqKNjw==
From: Frieder Schrempf <frieder@fris.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Marek Vasut <marex@denx.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 2/7] dt-bindings: eeprom: at24: Add compatible for ONSemi N24S64B
Date: Tue,  2 Jul 2024 12:31:14 +0200
Message-ID: <20240702103155.321855-3-frieder@fris.de>
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

The ONSemi N24S64B is a 64 KBit serial EEPROM that is compatible
with atmel,24c64.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 9cca8ffa1712a..539e4684ce565 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -126,6 +126,9 @@ properties:
       - items:
           - const: giantec,gt24c32a
           - const: atmel,24c32
+      - items:
+          - const: onnn,n24s64b
+          - const: atmel,24c64
       - items:
           - enum:
               - renesas,r1ex24128
-- 
2.45.2


