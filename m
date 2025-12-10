Return-Path: <linux-i2c+bounces-14487-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4310ACB1F67
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 06:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 038BB30AC67E
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 05:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43062FB97A;
	Wed, 10 Dec 2025 05:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b="MQ+2QGhZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6BD271457
	for <linux-i2c@vger.kernel.org>; Wed, 10 Dec 2025 05:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765344269; cv=none; b=ZqV9jXri3rKt6zwybbSJObIyP8Pkg3EaaBseaFcEUS7EeQzqd/UdU9+3NTuhsXJQI/uYvxJ6uCnYDRkIEUIsdaQdfqqXDcuERwsBNv7GNKuleJ07qh1PGIpwsFLkopBJYlLWabEma3RYEc+LvzRwOqyHgPlpH0vM/duyHbjRl9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765344269; c=relaxed/simple;
	bh=kmFhRlOmliGPCjl0tEXP18/laIwlZBhKOJoyLH3kkfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AKkBS9eAlYGsAilYR4t3XrwQz9HWm7jSWOqUG8alXyVFkY5Khw3rvdVN7XMIC9TgVT46A2SzZJMs76vpgzv0CWuXp1hTjjBG2dCV2PGp1dBEdGMAH68HZTgv+O6U5dYvqCP60wD0g9p++1ySFoDBsHlZGZ7iQHhuSh6w53HCECg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar; spf=pass smtp.mailfrom=frba.utn.edu.ar; dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b=MQ+2QGhZ; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frba.utn.edu.ar
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so899380a12.0
        for <linux-i2c@vger.kernel.org>; Tue, 09 Dec 2025 21:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frba.utn.edu.ar; s=google; t=1765344266; x=1765949066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QlJtCng94VGpqjba3SuHtU+AS5mW8U5fO5+chTqevbA=;
        b=MQ+2QGhZ9NdFsXCC9+i2lQWE4Xsbf1/IEg7Hr6QjobrCzDdkDCzLwJPk3l4YxWDBFF
         2wJ6OEQXEs9hfPSiaQAZBHUP+n0aN7epVJbnE0Cebul516NtSL4kus78c3GDAhDu4VEp
         lvyvl9Cf+Dx+aeOcCtY5NE5iAHUgc5QG8inu/s6xwDBJCV/Gn8OyZjFaTD/N0h+51TGd
         FZrCz2Aid9LAtitzfz59A67fL+LVvA2pn8FI2XyAJ65AJK0GYLdMbEJXP+Wwh9Jq6Kh+
         SUOgapx5EDI+I2tLnZgBPL/JmYD7j/DR6BFL0qcUXhQ78xAVhfkQh4HuBzBAaqILZ7JU
         yNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765344266; x=1765949066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlJtCng94VGpqjba3SuHtU+AS5mW8U5fO5+chTqevbA=;
        b=fHBuiJxu7xWLrYEEsh6Mca/UQjdycNleHZjgn6RekNfP521Mfy+YvskcdPfim90CEB
         b0s3vsfG2JLVFoc0Knp0hEjQpeauBaAH9WB1FAzW5ZgZ/4wAM6hEzq6o8QhP6IQy1UhQ
         q44WjSVZZ1I7o1OgItZVNSq+BQ0ZfglUWiLMKBlLx7uGPFgmGZM6VSoXItAxgxQV7UD4
         Afi1TKEHm3z+PCllZ87RAISK4HadHJvIYfWf0O2iadLRhxY6p94o77o7NS5Ort0ZA2FO
         iaxhYeGBO/a2Jf9iWkvU5QZnql5y0F9/qe/KlHKawVEnc2Wgcpdv9kIFyYQKHX6vNBFI
         sEJA==
X-Forwarded-Encrypted: i=1; AJvYcCW2srVVBSbSMXsFgeKN4K6H3wXjshhgj1Hvwj0EKTXT/fqz5JGmzmZD9TBoh/r+QAg7ztx3Hp7V+SQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu2fnzyGVY+suI95ZZwvl4VMgKCNlYmJk12l9Hyvp2xMqQsR9t
	OI+l3FkXoA4QXDFP+qJUpDO9lKh6O2O8jIRXiNP6KnBtPhAYnRFrBtuD+4O8iqKYFKU0zdRnq+L
	a3JYxpS+R3Q==
