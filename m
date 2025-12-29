Return-Path: <linux-i2c+bounces-14859-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6D0CE7D75
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 19:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 166DB30136C4
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 18:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FBB339872;
	Mon, 29 Dec 2025 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="nrSYBFVg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7516433986D
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 18:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033631; cv=none; b=uQ3ydrkZr7wiGtyyd5pdsSJK5sEeBPohq2Zu9gz6SsE1SyhXh5CsXsyk8dbt/C2UtdiXAm1uDcTuqgXwlVAt7PNUlflgvbuy1SZ/h2WABifBM7GpOWrC8iDroXrKQGpcd32armTj13fSovgb4UPVDDwm3b//bVYs72hndne/K5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033631; c=relaxed/simple;
	bh=zUvrtsolEdengocgVlyXQxoSJXOg4mGPqcC0PLdIbPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AFFZ0W28lwdkk+B4j4outJbWDIHYtdbVJXr2W/ZMyyR0D1NJpexwN3g7Llzs35fj+IjBDQxUfX76M3PGXyDhKS/zuRh6GFVACV59BU8zGbM2wgwVsAZX/mHTNx1U81FaiOjE65ViODVYXZsEDieakJdHYBPvIcrrdZX5e3b0w9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=nrSYBFVg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so22430875e9.3
        for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 10:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033627; x=1767638427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XldW6lxnsgyAezmPBHgoeGUpbHtzZudWE9rMzsQl4gQ=;
        b=nrSYBFVgIwnAefLeDPgYgl8LqPiDckGltKlnnW75XVRuK+1yY9xg3gh3tZq8mkufWc
         bhWiM36cUBWMUAHYQq5VxaauBN1JBIGM1CoAC8bv+EjP4ME/nR6R7Y2d1Atbm5cJQNSE
         YakDsZ/R1kZY+j4wBQsd5PAXPwYKwrwuFRZtmYDWxrtbnG27rLcX1oBpHJzbZkBOJeRG
         /O8465TNdb93NZorMxyrz+2AaTqkqW0Uztj86TFG1zFVqHK9e3/M7xA6e6pQgFYtDjDu
         S5XivWOem/+RsxE7b3hkn3aI+uUJz/5pGcDpvkkbhxo4xpt3Fb/AMTvy+Y9k6ba8G5Sh
         L9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033627; x=1767638427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XldW6lxnsgyAezmPBHgoeGUpbHtzZudWE9rMzsQl4gQ=;
        b=NaFAH0o6dZCgyT4Z2irileyc4sb3gipUPvVU51PmTyIF18R1HTmgQoc85sWOQghWgw
         apLWnttOykGW7uZC9OTOj++5bDSpUWcIX1XaL1xhM0s1lZllOO4NR3mN0NvXrJjUDgBQ
         n7mmS+VfIY5rdmtYbqotE0vhDxcDZwNhOjlj1+Vm+n/7JdN2+4iA9AmcEeRDN8zcB+RX
         Y7/rUyWy35Lw3pvBqZPVIjz6OUngxp6maXgEacKT809q+MHmT25N5aSoAcJQg0g3otNs
         0SwveZNKGK3GMQnWY3ajS1z3Ki1taKfb3loohPFDGnXxj7FBFyLCRGLuUDT4QBVbHYme
         h/rA==
X-Forwarded-Encrypted: i=1; AJvYcCWo+AzOCzhkwKxGVRvkQVO57R0TYDsnRVQPOabsV25VavVIoLi4iRnMiFfNnP1KbqvvIFctGGW5R6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCoBrSc+D9MCEs70X4qnvf9PyCLET9qyohFWaQrrCibtIqV0A/
	e1iyzsYoNBGmiiYVSTmv9L/EB0sZh5DcJEtrhIRV9wA84xzzfperGV5Cmvi1QNiHqgg=
X-Gm-Gg: AY/fxX6MRD6PZJh0i/v3rwqvdxwRJfGN9Zd9YV/3NSJrxhQ149/UM3+Enxlu1bhxvXx
	HcJXY+RPAL/z3NqpfiaqVj6IZ9uCKIHjQD5qwYOAKv3ZH0EvR5tKD5QpfvmddmcYhZc9ARM+TyA
	pxUYPFKAmgHaW47T9uXaTKN9zycputdVsBhziRWYA0t5785jVeFT5tdHezSeLqOsBh7OtrcOMBY
	UdlWpM5WqrmdORw3Aq6rcxrq5A14XycGzSw15KppDngihNSJipwzSVnGdIqCEY8/s0eGah1gi0e
	XQ3xTTH5QkjimRQpGmFch2aRRtL4Zo2QU7cHHldkArPo/BldciLpWrlHO0S6Hy0lx5i7tX9HhTH
	7DDIe/xt5ZaHYB5hZRQvx40tfRPxqmcWvkgsnr/hyNdExlSCx9o7B92WwyyfgnSXSse/FOn56u1
	xB+7BZmGEAqzgRPsyVsB3RjR2MmbIrVUIncp+coUbsv1qkojB7CvmAY2viNmYu6+GkewEOsZJOy
	1Fr9C+BRmHpM0qof5HzeV0xuBNw
X-Google-Smtp-Source: AGHT+IHcFjQCCkIHzURsiMd4ZffbXQCjBanKlfgaAMAIAjZSkOlosZ6OaPn7ElCbfUOqooZC1IjlJA==
X-Received: by 2002:a05:600d:108:20b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47d1c038664mr255230805e9.28.1767033626661;
        Mon, 29 Dec 2025 10:40:26 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:26 -0800 (PST)
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
Subject: [PATCH v4 07/15] dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
Date: Mon, 29 Dec 2025 19:37:48 +0100
Message-ID: <20251229184004.571837-8-robert.marko@sartura.hr>
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

Document Microchip LAN969x AES compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

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


