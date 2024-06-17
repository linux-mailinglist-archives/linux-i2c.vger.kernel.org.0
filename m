Return-Path: <linux-i2c+bounces-4060-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AC590AD9C
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 14:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 407822849AD
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 12:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FBF195397;
	Mon, 17 Jun 2024 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aLWYx4Wz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50307194AF1;
	Mon, 17 Jun 2024 12:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718626106; cv=none; b=VXWEwF4dN6m/DrsGNC9vAQIbrf5/TbhwC9OO3ts3zvWFNiRMFan5JIZbSGyAnpMt949dOup5/Lwqj28yFScx//e+qiM79/lm2UfeB5yvx5nANHvHe+sGk/X+Zgfq2XXcfVEcakwdeyHFB2WRP+wp0L0JT4rqMzr4RFjoUMEjpgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718626106; c=relaxed/simple;
	bh=UY1Iw0rvqx5zQz63sj8jJEEYKZwoD3UQTi+vP8BO7SA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jP05rBHHtIHSXUSeMsoAz8vqbZR7Knka1n6bjublESDMvg6S/qkY1f/MPIXyhVg+18xoHV+ZvhbFBHT2WqUMCRannxESh6AFscn+HhvVPpIdX399HToFZsc9kdwIV3zcfUf70ef0/lPzOLVdrv7NA9IiBDFrxhdAAUvsdcQB2ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aLWYx4Wz; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 23D354000D;
	Mon, 17 Jun 2024 12:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718626102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YLinVnUNOZtit/gGceqUFqQVwx/hRti2F9+Kbo6Qvmc=;
	b=aLWYx4Wzpmvk5RDQ2pljHQl5ku2JtkydyRQtx7Rxtx7Z+0t9P7r77x70RaygiFsfgk5s0+
	AsRTramofkMR9BrIeKwCw+jk0B5a3LOjWomGpkCn1bzl2+/YBaP+Nrc6YkJual2uJjl3gk
	CsYU6s9+HSxuN0nQ/9+t+vQLrWvwpH48zNH9lLPrdUiiA5v870Cj7YMpJ0E1pE36VYDUWJ
	i7dTfB/+CdaB4icQmSxBwo+8TfrlPoH3NQLLqJ2wZVDdy7ca7Mz7Nq9Oa+lCMrsxCq/lhg
	e1EKXi5w5awYuTWoZFcSd171yaMfPRTZSFuNGx4Js6iCfH7GIgWxWREDt3F9wA==
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
Subject: [PATCH v3 1/3] dt-bindings: i2c: gpio: Add 'settle-time-us' property
Date: Mon, 17 Jun 2024 14:08:16 +0200
Message-ID: <20240617120818.81237-2-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
References: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
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

Add a 'settle-time-us' property that indicates the delay to be
respected before doing the first i2c transfer.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
index f34cc7ad5a00..4a93d1f78f93 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
@@ -57,6 +57,9 @@ properties:
       last value used.
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  settle-time-us:
+    description: Delay to wait before doing any transfer when a new bus gets selected.
+
 allOf:
   - $ref: i2c-mux.yaml
 
-- 
2.45.0


