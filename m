Return-Path: <linux-i2c+bounces-6634-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF9997705E
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 423A5B2100A
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6071C0DFB;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAwr0nJH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561D01898F9;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165215; cv=none; b=LYIcHykWciJTMZvGoE8f76DkXn+AEC0F548FKZI8DNP5mhdW91RTpOK7hsTwu0PDn2dthNHNodbz8q8M/JyEs7tdH2mkMkIKrHBIcRpmlz+niiV4fmnXwqOCqHo0+ycbbMOcBs59C9zeq1QIONv9dioP2k6uRpWzsGgkRi/1cUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165215; c=relaxed/simple;
	bh=v/JKn3gZXUVsA3y1aAYS1Zs+qQ+FmLETkgfXkSxZq4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dpi5rQVhsSiLVVj5jHHsp5VN6br/PPJLDmWd5mervYASMcujUxXjlcX4tCdQS9zvmFqNQMER/dybCBmBgx/9OzmpmD4wZ+4qHpl9DG9cB63xicaWnYuTNXqDhne21DW0oIStCpVlwHhPfSOBNa0+5ZiC9vN6caH6eJS0rhbmWD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAwr0nJH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDEFFC4CECF;
	Thu, 12 Sep 2024 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165215;
	bh=v/JKn3gZXUVsA3y1aAYS1Zs+qQ+FmLETkgfXkSxZq4w=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=lAwr0nJHscmkQPKJFkZwmbN3d58Z6g5GSxtJRwwW/TxBZFI1xAMWh2ov8FDk/XffI
	 RuDyKAj7NFEa7l3Eq4KoKeaArG8RnocBC91iGMguqeWKiH7h+MGeS249SfJcl1ge4G
	 Ygoi+ujwlnFX0CV6wkda4ppVAyasryIb7y15YxCSpknniVcYTYcBSgnJCTNKF6S9dQ
	 RxL/Mk2iBvaeYc06sn9q4Y30+hpgPDsljUd/s7Ek6SBpVeOsY/vZY10/Dk9wJN/ipd
	 8kVmULd5wOQVinP8KQ2aMacAUtQAqZf4HYKwmAmquM10yyk1NjVCDR0j8HO3WOzZsH
	 tPTzaQ94s4ojA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFB1EED63F;
	Thu, 12 Sep 2024 18:20:14 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:24:48 +0100
Subject: [PATCH 03/21] dt-bindigs: arm64: adi,sc598 bindings
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-3-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
In-Reply-To: <20240912-test-v1-0-458fa57c8ccf@analog.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Utsav Agarwal <Utsav.Agarwal@analog.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-serial@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, adsp-linux@analog.com, 
 Arturs Artamonovs <Arturs.Artamonovs@analog.com>, 
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=1844;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=Oi5xgxW+vpOrfKsaRdGPlzsPaJn9xUo9SU1Q4oMSXZ8=;
 b=n14btFQRrorCCXsLphS1xj8VeFGWTdUV7UquRTRapHFoqbQL0L1h3/qkuUAr68TwMJSpzM7OS
 oeNnb/6FXwVDmqU7DayurCAzLZ1F5Xt2iNmuE/jKV0Ixq7kYAB18b49
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Bindigs for ADI ADSP-SC5xx reset controller

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Co-developed-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
Signed-off-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 .../bindings/soc/adi/adi,reset-controller.yaml     | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/adi/adi,reset-controller.yaml b/Documentation/devicetree/bindings/soc/adi/adi,reset-controller.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7a6df1cfb709d818d5e3dbcd202938d6aaaaaa9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/adi/adi,reset-controller.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/adi/adi,reset-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices Reset Controller for SC5XX processor family
+
+maintainers:
+  - Arturs Artamonovs <arturs.artamonovs@analog.com>
+  - Utsav Agarwal <Utsav.Agarwal@analog.com>
+
+description: |
+  SHARC and ARM core reset control unit for starting/stopping/resetting
+  processors
+
+properties:
+  compatible:
+    enum:
+      - adi,reset-controller
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    rcu: rcu@3108c000 {
+      compatible = "adi,reset-controller";
+      reg = <0x3108c000 0x1000>;
+      status = "okay";
+    };
+

-- 
2.25.1



