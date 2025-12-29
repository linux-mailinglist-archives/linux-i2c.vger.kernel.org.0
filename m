Return-Path: <linux-i2c+bounces-14860-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3DBCE7D7E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 19:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01DCE3018410
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 18:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71ACF33AD90;
	Mon, 29 Dec 2025 18:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="u+C/t36R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C93933A6E9
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033632; cv=none; b=Xe2bKYv7gF69TWzPK+9cja2wLy7Txw7sRXX8rx8Ym2g1Q3aCD0gKGdCZG4gD9EE1SgH0CZJpJdhvrX0SgRDYOt6agbbOKZop0oCCwYajyNeIVPFBFEed7tViqDuyp6u1L263vmJl0p/yCGR7qFMU3iQ5H9C8XoVJgPYPoIW+FOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033632; c=relaxed/simple;
	bh=7hKH5EzmH1tw2QTQXNXPEJl0sVHK/le/PcpUxmqe6fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7p+i/+ppnJehU3eB03RTPcl4oPQonsjEK41UFb0D0EGFQU+j12lF4zbtBCvSRg9bgG0UygdtrZiUQFqPBpGPKwvZU8WkW0aOlHjuNkc+FIXBMxpFK8oM1YHQm89PKkCr38O/+XB/qg9bC0HUyJFjyNVEhxGVAFgigkDYMEmfQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=u+C/t36R; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso96172105e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 10:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033628; x=1767638428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=;
        b=u+C/t36RxL2h1deDF2NgdB+V/8PFIJNoVWYqFiBvqPNfeDhDg8nP4BHIkKa+gcW6Kz
         oZyl4BCY1ZY0UlTWbp3WqvUDh1jCR0nluG0nE8iXrs7pjzmjBbQHIbIPL+8dTif2iApy
         49ONVh5e7r1p1beaG0DMCImekdmaXwxCCIx94h6Iy5ESduLUfRYjQji8QXQDkAohfmk4
         FFH7obpel1rzxwvDQjHUy+5M6GtE/DPaAt1uTJE0l+zC7cPSxPsPuUtaftvHqc0L54Uw
         F9IFWNLp3CuSTGSt/Oey3Exa3OKO39cdnJXeJo/5uJiqKIWjp4l6/JJxmT9Pm8bsytkv
         193w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033628; x=1767638428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MElNA+evLW3q9gh9PLqoqAuYhUoiUgxuy1qDVWGw3Ao=;
        b=mwMR0eX1Tolx5LyFHiyOU88YCXiXHjSpCxP89hhRLQqZUQz/iznod6II/xflgKRKNv
         GiTs+E6zRPzmyDckMA+IezkO22Z40bACt21S2Wc4tyaiv8timtfw/XyqTAbnLA7qahkk
         CP07eBOrp0vK1VZ8pS4mYN1IF/dsJuBxKwdpKqTt2uulLjx+ystBRNzezar76c/Jhoi7
         8ThkQAruDzd1JF3kJfy3Y9Bl7jgL91yObmOcj9kvA3SrNUheWMhm1UqrGIklyMvPD2RP
         9C7K3Uc58vUGSbTvJDf69MZNANvWltxlAgof+ypI/rMBYVfY+VDLIeX+4dv2jU2gmozv
         jFqA==
X-Forwarded-Encrypted: i=1; AJvYcCWhcDkV65aNmNKBZW307LNA6mgjWRVKm51QGICs+vNxt5xI5sWZI+mjPLG4MpENXexYguZZKD+SJOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIhB4M9rhguFkfe6J27fAa8FsfUh7N+pipZQKnl69NmV5XrwJ7
	SdTnXLCEn6qg2iak9oO2qFAaxnIHjmjz92TBvLG9lFHDFea8CrroAiJYzz1IVv6Tz9Y=
X-Gm-Gg: AY/fxX6CyJpkByt7bgnAm1mPiGwJIiJ1UXXGpkSNOanoGqDT+ACTHqD3GUI83QMX9bX
	K24sYGQKEKIO0CSX4cEK242EyQGU3TudGEvoOFboKrc0mNPx9LaWmzl6OaqcNZMa3gpfot7ukzj
	kCzl1zbGMbHd9AKPmqOhQOm4RHnZLdc0kHLBjjAiCq9nfIH6nhHNYxn0s9m8s17efX94Zd2rITL
	Tvb4cMydF5yrUv+AaV7a/xVuBcuLirDNbI4AnYqidGZSURi3S08z4QxkwwacHJYDvb4JydqO+H9
	O82egi3/pFIcggSIG9bg7Q+iEtdfQ5t1PN+HFASQLl2Q9wuh0PQ73ZftXMIaF+jE+aBLUZKYkOB
	Xlitx392VTJ7I2t5rAN5l5nR4wnU5hjE1vB0WzuZDANkWEO+NaRsKIm/BkEIi3p18lNaaTA+qNs
	tCU5hhrfg+va9w/7WaVn+SY79r6NgSEeNMgVaUWPfavOCaAyd/VnvAsdkIfud7lQihV7hX/Ycq1
	7k2FzIFbtTNAl0ktYA0O1CMaYQn
X-Google-Smtp-Source: AGHT+IFilbmrX7qgCmCad3pYK4YkE2820iFvJcnWl298VhAC/QPnRoMoqJ3XAnKO9WPGPH+NwyaEYQ==
X-Received: by 2002:a05:600c:468b:b0:477:b734:8c52 with SMTP id 5b1f17b1804b1-47d195670b9mr338260535e9.14.1767033628587;
        Mon, 29 Dec 2025 10:40:28 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:28 -0800 (PST)
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
Subject: [PATCH v4 08/15] dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
Date: Mon, 29 Dec 2025 19:37:49 +0100
Message-ID: <20251229184004.571837-9-robert.marko@sartura.hr>
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


