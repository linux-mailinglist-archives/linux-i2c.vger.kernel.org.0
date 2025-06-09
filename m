Return-Path: <linux-i2c+bounces-11315-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 405D7AD25E7
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 20:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 209551886D4C
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 18:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B4D224AE6;
	Mon,  9 Jun 2025 18:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfSBo5TP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C5E220F2B;
	Mon,  9 Jun 2025 18:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494491; cv=none; b=dEKv6VKs46IiSF5x2DW5qBq0vROwKMzGwg6gr5A+qcMnYH9JH4gbyTWiJVEnX+5DgZF3BaBne7vlkp8jrXK1lQh5rOJOySLyzr78Phtr6sXjJL9eoENPeH3H231pJewoVQ1eZ1/MWo7y0gioN2wIQLqwWBSDPkpdgl4ymTEw8MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494491; c=relaxed/simple;
	bh=kbu34hezaWRLy0Re3uwTUPYVLYlThZp29+Rm9xly5xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kdc4FfnCGW/BlY5qR3j+tONmhirdp/aBpGeKG/GcIvM+4qb1P7LXtUIhzTIabRZYXj5KJBma9xISh05T5G07J7GymqBNkuxR2kpZuNC9Ns7prRg+DM16WkyCZnfqgNg/Z2A833QPLSFnVcfXzgUG0+9T1GiwX7TgzMPxvuGJCnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfSBo5TP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so2660801f8f.1;
        Mon, 09 Jun 2025 11:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749494488; x=1750099288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9V5GOYWzQrnpXJrys6asPEd7bmb2Ie2LzydP9ijFVU=;
        b=gfSBo5TPuW6H362giZH11KCMsiFv0drR2Lh16u1odvYvktSqBBeKdXJj9QE65zCJTX
         y+oBVTL7X5uI78y0tvMbgJ8IXyOG674KJPd9nZYYIb2wiUifudQ/DSrk6IK+7HX0YX9H
         IjFYoUJnOvo7rZwWtmJP47CzlsNhqyXOVSi7QlvXKqowH3nCAsH45Zb0qDs3+uMbp+23
         p2oo3DPXT5GeJeVWUCj2mSM81k7LSri5DvbhcBO/g8I5R8rBjaBTs59qhHonGg0xdoB/
         NP9OkSHJGPmICOrFeGC851ccCGH6iRJNdaHibJjuRfx/y/WNF9w6RkVBdD2R0X0LNjo5
         ksNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494488; x=1750099288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9V5GOYWzQrnpXJrys6asPEd7bmb2Ie2LzydP9ijFVU=;
        b=LnmUuOaJ8BYzTtA5VqQfnz66F/YR0L7qGHTP0+vh+J5Jh0zvEVIJJk0yL1KEwitkAC
         1I7oqoffezrTVcPOG5A4PudGkkz+qRU70t0Ir7f/2C2S/8JOSnXCH6OExiS3HWub2GIT
         MEfIWEbW3jKXg833Crq/dGYtk2Da4om89ujGbvDqNi+0cNDjt1+562ksHBE+Y9gn3Q8E
         aTtVLbAIWiS9jNlNFKnGS2iYPZgZ3cfdxmrrsXT58hsKSdDRPwVR4UQvf9eQsg+zjNwn
         MbYXFuM1OtmQ0gkNJCK6fEK8OD309J8i7AdEBKqOHmarg7xxpn9v0NP6ZVL+s2ALFYE4
         9diQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5wXWfBO8Nuzk+AD4wl+KheovjRpHjry9vtUoB3/5nivsQUI1czEoppT8ImJ0OoyA8JUJbGrCT9K1s@vger.kernel.org, AJvYcCWUgKIMyw1jdBucozxEfj23JG9zhPrVavhBYSVtL28bIl6H3MR+gX47T0fiufgURE0D6SpwF9JnWnu7HigT@vger.kernel.org, AJvYcCXO5ANpCMo9yFaIkS2IUzf/ZDnGtadwhPsATv6HkW/dktv8FSv9ZRw2mHNawdW8fVjEY5/qBKR8sy4e@vger.kernel.org
X-Gm-Message-State: AOJu0YwX4u6Y3DGK1pe9ZmHzs3SvaofHUbh+HBx1YRW1THuccMNPcf9c
	2tIzfwZNB8gsNnV3Q6cSkb8a4CLvvYF3vZ0w/xgLiVnyEssF8UtxIloS
X-Gm-Gg: ASbGncun166Ba+vFOCu2ov2APC9TLwrxmK1hY2na2gWmE0adOhyxlFLyq/ebRhLOXaq
	aAa8xLLWmWolG3rCZHhGvFeW33UemDzRM6LG71bH0Bfljs/nn+KK53CsyjgAB2yY8Lrz3BP+BQp
	VTamy4SEBMn2FLRCyTnY1vctioJXjKo2VZvEzUja2TGNYJP8LWw+jGP035xRWt7gRzahmK1FiQX
	LScclj3TlH0daAVkG9OqYj96IQjEfkYa9DZcjrsWbTknFuKAIljXcdzmKSKI8NlaJNtFcWUZpTf
	6l0EypUXM082+0Q1Qm0+A6YYisI3rFt/xCZPt0uftvA9dGm/Ef0cUgfgmBgLUlJ9xkHlBslkP/l
	+FGG0ljXr
X-Google-Smtp-Source: AGHT+IFofTSMC44JMcnh8FTNU3AHa8Y0tf8Fgt90QA5pm3n5mDD+RVr+5HCxYKuDHk5rWul6avLRhw==
X-Received: by 2002:a05:6000:18ac:b0:3a4:ee40:6c85 with SMTP id ffacd0b85a97d-3a531cba357mr12136395f8f.54.1749494488157;
        Mon, 09 Jun 2025 11:41:28 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f04dsm10137865f8f.73.2025.06.09.11.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:41:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/6] i2c: riic: Move generic compatible string to end of array
Date: Mon,  9 Jun 2025 19:41:13 +0100
Message-ID: <20250609184114.282732-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609184114.282732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609184114.282732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reorder the entry in `riic_i2c_dt_ids` to place the generic compatible
string `renesas,riic-rz` at the end of the array, following the
convention used in other Renesas drivers.

Also, drop the unnecessary comma after the sentinel entry, as it is
not needed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # on RZ/A1
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
v1-> v2:
- Added Reviewed-by and Tested-by tags
---
 drivers/i2c/busses/i2c-riic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index ecd1c78eecfd..d0b975e45595 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -693,10 +693,10 @@ static const struct dev_pm_ops riic_i2c_pm_ops = {
 };
 
 static const struct of_device_id riic_i2c_dt_ids[] = {
-	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
 	{ .compatible = "renesas,riic-r7s72100", .data =  &riic_rz_a1h_info, },
 	{ .compatible = "renesas,riic-r9a09g057", .data = &riic_rz_v2h_info },
-	{ /* Sentinel */ },
+	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
+	{ /* Sentinel */ }
 };
 
 static struct platform_driver riic_i2c_driver = {
-- 
2.49.0


