Return-Path: <linux-i2c+bounces-14563-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40097CBF26A
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 18:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 904033023E9F
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 17:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D210335BA7;
	Mon, 15 Dec 2025 16:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="Ak7lyKPT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4693933B97E
	for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816766; cv=none; b=O/jxqzfwJOPBZ4cmz3KP/T103NoH/gYpd6zsmXxD41YDvHpLBdqG6umluO+DCVdw6VnKIn8FYxxjoPLIIpa8qAo2pmBVTvAn62wCz9hpAr6cPGjMqvS/HWtw/ROQEgaBaHq4MpA3FQnGo/5n9OSjPA9hI1hOj5T6FZLXrsy/F/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816766; c=relaxed/simple;
	bh=MatarePl5a5XyouzXF+9ZryyErb8D312+5WkUP2SbUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NRINOBemVQJLAGouwqO9cAXIqmras+/NmMNNEPOMFJ6eaMphWpAALAncLfK3ehrJLRk4mSs/FCcVsUL3HmmPddglhP/SOS5PZz6ugSJ8R9me9PMaCq0i+vdEDWJ7NWcJRFDnS5WhH45k5evoX6IoEnrsy01keiojyWe8MDDA7hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=Ak7lyKPT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso16413645e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 08:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816750; x=1766421550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8YcHY5v5BL8p7Cq7PHlLyAS2e/CqidtOgzAnVomKxs=;
        b=Ak7lyKPTdvJT/5Yv+iN/8LSGRVf5YK/mE3nJ40Yv8v5WMEygg6FZqSllz4L9oiC6g6
         cVzdeYT+IXU2lNR1S9VuWsHsONOsbxwjqKUQUGF/bXURX2ZECo9CEKUcMdm4FbZocUdm
         2i0wVhkFw8JWyji/ASYx2hz40xV5ycXhF77Uo11OdNHF5/+f9r/2mQtbTpjB3TSfXh6L
         YYQkoLq5+xTuie5xaF48zIMd1GQKQg+73FbhoRQhJifJZ1gSqMtPxYHCa6AzJ9AD1/ab
         oD2K8HRM/EnxuEWq/plNpjMA2kCTVieijCNKzQpUH7KbXIx93gk1euQD6vOPM5SzUX1o
         gsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816750; x=1766421550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h8YcHY5v5BL8p7Cq7PHlLyAS2e/CqidtOgzAnVomKxs=;
        b=LR9m9ZXBbeqj6EkL+JYQYHxzq8/MuKUBaIb1ObJQFmTU149cpTiRbgEg+YLXjqAsZj
         8N8P6CKwGZLSeQK+Uuy4rbse9rv6ZqM/UQtT++CaiI7IYKStqLRSTvYqO5ZkHUt0mEih
         N6UksoIyoD+lBTcgZ9tylbB2CejT0hZYXRu5ID5aeaxTbc3e6KDA9kanReUAGoFjYvG5
         Oys4sYNh7jPEAedcZoM0oG4lSvg4cKvyeaG8suR3Z1GcUGKc7X5bZBtnzL2K5Tipfjnn
         bxbUOuxGG4bSeIPApncNwTLmpZyQb8ui+GZHh0v7W933rjqy/s06GCSv/8H4cDdqo/Rb
         tLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdRSwjCqd4tOvld2bmmanW4oJSa5HprptqsIrtltMsvty6RvoRE8Ln/COPfvcVuNDW+r9/IHfVn2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjryeAU6y/gh2+x1KyE5um9toKy+KTUhSH8wtEzJrK9RfsDRil
	BSAidzrKa4J0Myc4iyXAA8E8orc8aMfpkXUZky/8MhReYsesQ/EFANU98l0Ed8FDGt8=
X-Gm-Gg: AY/fxX61mhYERZcOsswMp66lrn3wGLfYjeHwn6nBJ2xwIErT9X0HkjuTKTEioGaRssl
	mU5pF9WVsyBpG9QBXRM8/bIg5Ys3xS2rqWClk/a/uH8us5pXh/w865XZsEb5oKEFvncE3T8Rsy0
	TnO8MxmGjG/zGJqnCdbrHOPey1HGMaLTQJF+FZ1dHhL+0ZQ2mw0YVDDmmZlHA35nLY0x0Avp2d+
	iG4YkJ4Eiqh+kOX21msdO4kblB6CjpZkP8HYPoH2xRam8uzJTfjPz81T9Sss3M+m5fDe8FBuez+
	rGQTlbQshf18Nso0vMlCTzoRBmPnII/dzsU+v5nAMExB/3xgbsioEDHKh5vw7UrM5TBWolaQrJu
	BYy6W11BYaA6F7SBkCUhEDiImC/RTAmWPD/1FOhE4oPGhIXfBLMvbQPPHfVu7htkkMwaBG3Vr64
	qCoJFuc0eyE+vUW3hcZXa4ouF2/4+1hbJpoAyBluuGeJve
X-Google-Smtp-Source: AGHT+IH7LP1zL48BN4L4uNrnTgDczVYK0VmpeljjcZUIjxNDtnXInUvDJihsME7YWq6t8mes39E9Hg==
X-Received: by 2002:a05:600c:4f86:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-47a8f9057fdmr118557835e9.24.1765816749513;
        Mon, 15 Dec 2025 08:39:09 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:39:09 -0800 (PST)
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
Subject: [PATCH v2 18/19] dt-bindings: arm: microchip: document EV23X71A board
Date: Mon, 15 Dec 2025 17:35:35 +0100
Message-ID: <20251215163820.1584926-18-robert.marko@sartura.hr>
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

Microchip EV23X71A board is an LAN9696 based evaluation board.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/arm/microchip.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/microchip.yaml b/Documentation/devicetree/bindings/arm/microchip.yaml
index 910ecc11d5d7..b20441edaac7 100644
--- a/Documentation/devicetree/bindings/arm/microchip.yaml
+++ b/Documentation/devicetree/bindings/arm/microchip.yaml
@@ -239,6 +239,14 @@ properties:
           - const: microchip,lan9668
           - const: microchip,lan966
 
+      - description: The LAN969x EVB (EV23X71A) is a 24x 1G + 4x 10G
+          Ethernet development system board.
+      - items:
+          - enum:
+              - microchip,ev23x71a
+              - microchip,lan9696
+          - const: microchip,lan9691
+
       - description: The Sparx5 pcb125 board is a modular board,
           which has both spi-nor and eMMC storage. The modular design
           allows for connection of different network ports.
-- 
2.52.0


