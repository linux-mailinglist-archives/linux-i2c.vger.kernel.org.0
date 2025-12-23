Return-Path: <linux-i2c+bounces-14752-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F390BCDA86C
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 21:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 234A1307C564
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 20:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415A9352FB1;
	Tue, 23 Dec 2025 20:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="qEXm32uj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08AE352953
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 20:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521264; cv=none; b=VPMNfH2VkpYUYLBXogxvynx/SQRNpdJ17PTGA9+dy4wyAEbTCEXuppLsc5Hs/C7kZ2BGPWoa5dGFXz+fIF7Y6s5/bdxlZWGxFDM/kstz1yenM1a2btSuTGbOpPbuiAoaunfvVCwzqXB06F7gYHXSH4/Eht2Yw57hA2R8Y9ZG73M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521264; c=relaxed/simple;
	bh=7hKH5EzmH1tw2QTQXNXPEJl0sVHK/le/PcpUxmqe6fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FdvmDzRK/U+ELprbKVsQn4zkBEJh5Oy0i56psptDpz+z3NFBuxqT3guEB45Ue7pHyA04IZlzB9QsknfnPO4jRqRQ2nU4KUR5mGrjXl5af0rtuZNgrHn80aXBHGGbPOgUG+KUEQp0dYjdeGdP6pQ1TtqY3f8/fslyLHcbw8AGApc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=qEXm32uj; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so6112618b3a.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 12:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521260; x=1767126060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=;
        b=qEXm32uj1+odh+mia+XgDAG39bxsV8BBnWSP0gbyH5RJhUfEzyjInuhiC1FtX9Wppx
         KLxk0YDYruP0rpIpgefdNHqLi8+C65Db06vxmizhWFJNlUeyE4PALzO+idf0NA0jEvMt
         4bfGeG4K9boAoeBljyhuYdHQPXx1fzDNbBeLm+/ymuEu2mywxvu0nFbFozqKna0aW5o9
         UF/l+z+RE/wWwKcEoAMBfnOLbiRWzz5O8Ua1eIoWr08agzCuSQBanUqTE3b4fvbRKl4J
         RwJDjpDIeBb/IhuLWShFAWC3/IHBkQBxlolO5/7LijryExtWwxx8zreGCz/caCv02scj
         QTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521260; x=1767126060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=;
        b=PXFDI9wwwboBudXWMZk+g/V/UkYikP1gGBtHbfvQXr3oEnRfZfW/uETUzPXdzDf1hh
         12Np6WMaXtIAXnanaxdnuXMA74tB5W+tblOrSGjMnuPhpq6LGYujD5NGJGqR0EyfneJa
         K7skJlAqAlWf84VwyfHgqOer1gUsbdUVrVgaVaPwEDuP4TXa4I3JxRAnyrf2j7vHO2jW
         V7HOaW/Cw7M8VfFygaAF5tQmIRLu2nHvfHkvHt1rfJafTgXC8T/sL+5k4iYtWD3uZatR
         AfOGhKlnMJtx6PdV8Hqo/yQAxkeYZyOYY4Ew072gMDIPkVu3S7KejKDdsv8sr2ecUXiG
         8jww==
X-Forwarded-Encrypted: i=1; AJvYcCU/XsZJOYLK1Psi818Wl3kAi6V8giOiOl2BRBrBK2cwf+TF65vL03SW7Q94/jIuqXM10foExNibFls=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgdwrVLbSCdaKnAgRR+Y5kBLV0zbs2EQeCNWq5liKOMc6SLl/a
	wG0P4xZCnJ59Yhk+m92AK2sJEfHBLq3UsHmzlc2m1IEnDSZLeOFbRSIK3UCShfB4TQk=
X-Gm-Gg: AY/fxX5k65bAZlGCRBJmiXEf/K6l/Rse6xsWTGwpD9oVFpkfMXhHWgKtWmsGN9zqe8Q
	BoFFDqo1XiRCUZuNcvBqrQz+uWSRR8jRFHdJd0VTBrQN5bW0/6wAWL7/z90TNbLHdb4nuzVj3af
	ISeEZw7XBwBCR4fhlNQkZEd/ZIoNR6xhVfxocBwK5AhOTH8jbqZxHDoBB/gZlXNDSaI6IHrI1ui
	2TVLLzMPBoQAVkcwCNPiAmemnW6UOrreEDOEFu/p20gP68DCVMAim7XJDUrgOYW8x3bw1vpldrd
	jdbiiFNtEicMYduZqN7+d96nqWqvytjbo3b8oyf3OGnp0XPH9uYaR6PMOWeP7BCyo/2e0YqD2p2
	5hJ9V2OCPpyhc2c8DyWMkcZmEBDLy4Njyz4tSXlJ6pKRKbIC20F7R7Ljz9lYevUfQ/BrjKx6nmm
	QdfzjM6Lw1hoaRA94RKI3Vy/QgUqH/oO4T+iwZYxBczsZV9pJ0bobL8toFy++LmA9pj1W8b/VAS
	DkHv4Lw
X-Google-Smtp-Source: AGHT+IHKfwHDjFbBjFoOP1ZNZG2yYIy8Xdi86MslAqVbrnS76U8emwCJO7CURd8duOcxnItzlu++Ng==
X-Received: by 2002:a05:6a20:7289:b0:366:1880:7e06 with SMTP id adf61e73a8af0-376a5449622mr15082294637.0.1766521260025;
        Tue, 23 Dec 2025 12:21:00 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:59 -0800 (PST)
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
Subject: [PATCH v3 09/15] dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
Date: Tue, 23 Dec 2025 21:16:20 +0100
Message-ID: <20251223201921.1332786-10-robert.marko@sartura.hr>
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

Document Microchip LAN969x SHA compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 .../devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
index 39e076b275b3..16704ff0dd7f 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
@@ -16,6 +16,7 @@ properties:
       - const: atmel,at91sam9g46-sha
       - items:
           - enum:
+              - microchip,lan9691-sha
               - microchip,sam9x7-sha
               - microchip,sama7d65-sha
           - const: atmel,at91sam9g46-sha
-- 
2.52.0


