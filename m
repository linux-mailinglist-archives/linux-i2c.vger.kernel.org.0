Return-Path: <linux-i2c+bounces-14751-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CAECDA800
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 21:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD43A30D2686
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 20:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC9034FF51;
	Tue, 23 Dec 2025 20:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="JWd8YeUf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FB534D4C8
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 20:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521254; cv=none; b=dN3dVqR92OywdGw9NFzWswPPmMZYnRDWyCeqIB9YeolzwjTfCR2i24ik+yWdrdnF9ANzItDI14TR5NryMaxnLpCurxXHYAcozuchqBys0RGcv/mwZluAASkymfOMCjvps945El9rzkb5LYRd5dDeTPBiOWUwiLMzVpyVTD2dM2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521254; c=relaxed/simple;
	bh=zUvrtsolEdengocgVlyXQxoSJXOg4mGPqcC0PLdIbPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S4y6PWVNCFuzq0k6rlsthUX66I4dAlY7po0+QgczPmuQbs84GKkbTQtT37Q5cW7zjflGM0fBE5LTfDVveX+OQp3W44vS8VdErC71NcOBMu+/bKiRDOfHZgw4yKiSDgo9MHngz/4wxk3t7d8FidZNMEXmTKKByW7x+3pVUW0sZfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=JWd8YeUf; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so5735341b3a.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 12:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521251; x=1767126051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XldW6lxnsgyAezmPBHgoeGUpbHtzZudWE9rMzsQl4gQ=;
        b=JWd8YeUfcE2jxi4dlT6RjGrdeqZAThp66WLdnh1AdZbByRtMWbUC3/KQA3vOxoI7rQ
         Nej77PlWwyPaR0CweuAUAHdybLE+chQvK13KAx1PHCFCzP8dqOUX7DNszBLGLS3YPcje
         3obQGC21IXK8hIsdJaIVFWus/hPNRBL0nHrgv8Rk5tPmeAiEGaHpc8i+apiMSFebghNE
         0W0Qy8FfsEMkqnJOoL71GDcIZHE5UqsuPBST8EGPO7XAr1u45JqOy2YCVoY6QZ5iqEaC
         ghB9VRmSjvWVRdEspk9wiO4HaSDvwPHstMR28m2thH4fnj7e8ayv8KKHgpqopigvFmEG
         nQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521251; x=1767126051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XldW6lxnsgyAezmPBHgoeGUpbHtzZudWE9rMzsQl4gQ=;
        b=kIqiHjosjUescIcjPzGC6Oxza0SRO+TO5y3wfAgVP4B1Xh0jzetpIc473M1y+X417X
         ksJkL6RKJ6a2cVyvgIPtx4FhuP+fF7KOGjgrw+eQIWG27LIwvBTh787a7qVfyAKNeqc+
         C4Jtx1MlVxxxptVx9DRSd0AG69eBe61ZViHG4nZQVaB6UbSUFsxtdZbnIS98nLru46wc
         X2UoHNSkeBwaXybr+XWbiJEtaLEgomd6caqFcTJ4j558IVXRpeQ/JUok1n8zkJXwrkZE
         k3lLoJFgBOUb1YE8MI91EHQroqyQHZTkt9E3GBAv3niSO7Rgee5XcDj+jRGXoh8NRr1B
         1+xA==
X-Forwarded-Encrypted: i=1; AJvYcCVCWkUTJgVCDfZweYQjUX6YFbTIx2Ynm98jjjR8F9b+mdm1tOtUJoG38Equ6kb/TJ5GAyQe/Gy6Crw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYEjnSiG+M+pGWhOYYz6ceNkgu7wyBPa1ObxH7DcL1/toCwQoP
	mm4TD1qB362tAPuUrzM5Dc4GEqo5t2vtsT+zo+xhvM7JWe8V/JEnyEvOjpp52O3Da0c=
X-Gm-Gg: AY/fxX7OeWHUm6ahmdVb5Nos9c+wfXcb+3oxNywsnWe6W1XQPdnDJ8qHgMMAh5+DAaV
	fFUmFT2rwZV3ulIe4dqDTAcnet/VPiKLnoSUZFQWSGBZI5t2hd6g28ykBN7bMeio/Yh2TAoy4X2
	8xsEnSFN87xq+B+NQpqMOZPfTVgg8pJDB8bNpKC0KHEs2GkK26VO3BcG2ElbM7PBnEleTFTiIfB
	b5RMhXAtPYuRdtpq6jVvJMDkFmKoHCzckQNr1fh3UAt34xFzpn5qWYFBig/ZVCDkj40sIoyuBcu
	z1WZjiP6TpMFpmc6qbZCyIQVWFGe9WcTjUCb2TDzyeIys3P33xxTXdd1Wj6tY8olBKUH4DobM5+
	QCgIGLv2yf7akJTZJWBY4v1lmT0WAZ5EvPkMTKx4+MAfo21b4Yh35MJ1yrjBGTzUL1WT9HEjT3T
	2mPQFUD6IiJwo2rfTio2gU0qv7qOPKA16sT42oyLf7PA3nCTs3N1TJ9b4NVfKB5Dwr81+t84VIf
	736sZBWBaJ+c3x80so=
X-Google-Smtp-Source: AGHT+IHKR6G1JkjZPbcb6JKFu1uGkQq63m4FpssJS+cOb3Ug/zNWJVDVvih5redVT4o6Tq4IHHU3Qw==
X-Received: by 2002:a05:6a20:2588:b0:366:14af:9bbf with SMTP id adf61e73a8af0-376ab2e77c7mr15535010637.73.1766521251186;
        Tue, 23 Dec 2025 12:20:51 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:50 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 08/15] dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
Date: Tue, 23 Dec 2025 21:16:19 +0100
Message-ID: <20251223201921.1332786-9-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Microchip LAN969x AES compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 .../devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
index 19010f90198a..f3b6af6baf15 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
@@ -16,6 +16,7 @@ properties:
       - const: atmel,at91sam9g46-aes
       - items:
           - enum:
+              - microchip,lan9691-aes
               - microchip,sam9x7-aes
               - microchip,sama7d65-aes
           - const: atmel,at91sam9g46-aes
-- 
2.52.0


