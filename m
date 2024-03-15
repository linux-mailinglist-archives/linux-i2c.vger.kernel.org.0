Return-Path: <linux-i2c+bounces-2363-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E93D87CB79
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 11:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECC9D282776
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 10:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4278A1BC37;
	Fri, 15 Mar 2024 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvbZYSn6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5561B941;
	Fri, 15 Mar 2024 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710498700; cv=none; b=UfAbxMbCMQZrsZEPjog8/VzQqw8I9h83U21z6mfEgC3coOATUHXUuhKHmlZIml6wAAJ0o6duboa3f29iWViawLjA5ftkxWgWsrMt/ZXW1nbGkX1EN21uacqf/ZB2uzVuoY/jwWnAEcTuOeOUjDmWsnXOYNS7gEu2NYtJUkU5lu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710498700; c=relaxed/simple;
	bh=lRdqpTT0gh2WtHqWtaq0VJmI8rtEhSLoMt9GWGgjokU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nt30VvA4Cx2C5nIbmlQe/5C7c7OwKLV5DIzLDI4K/anuXVHLr6LXof1EKx/9yYNuxKs7uWtAUDVphSRzA2L7FsgpNEK26Oa0L/f2eQOIm7lWhDOMfGKhkwDVEs/2fRc4fdCVaacLMZVeVaU6iVAG2m5Rbv3QMzai6QCxTu3+mFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvbZYSn6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-414037e9acdso1373245e9.1;
        Fri, 15 Mar 2024 03:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710498697; x=1711103497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CckpNQcaclBaLWHE4esIu6A7ypiEpjVfV/EelIKw3g8=;
        b=EvbZYSn6h9lgNKXlmyPhhkg7F+jCKjeoIr/Zy3hG1+rq90r6YEiqmEDhdTP4Eo2R5+
         U9+uCwY+EQlUyXbPc2o1ISJmhwj+AIS1C8tvIX1XbL/zr/78G3YfpGgSGkRJ0ybgYnFE
         /qI72i8/l5UEnq2/0pMvJhhillHUBsQvZjxeEgYGBFZYKZIGFKvwRY46dGfQZnryxYjJ
         gqZxYIuBGKfBswe8xt+sHk6s1uuPVwScG2xdl2hc5/P3AmOniujkBwJ7Wys8FXFJcfgu
         pI/6uPSQ/bGWOaKGlDexQ7+MDGdzAA2hjKl5XzRsYhjcclGvuWYvIZFz8BNqprMjVKVm
         s0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710498697; x=1711103497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CckpNQcaclBaLWHE4esIu6A7ypiEpjVfV/EelIKw3g8=;
        b=AkcpaVN2VHQ6SDhBbvaJUWZ0XkieDTlx2iW18UZNymsmzddq8pb1zMHdD4a210DXJa
         ZgbIHSO08xH0TEAR42hHmNuQvqxcO4zY5B8Rabx/PZ+FFIvZam+u6aJrCMbVt4z9ZZc7
         4hlvg6IC0UG0fdkOR+qyB/C3d7pIgipVglOa/3a0ouLIrAWg928RuNPDNnf4kRYitEtp
         +8V/WnICTEHRyclqm3LDNS0atqntWUixSmxLqY/I5Rt9IJtR6oM9vYFO8egjj2Ika5Pe
         tDYbLJwnHHonHRIH3VLYXgk0FgVjvgb90XGrNRS+FZZmL6mAPCICG08CdBsXiHwVWuSZ
         CXsg==
X-Forwarded-Encrypted: i=1; AJvYcCXU3s80mGSpF6wXlbha6BLTNf5OEvkOP2ObsdAHJetNFN7tnN3ndGQNNlbRCuFM8Ffy+fIJEnT7EqIrFbfDL5b4KK0ukqiLrr1SUD5XYtOCgrM1zn2uKf74PjXRnrh1irv0NftGzbHRkYNOBXbdvVgkiKHL9njnATVhWIfoQIOMcc7P5Q==
X-Gm-Message-State: AOJu0Yy+7fxwgG9igEUD54VcjLOg1TO9iG7QBNrfPQNKBWNAfw2VQKiW
	44e27ut1cVmQ4tdwTFZBIr3+CDo/3cfNs8kcOC9TurdV1qBiqQed
X-Google-Smtp-Source: AGHT+IGHdpZ3MrSAR8C+LtQYj0s4PZhbJXP8cthDm4G5cDLoC6N21cKw5gg26nHFO/y1GLUSHk5d8A==
X-Received: by 2002:a05:600c:5187:b0:413:f1d7:ee09 with SMTP id fa7-20020a05600c518700b00413f1d7ee09mr4194825wmb.15.1710498696399;
        Fri, 15 Mar 2024 03:31:36 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:ae92:6adf:5cb6:274c])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b004130378fb77sm8676549wmq.6.2024.03.15.03.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:31:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/4] i2c: riic: Add support for R9A09G057 SoC
Date: Fri, 15 Mar 2024 10:30:33 +0000
Message-Id: <20240315103033.141226-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315103033.141226-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240315103033.141226-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the RIIC driver to support the RZ/V2H(P) ("R9A09G057") SoC. It
accomplishes this by appending the compatible string list and passing
the RZ/V2H-specific OF data.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Dropped setting family
---
 drivers/i2c/busses/i2c-riic.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 3ae2d5c2f85a..861b244d5118 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -523,8 +523,25 @@ static const struct riic_of_data riic_rz_a_info = {
 	},
 };
 
+static const struct riic_of_data riic_rz_v2h_info = {
+	.regs = {
+		[RIIC_ICCR1] = 0x00,
+		[RIIC_ICCR2] = 0x01,
+		[RIIC_ICMR1] = 0x02,
+		[RIIC_ICMR3] = 0x04,
+		[RIIC_ICSER] = 0x06,
+		[RIIC_ICIER] = 0x07,
+		[RIIC_ICSR2] = 0x09,
+		[RIIC_ICBRL] = 0x10,
+		[RIIC_ICBRH] = 0x11,
+		[RIIC_ICDRT] = 0x12,
+		[RIIC_ICDRR] = 0x13,
+	},
+};
+
 static const struct of_device_id riic_i2c_dt_ids[] = {
 	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
+	{ .compatible = "renesas,riic-r9a09g057", .data = &riic_rz_v2h_info },
 	{ /* Sentinel */ },
 };
 
-- 
2.34.1


