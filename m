Return-Path: <linux-i2c+bounces-11986-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 601A0B0CA43
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 20:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89B33542E86
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 18:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B38E2E338B;
	Mon, 21 Jul 2025 18:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2W4kIKC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B082E2EE8;
	Mon, 21 Jul 2025 18:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753121254; cv=none; b=a9oxrZvR/V20rX2frfAy9AEWUXaJaOUKr46kXQCrxX/epA5FejJbn9wRFSHZsIoFPuJvlIIzwZmgWNqd6ZAy4VyogIMIyyvVP2VELdGrRtaBPCTZJhCnk7aNLlUTMy7GZ3AGZH5pglIBj/TJdAZCkkxt2yOfV0YqxZ9yYNHNEfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753121254; c=relaxed/simple;
	bh=BSuIwfO/sLgzwibvy1RfgHreC06I7Shn1XmjuLDFRyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FaFSWk5FVYKrPUXQQyBh+wvfu/GjZnA1z8vdoG4X2yh+kMcjQEJv7w2SffAcpUJUPcrh1dn8Sz+6iVbnRymTxwQpU7WnojwAjCxk/n6S9HHflJAeNRyY69PZCO6rcgQHaTQusyijabjNn3fliapywVpKGnmc3Y9YyxeER0azEGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2W4kIKC; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so2350591f8f.0;
        Mon, 21 Jul 2025 11:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753121251; x=1753726051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ic0V3M7sRH2Zp1RRAt0YlGJ6GUFWs58JzWsEOf9cIOU=;
        b=i2W4kIKCqK6MatCRfI/g9Wevmrb1kbsQE7wDbbnB+9eXnHBy7iB3SoyS5A1ZttCWVn
         wYGQdJhtUV4K6MS6PX7k3YCIykfxC+2erBZmw0GfH2Z58iBwdj/0VlA34EQzBbODHq+r
         BZfeuMur7k4pzsDZYxpZeIyaqv5RZykSon5gZt+3I8yw58AVFMt9wy1avuPv6LIKfQf4
         TKCp6x+khq5En6stK040mOzzUEwoaUdmtTp4LyyKp0K07bcoB1SogdLDghp0Vl4RD91B
         E8HBROAkvL3zSzzQt70cEOhIoYxTleZ/cfBYg0tf17Xuwz+30+tJkuzG8zxtNG/TLU4R
         ZNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753121251; x=1753726051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ic0V3M7sRH2Zp1RRAt0YlGJ6GUFWs58JzWsEOf9cIOU=;
        b=VqQL0ZO6mJhAVKAwZIyK+59bo1dVRl39MoY/oOJPro+8eWvDvfzOGSHkWgcWS45BCR
         BzNhgu2VPQmPdDETOrPYXsniGEoP//zrPch0YCB8G9kZJHJo+SOSojW+XcMazD2cfrRw
         4Ex8QSUNb1Z0bIj2m+oOO/N7Kunc2pB3MociSLxbXNgeujv5ZjwEwzZH9JRxZB1LSFz3
         ZWWw27V+0czuOfQKVkSQ4zzUsJiAFULuxFHQCltZzO7oCE8KdQe6YsC6lBPHluV58Giq
         PkON9d9l43OdqteMxp1WTqEFTcXb9/+R2ZYLQbLwhv46TB2lb5zuCzwQmH7sTMhPHos+
         NPnw==
X-Forwarded-Encrypted: i=1; AJvYcCU9LJFGfeSBn5iWNlyghMnbY83oWfvLC5U3aA/8hwPjZ418SMKR6n6n7nRLInebZgqEwKDwEgNNEqog@vger.kernel.org, AJvYcCX8s67eiYtoMm7gQQNhFtOjOVOVPzLB3wgdPhStA4EzjQ9Clt+SDBZFQCjzPLCr6F95pla73aQnu+PX@vger.kernel.org, AJvYcCXpfqoDqKhABw8c6OYJxQdHrOx7eW6eiAyVfx2DM5ZNWA8KDIzYrrYhq6CE97s2MzmWD2F8fxOQWsPiIB4v@vger.kernel.org
X-Gm-Message-State: AOJu0YxqGTJ9kmHHNfKWsm51YYgsWlySS7I1OWVgGwVWtiJM0eYEfLNH
	pBkKgdJJXT+oW/O3Vg/u7HSKfFfbfGbhlkvTMwUfjQgzfwRt9Hp3gSwQ
X-Gm-Gg: ASbGncvaBz4/M+sblyLx1ZKnlyCQu7riaBcwSMp6lmJrxK7Dpx/Xh10GhsXvVSGwuoI
	wb7ntNL6rg8n0sIRLoXfxpfSALCMMv7uWAEo8fcTy6gdS5REBlxBO9a+SC+FQQfmMwpSDMucKrX
	H7TDBrxoeFuoVvOs0M2qkdKBZWl53foSgCH70OTsfkqmZcEBh4ObB7zioI8kLpWwsc+cevswq9+
	VXtSMdD2vWMmweXHLiovGXV8h//iJuI4+qGek+DfwhsqvTNlLtZD17fWwI1eMryUsORc4InXcLH
	fS5SrrhJbW8N+TpWatnIza/4e6is/TJkzXRJYIUanus3xH3Nwy4MFbBPxLDRT60ewmQjeKKKNpQ
	WF2SJrGXUlxA5926MzisJ7BY=
X-Google-Smtp-Source: AGHT+IEztSiq1VvfDAe7vlwj5FXCH2q3wnt65o36wdrhDBUN+Og6tmvcBZ2eJisaFxgmoXC6DUiqQg==
X-Received: by 2002:a05:6000:2310:b0:3b5:e7f4:74ee with SMTP id ffacd0b85a97d-3b60dd6a8f8mr18711660f8f.16.1753121251425;
        Mon, 21 Jul 2025 11:07:31 -0700 (PDT)
Received: from Ansuel-XPS24 ([109.52.136.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca25443sm11183370f8f.9.2025.07.21.11.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:07:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 3/5] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Mon, 21 Jul 2025 20:05:54 +0200
Message-ID: <20250721180710.2116-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250721180710.2116-1-ansuelsmth@gmail.com>
References: <20250721180710.2116-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha SoC implement the same Mediatek logic for I2C bus with the only
difference of not having a dedicated reset line to reset it.

Add a dedicated compatible for the Airoha AN7581 SoC and reject the
unsupported property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/i2c/mediatek,mt7621-i2c.yaml          | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..8223fbc74f14 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    enum:
+      - airoha,an7581-i2c
+      - mediatek,mt7621-i2c
 
   reg:
     maxItems: 1
@@ -38,6 +40,16 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: airoha,an7581-i2c
+then:
+  properties:
+    resets: false
+    reset-names: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.50.0


