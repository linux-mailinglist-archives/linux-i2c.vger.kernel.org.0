Return-Path: <linux-i2c+bounces-14755-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2F6CDA94D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 21:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0FDC302B31D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 20:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942E33570BE;
	Tue, 23 Dec 2025 20:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="vAEdXO3r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB1E3563F1
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 20:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521290; cv=none; b=IVu6wu3K862+3uX5kSZK9lHbmgGX4uyq5v89zIBlou6F78P10KDg0+onPwzrRqYCscoAQKY0LrXhcep4bP8hZd2wbuYgOx6/qtjq8y3+6ZTaa+z7hm/mT0eiIwrCtafjrZ6c9hv6i5H6YqDjmGpkET1FYKM40wjGJd+tT8VQuOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521290; c=relaxed/simple;
	bh=Q1obzpbb74AZt0ukfBT7/Xcte4bERP/uv0lOi/h0us8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ixlFSzOmDXPI571CrLoKatWPm7s0DljkaAByw1S7T1+pgcrKXFQjwzQDGp/BeOvkwjTPac1mFBaKFuHXEZj7INEhoU9yy2LpzgMR6mP7h8rFqvq/jNdmT7d6IwA/6V1s95OVq/buMU6Sz6VHtOemswD4Ns0Y2eCcNpIQaceLO58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=vAEdXO3r; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so6112887b3a.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 12:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521286; x=1767126086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=vAEdXO3ra/1bm20X8T+iXv1DGUZqKx6guXdgGYlEe09deRwfl5bXIa86Eb9PSV+d1g
         89yhFC4l5+p3HDHL9B4t3HraCiFP2Abre+g5OOymalREUL4ViCVjaMatLcQOi73KgoaO
         su9Z87NmLUKhMW1Z4N3LrDbyJ/2M/2Y3Ff4tCAv8WODcWixujph097B2TZm09bAiaL+z
         5RusNCbtacBZhsJzqltsEvBQ/ROehlt9LNDXxG8a0iqZnYUEOZo/smkMaGNsonZqVIvW
         oB5htBh9H/x4y6/cNqzQFEF9xiV9o1T5FsZ+snE4miTlvCzGO78Af/4SYd4c74sDMOq0
         AwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521286; x=1767126086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=Y9nR+xupTvPv/kqCNkao6aqfgVd+beOWdUn49i8XlYXISEoZjkFK0rhqiwj3cZgP9Z
         jGwl8y/jOZpGNeiwdxv5v/7++IXzb9Uless+gVXwfEyo3/fWVBCJ6i/vSF4SkHLXC4lS
         kmZV7wwGvBrIhJG25nn85QuaDxE6PQNpzhS94o85xlHSoQfyKTjVXlp2X4B/AgiefTn8
         bIkMt42hdrz4+AqemgREHYf6w0gW2qK/C2Ca5myOqavKkEYnuPIHVqE5K7g2BA2AxByM
         l8VXDyDfHQCrR26MWq7lMLaaPECUOkL1pYRfCKjj16aMNn4rCIoMkqzlsZCLf5WBiMtD
         Ck4g==
X-Forwarded-Encrypted: i=1; AJvYcCWGqm02pR/R44FK4muJADl2fen9d5ZfsJO/XnerwsLgwmcGTVn5iEJS4EcZZVu6YbqvoUM8bolv6UY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGHeg7QTF7ebAdejcPj0598LATuz+87twsIbeQAokPRa70/Dl1
	6EiSb0UwLt8n3LIiMSt2iKeKbOALT1yCqRFCfUSj4WOTFMWNNt43IXG5O08b3p8tBXs=
X-Gm-Gg: AY/fxX7KSPB8JHT8N2s0U/e1k0U/el7qxd1Nsbjesa0yi8a2Tr+WwauXqZKg7EnYYa1
	I1CK6Kni+ALxmVghZJC8hpWSANp011L7LzP7wsVsx8EArH8SjHszq8erWY+egc8SG1nWxrN8Nt9
	58bee+UUx2puuE1u+lWd//8UzHRE7fVBNznJrLeqf1p5qO/BxAJQRoaAICAUByYyfMW7RTCzbxn
	WyJvCoVgLm8aYwBGaVypyaaKeH1QLvdBHE2ugzGSqj4/89aJd2GKN9ar50+vbHMuaBLm7bGNl0P
	bpT2Vo7Sbv1IAHTu7lZ7YsU5QllLA+2riNkHFd9/fWiJQQWB0qLiGeegk+ImGWj3HDu6QbvG3aL
	2paa3K//yX0nupQrjPwTfAbb6UFItekuLmiR2j93bwFWpby5ysGOJ051DYRH0TFzB6NbaNiNqz4
	4KDhersDQ9AkoDKnI1TgOs6Hn++RlViFDGwLilMIyKv48XQqtxj96C5LgXkyXeRvbxZRRr9o9SV
	ZwQDLdWM5A0bSMDZWE=
X-Google-Smtp-Source: AGHT+IGKTAqrl4PGe4SFW7qu0192lJdQVYEzpdtaZXHZbcUYB4ioIiqnmVp7I/qce4lXwOMNJA61Eg==
X-Received: by 2002:a05:6a20:e293:b0:341:d5f3:f1ac with SMTP id adf61e73a8af0-376a9de5b1fmr15092285637.41.1766521286558;
        Tue, 23 Dec 2025 12:21:26 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:26 -0800 (PST)
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
Subject: [PATCH v3 12/15] dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
Date: Tue, 23 Dec 2025 21:16:23 +0100
Message-ID: <20251223201921.1332786-13-robert.marko@sartura.hr>
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

Document LAN969x compatibles for SGPIO.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 .../pinctrl/microchip,sparx5-sgpio.yaml       | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
index fa47732d7cef..9fbbafcdc063 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -21,10 +21,15 @@ properties:
     pattern: '^gpio@[0-9a-f]+$'
 
   compatible:
-    enum:
-      - microchip,sparx5-sgpio
-      - mscc,ocelot-sgpio
-      - mscc,luton-sgpio
+    oneOf:
+      - enum:
+          - microchip,sparx5-sgpio
+          - mscc,ocelot-sgpio
+          - mscc,luton-sgpio
+      - items:
+          - enum:
+              - microchip,lan9691-sgpio
+          - const: microchip,sparx5-sgpio
 
   '#address-cells':
     const: 1
@@ -80,7 +85,12 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: microchip,sparx5-sgpio-bank
+        oneOf:
+          - items:
+              - enum:
+                  - microchip,lan9691-sgpio-bank
+              - const: microchip,sparx5-sgpio-bank
+          - const: microchip,sparx5-sgpio-bank
 
       reg:
         description: |
-- 
2.52.0