X-Gm-Gg: ASbGnctLu6IgZBAlYUwOKIaGGUCC8zSTLV7XVv759oGnhwji9y7B2h1MI1EBjEhLib4
	xQXtj2T4hvodBauuZkiUAF0GZYuRr8spSFkmrOb3aMZGZveEmue6+R0LaN5Zc/vrOR3A/c+VIQV
	7gE3JIIA5e05we9PbvY8JgK3laVnizW0OResx2yVu4wM2i8D5enRtgEvl973GAMTRESWROYaLxq
	gMbGQ/YWJSNsxZSG/5efFehqC6OvTWH/nHJs327jlu3npCLtkumJIuLwWD6v9GPSqmtrgI0zWYQ
	+BKiXkX4yeEGr+V2I+520uIG6PEv9T3kOBwHlwYWvmy6DavUxgrjYQiX/csqLnwYMkSyWOOpS9F
	vm1I7Bph0RBA4WyJjpUoC9tyhLHA8O8WlOLjhZJMx0G2DZH380ttknHsW/813yP7QVphes7FM1S
	rMjfFG+cw0pWQ5oH0W8nNq07iFmLqZIjSo6xnZj8MLRenq4ngCzyOT6A/tjGiwK//OrRmkibWz6
	Vxa7r7x/PnDTn0GE3dKAW3vlLVt5w==
X-Google-Smtp-Source: AGHT+IHXFz7KImUQvpjB5n4x5vp6laDwqapGFb1cbrih/2lZ6SLdPLifXhgEwnrmO1ldg9oaopj9Gg==
X-Received: by 2002:a05:7022:419:b0:11a:3483:4a87 with SMTP id a92af1059eb24-11f2967f3a2mr923201c88.13.1765344266293;
        Tue, 09 Dec 2025 21:24:26 -0800 (PST)
Received: from fedora (host40.181-14-227.telecom.net.ar. [181.14.227.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4796sm5358862c88.13.2025.12.09.21.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 21:24:25 -0800 (PST)
From: Fernando Coda <fcoda@frba.utn.edu.ar>
To: aaro.koskinen@iki.fi,
	jmkrzyszt@gmail.com,
	tony@atomide.com,
	vigneshr@ti.com,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Fernando Coda <fcoda@frba.utn.edu.ar>
Subject: [PATCH] i2c: omap: fix incorrect SCLH timing calculation
Date: Wed, 10 Dec 2025 02:22:54 -0300
Message-ID: <20251210052254.279899-1-fcoda@frba.utn.edu.ar>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

According to the AM335x Technical Reference Manual, which uses the
i2c-omap driver, in the section 21.4.1.24 (clock timing parameters),
the SCL high and low periods are defined as:

    tLOW  = (SCLL + 7) * ICLK period
    tHIGH = (SCLH + 5) * ICLK period

Every other reference to SCLL and SCLH in the omap_i2c_init() function
follows the same pattern:

    SCLL = value - 7
    SCLH = value - 5

However, in this line the value of SCLH is computed subtracting 7 instead
of 5, which will produce an incorrect SCL high period. This appears to be
a copy and paste error.

Fix by using −5, consistent with both the TRM and the surrounding SCLH formula

Signed-off-by: Fernando Coda <fcoda@frba.utn.edu.ar>
---
 drivers/i2c/busses/i2c-omap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index d9f590f0c384..d0a33f5f1bb3 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -459,7 +459,7 @@ static int omap_i2c_init(struct omap_i2c_dev *omap)
 		if (psc > 2)
 			psc = 2;
 		scll = fclk_rate / (omap->speed * 2) - 7 + psc;
-		sclh = fclk_rate / (omap->speed * 2) - 7 + psc;
+		sclh = fclk_rate / (omap->speed * 2) - 5 + psc;
 	}
 
 	omap->iestate = (OMAP_I2C_IE_XRDY | OMAP_I2C_IE_RRDY |
-- 
2.52.0


