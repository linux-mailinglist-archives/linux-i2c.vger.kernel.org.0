Return-Path: <linux-i2c+bounces-14854-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C531DCE7F95
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 20:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 530CF300487A
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 19:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2693375C2;
	Mon, 29 Dec 2025 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="EtboB3HH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAB33358C2
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 18:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033621; cv=none; b=FZ8Ps0UVk1EFhNChthIaVSx3EyQx9S0pLQcYabUtI+NFNBlcg5/byXxlEDReJRy+zimqoLpsHi0BHwzCHGYWyAPs2NjpA/lWSus0s06SOXvg6ttKvZl281OOXRd6/Uq2cugD7AFD4bTNSkZfrdi2Slvpw/7Q5WyLGv9hGeCNva8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033621; c=relaxed/simple;
	bh=lnkhvIt3TrOEyzf6TQ1BG1hfakQAvNrAup7QLQoickg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1ZrAvitOCbMYqgKITm/KDXOS8kzDopnKYFAWKlxMFNCUFCXl6E6J3WnTMGK3VcaF8zCZjkpp4ECcIp3Y1vutuO6JJhlLE9Jmup5ldTdX/+L08mpNk9h3DyJBRVlw7NtDE2dSEgvnYdmoDx73NJvLkaA61XSvDteM66guuMOppI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=EtboB3HH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so22430185e9.3
        for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 10:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033617; x=1767638417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akmDQhsi4smXKOu+AQ0134jZY6Y2uyR0jebUNjrF2nI=;
        b=EtboB3HHe08w0XqyvQc3lIhAD3Wrb3A+jSxyRDBnGZHNNGsDYTpopftjz07wgCqGTg
         wVeB0SBg0sYtcFqQU94CuwWFrINZ8JOPcHYxaQ6Eqrk7RF9dttwfVjkFrtKvAte42QKe
         r+FYs+x/gVWoMwshb1deUAAslnK41Cwlqc6VYn9NzC9sJc0HbsKoDjg1tHFyEjsIuV1E
         ATaaF/DfSISmFUI6qUXqycxRqvEHQLBI94pKcPYVDNRLhHS4veRqPGH7ev44aJH8hGtb
         2pYEvIocOndgsPPLrTFgpsyOh5/kaYmScXGx3p7T8JaO6Sc3tDW4z8sPJigQKU51gN30
         qWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033617; x=1767638417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=akmDQhsi4smXKOu+AQ0134jZY6Y2uyR0jebUNjrF2nI=;
        b=s3kZl1cEVs8Y0WR5fBlWltq6Lg+UqfJlirheg2YI0kUdl2BLurPTysPHX5gWU6X+t+
         3I89G1Vfhe+qu1SZMEeFz7MGFN5ew0/OW0iCIGyktiAA9ZL6LnLxod7BQ7N8L9Hfum8S
         IR6+LKwdu6AEw6EYQwPalQskiOqmaDB+DaSPH9YIOnEqzVZqpjwe8q+WImnA7SvfcBd3
         JvPCGnafMw1ibIVxmeduWFC4/oyO1f/MjMVOmCMFtunxNXUPEzdPxYJiAG9j8yOFMKrS
         9UWRjIOl2lHXsrNJuwewPKB8Y97iZDrF2FHuLLk7HHzP+YvM6q2H0MmO2DdAvnj4rMts
         p7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVr3pYBDXvYgzyV2C6wZtoRrBGqP8qcf8OOkZRL2LRr5MovD5Cc+iZb+DmjvKzpJ0spiQcJqM0Brxg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz++YGbMx6eSdVz0MU//KmOwDfa5gCM76CFOojzwxfWROjfy5oy
	i+FIHcnqvuiiev2hdsmMKlzVm8CrbOhLZkKyDDdmJWJhPzAukhC9IhH7RxJIwgBM528=
X-Gm-Gg: AY/fxX4osC/t5i6MdVHi+Rgt0V8scBamvJk/KfmZ9/9EJrO8Hpr3H5cFDHLX6x+b/oB
	w8u050UmxTIzOjTJlYqcVlmh+rwknWsvGBQdVtYLGR3rDsuVVe00k9VFACcNYQ4xG8ALKoc/4I/
	EAb+h2U9PsYhE+q23BeZUZS2C2Sl/D/nANCkbvtLW7o/Pyb3rNNbRPHiiMAHqIVvMDtEwj2baXX
	8JqzLXr842J//c2K8RcemB/m4qKvPz5xJIKSFEwR7wGEqAPqAxLsAMDoXQa12szAdB4dVwUNjHv
	u45HXJAb5sq6S+M9NRNq0siArVfX+wnCUPy+4bZ4ANhPQ2VeYRw1LZZBfXduJrl0WOHuCq8/Qbf
	IefgVtQvFm5erNNcskDIx0sF54l9b4wjcoQwQX9YmCjHGK2g2xcUp3Kvj2hqnrm8u9PvcuUZreO
	US9X/lszGemh9+Hc1rnwHfKVM48Nh9qOqEzprEGxDw7jsqnqFJ4yihELFo+X7uKDrvUwWx1SIOv
	nhm5D6uwG3hZHjcXLciX/Lih7SyKnbrTxb2Nck=
X-Google-Smtp-Source: AGHT+IGjzQS21rGuoSBITpTDpuhXFeVyR+ePrw+9us1bVyog91e0BDAjrgenQhgGZwBix2fL5K0wjw==
X-Received: by 2002:a05:600c:1d0a:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-47d1959f72amr367970555e9.30.1767033617043;
        Mon, 29 Dec 2025 10:40:17 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:16 -0800 (PST)
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
Subject: [PATCH v4 02/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
Date: Mon, 29 Dec 2025 19:37:43 +0100
Message-ID: <20251229184004.571837-3-robert.marko@sartura.hr>
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


