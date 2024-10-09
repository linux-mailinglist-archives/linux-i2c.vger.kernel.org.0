Return-Path: <linux-i2c+bounces-7287-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E404699671E
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 12:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2164F1C2271D
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 10:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6058A19049B;
	Wed,  9 Oct 2024 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QJdb+oUp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2669818E76E;
	Wed,  9 Oct 2024 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469421; cv=none; b=KToHsWT1hOPCg2twzUU9xRJo0i81WWa+orWfZm9ZC+oEWZHGlUiz3IbGg6YmuTVIIKQSGpqjrm9Fsy3cgU8V6Jju6a76BZB7fFSLZAbwQ5OZvCAyr2D2buFWlG3jcEwgIVoJ8DfmPSvh3E+PfpJKl67uuDrG+qGx9d9lR15wDEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469421; c=relaxed/simple;
	bh=BsPvupA8qNH3O5GjZQoZ0xKLNEBQPI09j/+PzdRqiWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GY1x1LUYXMEXlzCNd+iFlan3JMBYxehjm2W6uiRP3xxm6l8lwABseOC4THPyvH17Bvv25cZPBivB+mN0KlMv6tCqlNrPmPT0wiigZ4FKSNtH9GnfXZ/FTBaj/cUjR1Enfdi2jOyI0R/NDSSPLYHM55i/gBnTBMzD2WVWEe1YFPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QJdb+oUp; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43984C000B;
	Wed,  9 Oct 2024 10:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728469410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ykpyCvhbG4GX53O/kYa1itG9c8NJMGXkUeCkiHCbXvk=;
	b=QJdb+oUpgnOdxhkgszUGcd9LFYP1TkF00gHZb93gY0DTgQ5CJZsDkoefRa7k3RA5O/93zT
	kqyJjtCuvSUx1/+GGq5j4Mkc4KwTdVbh6uFfR9kbUHNUFn97q4e6CJ0CiXRA1/hwcSJasy
	0XjStrs0cZh7LGX3tq8pkBKIrOe/XOdV1i/l8XswnMG4dZ0QZb9vljtivLLZP6+m0yFjrw
	jpG7TigaqMSVw+cc7vu7zlLrGHGFGvSg7Z888t2eL/uK/g347czAcqcraKau41niJCduWw
	x0OWpOClaYIRV8kJ2DEcSyUjE1uRkHUoLQFS5BzdRs2a92OKfNfGlQE0W5Zitg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 09 Oct 2024 12:23:28 +0200
Subject: [PATCH v2 2/6] dt-bindings: i2c: nomadik: support 400kHz <
 clock-frequency <= 3.4MHz
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241009-mbly-i2c-v2-2-ac9230a8dac5@bootlin.com>
References: <20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com>
In-Reply-To: <20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Hardware is not limited to 400kHz, its documentation does mention how to
configure it for high-speed (a specific Speed-Mode enum value and
a different bus rate clock divider register to be used).

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
index 7e84465c20094b799697a71a66c66d144d621f46..012402debfeb244b85dcecdc0411a77ada4494df 100644
--- a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
@@ -68,7 +68,7 @@ properties:
 
   clock-frequency:
     minimum: 1
-    maximum: 400000
+    maximum: 3400000
 
   mobileye,olb:
     $ref: /schemas/types.yaml#/definitions/phandle-array

-- 
2.46.2


