Return-Path: <linux-i2c+bounces-14863-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC9BCE7D9C
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 19:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 573AC30049E2
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 18:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BDC33CEB3;
	Mon, 29 Dec 2025 18:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="LyRSbbrq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAF433BBAA
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 18:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033639; cv=none; b=leC7eb8SZGwu2GV0NqNt8vqTzR2nRZ2U46Sai5GhZa+0WXzh5YW9BB6aJs59roJQkXWUq0bC2Y96DbhyaduoQbwzROXy5NY8NmtQzzA+CxNiKnOoPjqcU08gOtB3j6I4hIsAH9YMtt7st1GeRUIzLO/69RIgeKUr1qUJWKpxbRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033639; c=relaxed/simple;
	bh=Q1obzpbb74AZt0ukfBT7/Xcte4bERP/uv0lOi/h0us8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jz8EaU8NOYmrv69vQ3yvR7RvchsReIpvhHkEs8k9AdmeljCc4MXMXrerXDZjtF+BPHeKrfle2aJ6SCl70PtTxNmaCz24wxfOsDYkkSViKrofoPjSOoNPlk3YN/AwJSuT+ItXPNFtUy/N1bfZkwCMgvj6E3wsq0YuQshWUk2TCnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=LyRSbbrq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so71189365e9.2
        for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 10:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033634; x=1767638434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=LyRSbbrqhsYCVMar6TnbNq5OwUK6vM5vLOubw24DS+DHtGNV+bJd9Ws4YLFLcIaAk7
         HWPCtBIRseMv3/cnK5UmboWJt/jYxd0RuJWmcbt2Yc58+DpXPQwFcYmx5ERXgyz/VGnj
         V9qPrIkX8CwYabWmv/ku38VSqUqR3RGC4o789At+xV4gIlr9J+R+B5MA6mEnjByrB5D9
         6AGB6F9TcKy1iuVMGebdlKSCHbuE+vyg+Q01p4WIc/CbgEApewqay4CiCCRYEI2Eypo0
         a4p8Uo/of/KtQ63rWWRF9/G+a3GHxhBtDB30wW9cC//iynv4tt2gWEPfDR5IAzePQaxD
         wR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033634; x=1767638434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=FdB1WEChfhzdZHvRufyI5gKhwy9XiMbFsBfLsFHlIbc7daXaIGzuTDWPkJSaFeaS6t
         R2HxuAJQK8Hraqu3n8vtokR8lHaYWe078LOnsCcUVDmH5EzAKdnpxvsby4ZgMGb+tiC1
         6S8Ku5+YveRNdSJ5NYwKMefg7VDiH7O9t/n2eLGy+cCmgXh0extLv2VFc0ZS7UwYA2Zp
         ZJrjx9h+RrjTgOLhLT9EqoLok3LQ/iFW3BmNrDGddOaNcten/toaLkyzHPjU6BXDkLjO
         vTx79pcez+6yF0Ul/U3EUAGz2ziUDhl7RnDVVFd5Vc8F8ItUXJf8VLzamo1StgMgzqLW
         GYpg==
X-Forwarded-Encrypted: i=1; AJvYcCVkOPNbgNe0gT4qqMAzeL5RS+vZEkqkDJTr2nVgURkL8W+3/NW/GMhzr3JAtd27FQEsN9IdWHWzFI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTiAC67YB1lw/78RCzUssPVxBOts1iiuik27l6wLIF/rsPcKf/
	Mo671eIuwAuVVbdabOj1b0Vdpocw5qTTUX5KBRKIO9eSADMpq0P2VZzTTaH//UZS+H4=
X-Gm-Gg: AY/fxX76Oeizrc1/8JSWIssDwH6lf3PTqJ7cRipWLKwk30/zwWpzpq3+rC2oF05onVx
	hNwu/FC49WwOFbe6VrDWsoYLEbc0XEuw3cdbzwHarfUZi8ZaXDK2lPk3VHaB921kS9y886Y+mVn
	Ebm+yXGCPDo1Mv6khMfUXUYgB1+u31hZpK4qdclmgC1matGHUXIP0+hTkBxSQ3/lFbr31FxvFVO
	P6gyS9AaovrB06n0lnKFvOBC64JZef6RCNxAMVuoREwdfq4b7YB8a20C4/FvLslEPwXzhWOyV3b
	F+b/fWcsb2+SAYgU4RLSgZ3PIhRyasfg4XJpv54rlo8dlOD7KsoV3kQLqnOHT83PSYJDQKFwrlc
	5cX+apGmw6MiI31GeWbh7QcLBAZzi4g44jIcGT2YUdKl9cOUi9paMVdeCbW8mYdBta7OYtuASFA
	h9BEqe7qf1Eyob1S/flCfNaZuFsRn0wgVyEqmHQ/n1vkiA7q9lOlaGGkA+mWk8UfkH5ykxkyjqK
	lzGSbV7vuHfH0xcTbF3Ys/cI/Tp
X-Google-Smtp-Source: AGHT+IEOW1WMqA9XyyxJdu/NN+RbiiVAdkX9+5SQ+X2Sm6Ndg4Ati/iuxawV+Wvcj48RXpcfvKGVGw==
X-Received: by 2002:a05:600c:c115:b0:47d:3ead:7439 with SMTP id 5b1f17b1804b1-47d3ead7574mr139091495e9.37.1767033634253;
        Mon, 29 Dec 2025 10:40:34 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:33 -0800 (PST)
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
	linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 11/15] dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
Date: Mon, 29 Dec 2025 19:37:52 +0100
Message-ID: <20251229184004.571837-12-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
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


