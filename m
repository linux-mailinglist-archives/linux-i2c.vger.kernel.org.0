Return-Path: <linux-i2c+bounces-7460-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3819A2C5A
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 20:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 406521C21761
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 18:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED0A20103D;
	Thu, 17 Oct 2024 18:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="EAvhQUkC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A40618133F;
	Thu, 17 Oct 2024 18:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729190538; cv=none; b=BSfNPUboxK/kCfIxSM/kkWHcF4/Cess2p81lqqW96vEkF17IhJBxULlEGpF3PkE42FBQEIyCxVhOOcXj91SQNCkoOV4UJjLsOMoJ5tyC3mL0FxEKPOmLnh3f3pr6dJlg/g1ZG+x0T1IY8a+N4bp5j/a6rFoaQtt9+9GUsuUrRE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729190538; c=relaxed/simple;
	bh=7kfG4WB6D3uozcfZ/sZuNMDvfoiOu+DKiplbNuRJ91k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lIR1sa2B5QNkcftF0e/+eCDFWXYKvUXIppSOePuK07BK4Ub0+uLJZNs+MpHs9TUy7CNyY23mOMnT/Mu2+iTYg6CdFPUtHX4l89Fg1sbnfM00OsfH1oFaU3tbsApHQhF3mOjc9RwgHnAxY7py2oZbwQHapCPYbGkWbv0CrK3g2ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=EAvhQUkC; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6CC6A88D5B;
	Thu, 17 Oct 2024 20:42:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729190530;
	bh=XAphFOkiYS07BlQDtmZ6qa+YhaWjPlC8eH25+ZVOX4k=;
	h=From:To:Cc:Subject:Date:From;
	b=EAvhQUkCx13IjE0a06fOVjd8blAyJMOGDEv/theN/1hvHTW5eEIyLcfXvO5EPngDp
	 rXxPjvbWC56hUdBRzdwX+49kmkWhIjMEEjfGupW2T9fC5eLPuFSjEnRMd1185BtF8r
	 rVwh+IZ6B4MgiY6VP1BWvgzMzJ+xbvnLOD5PLmZUKtD+zo/XSmXA1jLo8CyseuEyYH
	 F3lOFtC4U8KATd8GxYCD72Lj51VtQQOI68lXrCWeNO2y3CWF8qbtoB777B2ya2Q5zb
	 HNZ32n1dVX7DSQD7QWHwSuBrvT7oXLKYNlk75Q6e/MCskZmzLM0CCY/8tk/2foIoz2
	 3GQN8b6aLSnbQ==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com
Subject: [PATCH 1/2] dt-bindings: at24: add ST M24256E Additional Write lockable page support
Date: Thu, 17 Oct 2024 20:41:25 +0200
Message-ID: <20241017184152.128395-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The ST M24256E behaves as a regular M24C256, except for the E variant
which uses up another I2C address for Additional Write lockable page.
This page is 64 Bytes long and can contain additional data. Add entry
for it, so users can describe that page in DT. Note that users still
have to describe the main M24C256 area separately as that is on separate
I2C address from this page.

Unlike M24C32-D and M24C64-D, this part is specifically ST and does not
have any comparable M24* counterparts from other vendors, hence the st,
vendor prefix. Furthermore, the part name is M24256E without C between
the 24 and 256, this is not a typo. Finally, there is M24C256-D part,
which does contain 32 Bytes long Additional Write lockable page, which
is a different part and not supported by this patch.

Datasheet: https://www.st.com/resource/en/datasheet/m24256e-f.pdf

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-i2c@vger.kernel.org
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index b6239ec3512b3..590ba0ef5fa26 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -141,6 +141,8 @@ properties:
           - const: microchip,24aa025e48
       - items:
           - const: microchip,24aa025e64
+      - items:
+          - const: st,24256e-wl
       - pattern: '^atmel,24c(32|64)d-wl$' # Actual vendor is st
 
   label:
-- 
2.45.2


