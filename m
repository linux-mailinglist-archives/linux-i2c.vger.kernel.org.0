Return-Path: <linux-i2c+bounces-14866-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF4CCE7E83
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 19:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C66DF30C018F
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 18:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0860F33EAE4;
	Mon, 29 Dec 2025 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="eDl6YqTI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE26C33D6D9
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 18:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033645; cv=none; b=HVDHEexi3JBuf8NxOkYwxsR/q120vWwJAIXmWwNBmPLCrYfIrNIK0phbcHyaI7krUglLDF+48kRHi7WGzI3XRDCMz5TAstYfKIPI549t9r7jyALVlmoCrfXHBbNowuJnmw1jxfhr+wZk7qRsIBo9VnGs39rChpKkdz1HH4iGJ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033645; c=relaxed/simple;
	bh=XoF0Eovrxm1txLTrLfP7MB7ayo4/Y25gdep/95xkk5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXAtUTRUQzikGn646gF8c/q6U56yIhap4IMcwdiQSsuHdWK6qB6TZ3FoWqAb4geidWp2cQsQckCAqc2KbGuTf0YCVfmsYHjTglWG0oIsf2O87CIwcAPjhzLM6BvU6o+YasudYvHC6679PnQ3b15ZrKlDj2fX3pSZusY7NezMNbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=eDl6YqTI; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so98481275e9.2
        for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 10:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033640; x=1767638440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=;
        b=eDl6YqTI35mE7mdIDYxmhJcA4HqpioN6T+TrIWpO7rhwFXtvwMqpaCt2rVWa5KOT3Y
         PzQmjNcD3ZrlKKrL+sLhAkAO1G+9JFeLQ6HfZ4RLRD+vGzqZ8nbHnAvPszy0K7JPB4H0
         5i9ecXb3tDLcQBOFCP5IF14KvLKRYmOOE1wWHk18pvjPph5g85omJIHxFYCFgCNgFzc5
         rRMoxkFKU+zAxax3cIGiVYf33wmRRaGswKq8m8cmtly5hnQJEOUTlktu8+2f62IgiqfW
         u/Neehn5EO2WPKUDyLjLyQBW3zkSTpdvIy0w+c2swIdgRBGSJSsWnY55ywc/rwY0oCsw
         nL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033640; x=1767638440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=;
        b=WQ9gc0BoEo8uEEIvDqQCyMn686jofsH4dsfd60H0f1y+jgCONxkfSvBE9OEsaUn02H
         iU/VIaKCVp1JvPN45jqw5Bys0f2mWdp0wvrHRUErNOjTE1HTIwNJiDPhBTeXMv3egxPt
         4El62Mx+ux47i2w2dNPzC0OjI+tOHPEORm/DND7BKGC4eJNtcM/eChM4r5TYl4MWhv5A
         gLdQqQarCGtjfrSPVzjOsBBRJqBCBupSRVnSP/meqvCnmf6cy4MlBReQ4DRICGeqgyGU
         6fRGj/G8rBPaw1vP4vT351YNutSNurx/wgM08S5tvyqN87uvthtqnzz0QHkLSjdtkf28
         0bWg==
X-Forwarded-Encrypted: i=1; AJvYcCVgITn6nv7rSCG0oIFsMyZH69ydYKzxfVOm7CchMxfmzeV+XbMyB2leaMtMwLNVrQU3hETm8UdqUx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmoTC+CHOwNwxRNqxZaq1tCbOF5PZc3vpzn8PDbzMF1nppKtoC
	a5qL7mI1MRJc9Jn35g/FIpv6Eh7giIdJyPz5ZrQGICqk2eXpuzaXNhcQ4xzExolUItM=
X-Gm-Gg: AY/fxX72gun60zQsY1wyc2Xz/ujRBSMztrczlgWVFKarn0NrFmH/gjg/ONxd+JrqO0x
	cy4o1JYmDyqpi2R8FKRPKSRAO7Vk809Me8NMeJdpwszy9Msgv51xdx+J7Eay0nCWZjGl2JLHl4r
	tGYHh9B6HX0epwPgMGP4gaZ5fyG6iba9Up7Lqm4sn1GlOAjXW4Mss3ZbI5RWHrTTcUFTwPb93ng
	8ZtCF7C0H/sMf4RM0yRkoXK8XNfKS78z4xD09tfWxDGSquFW5ZXk+gKMp7QoD4SZeNk7illrLzM
	vfdbAEICNkSWna6igN/EEUJgD43W1zhwj6DH/ZmBCThahTOGL8AFKg5Hnp7ZQVoA9un7EIu8L4p
	/at1ZiFbvoJc6V9RnsTWnJLj1r6g2JxJQ0k19fE6U13dtLhULo7jrAbc6jWcZ+tcVKgqWIVs/uF
	4YbiM2RGVevtxhc3tbzuZKEqFikSVcELJiuM3LvmNSNravjOdxkP0d/vKFvkHgm6Pvf0AyzeX2P
	7Rb08ITfIQRGpViJnLLp4/YH+iY
X-Google-Smtp-Source: AGHT+IHW2rHrGjnHbMx7gSl8Rbl6YVS9e37XXYhb9JI7btIp7PDkapkLHawpn2EWrbvZF2/0cVQnBg==
X-Received: by 2002:a05:600c:8595:b0:47d:5d27:2a7f with SMTP id 5b1f17b1804b1-47d5d272cd4mr3349085e9.26.1767033640044;
        Mon, 29 Dec 2025 10:40:40 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:39 -0800 (PST)
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
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 14/15] dt-bindings: arm: AT91: document EV23X71A board
Date: Mon, 29 Dec 2025 19:37:55 +0100
Message-ID: <20251229184004.571837-15-robert.marko@sartura.hr>
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

Microchip EV23X71A board is an LAN9696 based evaluation board.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 3a34b7a2e8d4..b0065e2f3713 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -241,6 +241,12 @@ properties:
           - const: microchip,lan9668
           - const: microchip,lan966
 
+      - description: Microchip LAN9696 EV23X71A Evaluation Board
+        items:
+          - const: microchip,ev23x71a
+          - const: microchip,lan9696
+          - const: microchip,lan9691
+
       - description: Kontron KSwitch D10 MMT series
         items:
           - enum:
-- 
2.52.0


