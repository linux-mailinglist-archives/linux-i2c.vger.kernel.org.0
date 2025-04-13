Return-Path: <linux-i2c+bounces-10303-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B8BA87459
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23FB416DCB9
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FD51F4176;
	Sun, 13 Apr 2025 22:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBm+9iLv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312EA1F3FD3;
	Sun, 13 Apr 2025 22:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583766; cv=none; b=H5UfoCVK/TzgRcbALvjRHL++hy+HI+1hArzIwlrPtO1P1TjxzKxB0xHwxBViVVepvYDmY9NP3CCVCy84tn6y+OxPRVzZaOBBLKTU6w1/D28PrRInmmrkJseZuzdTRtTvv8iEJUYXj4hL9IpMvybAXY2/Ud6R2PizJAkV/9s02b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583766; c=relaxed/simple;
	bh=Z3pKjt6jm8qmltYPIKtcTmyIWWpyU/A0Zm9fLXjpxnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKCjPepOnwI7kqRReZ7Q0QUws5/XZhycB6gEZZ8cyqbyigVvkqZZ1QniZiWTeQNsz13liKd3FEKf6Gz8+Ruqzvm31ww0tziCmWshVk9FVqJNX9aYfozNgLE4G5b/IKSFE+Tysk21RRMZHmVQ5d2Pf2mSW/OdRG3O3LNj2wbLt7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBm+9iLv; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47691d82bfbso80969021cf.0;
        Sun, 13 Apr 2025 15:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583764; x=1745188564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxIhm0hMBOl2X8srvjlQ1v903Cf3zvDJK3JKql1lGXo=;
        b=hBm+9iLvRNZ35npInWiWn3k0DvtezpptAM0o2p9FBO5oCQb6kTtbpyzOF5r+rOVZfB
         IqmrBlQc4UxJTu9+w+1zaRM7YL7qPtIyf5bgx1UijGIKAQ5M9L0T0e4dObw4DmogQ84r
         2Ht79GsIyvZ2XE7sGqLjB0zgJCoIICRQXozkSp3z/yD0VV2ZiBgTjEE7f8n5zRVv0ANy
         IyGKafsS+wyeDNAhnpUfzDkZgQQtFo+76/4k2/dZPHV80swVfIiUp3BaTAkGqUvl6+jc
         trw7c3Zes9wyFcPyYL9TGuqUmsMPNQ62qb64QVeeins0BIhYN1U/vyoX5NNlML6xN1Xl
         ANrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583764; x=1745188564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxIhm0hMBOl2X8srvjlQ1v903Cf3zvDJK3JKql1lGXo=;
        b=U9BiqJW5CT+EKWH649AX+LUBWTSkF8oIXrG6CAWlNdkLf6ZQoJ1WL9zQho26chnKcF
         XY89P3sR5tyaws7BqvURQ4upJh90TdKxtHVyEMdrd1ZKuO7klDKE7M0wyfh1N3FUXBoE
         nJX+RK58fGHVbVbSUMKUcV2OEZbicfjujp/WQ+c8Q1UBl7DUp8Em8vF+s0lSz4FP8WYO
         hRTmUvOEo+0IAayAmnkHVcFerY2/wcY6BU9cDAi0QxJjry5Cy3705jPA/XG+mHtlmrNV
         NOHdsbJaF6Z+PEwlUoodDaCHLzMR4rtd0Jsaect8+/H4tH7F53PgK5gHGx9HxztTyJ06
         gGwg==
X-Forwarded-Encrypted: i=1; AJvYcCUGrBomuQg6/kSZiT05gSBe/y0SzhIXIswoYTkCrxMN/jpKgEWU6cpMsVJMiXGI9aXIkeOWiST4V3BY@vger.kernel.org, AJvYcCVcQzs1FMQH7cuNte7cPK7weD21HXI00dfv8fq68h4hw+j88F/2xOU27lIUOp5QyS9Y16KEU22KqF0IX+bD@vger.kernel.org, AJvYcCVf8tFM4lgzR3Pf+D/XfVbjMEjpp9DjJu8kJhUWcUBKuwt5FAiTKUCwHCDVvFb1iZSMJOYo7fN5CDJc@vger.kernel.org, AJvYcCXTIM5E8XFUONppLdR0ee5Vdtq9XjIMUM8hmC6oupcgkOUb93TF2i3DkULnBcAyzytSZXNa8+7YxL3D@vger.kernel.org
X-Gm-Message-State: AOJu0YxHKTL0JLcRdhYnEgzS0wv0j3ENepybB00kuGhGBqc184tf3Wof
	RNAfFIc7/Zp7GYrJXCqI7bK+hSODMoXBjAOl3igo8x7q4CfpOaXl
X-Gm-Gg: ASbGncv+dNfb0mQkW7UMoq0VzSU40iVQ5TpYd2OexbTT8inMYZ/cT9CdyoRkqVboLBj
	WjcupvBRNKODLkKepTLz5tz5ShAvvAhAwAe4YUE9VEoDaWdHWv6173Ry8Qd3hQmgw3YVrc2T3PI
	fisJezOzS5KLbUx1COFNIpvIcNDSISozRbBX9uhksMg+DKXv8g+Z7b01F+CMNh/WtVco/GGTsEj
	0TNub58ibktu1fgA5r5WA6ve/97XDdAV8wMm0gtXKMq++z69QJI9eqTnlKOANy//DN94MuahMOY
	KcCY7WSHwcO5N55L
X-Google-Smtp-Source: AGHT+IFo84woRciVkAQ2hF3obX7SVl65Hj+exFcnkwrsEEvc3GWg1aGSkIMkZ1v62wMhkdyNDFHSrw==
X-Received: by 2002:ac8:58c9:0:b0:476:60a1:3115 with SMTP id d75a77b69052e-479775d355amr169052091cf.33.1744583764114;
        Sun, 13 Apr 2025 15:36:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796eb2945bsm61605741cf.32.2025.04.13.15.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:03 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 04/10] dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
Date: Mon, 14 Apr 2025 06:34:58 +0800
Message-ID: <20250413223507.46480-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SG2044 implement a standard T-HEAD C900 PLIC, which is
already supported by the kernel.

Add compatible string for Sophgo SG2044 plic.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 3dfe425909d1..ffc4768bad06 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -70,6 +70,7 @@ properties:
               - sophgo,cv1812h-plic
               - sophgo,sg2002-plic
               - sophgo,sg2042-plic
+              - sophgo,sg2044-plic
               - thead,th1520-plic
           - const: thead,c900-plic
       - items:
-- 
2.49.0


