Return-Path: <linux-i2c+bounces-14747-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB56CDA7E6
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 21:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E764930CA54D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 20:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B34D34A78F;
	Tue, 23 Dec 2025 20:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="mknI3aHD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D86C2D5C68
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 20:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521218; cv=none; b=XGI9KSozbyO+DTuwIgIsFjOWmssoj0qe/3sfGyJhj4e7WhZM5wzuXo/1uCU7DZ01tAJskMbJJflgyLsUZ6aJ8HHr6q5Do7Aqy2U+G4lpr7YAESgaYHuojb2hm2KM2FVxx+alWqUm/PRRAD5D9PP/Die16NNOGZRLqSDwx2D4wy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521218; c=relaxed/simple;
	bh=GSmfufS+BjcFXAR7DhKTmRXgeyl65npdKjntCPPDfHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lqK2ov5MaZ1NecH17doTShs1LSvh+FfcZ7X8Izeq2F5G7NxqsavyLVt/AthVUqgnjbnanTHD30fUWfbMO61HM9QIsPR/nX2KQObhdu2vf3Nsj+W+luYU/nLQ+zkvxgzJDPDCF1h2cYWSxwX5Zr7HUpIqnWtuLg1xYo8uqgdR6MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=mknI3aHD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7fbbb84f034so3954514b3a.0
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 12:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521215; x=1767126015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=;
        b=mknI3aHDk/xx6E1DXCAkhUtT53KYTa8H/fy7ZqYi5lMAYZ2pnjDOEBbpIn+PxzsEih
         Wi8gHCcxw6toR6SqJxa0bt8CxPRFrw2FGeuOBXtyqNd/OiX8LDNzXflhB1fmTCJggOR+
         YGkdiMbAf487Cc3/wOyoWB7V8JvpTpMJwDUOtBr7clyUt5ACpOC3y4DWtOmXN/0bgspv
         S+1LRRlkfT/LfRuRi8mvNfnDrTa7d0Rz3fVOwnNtuYqX9hOvYGnRNM8NwkprFzIiTiGt
         DCBGCog1PbUG/q40amKbvFtSJI3QV2PfA7L1Id37cDtu8ahGqYpYnBl3zRj+quKK05rp
         MSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521215; x=1767126015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=;
        b=EjO1mrWUr76gBQp1hBuHpnHHQitZ6dYMwu+GAoQz1ASRZDTyl262zVyDhbxQFvwMjR
         aJMZGauPIhlqHU7yIXpAzSZL5GtJhAHw8oHGu9JuEBWGILRMlVEhA/XcsCdMc/DNbUwR
         f5FDp4PJTRB8PyxIC4AWY1YmiKoQC+O5okXxA6jIS2TQU84Fa4XWxVQ+BmTr5537Y+Zo
         fBCQ2FeIvvTf8a73rtMMZKuthL72VTtbdq0OhJ53KQW46T18xJZK4ft64/ht20bDHoB0
         +gSnzuto37fImmQiCEHVnNh8+PoPoFn7RoYDpe0UXeLRxKFsGlemX5VQlgzwV7xOyWBG
         BXNA==
X-Forwarded-Encrypted: i=1; AJvYcCVHxinhiRRunK6af1Wc3RssODWYmF1vc3Y3xuIpY9hcHAi/FauozKiN9KYZORtJq/7/+QVHDt6LowE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNQ8gsCEce5W9OB8lgwZWpDhhOJQcZjenjoe8ZXTrVfDc0blUg
	H1CRCMp1vkOAqzDA8cfs8sG2SPJztUk58Ef3Y+3Kr265Ao+bu6dcexM05cu/MALac7M=
X-Gm-Gg: AY/fxX4gIY7bfVhsQjh2izutM18QrLHj9AdkDZQ7A+6luanmGDNvLc7z1bPxt1R+DqE
	R7oDuP0LNIgRKR3SRv0JSzRu5itJNNQdLGq2/qOORjkc3/Hz+nVAYJj9LKCUDAhmBMViU4FBQSX
	ABhZdZPvlKxqNMCab2Jay2E2ETexX4cAim7D0aGZtgldzmjUNH84AXBjZNKtiycEQbGNAS4n8Tp
	JpskrVOvPi4BKXaVBHwpfU9x/Rgq1/lyXv36sD81KhVTwoRruhDd1jItiC/LLksdLnYw5K8C2lz
	Vo7qC60mlH20qcsW/joozpIsUa40sg1+pUj1OzmvwgpT06L5UzEpsWWmiIHXsPsHuQrkVj2QdXK
	kf3bBwJJZ0aXZm6oNGgIHt1Bdt1mYwiKMD/g3OiRUcDQWdHdMa39rNpLk+SkzVEZxXLa6X5QWU0
	HW/K0Tp6ViiGMt1C9TS/vYq/qtoop2GxNmwVg6q+V8ycvDTVemuViqhCjRteOq6LAmUZiRJXm4+
	KRBJKgl
X-Google-Smtp-Source: AGHT+IHTipKQ2GYkfIzCrgEkT5HgaT5cetpxH7RTkCWDpkBy3UcCKVeG1Kf0FvBM/eI9Sln/VDayPg==
X-Received: by 2002:a05:6a20:9149:b0:347:67b8:731e with SMTP id adf61e73a8af0-376a77f12e8mr16762772637.14.1766521214766;
        Tue, 23 Dec 2025 12:20:14 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:14 -0800 (PST)
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
Subject: [PATCH v3 04/15] dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
Date: Tue, 23 Dec 2025 21:16:15 +0100
Message-ID: <20251223201921.1332786-5-robert.marko@sartura.hr>
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

Document Microchip LAN969x USART compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

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


