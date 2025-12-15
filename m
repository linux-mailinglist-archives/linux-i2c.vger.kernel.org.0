Return-Path: <linux-i2c+bounces-14547-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 51788CBEF30
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 17:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F632301CE70
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 16:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DC5311956;
	Mon, 15 Dec 2025 16:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="NsVvFFhS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E293132FA3F
	for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816719; cv=none; b=Pi+aVgYVB6trIwD0f7+IIJ6Plz0Gdx/nBeyFPmqx6aaxNIGa2sIeLm/W06Px8y0XyvV6sCQ51hKxXcpxt6lAujVu0WaffVU93MRlXrrYhBstxNJ+zbbjinViIPAKL21YKbPEQtjFVZ2S4ZcpJosGxZgKv00DAqxsYcZ8xQ3Rhq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816719; c=relaxed/simple;
	bh=QNwkm9U81awz7MWrlZNJ8gv2P0ICIp/KsNuSQyBzV0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFOOGJLUHoh3oq4Gj2qDCK81uLW8U3VQaxlZsSqTfzEKoevkYWHondbjFDV0D1IbnbXWz0AAo7Lsn6QStP3c8GvHfhDPfkdcLhat+S5q5qWO32X5DgyWBAHDJdKPZN8Hxb5/EH3Lf/a09m45ENSngp3u354Oy01cuaCMLSCEkx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=NsVvFFhS; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so22331595e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 15 Dec 2025 08:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816714; x=1766421514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxaNMbhOAlt3TDMVPp5Rm4PIt/K6yh2QHyxLJcGOJ5Y=;
        b=NsVvFFhSrTcmsEq+9aWzF4cCJXY3RNtfTOELWK/X7PK6FcAKCiLKNqtYjY2FMogtrO
         PLt8Wd3BJ2nN7qhu9uLiiubIO820dt42IeB40vKIzDQhYuvBsk2DodCyA3iNPLJG8Pmz
         KGhKAPGRnkY7L2iWfDIL8RhdqfuuBSwBNYa33s/hhufc5wmQ8rjIih/h41yQ9unmNYFW
         HXB0GajUAQJZ/S6eLuOag6yycLOYvqFT3BOCA6pV+RziKUHaUgAy5tRVSj1xOK2iW2LV
         /SJzx0opgUKWAysIRljHP/gNLyBP1exfX27FAnuEng7fgZdfuN5YjJuDd20q495urx7X
         l/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816714; x=1766421514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BxaNMbhOAlt3TDMVPp5Rm4PIt/K6yh2QHyxLJcGOJ5Y=;
        b=eJrCGgL9iK9oB5l5oG+2gitc9y5QG1KHsa2cn7LMVa1rm7+vq17H0GpZZUoNuTmwQj
         d+QAYpO7E7WtKvi2Jnc8gGDbp9UNhXAC9XzsK/orLVrjZgNviTYDW7sBeLDWRbKaXXB6
         hIe2kVp8xc1U0lM5vo4sHtJzzzC18xNqAKtbVawCilHeKe3z77+mBvLRtRDodKSwEHv0
         XNyBrUe6xkKT0+pZmaaNtzFeN2i19swj0b3XrZPJWn67HNGYb8Rqh2wB5VUGfteWLiOe
         nMcO5kLUI9p7bzGaxr3Bsq0mlAl1USAIfZzMAoI74fyqM2OkRI6jJftrHoEkRLnPoNAQ
         wUuw==
X-Forwarded-Encrypted: i=1; AJvYcCXgwOQOnzRJWelLijuzi5m+XMJRWqC/LpXVvUfx2Dj6U8JMxMFPTNFRwzsrVfAFoTmMdBVlNINS7YM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1suaAc5JWUOjIRmv/vkjoTZ0Huj4GZJ9Q6aiRTcpQPNKmi52S
	w0UUPzxX+du0zSMCO4upruY0TYRk31QZu9ZoS8XvT2/0zmq/GL4yZV3OM68RJeuWIlQ=
X-Gm-Gg: AY/fxX5l6JQQVcZLmPrTDKz9ARWIiO+87vv+Pb2S30/rtbyTZfop6FSsOBAQ1fMZObe
	ijF0w+3I21bbCkhFdCny5GIGYaAzlW3zctMkwAErH9NZ4tWI85tZZdlhAOMgSnQ1JMaILoFGsOX
	ZuiOXHFY54WhbPwfeCMZKf1vc36GOLbAA7OsfwPfQm7iZ0mio9FbYDUcrhTKsnNUUQyGJO/rJ3x
	AoRrsM4gK+MUZ0fKM4fVglkCnlR4PI+0dVGlycZegDdb90FyQhrJ63eciP8IJc4n51QO2O0i4GS
	2ieZewNLV+K4c7veMoZF1h+B+JsTabPg+xMPE3HoZOj/2M5NX6j8dZewlIOPzMBui6DMt+n0Ugq
	u8bITGzjMQOcIDUXDS6sdzz1pKEC/OzvSoVtkZMtr+KAEgO83FSKO8ECjgYNAtzHz+g/j524gdR
	oPHrPhm7Ic2R1BgLUwMxoCwv/67pTATGPNFyF8YFXve4eR
X-Google-Smtp-Source: AGHT+IFmd5yjjsN4pJIoEKmwS1dt07aTMkZ4FgJk47aEX+6lFjDEQnmHIR80M20dZsQbY4fZQ9SOEA==
X-Received: by 2002:a05:600d:6443:10b0:477:7b30:a6fc with SMTP id 5b1f17b1804b1-47a8f90f371mr103502135e9.30.1765816714084;
        Mon, 15 Dec 2025 08:38:34 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:33 -0800 (PST)
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
Subject: [PATCH v2 03/19] dt-bindings: arm: AT91: relicense to dual GPL-2.0/BSD-2-Clause
Date: Mon, 15 Dec 2025 17:35:20 +0100
Message-ID: <20251215163820.1584926-3-robert.marko@sartura.hr>
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

As it is preferred to have bindings dual licensed, lets relicense the AT91
bindings from GPL-2.0 only to GPL-2.0/BSD-2 Clause.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 3a34b7a2e8d4..88edca9b84d2 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/arm/atmel-at91.yaml#
-- 
2.52.0


