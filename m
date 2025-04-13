Return-Path: <linux-i2c+bounces-10302-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE74DA87455
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7BA116D383
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7331F3B93;
	Sun, 13 Apr 2025 22:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QW4iNaC2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11841EE7B1;
	Sun, 13 Apr 2025 22:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583763; cv=none; b=GuaL4VXGdsaZ0yhMuXibUT12HXbaenay6WfcRk0lvpdCQPJni5+b20bJtXtSF7974a4FPfzYMsn691G205KEzGLDb4k+4joogVgnv6iMIRthStdALg094mRcV+CUf9b00EiYxLpWKwQ8HYUmYLRPDW8M3VmYHuxeJEZxw/7hQmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583763; c=relaxed/simple;
	bh=7dHme/Vx6fkQgu4u9qEbQyCY/VKmf6dVZl22pAWFhqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQA/dAcEPMCDm3P1HcmEYeVunp9ZZiojUswvFroZCDoA9gdVWxF7rTkVNHJi5AmJdzSqw7UQmh9M57RQ1no60hqaZYWptIQgSiAZHdq6mDZFsvFTQpd1jDchsJdmRdVonRim+yXKbuIc9R3e5KEoUDFWqSOpdEpYp2qXNf3jlVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QW4iNaC2; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-476b89782c3so39275301cf.1;
        Sun, 13 Apr 2025 15:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583760; x=1745188560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMOUZ6qRg9W4PB6CSqOFfx7Fn9U9SQfI0wC9q+7apzY=;
        b=QW4iNaC292RNo4HqWnuTWo4XWk4Atl2/BdGCdw1UaLHD7C7hUtcwWZzm39YUDD/5c0
         khwVLf8e13ThbuEoFyhXHj/lZakoys5FFnQ1T3MkwWNo1PET5nkpqm2RoYeigXHYT+JX
         gV/ED4BS/W511odpA5InairXJwqw/wrtUUn0m2JgXEaJ0uOW1vhi7heYtvPvs940hmHK
         z9n9W/QpLkkCXeYZFQjpg3F+1/PrEnSmxR1aZodZUopas7wrGJwqbDcYFv9hQgpelgww
         VANO9hadQohAWX00tB9vSllu68IKziAAKdUTmQHtLUTuIzbGa4Lz6vE7N+TaXFVmwpb9
         Xh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583760; x=1745188560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMOUZ6qRg9W4PB6CSqOFfx7Fn9U9SQfI0wC9q+7apzY=;
        b=RTk8C/5N4Qy9y2HrkiZ8bDeag6un9g2jb/V2CqvsYuz8IauWsQm4rwIPKJcx4ZL1SN
         s6d4DV+FUmE8M1wR0LLwSnxqGT+TulgUU4gQ0Fct9dTXah7RWzY5anGlJ+lr4C8uj1O8
         rheSME/V5Irap+JsAdsdFgSvoLF/s8WrvusNkdNTgTv843QFBzm82akZ1lLF+D8SObFq
         KxFdX1HeqisEo/FAz0oAUIevDwNeD6RXnJWgbjGDd2cIK0UBIRma8pREzNxTHX66+BGv
         5cz+rvFyIXrEjVdZQDavz5Db8RtcZoygvmCZh6cHbIDHg5zMOrWt4Sx2tRFbIC0f/j8S
         84og==
X-Forwarded-Encrypted: i=1; AJvYcCV070ddHPPSvB86g+flstW5rrUkloU2EO2kckdplD+b375eZXlxmYUH+wVkBjkF4V/6et3oNDkngfqL@vger.kernel.org, AJvYcCVX5JYo8ewfsLy+h93qtFvdu3BUpRDjJ+EuyP5MEbA4mjZ5W4j8jVh7+ZhBQxQwpGquzGHY4zrFkL/N@vger.kernel.org, AJvYcCVsBb4WL9oJL6VhlkwyXcrJwkXuDGpMVYX6QlNw/Eo/snh0ti3CTbfJ+aJF1DeHpu2qXoXBUMHe8YdJzEac@vger.kernel.org, AJvYcCXblvo80QJ7YhbVC/aIj//yjCS0r+V6+oJK4RWn0KKoHaSnNjtjPD7bK6xYAZt4kUwzzz23hsqRoa3y@vger.kernel.org
X-Gm-Message-State: AOJu0YyCBWaYz13lxzZ+D8gV5fr4aKXtHGK8naUVRp5MntQITaLbqRS3
	t0DfjSoWDAxQPhcNXTMeTgj4ib6qecV5A0mh2wc+Q3sDTyEDzU1M
X-Gm-Gg: ASbGncti0N6McGJ3AxRbxUoclt/0yVT+Pcy2s+KrSKL3M0wyue+kA50VOkQjlAUSFZb
	c/Q+icje8FOTQFPUqXntfwPFzzwbfFYytuTjMh4yBcqW3sykB9VLWcYSQyolnCxmjGPmsF/O4JB
	X24+Sb+0aZuKoevdwNQBnenn8vJnwkKgjZloTaQxMA7bnJt6Fj1ge2KGZg/+AKkjl8nzCSgsPSC
	toSfMrxPWlXduo748wKcJSZCzznPBmEiAwzJ5wfVgJFHrCdGYJtqPZad5/BXixwTOEoriON0I0J
	AZ2AfoKH0TRgey8D
X-Google-Smtp-Source: AGHT+IF93rzEVWRRKOIxWAcvcau023Tgxa4/7nUy/JnIgvkSrZ8RcL6P1YK7x8N162WFUx0/ZurzFA==
X-Received: by 2002:a05:622a:2d2:b0:476:8f41:7b8a with SMTP id d75a77b69052e-47977551e2dmr154754621cf.15.1744583760520;
        Sun, 13 Apr 2025 15:36:00 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796eb0b581sm62137321cf.10.2025.04.13.15.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:00 -0700 (PDT)
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
Subject: [PATCH v2 03/10] dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
Date: Mon, 14 Apr 2025 06:34:57 +0800
Message-ID: <20250413223507.46480-4-inochiama@gmail.com>
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

As SG2044 also implements an enhanced ACLINT as SG2042, add necessary
compatible string for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 065f2544b63b..d6fb08a54167 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - sophgo,sg2042-aclint-mswi
+          - sophgo,sg2044-aclint-mswi
       - const: thead,c900-aclint-mswi
 
   reg:
-- 
2.49.0


