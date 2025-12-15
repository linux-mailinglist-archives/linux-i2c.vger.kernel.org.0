Return-Path: <linux-i2c+bounces-14555-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC7ECBF225
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 18:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CC5030185CB
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 17:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B7933A706;
	Mon, 15 Dec 2025 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="g+Jpw/Rq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43072338912
	for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 16:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816745; cv=none; b=mZiy7h1rn7L8az6qIJDjtcevAGVXYk57AxykyRblgFFEAlcbB6e5uFy2A3TiEYEG5ihAuy0jUkkK507bb8XpSK832WchOW7HbGAape/JbHLcTxO2Y9lSS9dPh4f/Ff1ZY0wgeUXXefnrBx+ChJkhX0zjQjEczJDVBY1WKZFeOeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816745; c=relaxed/simple;
	bh=H5qZHJBlkQV6+/j+zTVqie7Q24nFHuF3MlV57DgQSPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijfvlbjow9MGwIMspbK5tLJaX6xeGmIYhcNHVyQxTfq8gmIElT1EXnOg9R0ge1TbxiIGg60MZGtUen+ca8WnZib3LAOzlWAEbLtwATu3G4Rp+Q8R/Ee4jkxlbiDXJnJGegEgd5nUx60cqDeDjpVIJ6DgN4QvYNCh09GwbU3b7Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=g+Jpw/Rq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477b91680f8so36978645e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 08:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816733; x=1766421533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cvy2LXuomfpj1nBing2L+jv3vaShIDCdMet4k/EboCs=;
        b=g+Jpw/RqdSE8R3RrrjQvhbjLiVU5JJvGAMD4icDPe28PPyf9q7p33NAR2brta51Jk1
         vhKfrzJqyBKDndGSaKieS7beK81YB610auUCmT+2t2R9OxgxySm5j6UcXqt7vDwr2yca
         IuvDhLzV7LpgZ2naTmCudKK9fP60HkJlmNpO5/Svow1GgRTRosFh1KiW3zICe/wl6SKe
         gjELLThAa/7h/I8jFCkxujmPa2VFPMEilRd1q68bEJMPgd/hEtLuCCXGcHJ6yfTsFE3e
         VjMvyu9I5um1nsezeE1uGkkQJcEcPANF4u/Csjni370le8TjbMdqiTU/AQK+gb7/fSl9
         q2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816733; x=1766421533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cvy2LXuomfpj1nBing2L+jv3vaShIDCdMet4k/EboCs=;
        b=AErVAZvcmT9NewBf9L+7ZKr/rI6nZYeWfvwNS6ZxAGYCloAL2Q1MnnuwKZ23VhkH3a
         4Wia0/FIfm0uQblOYGopmZxUg5xkAv5V6aRNG3ERKdssk1S5cc+7YDs/1qtIbc3ZEQGM
         4nCcgl6R5jf0vRa84ELNSm1A/3g2bSQPQZvoxiwZ/xk3hgxkG1LACgitbbdlxhVeuXhp
         RpeJHq/Mei5XmAwiw2JZkypLh+1D0JX/VdWcaEyzF6xnHGD2CV0XSO4vp0DA377Dqa53
         tv6y7jQz1eIR6v3+OF9kMPhYIKDw1vVVxGB9TXC0YsgdZBYcKaToz77Xj1B9LyI5iWFR
         wfUg==
X-Forwarded-Encrypted: i=1; AJvYcCXqnYav7Gmk46ye7lD58u6liUc4ACBashPdP+3KDpuOXykaNBgkziiGi+zbccIXL28sm080byRXr4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD+NrLcpEFN1RFoJjRVEg3hVR+u9a//+RfPS9SX4cjU5U5P5VN
	ni9ZRZPcHhKv9TwIHZBxITYTxx+nLq88+gswBbVqxxf35KPSnSVYk4Jaq34bz829UoI=
X-Gm-Gg: AY/fxX7UCt0Cue9OWIDPw7Woh8QwJRcktq5gdZbHprj5rkKffs52TIXcIF+4Yg8O86/
	yQZZKxgjVKwYNKTSxDwm7X/QXS/SF/xdyZwxKrOIf/d7QdRHJaUwXg1hju6XJeJMtBMQ70Wu6va
	RzyMyYqx3nxOUlIwYdgff7mMbkJ+o0rmU0bd1f+TEQkynURJ9rvkx8NnBJbdo3Rfbhs9YfhI3rB
	v5c2r/JbfkD2dZllFkDe0pmga4l5fwoLa5QAe0nKyBlNzhDW4OMlKasd2MTDOeZu6Eh4J6M75Tl
	c9sQIDROQd6LCfttgt5ckBe1Q1EsFxW80zMMNJ2u9oI6Q/6WRm/F78cPl1Nn0De2iquKAaWZgty
	qJT8B2IvE+BmBhadd3aQKwkxXfvwPqSP0P5euwL6JgTJSqdORXYjstgte7WbETjJdb98tZ878Le
	zZNuYajpkb4Q9d5P9ZtVNYTWhDeymiyO7jJSI8OhUO+Ixz
X-Google-Smtp-Source: AGHT+IFiI7Ni2LKcVl3YPoJbZhPL5dwoIiYSj1m9w7GWGjr7ZRqjP07iguNywDfLKiIq9PsRU4kDWg==
X-Received: by 2002:a05:600c:64cf:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-47a8f89be65mr106452615e9.5.1765816732996;
        Mon, 15 Dec 2025 08:38:52 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:52 -0800 (PST)
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
Subject: [PATCH v2 11/19] dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
Date: Mon, 15 Dec 2025 17:35:28 +0100
Message-ID: <20251215163820.1584926-11-robert.marko@sartura.hr>
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

Document Microchip LAN969x AES compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
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


