Return-Path: <linux-i2c+bounces-14550-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D83D9CBF0DA
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 17:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4059830C6A6A
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 16:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CEB331A6C;
	Mon, 15 Dec 2025 16:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="mh3bUpSK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032393314AC
	for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816730; cv=none; b=I0QkaB3tjbVOeCjtzIGpN/nZySDQcFQ6dQdbq07im28fy/iwtpTGw7QH6OXxii+VdZodEZD1aQm3CuNT26fIJwOUjAm48RXyomfAXxXsUOkyRPwCKFybeyVyFP/mBXcmgbttlzl1ODv+38Tv9h8pqbFvdCvDD4A7odCDxVhs40c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816730; c=relaxed/simple;
	bh=Wi9AS/Q9Z9rJWlYN+9bptQ35O1l7qMfPD8Nl+Hhabzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNx+BWie3aPmGueG4cMNDkCtNPs5z7ZOMH3esfT5BdtDZrWE22GmgwhEQVntCUP7H9FAVj/AdtOUDdAO+n8mWjwRo929dmh+wlu8uIEBq0opnrop1FAzq3YghGpHp8yRpehbmPya+AydcFPQSgHh7V5hvNzJxEKFluZP5EzRe14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=mh3bUpSK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47118259fd8so37293235e9.3
        for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 08:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816721; x=1766421521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dr/KALHxcw299I9hw1j3lrM8oXcQDyuqwKf9keXmbo=;
        b=mh3bUpSKu6JlE2ZCje7XOGuaHUYeu2cxxu+IFs9v1wVAGHi8paQTpFs9+NH5OVCp0N
         IaP1HdtWkevWI5zyVvTj1IT/ssgm7NUeftrGx6xtKwNhtFX3HeSnE2DO8hvKzvkvMeqK
         bZbhFfk/QeR0QJG8UnZ8noCrwYcXUu0soBEQ/4uABPC2yg0ey0hv1kKgLI3f4Li5fb48
         R22A9VIhPq666CCEvipUWez6Zxxu01uB+fdRWpn7Ka1i/uiypH1W0PqYYEw8+Rl34yz2
         JtFz/ipWF9b1RitIgLBKMqQMVUoZyjMQPSiOhcuTPsd90t1A2ohaklznD+C81YD7CK2a
         4eQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816721; x=1766421521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2dr/KALHxcw299I9hw1j3lrM8oXcQDyuqwKf9keXmbo=;
        b=jJF24TWNWnp4vpJBRyYzxzzRR7H3sCE3WCs0IcOsmw+fWWSLJgppEVsaH1OkVKpCTe
         zb6i/x+RMyi+20/GD0s/i0hYamMVGQvt2i5N4ajCt9T6WrHFi7BiWH9P0silS0oA6Ube
         /8BAlay2QbKGBjohwDjtAkvNTl5THDcz33c0hYlXdbGbpp9AJehNAEsFMLt3bSEOAcDz
         Ivs8Lw1dJK56bi5OifTkR2iQX0Lb99MIMSQm9F42mvL7XG/EyjuT+AcrgXUu/QQQ1DkG
         cuq1V+W3XmGW1YYCK7GgznZMta9OwEd3Q94TFsT56kvzaA0Q0rrLSGEz1e1LVV3erTZQ
         sJTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf41a3j+q6yOzebazyzBtw0p9pc7/kN2g3eHeV52OkycSyxrIguK5yuHq79a3KwPiO+J8hzuiTEVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKd6eDBcnyYRdr5N65CH4NdO2bA4S+W8kbFpRkCP5dzETQa8rQ
	aMda33BTqkAlMVbI59MmFMSVqZg/yqRzvRVNvdfqXFbxOWMtdSEGWZg1sUuUNZczjW4=
X-Gm-Gg: AY/fxX5Akn4MJRpouhQ6zF0L+uYqEAJ0X5Qf8z/sUK/IrH/cULW9igN3dhMc6+7TboN
	epwZVyF2MBFPxk23HW0TEQ5suL4D3IBkJwVlTkbpBHusEvQiqzOTx2IJ+PTi5XabIn1quMpAwfH
	EJw1tXonnrqvfeawv6LFqeijkUISTYFhFJC6aBfjTp6+9a3DtUAuBSTFLwpzlUThN7szGQic0oZ
	YVRXj1Fj63GLJ8gDSejK1jXZ5UFBHnn9194pKz9ynfzOEuH6CNLUzJn2qTAujkPA1g5N5sxpaLQ
	TPMgMJbXVv/FtG3uqUv7XElMDBsD2iXs1emp9TaReiGXa/XMibdYJ3ZZrYJeHtb4vG1mQ6S4TwF
	Jt1cUbzff7egglgX3fZhKg8aw4uDQfAKaEm7ue/S9ZxV6nk6FSsY/LQTFWnhv+b/4W/c+9ThJjO
	I/UHQDvHp2+KLrQu7741sanAgZaF09Bv8klT+33bSDCUAE
X-Google-Smtp-Source: AGHT+IHVHrhWHHd5t7v+NK+1xDZQB9RPKOfbhSwk160Kp7+0yxWrCigeVebl1Gn8PfXk1Ze7IDyXTw==
X-Received: by 2002:a05:600c:64c5:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-47a8f915607mr114002895e9.32.1765816721213;
        Mon, 15 Dec 2025 08:38:41 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:40 -0800 (PST)
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
Subject: [PATCH v2 06/19] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
Date: Mon, 15 Dec 2025 17:35:23 +0100
Message-ID: <20251215163820.1584926-6-robert.marko@sartura.hr>
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

Add binding documentation for Microchip LAN969x.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
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


