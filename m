Return-Path: <linux-i2c+bounces-14560-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E74A0CBF2B5
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 18:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1423303AC8D
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 17:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934D833C1AD;
	Mon, 15 Dec 2025 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="rn33ZXnX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABA233A714
	for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816757; cv=none; b=mMBF6B5u9GQjdA6ngw7p0Q4Ie+3djribqynQHv5WZrRpb+YayKpAs0G2ISon8iEdThLVWyVTWIKu/hy9phF6SnQyg1AwwYHOZ/EJx781ZaU4daLC3ZnmhGHudlQvDJwbhl6cdKzKaCfbmQXyl+KR+NbYRxXM8y7fd3uC0Fw8qRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816757; c=relaxed/simple;
	bh=gV+TkM5zsztCPBhE1oQ2+V8DbMXqPzezIUs2nyTxXhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KhlzJMJKZFHJsk7x+F9n/zq/Ro+Cl+Iyzt0eJph9IQ0yKQquL/6mIpCx4tZBt79qTYnD5R28u2g1S7TpEWppUan9i2HKZDc4OZWVL04qq3JQCwUT0QpxDG6kzFJ3dVjbfMfhpFxAoiCrUsFUg1dPwO3VghZD7pXuraDVKSVIYwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=rn33ZXnX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47a8195e515so30239295e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 08:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816745; x=1766421545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tTqTgQ3RTUpDiEW13WMdCLExMtis8Qsfy3jipvKGlU=;
        b=rn33ZXnXrEUhiqrS7JriKukKQKWUMch19+hIe4N4Bv/WJEHSMLxXGFcTjjHxxtmm/Q
         246+I+MVHCghoIhSeZLgpd31ii9B9rbx2NkrrIVLIavwg8qn7hRok7xp0Kkx9vGNyB+m
         vUAfWPLSBxo/J1Wp0eTFbpJBrl0UpvL3gyb3WY4pOZldzUJz1lw7+1N323Vxy/3/nmAX
         rwzoS0btRzMXb+kaIj/HWNEIbWiPMmqWwNGUKI/OxB/4j7lYS/idkTrn6dL2GGjhNd2a
         SP5w6YQMVX1eRB39CoflRlo5pciO8xJd3/gzTce96rknAtQH+YfUNADQXy8Z+3gnXXRE
         pGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816745; x=1766421545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1tTqTgQ3RTUpDiEW13WMdCLExMtis8Qsfy3jipvKGlU=;
        b=DFeuFnOjwSF08rfOKT9rxJcQNKLtfZUlGzcLRX42MXPiLvMeEr2r3sRmdDh2ZYrR7K
         9plpzOh30o6mZANJ4j4xpZBW/4jSkLgxImfTSH+U8FMsn5qjlkgoy5e4T5dalTq5+eO2
         tF2bz/6qrod+BV3WCVta5DZeRjwsMYPw/kj1mzugPh9DSW794lUmwPk8/euqNJYcUqBT
         ZR6pqtzNSJnQrpN+nsJ47AQA9MBOzmgBJZv3PsxpRfZ/OO6peI+ZX0/pQxBahOV0FXO6
         GY1UvWFm/gVpAA+EryWLxSn8ydP+8soT8DYrqKSDqdH8V1sPRGYuJO68ucHYry15nsW3
         y+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVOA228vOJm9DfI+7fa6VfU2+IoBzsFWsHyzlFM0XLwA03q7NPWvCVmZMtwh+QkcT25tmiqr8Zoj88=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNiNLJdIVuC3NDiHFiD8Uudg/ErN1z8YzavXgqMQP9PaDJpF4A
	2KZ/XWdXbb+8HYg8we+rLdrN9dK6B1jKDrzx9LJtzE3p7ZPiLy7vSXwuuUxDMDk/T+M=
X-Gm-Gg: AY/fxX6VNOmn1d94neJfD2J3M0Zp3QxPc/bS1Y6fifoh5aWt6aUpaPdYD8dIdrI2IuU
	a7hRzSsYKPMLAGBXl0G/8rAvaPhOaOtcmKHWsmJjaoqlPCNnIXEyDjPkarKe4QnMQj2lega6+Ty
	fgyJWvMv8RMMhbABfSz53+cIxgNAQCS0p86oEP7b8HWrtqoe+RxGc95dYJ+gAf6PWqShyKl16S7
	SrI+pjgyg3mxI7qDCUXZ0vDq+4XdNNmi6UjzPTN4lBejVna7Llj0ASMPc64A7kg0r8GsLEZdz4z
	V4Zi99jgAUAxX4eI0nyUhJvT3futPJlQbtFnVSUKcWFHEfN+lmKcqCA0UsoT+VfJ3YUMf/HTqRZ
	iMp6l4v4ZF1WuWl/04fylWn/FdI0ehib7RlFzQaVeVjSkokUMt2HzIvN93U6Jr5kZzVbknZluwn
	ce6SdAoNNctK9zUjcVvk7RBl8bo9aQJLgvEIUdlPO9xRbd
X-Google-Smtp-Source: AGHT+IE6M+SXBjy46AfoFYCz7iRvtgEH/vJDLvmdk1N3q4CHw0hjvoykYQUZxdniQx5lw2yIA+Byqg==
X-Received: by 2002:a05:600c:4f86:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-47a8f9057fdmr118554685e9.24.1765816744763;
        Mon, 15 Dec 2025 08:39:04 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:39:04 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com,
	Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com,
	tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com,
	kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	mwalle@kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 16/19] dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
Date: Mon, 15 Dec 2025 17:35:33 +0100
Message-ID: <20251215163820.1584926-16-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215163820.1584926-1-robert.marko@sartura.hr>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document LAN969x compatibles for SGPIO.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
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


