Return-Path: <linux-i2c+bounces-14855-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EED5CE7FCE
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 20:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFB1D30559E3
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 19:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98923385A3;
	Mon, 29 Dec 2025 18:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="JcqlzjRA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33B9336EF8
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 18:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033624; cv=none; b=kjQxQIy5wHR8w9AgIljR8CaW+GJm+uoN3AdEWvgFW6WePHsmHRXuTD2EQ1HjVYQD+eSON8f+P5uo8ic0fdH7yTK7WMWAJTLkbWLgCqGs/Uw2Zzmb93a9Usuez610ytT5RPwszixCvm2PtCGzFJ/Z29qCKfvwMkRlmrxEV4UfRNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033624; c=relaxed/simple;
	bh=GSmfufS+BjcFXAR7DhKTmRXgeyl65npdKjntCPPDfHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBh8CXILq9cYEjEGzYowqDaKg7Mv0IhrMWimufU8uQhNs/eRpRpmfal6uKr4tzblfqkId24W6ZyUvjrGQUmrSqHds+Y2qAiLWZSt63NcchxFTuYzr2xa2Y/7qcEQNpWCVcsayGcVOf2NH/OS9BxpCRdFZpUMYDLC2dgHq71xKj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=JcqlzjRA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso41578495e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 10:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033619; x=1767638419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=;
        b=JcqlzjRAY7GYd7DXROYgWaELXWB9Ssktmv0mSGBMky80lcqfObTvF++Aws/cnbhLIt
         yMn5+n7PQsVaPG5S0nSJdGjAQv+rbOP7HgcdcPpJ397mAkKVT5uX3fyEiZz4iNDImAv1
         ygQjSfkGsJtE4BH6mibkK5llo62IgL2R6umMw1dy0lu+we47jagIw6mQtfbEdcJbvIFs
         sj7gIiiZW5UrWkm0ZabFQQS5bX4/iAVnhv0/33iHD3qs/a9XjKvmtSqSoKgynE0Fb5bW
         zfOQUkXxivxUuLlwihW02aUZHmiajEMBEq4a1P099s5Ia7Jcqgyr+cJNoEthuSEHRpJw
         8pYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033619; x=1767638419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=;
        b=Gn/pTmALBl74e1DNGtVuk/ykJoAWEhaa1XG4oT60v33DfgBzEfU52DdbgIX/YpIZdC
         Cn+Bb+tfJfmVSpZnxkfV9lmOXd3u5mfEMkG28/49dFYHjJ76FQixSwQDs03qfQK1jGxg
         BMp9lCfmFGrG9Usiwv0bvbBRziMo5I1YyR0jcYBWO7LlsJJUpvf4J0OCidxko9H47Beb
         KqFsDTMgVKij4lWFzFODjXV0mf1ioNoVL4EGtWUf7GO1nQaItgVZY9wkc3uvUec89U1W
         iWljk7SexAs2sL00vLD9vdneGcF+b+/qSJY5kFb7rzY9v5Se06eeWWfSUO9TqIbLCfOV
         Ta4g==
X-Forwarded-Encrypted: i=1; AJvYcCV6YOpKt2Xn3m9ZNGgXl1XKBpIaIqRLiA2AgaCZAoHD/tgX4wCa6i7gwhppmzPiPGDzcL09CW2lFSU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk/u5JaW8NKuIu8txsre8mfDKtRrvCf8bRh4TBSTqPX4cs70ET
	/p3lAV5slDu7Wojtp0Ykt5h0sygVMXu1EQEN0KIAkg+QCnafQG6Q2T5kleIDFMo43gw=
X-Gm-Gg: AY/fxX6Da8pTIEyPyfD2Mb/kC5UNF3XObJWZcv1mnMln4afUS9K8kZPoN+SzuQs8rLb
	IFQ7ePrRxepchlEtL/5bNBeENM+FaBl8Z+myWyRVMnyl+e32NskGWdPGDbIn7a79+7qnceQy+9c
	zbjbYRuyyI3PtGnrJEaiQq91xwmOBat8oTXXz6VimIeDltwZq/IxKOpgDA2gcypHhv7AxkaK8vm
	51qJEITihXoKoT52yYcxs7YRvAFF8IivePbCLmOKUtXi9A49OGAQG3CsrGW0VYQdxfBAqbH1bSm
	ygAhXRzAyhqz77hLKz+yuLjGFLyhTLdJ+OEs1XhezBrpg3E5zZ2X1RGGuUvbGumHDcP9clb5o5T
	sHcbvfw1MjY8b6h/QqHYu8dxPppSFoRbTKOPWqyBScugte7jX6YPlt/2KmXk51UBQQ1g7pppISv
	J7styWeUh77Np3/3tUt8tb/gvDWOn/LEKfMj520tZ85NYbKPBMniM9yeOmIHFFAyz8jfIE7/UI7
	Kl7rui5zeVd0xIfC8hRZbK0T4oN
X-Google-Smtp-Source: AGHT+IGouKdEkhppybsCuf/IfO2U2/Dz9wh0+2E3/5N4x/PhA0Nd7PQ1c14nBgJEnbaurS5x35/GCw==
X-Received: by 2002:a05:600c:4e90:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-47d19557183mr403585065e9.15.1767033618979;
        Mon, 29 Dec 2025 10:40:18 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:18 -0800 (PST)
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
Subject: [PATCH v4 03/15] dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
Date: Mon, 29 Dec 2025 19:37:44 +0100
Message-ID: <20251229184004.571837-4-robert.marko@sartura.hr>
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


