Return-Path: <linux-i2c+bounces-14551-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B0ECBF0CB
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 17:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 161D930B7FB5
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 16:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B185337BB4;
	Mon, 15 Dec 2025 16:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="ZR2hFQ8E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF5531AF1F
	for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 16:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816732; cv=none; b=lJZje9cZVn3/pMn2LvkWJDo9SfpkZZ9fc5v6s0UdRvrWTahPEJ2JvUE8sELqAYasLUj2b5j9v4C3PSlEDo0SdJAt0pl0nfUO3AEBDy4pLG4dyLFPe3XHuFoZCz9Ku9CZZpVIkyJeH310z/eI0/HqJORL4uR+h8ZalFgagqOL1vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816732; c=relaxed/simple;
	bh=71vt4iyiLZEhN77G8cDPBZ3tS+ZW0JysnwtVg4Nk/+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eyLLXzIpSKGUL4n6/qK6SyPwmg6Hm4IfLX6RS++Z9gNlPuvbwW7JDRhkpw5lfYW93W7SD5m/kw7OvlYcIK/65yZrUmAcCtVgg9jNjcaBAlao5kOMvYeC6O2Rq4viJB4tKRLDWGibCeXeQvk73Mm+pL21vL7UVklDktneWhGZRdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=ZR2hFQ8E; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477aa218f20so24300925e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 08:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816724; x=1766421524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhZHb+UU/3uI1zhxQGkYOMy2iOjOd7yGE5qR+fmsO/o=;
        b=ZR2hFQ8EE14oGueyiW9ZKeCNVEf16QNkEo5WkatjheEPmXvl7ymhA8dsYlgoCoUFpO
         G0JBjD0my2hDkyDD1bKay7O2yESjV1Ycb4Oc9qR9az/UnPJtLuRIB3wvRkQNuarmafk/
         tmN9uxP/RDWnozUp9hseevemJsQHJnP8zSx9/LQM+LbL4ykX9dNQb2JgkWzSpf2CK6GA
         IKsPY0AxDee9H96Zz3+irzWfjg2suiTW4kRMPje2G2zRXF4+w9VDHE03DKZ4Lisf01Ct
         Pq3uyZeglNn8Ik3WHr/M0J+96bkPqLIcuMNMeP2ilD8gzxiDkxXUUxKDZbsIPMzS6smC
         OSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816724; x=1766421524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lhZHb+UU/3uI1zhxQGkYOMy2iOjOd7yGE5qR+fmsO/o=;
        b=Eu2GK31ErzYQdlEdvNx5NOM1M5qpHx3pxCpbw1QRJRHaF/WSeyqHXVsv3EmbwBoWB+
         nh0GekYZ6DFmXlPFMFtYWlXwat1H8nSEy3fTjRY/yb0/Y5OQNM00mIP/P+D/V8ziLrOF
         DY8oSVdKkxVVFTW3DDb3Qvan1RCa76zpUBJlR7evDwlS4DySlvV04atrXm9aIyQ22bOk
         G+V/0TufM+NgK/DmY3GRb3Lx+SIFL3tAnHTlcdw9zWej2eADVUt26cB8j8LWDzhXiAD7
         CnsAgo5VczMGqbfLu1Oxj7by1nNPSMxcN+1F6rxcODz9ed1ML2USCxKjZiYGF3kA6I//
         lSvw==
X-Forwarded-Encrypted: i=1; AJvYcCWgEoNHBHVLUBR5VsZ7HuiO0owdke0pKfpm/FXGufZpYx495Xyw+Adq34UNoLAExKUGwhmM5ad5zfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLHdHcyWF6xZPxQQN3bSXnyzmEB4OvZbnUGaNot+SAzALWpQJC
	OhYUvE5Fr0MuCas9dQj0LZ4IuNemSIF9I0KogYFCctxT6nzTx3ah2uNUN4jt5uVdShk=
X-Gm-Gg: AY/fxX7nrQXZDdjSLmDmL5Bgg5feZ8Y+h6Qg86rV9Pxaq6UCbNiPQ7319Oyeh+D9bWc
	drfXhhHkfRaPxKUdF+8wS0TgUlnRjIzAVQxdG7Ubt8mgmmTfne4+JgbztcLGkBiAH9tYRpO1aOn
	Auh9IaQkvvwR3OmDwClvxHModPSsEiuqrawzKMU3k5awe8YeXKLqqsUYASpfQsQylVV44ShbR5b
	7EPjTUCiJlev1U8ASQAF6v5nT29AbwVRmG9MuPyArHrEOd7HQFO195ZbcImvySt0Q0KqLi6OAih
	bRMAk8z3hQ068eFhVgi/PD/IHACIihS7Y6JqBDETT5Hnmmeos8KXx2MpbFTEWEnDDKTp8u5mhRm
	1Qtf6nkfZOXgR4e0fpkKKPkxNnL3jA6mU4oB9dSdhpWtpox0gNRKSA72GDFFPjyNhmhqSSGjeHj
	+TuTOWMzWb5NWkIN+WllC17+XkJ17HCrvpiVHtSdOS6vPW
X-Google-Smtp-Source: AGHT+IHtktJVK1XDeqQwSAII8bPqSZeOj9G+2EJJX5Ej20zke2p/ReS6z8A85crs/C2GxQTMQp3S7g==
X-Received: by 2002:a05:600c:46cb:b0:477:7a78:3016 with SMTP id 5b1f17b1804b1-47a8f8a7f0fmr122138175e9.8.1765816723603;
        Mon, 15 Dec 2025 08:38:43 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:43 -0800 (PST)
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
Subject: [PATCH v2 07/19] dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
Date: Mon, 15 Dec 2025 17:35:24 +0100
Message-ID: <20251215163820.1584926-7-robert.marko@sartura.hr>
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

Document Microchip LAN969x USART compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
index 087a8926f8b4..375cd50bc5cc 100644
--- a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
+++ b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
@@ -24,6 +24,7 @@ properties:
           - const: atmel,at91sam9260-usart
       - items:
           - enum:
+              - microchip,lan9691-usart
               - microchip,sam9x60-usart
               - microchip,sam9x7-usart
               - microchip,sama7d65-usart
-- 
2.52.0


