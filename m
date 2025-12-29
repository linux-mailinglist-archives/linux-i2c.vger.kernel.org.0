Return-Path: <linux-i2c+bounces-14857-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B63CE7D6C
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 19:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6A9C301E93B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 18:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EF433984B;
	Mon, 29 Dec 2025 18:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="DTGNbyn1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC80F3385A5
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 18:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033627; cv=none; b=BgKcT2/2uN3WLMAiIb5J1ZxiVEZkbPxI4V/hm0BIniQ032EBiKAFBeZWM+288ka1lceZJMR3D+Ag2TfSECzAUJ+chcOEvfFyVs4AlVZDXLUGVvu9gdMQeOeHzcNqpegbkKZK8QFiRHbj+u9PbGi26dWhorHA6a1F012cl4f/vO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033627; c=relaxed/simple;
	bh=Y4t8u2qiojJWvI6jSs6aku7/F91jF6sH7EKzFpxgIB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOB+NbieOS1EXpIoyj8SrmjQ2T/jaPhyaTLUQMDfZX91XQN7jMeyk217kjYjn1sjqmE3IldyEHGRpnYclTMUH55h7jvw8bFMgbXXRkXzfxgPvglDpspIZ5tyobkYCr2WtzcLOd1cJQvzyoedV9dCmCBJVEhoFItlVR6pIdN1Ag8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=DTGNbyn1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47774d3536dso74514485e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 10:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033623; x=1767638423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSHOwUHbn+hH9B++ik+7Uc56KzBi+PoNlqJWxebInus=;
        b=DTGNbyn1RSBQrO0sxPeaM9ygJowJFoE/5rjCT21ixYEfmXuifBUDxBFEdbW710F9r7
         BzGQ0ds/Z99A+mHYr9XZSfY1ZqWHUgMzKIKU42UbJHATo25po45+0UrhGJrNOdvu+FnN
         zHyjWWkiPuJl4Zb15uDtY7Nb9KIuYtpsGspxS9NbgSXVoWgTKBsb/jNYe31Ezz30gGsi
         I6pb/O4Q6dGSnlbH6PsJJhy1rYr8KKVRjxy/T3M3BSyE9xpciJlHvWpQI353EV+Dzisk
         YHPNIBv5qfw8Bx18a9eXJf79fy5nyXJyYv+zmS3RcfsH+ZVIgaAexO6xlnIVT2cEXaM2
         rBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033623; x=1767638423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oSHOwUHbn+hH9B++ik+7Uc56KzBi+PoNlqJWxebInus=;
        b=bFkLeGqIWJoLCXsyzZY/rxhbw+QVyZa3Eux5X03HQpOfKRTyB9hau3TNqEUTrc5KLO
         gNrDKBGqT/ZLza+8blIAy/GOiJ+KEmy82daK4MRiXSN8/vycZnEiUFDiw7Js4uYHJ8bn
         +wy+fCqAwOYknoYzLrPKlfAkeGuzaGiqqsDpq4XBNWipn7fIjaPuH3/w5K/WcTeuMOaI
         b/qRi2J375LzaAwttzJLtf40R3VwVvAp41JDEiAnVhtrwxQ28JQSsWeazaAna/Ukb5VA
         XeGBxeLOO202TDu7T+mq1bQdFhyp8YcY4NVOWx0Rm3aDm2TLEpMmUtZ2JiX4SpvDos57
         ocTg==
X-Forwarded-Encrypted: i=1; AJvYcCU64WjO6X42DWyFAB+aRAeEHxLeB+0Tml4qmIwgt/+G1qpw1Z+gMvO4e92ooSdT3MNEbQz3NC/sOOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDC2B8BxIMVkhHnYs+VG0HamrLuAWc7NEcLLjYgT0oxXfN6TNB
	VUW4MqeCE/ckwbTkbdi3UdX9vZgXa4uvFH8Rpx00xca83bMaX/tvo4+cd8SWfD088VQ=
X-Gm-Gg: AY/fxX75gualZJL9nceKl/nGzHVzVNXkEhozfd2YarEeswFzL6ySZxjZXlRahTfx/sw
	3jqlpduZYt3B273HaKDrfRMlSTeGcSxg926lZtnCp3IcImT5ChrXlSGRgROgYkHu0L8R/2HavZ/
	9xygZHN87llL+KmMwI+Q9+Y+KLlNWY0oG/nTsxH68j24r1lDIORcLKYabUvrpnwZRB/Z0FIAAdo
	XRP/OKqcARnb8rWJQHGIKzbYgu9wl4nlQHccAET2q+ukNGDBVbkTksmlQLC/eyRFH4FR1ljRApe
	+TV93n6lyLa05K5Kw+q/bL4BkiUIr7CsJWNCdPXDUri/dFrEMI4Ajqk1NUKt0I2n66oLb5/D7ic
	3CcC6+EHUrK/bEagW2exUg3+49XNoV+y27nonToM2CLAGmQ53kFVaI4QkYQvgDoxeKSRIrBCNvJ
	x3zpvF3AD0k/Gj5NLmWoc1nUvTnArRZexFjCWdmhhC/awO1rcCz7d+2SUmkZ4E8ZncKgumc8H5T
	/7CB4ooBYy3MBAfnHwjbZEeTlpAHYBDSy+d5zw=
X-Google-Smtp-Source: AGHT+IFdXHJQRkzLbrbudz/rrSLgg0wPVHDz1vodIiRpC++haL2go1AcyrpRC3xryHs5U31bxn6MLw==
X-Received: by 2002:a05:600c:6749:b0:471:665:e688 with SMTP id 5b1f17b1804b1-47d18be89d5mr452022195e9.17.1767033622859;
        Mon, 29 Dec 2025 10:40:22 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:22 -0800 (PST)
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
Subject: [PATCH v4 05/15] dt-bindings: i2c: atmel,at91sam: add microchip,lan9691-i2c
Date: Mon, 29 Dec 2025 19:37:46 +0100
Message-ID: <20251229184004.571837-6-robert.marko@sartura.hr>
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

Document Microchip LAN969x I2C compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
---
Changes in v4:
* Pick Acked-by from Andi

Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index e61cdb5b16ef..c83674c3183b 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -26,6 +26,7 @@ properties:
               - microchip,sam9x60-i2c
       - items:
           - enum:
+              - microchip,lan9691-i2c
               - microchip,sama7d65-i2c
               - microchip,sama7g5-i2c
               - microchip,sam9x7-i2c
-- 
2.52.0


