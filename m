Return-Path: <linux-i2c+bounces-14757-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B347CDA87B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 21:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D7B0309832C
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 20:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412433596E4;
	Tue, 23 Dec 2025 20:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="tqNu0iNX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6603590AE
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 20:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521307; cv=none; b=kVLms9MW55XGUACSQdXPZ2phZK+1MgkEgW16MlPfALa8XpZ+zDz2Hf6DtTWwLWp7jnlO8zV+68EtYkS8gfmPSpqdviHi02kfN+L01/z7wBq6qr8b2LzGchrOqpstHBOYPYrzV0y9vUU2v5U/FaWDAv7vvjSSTEqiAqDzQKpxNwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521307; c=relaxed/simple;
	bh=XoF0Eovrxm1txLTrLfP7MB7ayo4/Y25gdep/95xkk5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSQqVHa0fz2FykS/69Py9rBI0H04xsw4mChbhRu7tMG/0FWSfBcmIpPxA2DDRpikiF/Fl2xVB1QV//r81ZjlJ03Ok/YM6wyf9gwbMa2G/N9oNJ9Qoq6iGxpEdY279myLLeUkxoutxfmAgPxvrqDtU24efwfsLory8/j96t4k7UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=tqNu0iNX; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so6113103b3a.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 12:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521304; x=1767126104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=;
        b=tqNu0iNX/T8f4ZQ0j/Yobjqpzb43xMAQ24m5BfCOWvdzq3IHmLjeqTBOAgIiE7d5S2
         N5fBPe5y3gl9uLYGhAi4647HW/5fN5LATqcvMhv8qLSObvDo519o4bPtPTd0HcrOtJNL
         +yrIM8SMF0AMAun4zHRZJCoFTQvESD1JZ71NTG7XBB+JBmw6GT/ko8ZiqfMcvI7AT3/T
         fYOEil8UzahtCc/HfhugBjuEHq4Pcujmr1Visr30t0FPiD0JQG5z8cnjJpuD0T4CGuh4
         AzOo/BgdB+0KcAyjo3REQrPASQFRboUdXtpZEUsvwTEelTK2a6yQ1+FXxnZACDRLKtDD
         LFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521304; x=1767126104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfMU7MT4/V4GUajmsYnn75DFErJTnupop06HbanZvHw=;
        b=cVSEDXepmOr87sIwSl9dH1SrXUMa+eyXBLPpAeiMo4r0eidzK7lyAmhXvJGesCOlhB
         f9qs+CYGvHN4FA1xwwYQCbWO/D16Q17uQzP583puNfOq2Aec4WOQOGHKfvAcr5idvE7M
         0g7QPKcUMIaJhiRFvgXsOPwMbckGMJjGAvlpNd9u5QZRtS1lXTaZU1i8Gm8Vh1pNwDG2
         CLGAo6Bnymk/MEkNMZaG7xA/GrMYawlhuTz2yHVbZxqmknFUea0uyvsvCz1sotN8Pk4t
         b5M2abJzLo6L+RYM4yiWu8gmCg47EfNswyqv2Ieo9xubXTFbhYieekImqOOaQjX9dmGu
         DFNg==
X-Forwarded-Encrypted: i=1; AJvYcCVXIMM8byKowfwfaQ+g/HeLMHabO1cSkPPpwctApt+dWvOI5m8sgVLoel9xTuqo6YfdtAmCUve6H4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVD8yX/tQrZPcO557oqMhuws221MFk2MjeE0wFrdIe/8YheR/S
	+ANcxmL2NLc6Sz1bbXIP8NooEbGo1hcRkhMhAwbYyLFfIEuLga8Jh+V+P1jDyRx2oU4=
X-Gm-Gg: AY/fxX72MFhNMCEPpH4qnCO4LewF1SYD25VeugORl4lqD/8nQF2zRGnHHkyN0t3qOC3
	v2w7lN3l4iriFoiqb50lObaVRCZFtjdrpoJUYI+PSp3IkBQSvlG20/Q6cac3bx5jT7We5t7xZOr
	57CdQNhMJklSa322+zel8do0DsJWHkrTiyyZpTn+Np8dJAMS6RNzuMiECJef0a2mC8lhjeyPrsW
	qQKSiVIHGfVqEYGYn/cpSUW/KEg7sKZN+yuF5TgOE/+msawSQryV3O2Sd9pbC5X2/sRIhkMHOb4
	yFTxN02Nk8rVQ+uaBQyyoK1AsqEuFKhiu1zNbENGaEpw/6Z4aocSVhsEEWcakRtAfHY9RnOuyVT
	XbMTKNJSsv4Q+lLw6GyXAzyhJXPSwWYsbi1bnhPZgHU5cb0HKVTHYYRm0RGikB0+hZN+UGMmVem
	45Qa3RhDxy8epjOplqDSi4GCbQxTGNPT0ZaIAAIrxCi559v/ZnCONbsO5vTEk7iGy3nTg4sH8cU
	x4j30uP
X-Google-Smtp-Source: AGHT+IFrLV1OA+vGIt1Qeh3SInjG9m4lWsVJ7UMsa9ff7itN29HXneV9Wlv0pR5HcnrOBgJnEjlG2A==
X-Received: by 2002:a05:6a20:9392:b0:364:14f3:22a7 with SMTP id adf61e73a8af0-376a9de5935mr12020799637.42.1766521304022;
        Tue, 23 Dec 2025 12:21:44 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:43 -0800 (PST)
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
Subject: [PATCH v3 14/15] dt-bindings: arm: AT91: document EV23X71A board
Date: Tue, 23 Dec 2025 21:16:25 +0100
Message-ID: <20251223201921.1332786-15-robert.marko@sartura.hr>
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


