Return-Path: <linux-i2c+bounces-3699-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0C08D32C1
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 11:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C229283123
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 09:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD36C16A386;
	Wed, 29 May 2024 09:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ufpv6dxm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7566E169AD1;
	Wed, 29 May 2024 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974273; cv=none; b=gKktC9yotmd1o+hoOTI9AnZf+KUhexKBR8JiLDK5L+ZqJl59MUqR6tRY3u/9m95t8ZqF0xWVbKMxF0TGWBOsBTB2s+Lz/39rHMMygjm3GHsENu5bdS//PMq4jFz+Mjd6murTRKC72Yf/D39xelE5fosOrESuqDsjxtfOgeYG2SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974273; c=relaxed/simple;
	bh=l2cYH5DO9BxfSbaKKQ7q+5RKiD4WnwLONqPtXAYMNsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=my5cji6GKCrxuc3TtnvxvkOOB+tUEeMqHBXY/8Fmj/leQng7no2js9MNpjPiItZOMWIeyNonVKuLeL8AtbPFqXOsRWQRiUpMKFE8MYa7IMAjP5wLbPy9+N4mNKiPsaqH+zel+BPCS4cYR1CuS3FdGXYZnKL3OIlW3Q7v1z6zPoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ufpv6dxm; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 2492C40002;
	Wed, 29 May 2024 09:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716974263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F+Uj9V8vQpSPX6d1BoZ2cs5q7owsR97LnfY1SKzEsDs=;
	b=Ufpv6dxma+VCHd8mqMdUizaOu0z8teZYax62fxwy0HYRdbmZr0GfZC41HuJSNSq9xG4+Qf
	CH6a4lIpRbFrD5knztVwqBVpv3D44jvzAb69SMB/Ucm21Yi0s6kmzBMqDckPy5kwK0aE2O
	NKeE2E7LG63r+iaLzkERzXolnf5zFSGea+1APzCfBkpD6BdcvzEynhFbLDb9fg++9cIxtc
	07i9mkagUn2sMQ5489YE33UjCvBH+NXR86GZB9OjtV/EveAnR9jZrZ1Au5h4CxwZM+qxgC
	xlKHwCYGr5YYIVRhuvK5HFPrlz7TCFMFePvLCkCkM1TSqwfh8TWBq4WWv+fkXA==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Peter Rosin <peda@axentia.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH v2 1/3] dt-bindings: i2c: gpio: Add 'transition-delay-us' property
Date: Wed, 29 May 2024 11:17:37 +0200
Message-ID: <20240529091739.10808-2-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240529091739.10808-1-bastien.curutchet@bootlin.com>
References: <20240529091739.10808-1-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

I2C MUXes described by the i2c-gpio-mux sometimes need a significant
amount of time to switch from a bus to another. When a new bus is
selected, the first I2C transfer can fail if it occurs too early. There
is no way to describe this transition delay that has to be waited before
starting the first I2C transfer.

Add a 'transition-delay-us' property that indicates the delay to be
respected before doing the first i2c transfer.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
index f34cc7ad5a00..20d72c3e1e10 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
@@ -57,6 +57,9 @@ properties:
       last value used.
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  transition-delay-us:
+    description: Delay to wait before doing any transfer when a new bus gets selected.
+
 allOf:
   - $ref: i2c-mux.yaml
 
-- 
2.44.0


