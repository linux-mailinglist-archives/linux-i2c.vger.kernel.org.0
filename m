Return-Path: <linux-i2c+bounces-7692-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6619B8406
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 21:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 456AE2811EC
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 20:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75441CBEA1;
	Thu, 31 Oct 2024 20:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="pVEtu7Bs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F28D1CB534
	for <linux-i2c@vger.kernel.org>; Thu, 31 Oct 2024 20:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730405046; cv=none; b=CBq1yrRdeRa5MlIhilScPon3cbD02qkL9MU3TfIH/HVEh/wNhnF0ST/+b+I2cOsXml1UT4y8GJH/deVueegSyLY4uwbSQdg71MSH0TXf7A/2N/kad/BhqfiDBhG6aSHJnKEiEizCoFyXRB74GkD1qXUWxm/NWdfCn+cBisM9GY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730405046; c=relaxed/simple;
	bh=oxlOHXy/denfO5p3Pp7cF24OqAIvdb02wMkJCUkMjAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taK8IavmfwIAuuJeDpFS7D4h1qIXSAyQKN9iX+ACcB3GPNcvn9a+06wa9eW/RwliiiFhdygWJ4uCyCy5GJ7SzFnSevtHvha9cypc1ckZVlwHG5Ud2+m4WtzPRCdVX+qp4Sri65vkurzCdlrGRzHODEBBiHFe7zAc89GE0KVjrSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=pVEtu7Bs; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 324912C035A;
	Fri,  1 Nov 2024 09:03:53 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1730405033;
	bh=yA1/Y3Q0NDnDtOb0Gv1EPhOsW+IFvRao4iC3GbjZTsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pVEtu7Bsmk4rc7snfZ3PzGxtgR6wnMpkAQX/5lKxzZbX9LARw2QnRpQuHKTpqt0U8
	 nyg4JRcv8aTlhjALNxtJOAwcpAo1WlUBDkJxZpYyMEzKNl2vnTUtJYoU1xwB8RW1JF
	 RfoeKzCpury7skHnp7I03YKOBh3egqkShkNh3SywDY9/fc4YO9OHenK81wkB4n98ah
	 uW4hEcK5miVzzcX+acJsxR5iw8KUX1gvrDSxdJ5ItH1eKo5RArIPZRFL5uMQ2tQM85
	 9fmxb5PSe71MReSxuklES/qIRtE3LXj/FS3Hurkjgml4vF5nmmBGCCPGkj98EzvBBV
	 so7oq2Z/ihhzA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6723e2a80001>; Fri, 01 Nov 2024 09:03:52 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id D5A2D13EE6D;
	Fri,  1 Nov 2024 09:03:52 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id CFCDF2800A5; Fri,  1 Nov 2024 09:03:52 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	sre@kernel.org,
	tsbogend@alpha.franken.de
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v8 1/7] dt-bindings: reset: syscon-reboot: Add reg property
Date: Fri,  1 Nov 2024 09:03:44 +1300
Message-ID: <20241031200350.274945-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031200350.274945-1-chris.packham@alliedtelesis.co.nz>
References: <20241031200350.274945-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=6723e2a8 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VlfZXiiP6vEA:10 a=KKAkSRfTAAAA:8 a=8QneSPuuVenq9H3OMoEA:9 a=3ZKOabzyN94A:10 a=cvBusfyB2V15izCimMoJ:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The syscon-reboot binding used 'offset' for historical reasons. Having a
reg property is appropriate when these nodes are children of a MMIO bus.
Add a reg property and modify the constraints so that one of 'reg' or
'offset' is expected.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
    Changes in v8:
    - None. This has been applied to by Sebastian, I've just kept it in t=
he
      series so that others can see the complete picutre
    Changes in v7:
    - None. This has been applied to by Sebastian, I've just kept it in t=
he
      series so that others can see the complete picutre
    Changes in v6:
    - Add r-by from Krzysztof
    Changes in v5:
    - New, suggested by Krzysztof

 .../bindings/power/reset/syscon-reboot.yaml           | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.=
yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
index 75061124d9a8..19d3093e6cd2 100644
--- a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
+++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
@@ -31,6 +31,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Offset in the register map for the reboot register (in =
bytes).
=20
+  reg:
+    maxItems: 1
+    description: Base address and size for the reboot register.
+
   regmap:
     $ref: /schemas/types.yaml#/definitions/phandle
     deprecated: true
@@ -45,9 +49,14 @@ properties:
   priority:
     default: 192
=20
+oneOf:
+  - required:
+      - offset
+  - required:
+      - reg
+
 required:
   - compatible
-  - offset
=20
 additionalProperties: false
=20
--=20
2.47.0


