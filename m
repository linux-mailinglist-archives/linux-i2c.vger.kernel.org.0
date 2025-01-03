Return-Path: <linux-i2c+bounces-8872-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F182AA006AF
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 10:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 816BA3A4212
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 09:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3EB01D516B;
	Fri,  3 Jan 2025 09:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcqbDMH3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5817F1D432F;
	Fri,  3 Jan 2025 09:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735895959; cv=none; b=aNJvuL1h9jPH1HwgcTURATHl/r8Fh2WIFGn2JqetbD8LciT3UB9ECicfCUMgfJdoc1bmOBYGFiMXuW8cNtFQJ0/zIzguE//rxGDR5aZVlD1qWqsLW1WsxumS7LMK669wRQJSUf9vJnEv/61SHzbdejyp3pXTW1g26TBwtEeQb9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735895959; c=relaxed/simple;
	bh=Cb/Xx1BBP42JVzj+xyi/HC4NS8Uto5wanu77JCmVC58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=foTeN0mM8nu9Lc27VtNYq20W4ajhfXDSEjrJINckuqJEEVBcxKSv2yrsH6ssstDuZlZWslY4jGZ9ZaSXozyanoTOBwV0LTjDLlvjI1McHk2VUkGq5PaCHvQ1tiloz7jx6+xZ26NRLp10skYcBryCQZ510YptPXh2ukvwLrNjSVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcqbDMH3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3862a921123so8176272f8f.3;
        Fri, 03 Jan 2025 01:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735895955; x=1736500755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6Idbb7bGpoVzKoKkuBpR2WvH0u9CWLrp2ifBVLPjBU=;
        b=DcqbDMH3OtGW5onLSx3/mMVaYnW8/8pYEEVD5/Bpbsu0XQLKMGr6Wd4fNmShKNOf57
         jeO1dgVfg3TWb6n8MB5fja7H7MoHUvpKRI+/+PRVfqjscNhWW6n9OtesAmcDdqozK9a2
         IzHGPZYoI3gdAuRH8y8OczngFhI/OCvj1aBNis/itGw3NVCRDMIJrQ9I+yjm/YmA0tm8
         juJr2evq9mT6AB8k5i8CkdQdrBW2kHpOz2fyEnpRrRY6BnU1O7I8vS4ynXYPztEsRMp6
         a00VtVxXeewlpZ9mgrQqxsplIHhgQshutFjbYIL6YY0etzvYCeTH57S2Vj02kArQxaUE
         F42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735895955; x=1736500755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6Idbb7bGpoVzKoKkuBpR2WvH0u9CWLrp2ifBVLPjBU=;
        b=ccA7I4vfu09QLQTbKStYYbrR5vHrMXN5BpqSQJeLX90T7IqY1oimca4mtlwKMLdxo2
         hFiNuZiWWzEY8K2eyM7JEW5kuSyDhRZYdyNUvvJDRQ0wpPM6ixdK0sm5jSZwLcJ1xiwU
         mYSyUEmxMhu9BF9oulHRgyShed/1EamzpkJIcnbem+eWnkG7Xx02qWsU8OHCwiRUrpFT
         nVupQ6o3XjiDFvdl/HiljYPk1b/EN7wOftFTxb8N6X3iUJ5TSKUANHDhx8tTryAvh2Mt
         ydZZwsiv6PIW97E3ytkgrxmQG0YjkbGW24EC+Rn6DvUjaTTpcoqHYbyRmYd/hXn9JQCl
         iUIw==
X-Forwarded-Encrypted: i=1; AJvYcCVfSYQAJdq6ZkQ4fBn6wf6CtkDS63ScYZia9fSN/c68UoMQlrD+0WLSFUcDEfFvhECF7LycJtL79FwVnkLz@vger.kernel.org, AJvYcCVjohTuN/OwZ0NAqZKmsa3HbovzJ10lzfVmW94p7Bh7UOSCPuNmuBwxvAZzUle1uBK9ZZmGHb/JbxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsddhYVvSvOTMIOFYQc0pPTpRAwPL2VDIe+TQwIqO0ArpxGZlN
	B+dv5Bl2fGZE4Rwxrz25eBQWjL23hoDWbeKztIeLSsesZh49Gjvf
X-Gm-Gg: ASbGnctW5kdrVza4vvGJfouS0j2mCwD/5vMHkLyG1eJzOcAudVvR/SYnqnOYB5ODOAZ
	zser6LdQ/lbVNhhAhoZmgh2qxKlkq7b5WvCe2A1cOTnH5SJ45VzwtPenliXaSOSwPjgw8RoODwF
	cwsEJCG+jdBqd8AgprKOBUp5zssHb/X7HK4UpEqlVSYdM9y6VNl0jZWaR3RWrIICpotI+AS6nGZ
	dfiQmSuhSziR2246hCSrIkqfrwzfcpLDFh/bGfmBZEm996/L2M54VfjN3jgyEqT3ZOrhS5LiW6B
	H+LogTwkNA==
X-Google-Smtp-Source: AGHT+IF5g6Cwah1nUH4293law20BWq2kOqEosji28czoj5s+tXSGVRYefZBOtc+tsL0eYZ30GPMwFg==
X-Received: by 2002:a5d:64a3:0:b0:385:fae2:f443 with SMTP id ffacd0b85a97d-38a221fa238mr43347757f8f.34.1735895955042;
        Fri, 03 Jan 2025 01:19:15 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366a093cbfsm452493275e9.22.2025.01.03.01.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:19:14 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 3/9] i2c: riic: Use local `dev` pointer in `dev_err_probe()`
Date: Fri,  3 Jan 2025 09:18:54 +0000
Message-ID: <20250103091900.428729-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the `riic_init_hw()` function to use the local `dev` pointer in
calls to `dev_err_probe()`. Previously, `riic_init_hw()` used
`riic->adapter.dev` in error reporting. Since this function is invoked
during the probe phase, the I2C adapter is not yet initialized, leading to
`(null) ...` being printed in error messages. This patch fixes the issue
by consistently using the local `dev` pointer, which points to
`riic->adapter.dev.parent`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v3->v4
- No change

v2->v3
- Moved replacing dev_err -> dev_err_probe into patch#1
- Dropped fixes tags
- Updated commit message
- Collected RB and tested tags

v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 9041936fde04..459f7158ed11 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -320,7 +320,7 @@ static int riic_init_hw(struct riic_dev *riic)
 				      : I2C_MAX_FAST_MODE_FREQ;
 
 	if (t->bus_freq_hz > max_freq)
-		return dev_err_probe(&riic->adapter.dev, -EINVAL,
+		return dev_err_probe(dev, -EINVAL,
 				     "unsupported bus speed %uHz (%u max)\n",
 				     t->bus_freq_hz, max_freq);
 
-- 
2.43.0


