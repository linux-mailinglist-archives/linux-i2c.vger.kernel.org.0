Return-Path: <linux-i2c+bounces-14552-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C75C8CBF011
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 17:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 560A3300F39C
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 16:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5F93346AC;
	Mon, 15 Dec 2025 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="f/Uk4jf/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7999F3358CA
	for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 16:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816736; cv=none; b=pAE4l9D3oZy2gFHIveibEx1Fiz+lrHFqEFzl79OY6JKLraAaC4l79t5V9OyXqbAbmlHoOINxpv3XXzLD2seMoyP/tW/R82916nG8cBT7WDyUgS2mKrnw3kOI8LXh9ww5SyUDULk5AtwdqUtG+AGXl5kaVwADM0GI8oivKWC21Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816736; c=relaxed/simple;
	bh=scXnJzjuPLNSqcnBYVeFur/Bhfo2CWH8BsQkTIJqlg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nH/y7fYfexX0XGPMCbgh+/fQSOpDPIE2+zc+h26v7TwoC7DLsFm4zCmQ12rYimNzesbNptJFTXaWWuBxOkJ7/a6NeNoxwMjK9P9wD0OeE10ZyssmA/N/wG1d/33oQUa8MWE+CcYqAsVLdjMji37a1GPXZGv9KCjeOO0PvcROS9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=f/Uk4jf/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47796a837c7so26844905e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 08:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816726; x=1766421526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPjIyKwQFm6/JfqeS/3dLKxm8lxQV1Fis85PngA8h68=;
        b=f/Uk4jf/MCQ7QC0/lGEeRSSR47tTDriJfcTMv27DyQbaioho2/kAASrIt4a5+bYcYp
         ZJgpkKLA0nJDcMozIad6cn7rJdLc8Tm2E1zkk7ff/1FaOdqF6orReOxSR6o9vC5O1ckZ
         lZ9v2aWwesGBbtKVw8svbs7pCmctke6m6FrgROnx6TyUHDH7tYZCV89BQ7uHWWPIfCyj
         4CPf0hQ7/AU3x6gjMkqA/nU8pR9spOwxinJhS1d59wtu9cEJrWe623vqvNQad+4XGDc+
         z0nYFmsZ5fenhMoFo4LqgmQjgdpmhimZkSqa2fAEsMpfbFFZXZ1Z/36xrTxv6Fyz1wuX
         7d1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816726; x=1766421526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qPjIyKwQFm6/JfqeS/3dLKxm8lxQV1Fis85PngA8h68=;
        b=ONWJH1NN0BkX/ISt0At3bPhTQycvV6sHQcifQ6jcTItqBIJdKEvNwKk8r1x09HTsoW
         KgSJegpphiFQuhGClbSvpnVj7RSsXliEv9WA61+KX9HfkHw6EdEK9CpZm+HSHkKgwIdK
         2dCZtzl8d2dvRGfaEdQfZpeWZTavo8rq4Zfq9BBBnw3GUITf34RZl+iG3OCy9o4VVt/r
         iWDhg2OOAPS1cj0YkPQkJo+m86PriujxeLUPZ1ThStJEfXy1KF8ySu2sFXGflcWl6aY+
         gZPs3uaUW7uWYokj1y8EQFypVmGH6EtV/BolG5T8ZeJ1/4DPplCoqrCQDJpg4pqyX6Zg
         5/Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXIGsJdGrslyNaBLiMvgh/GCagCfCawE/uyOBHamzBqP4Jx9a8kertwPfVZyT35YZWewJPHyneOnz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAGnfSpAhv0lxVyDyt3gvS3Cpf92SpCFSD8X7QaKqUZRUYwhAq
	cGHodvaWQs/EZoSv/DSSkVIK97gwg6CvUc+mBgP03b7zLWVepbHlqrH+s0RaV2fRPrQ=
X-Gm-Gg: AY/fxX56fKPwygVD83XQJFWqX69waS0kBg2ejEa3OaH34Iq1I1c8REfJGMN5ZPeYe06
	R0v1SyqlYtJvGvSNNd6gOzGgF/GjOxvVxQTwp3mcuiXRPur1LEK5a6MfVBWB0blnSjlMQgfboQv
	71vtKDnS3oLs0J7fSgBJVAMw7CwrylyBW3K5CtEEONfgCH04bCk7AccCLo8qHk5GwtRp9FC8kOE
	InSlBWg98i6jaMOn8LVXeiVwnfsyXubGVRKKCITfqyhieegcsd8F0VlpldhGcrg6tTaw6rQWdOo
	nrNd2AyUEM0b+z25kuwb2rPQx1eyTzmrKXKliV+HxFF2pFACuSqN1KeUiltmjojPysor3TIub71
	LL/NsYGUKV/fxAr+m86YfQP1UmUV3IdeMIO1TOY55JKQT5X3pM3/TL5xvcCXS+snorF4qpSpBoL
	rTJHxcK/XiLasnEhHhdOE9NgiMJdExpQuxSwGkQkt7cpsB
X-Google-Smtp-Source: AGHT+IG3as62jY6VN+R9xsd44rJLyQGjfxg1Etzm6TzvOyKAMBySitGXaUcEuYOfJtLLJDAMKGWwPg==
X-Received: by 2002:a05:600c:1c29:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-47a8f917acdmr137389255e9.35.1765816725969;
        Mon, 15 Dec 2025 08:38:45 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:45 -0800 (PST)
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
Subject: [PATCH v2 08/19] dt-bindings: spi: at91: add microchip,lan9691-spi
Date: Mon, 15 Dec 2025 17:35:25 +0100
Message-ID: <20251215163820.1584926-8-robert.marko@sartura.hr>
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

Document Microchip LAN969x SPI compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
index 11885d0cc209..a8539b68a2f3 100644
--- a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
@@ -19,6 +19,7 @@ properties:
       - const: atmel,at91rm9200-spi
       - items:
           - enum:
+              - microchip,lan9691-spi
               - microchip,sam9x60-spi
               - microchip,sam9x7-spi
               - microchip,sama7d65-spi
-- 
2.52.0


