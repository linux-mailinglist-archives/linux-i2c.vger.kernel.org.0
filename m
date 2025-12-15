Return-Path: <linux-i2c+bounces-14553-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB349CBF04A
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 17:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EF87304C9ED
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 16:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527A5339B41;
	Mon, 15 Dec 2025 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="TIMTbnL5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835C73376BC
	for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 16:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816739; cv=none; b=o8Tdo40p8GS2saRabe4sxVlChwU53rpTV+oBFQvYrieSvrOsinSISwXLBj5PLP2afG21IDJe652ldP5iC9YlppMarqx0qMAilhf3+TOer/sdkJJXe86QPuv4q+5asyidZpbBQtzjWOlbUO74DyNwa6PDf5/BgO/Zy4pLHZ2dNk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816739; c=relaxed/simple;
	bh=tveRsbPZXzZXhM+Y4ZL/xeAZhYPJspnG2nmDI5Lswyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAoMbmMhiDU59ecZI7zql4FNP1VZa9dv5ryoDS39+Y6dDkMV6qboYxyViwkmOU5++uyJh6MDi3jRGOCmb13eNzwlSmmbhHcatwe5DB40ZrIis4iqqFFvLAPpH9SEFqWe/UwuBYsEdtgyJwbbab94ID5lXK5aOFALsQ3E+rxoN6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=TIMTbnL5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779a637712so24956665e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 08:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816728; x=1766421528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GXKAmimvfw8ijk1jKim17aNEIYNsEIF53cEg9wyafg=;
        b=TIMTbnL5Em/KH6EZ1AcGswOTA8nTJvUHKKm2Pz771cI9CVZvlCDopkoqTAva50aEqA
         VAvTMj14W/P63wkCe6DJS/XYIr//ifvfGpzvvw75fSuf45b05uLOG5DOs6HVtszdnv9Q
         OIUMeF9yWoqOyIgcdPi0ZMEBbNuYljd1ptw8AU9xi7TEhisDZdScz0eHTCfMc7x9wXrt
         kpmH42zqbUL5cORxpDZr0pbZx8mEZox9sb54O2O+K9r4/kbOTj4S6RYajMGwfNIXAdd9
         Sgwghwqcz8imo3Z7cjI4LtBBTMVjsidan0IG4I0hZQVfX4VGYq7t9/5kFtSJMPJpi4OX
         UULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816728; x=1766421528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0GXKAmimvfw8ijk1jKim17aNEIYNsEIF53cEg9wyafg=;
        b=bopMVjULhUGg4F2AqXSPlqgIHKI0fZgVkbXjz5MTm3H3OS35iyclgdo3pxFCxdZr5S
         bRGUnwIkbHLKL3PaFLs4cDCExdsETWpnIr9IkLoqd7C4hJJl3q/UGL5fzmr+IiygQFEh
         6XYDPj1mnKTMHd0krgLRaCBNXkJkIWmCOJPhHQiHUIr/s/w4HnRpTnXAqMUwKKHoACra
         MLie29RaT5mNJeZEHInR709/5f808nI9t2iDuhJkKuhRkBthOVYj6sY4Y/K8rGOnX2yl
         g8Q5d1UkB61qYTmQlpsnICY+Om5TuY1JDORrpmrQRvUX3h9PqG8GCmkEDjlusnG5IY0S
         rp8g==
X-Forwarded-Encrypted: i=1; AJvYcCUXQbR3+K3rv0Q/xrn74BS+pI4PETa8MrTw2oIRTiCHOxIaETnQSZXZx7BB0BNyyjQ21pwYJ0hZUog=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz43gSTWvQf7Rip9UOV7XQlTmI5U4TL+xeyWRl3ZNAatEiXDhZk
	WWfyd0omz98JYiUWywESkHIkGkS6uCwzdY6B41t9ornxX0/ZWVLARadrDMHYTNQzA5Q=
X-Gm-Gg: AY/fxX7Qc3zNS3EGtlWBzl8QmG0apCiSQhZ7OoQ8UVF6cnyt+Uxxdi1r5iDwxC5YqTV
	DldFocpl6lb+RnmHbT+XJPz4ZpgBxpQ+9Hxd47IQcbrmVDO0BoSQwsN0gZOwsdKbognEsmqYixh
	/QyHXIMvd/mWCe6Q/rb7rj9R4l10+UOHYgcKYorFoG1RQ6zANlS6jk77WeiFCM1sAvo2SedDc5U
	rwzJMVylrgA9JBhouCgB8N3ROeJdntuZ4uMKIzf0L8n+PMClE7oN++Q07MTBLMPSbcDvcHSpW+m
	KiYdZunTTSHgCt2yBqpmsh7FtCAh66CcWW6tN++aKn8xUDM4jqveUkfD8WURXiTRDDvvSxZAdfw
	jDUc62H+tEFqYoYP9spNKv3aqzaC6ntUfZH82J9FSXG94xcaqVS9aX1tMFYwAOS4NkOAbpT1N9Y
	TY5rIFdSm4CtoB/UsMqja2WpMv1kVLt4PgCX14dGiO9XynKlQ98OxeWn8=
X-Google-Smtp-Source: AGHT+IFkqZliIsZtRCNZPvKJ2k+bwRt8m/V9TgUCZlXWy3Yhe4IyvA99Hp8H08ozBRujUcKubFPJwA==
X-Received: by 2002:a05:600c:524b:b0:477:bb0:751b with SMTP id 5b1f17b1804b1-47a8f90d716mr120031825e9.27.1765816728371;
        Mon, 15 Dec 2025 08:38:48 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:47 -0800 (PST)
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
Subject: [PATCH v2 09/19] dt-bindings: i2c: atmel,at91sam: add microchip,lan9691-i2c
Date: Mon, 15 Dec 2025 17:35:26 +0100
Message-ID: <20251215163820.1584926-9-robert.marko@sartura.hr>
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

Document Microchip LAN969x I2C compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index e61cdb5b16ef..c83674c3183b 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -26,6 +26,7 @@ properties:
               - microchip,sam9x60-i2c
       - items:
           - enum:
+              - microchip,lan9691-i2c
               - microchip,sama7d65-i2c
               - microchip,sama7g5-i2c
               - microchip,sam9x7-i2c
-- 
2.52.0


