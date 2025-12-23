Return-Path: <linux-i2c+bounces-14746-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE038CDAA47
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 22:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 518D6301D0E3
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 20:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EBF34D927;
	Tue, 23 Dec 2025 20:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="UajBDKTY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8960234D905
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 20:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521210; cv=none; b=SsOHzngKo/6hLxeU0EZMUPx+vioDnKYuJQpSnoXfTTy2AcWx4xDdbmcj14pIX+6SvWEpyr0OEdWsk2/Y4OobyWjT5b+dsDahRqdxvBfEVSbFyFe9QIduOhmKn/pP231Mr4tOfAaE3I/EH6Sq3IMWzRko75JdP0NLVjHk1K4wTUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521210; c=relaxed/simple;
	bh=lnkhvIt3TrOEyzf6TQ1BG1hfakQAvNrAup7QLQoickg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UosRETbK+PTVPg98Mq4M7RCpci9cxJ8lkYZAjIDhWuV3/QT7+ShF01ZXqJxTTf9EXtqDC4U/vKulr6ZpYfuJCYI/p4MCcbGcOS3ThMwYKcU+oqcumCa5U/NGzIRx5Shksb6pKARIwjFAyPmvATuJ4BaopJbLcGhnVnCFHjUNfvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=UajBDKTY; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso7426897b3a.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 12:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521206; x=1767126006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akmDQhsi4smXKOu+AQ0134jZY6Y2uyR0jebUNjrF2nI=;
        b=UajBDKTYlKcruvSkRnlFr8tjHgo7vqKYdeF6g6i2LgrtBlAxi/x6/j2FzFA7aa8IFJ
         zCbk+kIU9UJjaY8OIT95qG20Y9itoXB0IHgRnrBEMTEvoYeZOBFiUZ+FDnpmRXib51JM
         VlieXBhkKajYtWxLUzmgiSHsdXHz3zT/Iqy7FF7c8goVaCwQ7p9fsGuBegWYWqK+Jb8n
         9jJK6EEPqAU5wS6uLrfhFlUXf2YYvHGfb6tTbrFyqsIqLuSPy6BdmhvfuxR/0v/GvHPn
         PnUCBlucC/3gAqVgR3ks06eKS/hQ6am0E1QuYjf8Chz+G9uMrPAlcGrBGz7oOlpk1iTI
         ZzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521206; x=1767126006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=akmDQhsi4smXKOu+AQ0134jZY6Y2uyR0jebUNjrF2nI=;
        b=GYyR4SwGSXXZMuPcqgmcvQaQfOzx+Mk4sIFodr94bYnVEVeAvSmntujy0iDz38Ev6S
         pwEC3nElFAUrcvreTkx/uVVayfoV9pIuEDu0OkT6Cnv6pAFHwgX/N4XEFPkl88pRRGd6
         S1yBzTVMAj2zjyzsmyGIV1HDeIMHSfEWP8FyJWWs7KG49xTiU/zWM0tSfDiD7CHdndJO
         9Rkso6OWzXvWKUm+8EHbyBRClRaTQtsC67+cgx9p8lKOH7oq7mY3Qc4vUCN0PUAjYfwl
         mQoXSsiqO3OzErxH17d3gP9D+DaeOjIVChhmmBxA9pTf7XzqF5flOy5p0XY+4vjOSfgJ
         1cGg==
X-Forwarded-Encrypted: i=1; AJvYcCWmXsIOYXLH9ducWxztcO0rCwSmxKEQEhDJFCQmQwn7QnoC7qT4FKoWA+fZcZoExC8KP0ikmcYa+yU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+QJU4mvx/crHW3eqcP6IfxM5srDRvQS/E9oJHbJc79jWF1kRS
	1u2SMCCvW9d7gbzSeFjZQaA1WWSsEYqYhnGkvi4+P/pTHTQ+GLTDhqTPBdTjT034RHw=
X-Gm-Gg: AY/fxX6ZSQTXLhqN3whXaFfCQu9exJKrNFBNGLuEgKjMhd7NZJcGQ/GCR3wiBxe5QUs
	OlGWofhTdiTiyWTnNfFy3q0DIGwVkDk7nFOn1LFssAgdjCngdo7gppEYPNO2xIEm37zWjhbfYrT
	dMcTGYS5iq+rGApEUxl0MZhiwvrfH0eEYu5LUwTusZdJ6lQDXP5AM+PJjvieAtHLQK6w9Is8FIx
	gLHFrdPNYNRUkbi/MeMQhywIVl/Ay6uMMCpU0vKzg22UbQ2V7Y9lTQFwVBnEEv2PpYlPoAjCCr3
	bFPqhJuOpi0vqUd/BGBE/iHjFye1z+KY/AKpnLbHzsZdmV/jK85k/jmd8SOY1229HE5nZz31OG5
	Rnp59xrx3SLfjl1G92zwn2t7C8TjTOfGdIhgV0LZs7T/oUXuS8k7fwrESp2pVcscwnstGyrkUyc
	M7yEw+iVaJS/FIPV8rEQF7alEw4jsHgxbwqpFl8B7LNjeOoHzOkJ/Adb7AAzJU2B7nFFKR+HpgB
	REFRl2Q
X-Google-Smtp-Source: AGHT+IEAtWdhcWPCbENBvZFgr3c7IxJWeT0r5R2X+lgPN+f3cgKBnmk37uhjXoH7niVY6cpG/hJphA==
X-Received: by 2002:a05:6a20:9146:b0:34e:959d:e144 with SMTP id adf61e73a8af0-376aabf97b6mr15698314637.54.1766521205797;
        Tue, 23 Dec 2025 12:20:05 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:05 -0800 (PST)
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
Subject: [PATCH v3 03/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
Date: Tue, 23 Dec 2025 21:16:14 +0100
Message-ID: <20251223201921.1332786-4-robert.marko@sartura.hr>
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

Add binding documentation for Microchip LAN969x.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
index c7d6cf96796c..5e5dec2f6564 100644
--- a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
+++ b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
@@ -20,6 +20,7 @@ properties:
       - const: atmel,sama5d2-flexcom
       - items:
           - enum:
+              - microchip,lan9691-flexcom
               - microchip,sam9x7-flexcom
               - microchip,sama7d65-flexcom
               - microchip,sama7g5-flexcom
-- 
2.52.0


