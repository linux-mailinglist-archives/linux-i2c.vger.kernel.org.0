Return-Path: <linux-i2c+bounces-14753-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE51FCDA91D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 21:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 537CC301F17B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 20:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F9B355041;
	Tue, 23 Dec 2025 20:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="ojfFSlET"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671C7354AE0
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 20:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521273; cv=none; b=UP4NV3FQ0CJuR2vcL6VkKA9ql+hL7Sp7ZxyHQDBRA0Gm5324hpsnN2zIPuES1WNA2ZuumYq6jduXmpjjFbskIHMAB366jB8ws3v+4Hzi4Xstr+ky+irwcER22YIayx+4r4N+TijKOlZq2ppysQg7tRIXVLMtvbo2aoILR1wPe5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521273; c=relaxed/simple;
	bh=7jtkvldmPSo6tJBxZSibRZu5hmUTyLaiO8iQq/Sa4wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6GXclSmTMVOm+1ecHOjzEKZ3DfvW0tpFNwCzNstD7DjLOWCa3UUZXdeZtLK50isK53MKRFIIFtUDx8ssXlOnHKaJzjVFbbt2iJX6E6r8AVkH1gmy0BbUfODKcwPcQVtgN9U1SlqhnRiSZuLVWrwz2A1TmJyCVgUrAteCl/bcjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=ojfFSlET; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a1022dda33so44422105ad.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 12:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521269; x=1767126069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=;
        b=ojfFSlET0cv79OaTDF1oKOqUXItgurMOgYcFv8b26PVp6292pJdfQ79anRb5B1+0uZ
         crU6noIRI5hrwH6+UBj3tgm9TBiCgBtq1MFeUM+P/kFaGiC3sxHi5NwmveHrG+90Fq5o
         +fRaB9u1u9Ldhg65JUonooSLko3zOgChDlBBUota2eUoVVNbVpEE9ZJhAK4YnlT13kuZ
         E8AIksIE7PjEyyrs7wStSwLN6vio4NMCgjATLzIr7LsdS7PcEQ/s8WsI174oVmnIoh9i
         daQbQa+9rLjpjcUf7Tgx8EBLVVp9f44DfK0v7fmYSVhOHs9bQMd6l9J1qZdOOXgjmz0K
         NS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521269; x=1767126069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=;
        b=RdWL5OVEnDy9SZCqzIuRbCJtueXqFQ19kojo3F4BXBNK1tekLzltSG5DzbtFwhekrL
         35/cXzenQrs9Jy4fwt8Ffx7yyW9bA3iTrCSMmyR4SukpIRQsFz8+yKGGXZXp55dgoE/M
         akJ7Fbp72apcibJD/271EQ+9jVxuMi0REZ4tHIav0VXlLXbx7fa3MFXHRBYYUmKao+EO
         ZLxjO99VTEcpsr7F2vwzYarQyXDk3rqnawdPsPoaYVZWbdj57FMTdQUYH8jCw7Nn5aSE
         ceuuvmBew4Vg9XMtrlBInlZZYcmy14Xxdk598oynbz4QMtntQed7jVTdkjR8QhY/Va3S
         OqOg==
X-Forwarded-Encrypted: i=1; AJvYcCUf+cWzl0cHQJrf4Px48ujaScRohqIxLjvxbibU97nT49F9lS/AtD52gR1ky8j7nnHrUtfebDHrDvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsvLawUYBwrnyXm7CYib31ngRax1M4TRrvVidOT65OQ1GDq4xq
	pqNwEfWUP3qkBy1QKrrjeD/niRtq224cha1WNw6URu7jtbABr5FRBPyGdaGUHR9jeOY=
X-Gm-Gg: AY/fxX6Cwic3IV2bmtIQWHKncnlrbob9SVkzc8vruDtWt8ubLlTesOYLF4kyGERx2vr
	dgxOKXlaZaLlUMqVyW1IyK7dw5jIaEcVqPQzcNH0WLgq4Yah8dCTerSDUZH+8p0NLOaLQFQ9d4D
	8vZI2XZM6skA9kDQDi7NF4fgq4JLGLnKCMHtHMjeIrqXgqawEeXhKJ0gSukpEVAN/+a6BhWKFGC
	NcLFVSdmx8X6XpFbZvwfYiYXIgtKGfetsD4r4PWJK/O1H/01H3uVFreYkSSvvEEtQhSsOAQglED
	JWMoMwluroKX0GECKfZbOJAZZH87lINeLW08ExTzfoJl8sijt+ljpOvDvdfYLhAOKnCAHL7jVDK
	YWcNqsSdmpPB4gHufhMrbGr9DXtRJIr3Vr2wjirjtHO92sPNnYPp61kRyMHqt3dkT6wrULbLEE7
	jGb9DStTju7t0IrV4R1adEXw6VZC+cZxzQFxaQ07XEvtMwqgQ5WcSoKclvxPkfp12333p27z9gC
	2CLsIb4EdOWICAMF/o=
X-Google-Smtp-Source: AGHT+IG1vVzPBAn5k790jfykavL0vRFl8+h9Eo75I4DE3aZwMJ8QtXRL/RgKMb5SBrHdzfjqO29A2w==
X-Received: by 2002:a17:902:ccc4:b0:2a2:f0cb:dfa2 with SMTP id d9443c01a7336-2a2f222a763mr171273565ad.13.1766521268730;
        Tue, 23 Dec 2025 12:21:08 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:08 -0800 (PST)
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
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 10/15] dt-bindings: dma: atmel: add microchip,lan9691-dma
Date: Tue, 23 Dec 2025 21:16:21 +0100
Message-ID: <20251223201921.1332786-11-robert.marko@sartura.hr>
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

Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
* Merged with microchip,sama7d65-dma since that also falls back to
microchip,sama7g5-dma

 Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
index 73fc13b902b3..197efb19b07a 100644
--- a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
@@ -33,7 +33,9 @@ properties:
               - microchip,sam9x7-dma
           - const: atmel,sama5d4-dma
       - items:
-          - const: microchip,sama7d65-dma
+          - enum:
+              - microchip,lan9691-dma
+              - microchip,sama7d65-dma
           - const: microchip,sama7g5-dma
 
   "#dma-cells":
-- 
2.52.0


