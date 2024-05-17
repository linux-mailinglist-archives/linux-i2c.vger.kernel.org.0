Return-Path: <linux-i2c+bounces-3550-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 441408C830A
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 11:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75DC51C224F8
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 09:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE9C22324;
	Fri, 17 May 2024 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RoDudsoI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F761EB36;
	Fri, 17 May 2024 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715937024; cv=none; b=E3Zt7J9up5qJ13VDYLtCP7Vr+4PGiUmXP2kWJTdHSGTm3e39vz2CQfyvnjYB0zzDVcbSHjZoo+k90AZxi2LYCMedSVp/xLkR2MOuNTQ4MBLwJ+WEeKeaaruhfQTBTXtx8m+RTLOF4HJp4jDSNgwZeiPO0P3SOo6gp8Alqom3rGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715937024; c=relaxed/simple;
	bh=ouKIBpi5DYo1XABOvnKixxJKfzciW99XiYkqpTOzoHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBgSAZRIkOQ36wYV101wxZZCu4nwntgiD9BlanVGQcrlSXMN3WFx39G3Qoe+wzBK8a//bYvgXVXqveN92oYW9UnKUmbZf2s1PAJwlHvtkQO9NHBI+M7e5mBEiJI1kgd00Ohkax1iSsDTZ1I0b5na6Lj7dNFrIg9eJ9G50Ujcijg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RoDudsoI; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9411620002;
	Fri, 17 May 2024 09:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715937014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pq7XQqi3/Cq4U6P2JcpzcOtiqC8L/GBHpBIFcU2OyKc=;
	b=RoDudsoI7xov79JDbeurmxUGeYsvpgvRxon//txTj24ZV2L0u4uzM1nR5+Y5Iiqqih6Ko8
	vqNiDTGAqptva1IncZcFl4S+k6TyYzy95kbSq7TrqOiwCmpW5whLqjub6viKuiRbpLrOIv
	6f1KeBJC42jK1kcPbMmO6d6ZZTMZPdbBAzoc9kGAFdPULscbEzGsvUKTrpZKEx2Ezw7kGg
	uWh6GLX/Psx1ZRiu3cIobHPZB/LVKqYQWbS7QBrTccXQOlZW/2/TmCK04OqAnnipXy3ebG
	kVUQTwM777C6oFcW3H+newyr1fjdd9eQVSF4iEu7dnE5HE/Ozxlhk0fUuHBYcA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Fri, 17 May 2024 11:09:53 +0200
Subject: [PATCH v2 1/3] dt-bindings: i2c: dw: Document compatible
 thead,th1520-i2c
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240517-i2c-th1520-v2-1-d364d135ccc6@bootlin.com>
References: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com>
In-Reply-To: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Drew Fustini <dfustini@tenstorrent.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: thomas.bonnefille@bootlin.com

Add documentation for compatible string thead,th1520-i2c which can be
used specifically for the TH1520 SoC.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index d9293c57f573..60035a787e5c 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -33,6 +33,10 @@ properties:
           - const: snps,designware-i2c
       - description: Baikal-T1 SoC System I2C controller
         const: baikal,bt1-sys-i2c
+      - description: T-HEAD TH1520 SoCs I2C controller
+        items:
+          - const: thead,th1520-i2c
+          - const: snps,designware-i2c
 
   reg:
     minItems: 1

-- 
2.45.1


