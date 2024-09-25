Return-Path: <linux-i2c+bounces-7001-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB799868E3
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 00:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66FD528219C
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 22:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6831714B3;
	Wed, 25 Sep 2024 22:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="CbcVFJ+T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CB315A87A
	for <linux-i2c@vger.kernel.org>; Wed, 25 Sep 2024 22:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727301613; cv=none; b=dqhRwys+Y3mIwLYkV7Fhsm03zGC4Iq8AZ1fSddqQdGk9VP0EHCW0NTABgIJVMutWsLkqw5czfMO7OWdotQCB6t5r740PJ6lzbSUFcPxZHioTlhiEaixs42PJtYyCdKJlHh/9c6qZlXxctl/Yo4n/r8n4q6ywkYxAjgOTj+Xxcg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727301613; c=relaxed/simple;
	bh=2ZYSqY3YIGLo7CuilsPs1sMc9iXpAcknGqjh1CS/kBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLMD6Z3/ccczbAEn0pkr239bu3hroz7i7zcSqmji+UCcnyDVmGmi6pn/wIiZiuPooXF6N/XO0/jhqKkS0HDmEl/PkvpPlwi9VAuqZASnuIavPFOdteFGdA/RZ8X4Ukhauvf8K5OiCbP9g1cPXQXNSD8VvnBc1li2SOdFkhqgXR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=CbcVFJ+T; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 769CA2C01C6;
	Thu, 26 Sep 2024 10:00:02 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727301602;
	bh=STYkyKa8X2kiOpfc1gaS05ML/Z5qdUmGOlnZJgX7SUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CbcVFJ+TK7MQAn/2ctkhAW+sFRohopNQ7ouJl3JorsIyPW8vYJiBIfG5Szz7bV2j1
	 dx1LYi+uoS9irYlI+z5GhUJm2jFExqvel6+lJ0tVs+eFrfh3jm3uZcVmiMUT5ar7RT
	 xKhQkGphoUUOl0SX7ev9fB96jk0NacFso0C6JHAJNTYL89d+psS5IXKXe+bj2kcyKq
	 Iky3vRXyJHkMqp1H87a4LEqvXPYv2LsJembHuYuTXuly6ECETfMy5TKRegc9zvs2w3
	 o7XyDJFZ6/Vk68DXqu6Ag4YjzAAbOyF+LbsRC/JcyP0VTO893HX9pLtgby0sDs5wgw
	 u3Jhd9b44d3fw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f487e20001>; Thu, 26 Sep 2024 10:00:02 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 0C28913EE56;
	Thu, 26 Sep 2024 10:00:02 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 09B5028044A; Thu, 26 Sep 2024 10:00:02 +1200 (NZST)
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
Subject: [PATCH v5 1/6] dt-bindings: reset: syscon-reboot: Add reg property
Date: Thu, 26 Sep 2024 09:58:42 +1200
Message-ID: <20240925215847.3594898-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925215847.3594898-1-chris.packham@alliedtelesis.co.nz>
References: <20240925215847.3594898-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f487e2 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=8QneSPuuVenq9H3OMoEA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The syscon-reboot binding used 'offset' for historical reasons. Having a
reg property is appropriate when these nodes are children of a MMIO bus.
Add a reg property and modify the constraints so that one of 'reg' or
'offset' is expected.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
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
2.46.2


