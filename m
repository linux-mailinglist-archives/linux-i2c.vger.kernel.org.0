Return-Path: <linux-i2c+bounces-14861-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5484DCE7D96
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 19:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09B12301A70D
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 18:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB8C33B95C;
	Mon, 29 Dec 2025 18:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="u7HmGPkA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E8833A9F1
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 18:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033634; cv=none; b=n4u+hUnRDmislS04Gpa6B2lt+zbSoL9suoelqCPvmbPlu/kEbPP79XbY7Sajj1ADpacNpUuYFbCLH/bsEtdgarons3gvawtiGqGrfsMqhg02BaeahHE/L7VK9EmC7xokaoq4ImDhrpQg0CNdSbVAmK0Bv3UtNV84BRLYHwU2Eyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033634; c=relaxed/simple;
	bh=7jtkvldmPSo6tJBxZSibRZu5hmUTyLaiO8iQq/Sa4wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bPtO3yFpZ/ValDVQe/OjyeGgGtmywanJLPvY1O3ezVToOIc/CDvyHlxayjjaeOBwf8ygSC/SC8qvWxGLVdatSmZpyTV1Gn9S38/AAER3eWnNFhhHLC85vtcNir/UFXYJf0vbewwdD2jmniGiSIdNimZoCEf4TjZIflZqL2s7VdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=u7HmGPkA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47774d3536dso74515485e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 10:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033630; x=1767638430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=;
        b=u7HmGPkAkdP3R7rcUekjuNxY1rqjuIdNyca9I/XGM9QnG+kfzr1RniY05coFnav3Ng
         RYHUu+lqU0wDiflHit52ZG0t1bmh/XBC+sQTV348FEuYagsi0eLdDABPMr2PVkaD7inJ
         smarDUYRZ7OjWsdOyQ7pkBVYoLoQKrRfREcBHdttYvdam13AsICcjYpaIixihY848NF0
         4+AVUcKCS1vvv6tkvlnLJv5CroC9pr3VorsPqY0IGKUkVt2HWY+/PhFxoJpOM5MxrRZR
         rn0bKm0ktUYeG/Ov+a8MT9JGcL8LG7NbpQ5e7zQAkwYV+aLTTb3hvAKTdGWO/w9MZ01Q
         gN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033630; x=1767638430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=;
        b=eYtWpHrI9+S6IyTwh8ABvIxKgeh7nyFM4M5W16TpUARppJdkSp6cxpAhNWYtZSoHuQ
         WHiMdiimb9K9QRnuhiAOAh82+sArGTah6Kej5+G1D9w2nSX9ad2emkor7RoxrxAoL9d5
         cW6bVsBfYL+vRMeHxWwArHOp2VEdUv63rd0SEuBNvxIAckKNPvSi6qh0ClvR7aXdSXSG
         7Gjgo8OxyhgBLT+vyRt7TOIdrHNrjEPG1+/dmLrQGrsgjErdiij/ODrNP0pti9/Ml4sJ
         lrxXx4yWp1NU1eCgV30cHpsI2IAq2wL+GEGbGrxz9/t7iJGDv0fX5SHnVAOP7z7CJAgu
         zl/A==
X-Forwarded-Encrypted: i=1; AJvYcCVDVDjzFajo9pd/eoGO5Dua3iGNBdalYhCL2y5iHppylYgBhYpWnaW382odHvfd3fI2CjHG8IzZ8zE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUYWz6BJKKeCOZ04j5/ZXKSp4s3C8WBDoNvrqBr77kSYxh3vok
	eBqRJ1RxgWKG3f7HD5nS41eeeVv5pbEC0vgQg4tTyemt8LhaCkA0kjHza9BhddklpFo=
X-Gm-Gg: AY/fxX7vJqLgtSJ4xscOAELPVQL8mnKjkPUbW053Xolj9WkaPQiJjPqYcM7raF7DQW4
	EEpqdWuMifdc6GOPEM7WYEJYW3/aFJlnEk2T15GfRVRGhtWl1hhnDtihVpJPhfI34tGI9WvcRry
	if5RwFqybDP2RkyF9JfsSFGobJno5ClQQWthOcU/WSCX+J3Oevv/c1be4MljUDZM+6nnjhhxO5g
	MI3rYpElJDtCLWAJqpj3wfxKSN1mKcVAc3Xak1INnU/mh/ZX3XVN0vkWpQELHmnFubNuuAnaWFw
	YVqraeQxRaqrScSje+vKu/0Y+bqJgZlDgicpjkBXwbSemBLRedpkIoXoqj9HufTt9UHv5gB/jtV
	C/RSSfqcwVyudWznnIMOVIqZgiXTGshMaV2mwnOJYqfzRwHhFmMFvlB8F1CGRI6PCq0O4kyK6fD
	b/g4P/k802PjxUDMliwEgsXly1EcR5VMaa9P1BgDMEEh61BWgXFwcinba84+4Ewnlsf7WDzCQr6
	W/JBolpWcSYIDWHkUH09P/RRiiP
X-Google-Smtp-Source: AGHT+IHU5TUgf1GXiZLlNhFvhk9NZs5LXOVfATsL4H0x67DGWgTd0xHPjLFDLe/wLhfc9aOjmrDYdA==
X-Received: by 2002:a05:600c:8b11:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-47d2d273999mr360424715e9.15.1767033630467;
        Mon, 29 Dec 2025 10:40:30 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:30 -0800 (PST)
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
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 09/15] dt-bindings: dma: atmel: add microchip,lan9691-dma
Date: Mon, 29 Dec 2025 19:37:50 +0100
Message-ID: <20251229184004.571837-10-robert.marko@sartura.hr>
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

Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
* Merged with microchip,sama7d65-dma since that also falls back to
microchip,sama7g5-dma

 Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
index 73fc13b902b3..197efb19b07a 100644
--- a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
@@ -33,7 +33,9 @@ properties:
               - microchip,sam9x7-dma
           - const: atmel,sama5d4-dma
       - items:
-          - const: microchip,sama7d65-dma
+          - enum:
+              - microchip,lan9691-dma
+              - microchip,sama7d65-dma
           - const: microchip,sama7g5-dma
 
   "#dma-cells":
-- 
2.52.0


