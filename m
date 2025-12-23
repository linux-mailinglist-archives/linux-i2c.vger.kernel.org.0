Return-Path: <linux-i2c+bounces-14754-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB3DCDA9B6
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 21:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03DBB30DF47B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 20:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B150355816;
	Tue, 23 Dec 2025 20:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="TqO1SVDy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EF83557F5
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 20:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521280; cv=none; b=pWaeFOt+fw5K1vVEJX1Dc0cAzkvqdA8ZNbbuHTLvmQ1jCU0T5bheytXc3+uZXWwUbjiTXdX0tkgD7wEAzV9EnMkIEwljrT7M73m2HZ2e2JBBCFxEp5FainxwRT+4KN6FQMtdPvL2I6iYyot1DfIGIUEKJuaCAhDMGLqTh3LBhwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521280; c=relaxed/simple;
	bh=omWUVkHfDgWK8/wVYsqR1gmKx3uRcWW/S7wsFlqvQZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7zY9/jN48sEJMXJ/AA8AJ6iLg+e5azRTy9qAn+jHuXNYN5fhchtiZWqGmdbOopfdpoEL4WQ7Ma/930XW+N8YoZgO51k+Jl3ZKbQKXXTVu/ngP+DCCowehdc9r+gZVK6kf0q3hlBdBUGtoT6vSnnTjYX87GR50elM4BgCy3fqIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=TqO1SVDy; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34c30f0f12eso3843932a91.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 12:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521278; x=1767126078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=TqO1SVDyDPy6oeM2rbEwUbThg0ZMdnWKh7T7VD8KZSzOa/J3kT4ROyy/pl8C/wyVsx
         87KW2ws4VZeH2LmCpVD56F3zdAx5JXs6BVI4CuP0krQwFRfdL5t80ZUQoSqx/9VjCZ93
         2xHRYX+ZNHO4M/4rPr+tVC07JSbvH9LFNrnBQ7xv2se4nRY89nnVpeQCvPP5R7bR74dN
         8ViTbRe6BIWhzI31DQmgEro4hW0FWUc++XgR7MG6fQJ7WiTyuHPokC+8mh/pV6Sq6piW
         ZgBIqf3KQjUSOvTNzk6HjjuoWV62KCEhAtinLcS332mSds9tBcYhX9IcAH44WscTKXwf
         1cEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521278; x=1767126078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=vjoi1UJYQNMAHDtYIvBSctf9rliBExrWT30P5v420MgSbPJBRn9XLorSCQGew8xNXM
         kmQ7+USnLj8kj42GkXaz9yB/WJWqWzJIP1gHGUqBK3jbLEHI4ceuyVj4FItx6riNIOa9
         qcw+7FGg+h+cCrW9wi7UgbwEXIENF7rwZ00Gc2EwJ6hgaGadS2pt704KpDwsUd3OXomf
         ekBx4dqbbAbz5E0Q2iUDSNBEGD8DRWPt9Kf+zzuEHdUWsgRa/fjGxRj143kcGtTEyC2D
         9DjMHvjxvV6LXgbGKbNDKGP4mSdaOTyDWh5yMmPrr1Kwisx3XTPD2GAtshs9CEvfvqmF
         cE6g==
X-Forwarded-Encrypted: i=1; AJvYcCW3XdrE5NYn3m8Nc1L8gqIg+P+n+c/W88rFNIAfUrawbo4WhwbfZ9cM7vT4bNesjBHULul3IIB2/no=@vger.kernel.org
X-Gm-Message-State: AOJu0YxReFUge9YF1xCNVBx0+hKroI617TovwM9bMizy3OUERe2bkR6o
	X5JI9bIKhWxQykyOswRzM2PHFAc1Rocp2ZC1Vx56aZ6XfGAvDyl5YJfeZp+cWxHg33w=
X-Gm-Gg: AY/fxX68opeYqcdP+0SWO7ib5z81bj9bh0dIaDvgtHJqeYlHgZBJECWTPMdGI1bEE0k
	n8/NGhNJ9H38lJa0+ZIl7wJObEtyVLys4TMpQtyZY3KhajAky2fj94u37jQxuI/NXIG0ZmpBHmN
	u9tYpGJsD9ch1BryoyGdhxr8PUsor5T8q1uDSWSJcOeaC5hmexqNTM0XdoFeJ6PzQKLrZHww90O
	4yANWrzCaeLhMdLLJb9H+VIvan22jG/x7CbwNm+Oaj/DFbUyO6WUbSptyI4bVAmlCeHdn222UCC
	IsFX/gb5e9b+uCElC7r6NvTI71MugdDXLFQSZjj0Oa4W6kQqXsWCkwmmWLB6gzORCCygVKV1sg0
	d1BBHoev55JAKyO/8UOze3OqV4s0TGURNvkpv52jvhE4wah+e68MQ+DB0amDX2BiiKK9vap7Ot/
	53IEVoKRMeSrxKHnsndfi/Anq9oePYEa0tC1zWGVlTWM92MBxXIjMj7TKxlAdFRfR1bMlZy76Qt
	zsbI6py
X-Google-Smtp-Source: AGHT+IHeRAtPKwVz6qoPOdL+Osxtu3PLTheDOvUOr8YysaVV8Js4PDKym39wxYhmLqVHZ9ksN45wJw==
X-Received: by 2002:a17:90b:3c4e:b0:340:c60b:f362 with SMTP id 98e67ed59e1d1-34e921131a2mr14020700a91.6.1766521277662;
        Tue, 23 Dec 2025 12:21:17 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:17 -0800 (PST)
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
Subject: [PATCH v3 11/15] dt-bindings: net: mscc-miim: add microchip,lan9691-miim
Date: Tue, 23 Dec 2025 21:16:22 +0100
Message-ID: <20251223201921.1332786-12-robert.marko@sartura.hr>
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

Document Microchip LAN969x MIIM compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/net/mscc,miim.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc,miim.yaml b/Documentation/devicetree/bindings/net/mscc,miim.yaml
index 792f26b06b06..2207b33aee76 100644
--- a/Documentation/devicetree/bindings/net/mscc,miim.yaml
+++ b/Documentation/devicetree/bindings/net/mscc,miim.yaml
@@ -14,9 +14,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mscc,ocelot-miim
-      - microchip,lan966x-miim
+    oneOf:
+      - enum:
+          - mscc,ocelot-miim
+          - microchip,lan966x-miim
+      - items:
+          - enum:
+              - microchip,lan9691-miim
+          - const: mscc,ocelot-miim
 
   "#address-cells":
     const: 1
-- 
2.52.0


