Return-Path: <linux-i2c+bounces-14862-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D724DCE7E26
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 19:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 159143075F24
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 18:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4292333C188;
	Mon, 29 Dec 2025 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="js20qBKl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E8A33B6DA
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 18:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033636; cv=none; b=J9VhiZ57qVG+7hMJZGiimcOYrOHiw7De7e2AoP8Bnm+3eyDBYQ82oM05ZVuuj6CZB3lo5eStf4oeN88Rlxu2u+9R+wNhpWVaqeoqN0QCPD1/cqGQByPQaDGyglluOaNVoLptAc1N/QgtcmKyB/rSABel8+fQY1JSBXLzJjB0Eo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033636; c=relaxed/simple;
	bh=omWUVkHfDgWK8/wVYsqR1gmKx3uRcWW/S7wsFlqvQZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSm5aG1M65CIF2TglJviYynsxC74UwOzPEl6bMuJTtAWvBUVskx8/ty87HlVj/SQfogj1P4dmAUyZ8vmEq7sJhCnNo5oe/b5XlRU1u36/IE/WaCcYuiDnEEa/fJGV5RTYM+DpCKAvizMncApiyRNgOamQTqYSsk74eYjIQ1g9+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=js20qBKl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so71141085e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 10:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033632; x=1767638432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=js20qBKlOIc8p7LAg3ojQzBrDVa9hnJ3iwdqCsfn32yFz3aInQM6QoNK5N/ROzBK2F
         7GGCtwcKHJrg81RR8yBIoLsUREQkvIHNvhSZ1Uyooa1SkWmuCNLxf1fM7yTIF/tSA5xd
         VFlGqY3EMA41aCFoQleCr+F/kX/Bxmhq53oqbmeTatA6OX82TeqOt3nsr2uNqBEqrl0k
         nBsY0OfjmzG0AqlPzNx6ENwwoGPvY0sYVSF5LPWB3Vob0xzKohW7DvCBZ7tTFFYgAJ6C
         HU5bjhYy+qoTsm16Nc5dGsdDMwZMnkSPDCi/zwej+DFJ6pcf+YNfvG9ROfUQuUhCz1pP
         LuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033632; x=1767638432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=wq/OKXWTTR181efLqgAmaPZhEiCgfVVFvkdnCxF1Y2UDmT8DfhXnij3geKw/PFKmFg
         Sz4pNhgGjBYCMUJrCPm18vhIAQN9bsK06Kw94log05z+d6iMTKGm4MtaGlhoRKPECh6p
         OZkVQJlY+h2Cx7un1j70xhVnPFd62t+khp68K6DEis+K9krU/pnTZHHg19A3k3DB3lZ5
         obMziXCU7NUVrFpZTJ7CwWlYojG1Uok2ASM8urmfYNAGvsdRSbrffjdYVEj30LvSd+kE
         JgHP5oJ0Lq49KoKsY+ZQaZhlI+Qknu4ySrrU9j41Av5tgnpOURc5hmX4fy7/1gHBaMir
         HVvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/vo+7IjTmqVXVGJOZ0ha7iru9++wv7eTKm4qtVy8zRIzCBB/rlp/T7hkzAIhjrURMw1kagcQ8FuI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7uOhVedexGh6YDjRdFMkXdT6v274H4TtNsLAyU6ThBvAJ4rHk
	xIZBAh0URDnA0vr5c7vvYomEVrdsbwXHfUqs1u1UtZbjWmvIs76lBNcLlHqdRheEfp8=
X-Gm-Gg: AY/fxX6oY8j2tVABgVQGhGo6SYkQV9DQ3y5GldUZHmITjcC45Jm27zqRyc3l52a1whw
	blxDjwM+c2StojD0EMTKv95WG6oZeGysLggTviBKhhH658BNhbWOckZu9XD86q/3XwahnQu5To7
	TepKlvesGKQ1ScNYEyIW+ZzAVD1Sv62qlGejHZkcqLrAKfh9ja/7jAcHTm3r+Bxv6ta032tLtYs
	LXjzK6VVzOaArmGornkSHXfDjk+6y8GlcSpUYBNMEC5SjbVFTdV0SBT57BiTkvMH+RBNioZIXLG
	4R+LCYYXD+b7p4V/MtjWcGBSZkgMObbxHmJZRMdCawOhOiRuOTU/CODEp9XwVhPCtncF315PKkK
	hW+NFye3z2QOUpppcUdpdn/WG3b8dwO72k9aSbQdBZ0FhR19v21jB+avHMFXHhCxLRKY1XTrfFj
	njrb7DVkdCjP+k4jUbbTuOaXu5zyHF+RMFuupU/E8w2dUUU/xQuQcZlrNyAIrxSC0ueMQ5QgF6C
	GjEcFplw3Rx43I5WJk/08bYPRDi
X-Google-Smtp-Source: AGHT+IHMeEPdVuxCEsr3HbzwXW9O9zK0z+wZ0vfJLANR2lbSoc703JFfFuycpKgytpooUs272ghcDw==
X-Received: by 2002:a05:600d:108:20b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47d1c038664mr255232695e9.28.1767033632356;
        Mon, 29 Dec 2025 10:40:32 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:32 -0800 (PST)
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
Subject: [PATCH v4 10/15] dt-bindings: net: mscc-miim: add microchip,lan9691-miim
Date: Mon, 29 Dec 2025 19:37:51 +0100
Message-ID: <20251229184004.571837-11-robert.marko@sartura.hr>
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


