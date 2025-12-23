Return-Path: <linux-i2c+bounces-14749-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CEECDAA7A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 22:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3844230A814F
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 20:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843B634E26E;
	Tue, 23 Dec 2025 20:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="LUNMGrbH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEB134E247
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 20:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521235; cv=none; b=h6WTkaE0kx3mY2KWWnrrhn4RaNGcTSid/l08FPU9Mxs2b/i4EvFwCj1WAn/+44HftSnidYfHqSUYSXtU8BPxJw8BLphzHYWl6L22W0OJwnACcj862f9EMTsYxQXSuxrOABpLic0mxAhJ2aP/HVtcSyiKNd3o7ymyf9bON3a4N1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521235; c=relaxed/simple;
	bh=fcTtzHF7gWsSvucVbLas/Xk6BXcFxykzA9hcJy3JeRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gT7jjgHyKjciYcu4F+kzfbfG4IJsfWQjNv+VRupdhOYuH+MJQ0d3hFwq0Oq02ROXJB3ydmlpvWPEzCuplLDcjIzySGutLb7T0du+DGGXQ3r3Xm2pqjCCb01oxSb/QO5FJSEljw+DRLsWOvT3Wv4cTPyC1G9Vau1cwzkWJtA0ot4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=LUNMGrbH; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8035e31d834so2736101b3a.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 12:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521233; x=1767126033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfrUlgr4mKAwpRgF31HqFmZ+jq2Qg/gWBBCl9WoQ4uk=;
        b=LUNMGrbHejcYyFw2a6c/kwd75fcTpoU1Txm3aDp5WPaRLflEN5x2KyQhCtoR9nYbgT
         G52WiWvsYMxeLN/e/NSOuMsHnDfXefk6LgHaMbT8DP/khfakpFdXf78tzEfqEQYq9umm
         8rUPkhi3lgUD8VCN0hh0xf5Tv1It8Rv1rO+V2kqbTcq9xtv6gqraS5r9CYDAF0oDXnwy
         A6H/V+0geM16PmRCt0ZWpCoe9tUowVQVnULVxxmuV0eluI1StV4l38cNFbXf7zru+Fid
         /S+ns2Pa9hMFFGRmLhFQ0nB62Ctm1T8/RBYKVCWZIl/75WNAdNzC5Bt5WKa2FK2zeCHI
         z4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521233; x=1767126033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfrUlgr4mKAwpRgF31HqFmZ+jq2Qg/gWBBCl9WoQ4uk=;
        b=sNRQo3tHUa7nPndgqXaRS6xUhUzps3WYyVsqMbW4u2jC8KPX/K750st8Wc7rBnmsp1
         PIiQy6G29bLjO7jadbwQ2QACXorNAYYtQNqCX+UjYADD3wZWAxxPPsA06U8ciKGYH8TU
         ZitRjaksvAMFtpOqmhEgykPyrlMOJhXM2DwYup1B4ofTCOsMKwTKMDtzvGQBtZquxYX4
         Cji4Iqt0+viEPxvnuyA3wE2pgt6oyuAG3MPJdtJLU4DZLlbzvfwjdW5JvThvrasKENRO
         L7isk6OvznjHw2bgls156wZoYHy3Uu03bBDje1qXmniO8XJyb/2ejQZEuk0fuMUsig21
         sN/g==
X-Forwarded-Encrypted: i=1; AJvYcCX/8ykLcd6sXF+fIvM3Jcmmnp5ThXD/khbBIJWNazO6cDs4IeAyouusP0snuNHKOhH5NHSgfgiuDp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJJelGbo+JBsMyjzZFxpsOJeaDU6BTZ6lGY8OP141CpgqqjHgB
	jvmMBYFofVaxoY7oKZvfRcBpPHF53N6TC9YIPozJ6EDBsiWLWxJxwvaarS3sDL//wBI=
X-Gm-Gg: AY/fxX42Q5VF8ZntOD1nhSV0477agPlK+5fwVXLNUnd/NQtKfR5SavSdYXewfFPg10y
	CKKiL4oumLK2JlFr88YMCblVloXcwbXZtmKe51AVDPOAkUtuKtwq5a5Rxn4zbWnkAsHWb76Kd99
	GQDIiAyXnWh2DCbMm3ItGKoqFOPrkXx9D70O8lxtXX9qNDcuMJs1XBaImT+nGfotJQeWKdS+Cj3
	G5GuDrMqBSokFmL698Ncp6IH8p3zqdPBd2kMgpyunf7JvQfChGE3JE/s9Jq74cGVuzt1XdZeUMn
	O7Srqs7lHx1gjVzKkXBc+HNj+svk+6rUqrAhZz2XsIitI6hErp9/umBDfbSUl2lUNgNvN/LUS6r
	mCDx6lisMaF6B89oG/WcqPT+O3ATyU0cToY1F2kB/g1xrNwdFNWdN2yWhuledVBPFWXZQqyRzNJ
	cEbt0FSQp80ePEyu0rWYXI4QCr4nA7R6VRRGKGaBGHcGTmb+dYm8y7SjMkoXQsiqgFgjFvPSglq
	Ui1QU3H
X-Google-Smtp-Source: AGHT+IH+vGo67Kz7b+8QZvoO1bYGr/XHDGO/seoLyNk1DncRQFKXbN1uskDp9cfikbL8HUPUhf7HaQ==
X-Received: by 2002:a05:6a21:32a3:b0:366:14ac:e1e1 with SMTP id adf61e73a8af0-376ab2e706dmr14672619637.71.1766521232584;
        Tue, 23 Dec 2025 12:20:32 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:32 -0800 (PST)
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
Subject: [PATCH v3 06/15] dt-bindings: i2c: atmel,at91sam: add microchip,lan9691-i2c
Date: Tue, 23 Dec 2025 21:16:17 +0100
Message-ID: <20251223201921.1332786-7-robert.marko@sartura.hr>
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

Document Microchip LAN969x I2C compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
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


