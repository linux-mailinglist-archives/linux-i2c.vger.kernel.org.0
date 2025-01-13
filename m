Return-Path: <linux-i2c+bounces-9048-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CB2A0B6E5
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 13:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E7603AB889
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 12:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8D622A4C9;
	Mon, 13 Jan 2025 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSEHgmHA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCFA22F17A;
	Mon, 13 Jan 2025 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771223; cv=none; b=GUIgjn3JLc3LeUotR/tR7VN/lLdsVWK3SaNdFB4wprJ1pFGu2jKr9zthYZL9lAeGCVyXPXlhcKsCk+4/453tXZzQL9CScLy50niTQ9NzRlv0/kKB0YKll26GJRPzDSly8F4e5H/5ne+6dpifxLduEGaVnSdvrNAsi9V827i8ulM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771223; c=relaxed/simple;
	bh=A+cAFzqBYaL4Zs8NQikZ1JgEEOjtnnh99UNkVD+R91A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CgsLcn0r1lLwwy5gByRxyxUU3lPRdeLO3xhx9vhoY52Ffih9eqv9Vrp5aOnkUlirx7eiMraG7DT24RdFlZFX7ithYgLpkJhSVVHsefAdmwVCqbXLcv4D5iBZJ57NPj6aQiljFs67OBhfLvS5FoD06e/8gf8hRUVi1c6V2xo8QkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSEHgmHA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43626213fffso31789965e9.1;
        Mon, 13 Jan 2025 04:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736771220; x=1737376020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poNT0Bmmh5IK2SPayphwfLNuv7i1YY72QjCWcSLlhrg=;
        b=iSEHgmHAQBgK8RLnZbCDpR8tNf30GG74A60QkC46VslgptSIHy3VsqKe41pg+CsE+/
         y47PAeeOlvMylw8RRFEJGMjSaeB7motPuLoFKVhs76ctdTfIZho947B1lsa8j9v4pIyV
         yTh0KwwwGoRYO9UkLjp989cXmPZ9oK/16P1tZM8krPPEdIQUi2lZmVtIaPNgo3WnhJqR
         cqL22nHLPt/EE8WNFTxm6YlgJse//duaUK15gK9ZitN+jwiF2W4gmlnyetsZsFe06IFX
         QYhDxV+qclKuvO9Y5YIUalMx8+p7dhXGsIA+TOJML+iCAAO674GsbmgbA7Omm910peaX
         0Izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771220; x=1737376020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=poNT0Bmmh5IK2SPayphwfLNuv7i1YY72QjCWcSLlhrg=;
        b=REYmRZNtDdbICCwEByBlQR6OIH9ngAAiaPdA3DeelPY/Xtt3/eUVf4lewK32URlCGO
         8Y1M4D4LYO4gvPsVdztrwT3Ojx0/CI2Yz9k1Wkh0LLPNqcJ+Ss/PYK1WiXpcxwuSpngH
         MdBqe5hkfEOXurreAFQkej+TRHrFmMf8AG1pAt157meGiq4ws6UtVw8QUr5ziJBmR8qQ
         HChuOBPwI1dXn/nozfRyvdAtd21wIOYKIsw5nemwLq2IWxvMc5PYKLoqV/jApTvSKBSc
         DYYDNNSWWCAf9L6+qYcEGzoEXfA5sYyRdo9a+Xfrl4G7av6eOsfCIdX+mh7+mZWP+gVK
         aT/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUN1+Lz6eSToRApzPS1GX7YusrTjHOJRZQBomuO7T1TZcQ/ZC4TCtbiFqHTvGv5ZMQhuNqKt1Nv6GM2S0I4@vger.kernel.org, AJvYcCWiWROaxHiTjTXyAlPzCHAtw+gZSGGPBg9JTWwB36xmORV0l+frrxbgQjt5kutOuPDWp8IHYYUSJis=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvS3pEhpaXb5fOrxu2x0qOwoynXI4Ecm2My1nqVHmnfpnEOnwh
	hgNnECTDRAM9yra9Gf7UG2bXSFBU9wm2j8wXDAotg792DeQC4xCby8XzUQMdD00=
X-Gm-Gg: ASbGncsRfZCc6CnS7TNE1r5kpab0p/sUmRFjC3hGnmO/uCpV5aehT0BoCpRngH59sTq
	pg4hebieYpGxbkcMkqXlPkANrg/x25v57WfSsQCu8LBas1AJOm360jFcKZHxM7wsnOF3GUeIWJn
	ph8r8fH77UvrnFmcUPvJYvgBcotrXnjs9ccCWxdA1ftM0g4AWw8I3ndEq0UgDOW/LkdmtjObRBV
	+2E4dB0jEztTgDbUPw8pbnKAG7QQTAFrezTx1dgsbTf/h4Pxmcj2BE7DQeJXTdN4o1N3RkE6VdF
	+vWzJSFebg==
X-Google-Smtp-Source: AGHT+IFJfwBXlyuVbXaH4dE6L99Fx92pkXUev8hcHAaUTFGJPZz/rT1ELw7nx0tfNKufIahFJWMmwA==
X-Received: by 2002:a5d:64e8:0:b0:385:df17:2148 with SMTP id ffacd0b85a97d-38a8b0f2ffamr12309576f8f.20.1736771219524;
        Mon, 13 Jan 2025 04:26:59 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c23dcsm11812720f8f.101.2025.01.13.04.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:26:59 -0800 (PST)
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
Subject: [PATCH v6 05/10] i2c: riic: Use GENMASK() macro for bitmask definitions
Date: Mon, 13 Jan 2025 12:26:38 +0000
Message-ID: <20250113122643.819379-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace raw bitmask values with the `GENMASK()` macro in the `i2c-riic`
driver to improve readability and maintain consistency.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v4->v6
- Dropped bits.h, as patch 04/10 adds it.
- Since the changes were small, I've kept the RB/TB tags.

v3->v4
- Included bits.h
- Since the changes were small, I've kept the RB/TB tags.

v2->v3
- Collected RB and tested tags

v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 370cb83bf5ac..cf0b45f9e3d5 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -56,7 +56,7 @@
 #define ICCR2_RS	BIT(2)
 #define ICCR2_ST	BIT(1)
 
-#define ICMR1_CKS_MASK	0x70
+#define ICMR1_CKS_MASK	GENMASK(6, 4)
 #define ICMR1_BCWP	BIT(3)
 #define ICMR1_CKS(_x)	((((_x) << 4) & ICMR1_CKS_MASK) | ICMR1_BCWP)
 
@@ -74,7 +74,7 @@
 
 #define ICSR2_NACKF	BIT(4)
 
-#define ICBR_RESERVED	0xe0 /* Should be 1 on writes */
+#define ICBR_RESERVED	GENMASK(7, 5) /* Should be 1 on writes */
 
 #define RIIC_INIT_MSG	-1
 
-- 
2.43.0


