Return-Path: <linux-i2c+bounces-10301-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5805EA87450
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6033F16C3D4
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0463E1AD41F;
	Sun, 13 Apr 2025 22:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4c3fKJj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221361A4F12;
	Sun, 13 Apr 2025 22:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583759; cv=none; b=lNIIx32ur1HE1oeIhY+i5/Qh3YtUKt6fkt7VyKNkb/EZGHDA87g/tKrCp9tPiCbOo36P6pDOU/GIyUhw3hFOyX7SH3/DW0a/Sx1AWUxyLgJX0Kbia6al8pwHLbmebf+IwJXJGx9+giIEA7yNAibEc5Fs6W/j2advwaca8k8Qfls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583759; c=relaxed/simple;
	bh=FDmFvbO80mwMvPs0RwjUUodvCGymVKrln63MPnG1KsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lwhjz2h8n5waRkrfrqIzH42jGLLeGwkgXlUGAkXOKU/Qt2/MSetpvMPvXhzSUJNlOz7tFuNzpYZZjwVK/+aKibNFdEjyVvpoYtONjxiq+9suwjIIHr+nPMwvJ/W/MEbPUaz6ufXqEsUkwNbnvbVd1pTdiBeFqKUBGA9ih4NgZJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4c3fKJj; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f0ad74483fso40754656d6.1;
        Sun, 13 Apr 2025 15:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583757; x=1745188557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43CgDCBjHo6ngYeTK6tuHPUS/Q9xbMOQmyIqAS15iLM=;
        b=Q4c3fKJjsa4YVhz1lrVW5hy+qish0fBsr8vSD8kJpf/nMQer+MaA01QV0nbiSVpmUB
         FYoThZsZVMJ9L2tsA0m5h6/U0H84qmOUImcQo4vHpCdzG7Jts8vyrS14VlqZRUOwVWgZ
         XrtHXjVQf2BHZ8NJdjxsPYdfyNB8vJmz4ucBXviNv5RONhEoYAdcQKE5476NRZLkBHH8
         o8jAxHGFsfcuWqn3+iOAO1ROWsNwQbz4RFCx0Y07HCsJ2JH5vm50xg+HJ3nJ9wWfmxbY
         +eMJEEN9/F24RFBQcBdqGQXr33xMN8oqVjF8cru/HAVhxwNiKT6DMz+ULfY+zYtDQt6z
         LvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583757; x=1745188557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43CgDCBjHo6ngYeTK6tuHPUS/Q9xbMOQmyIqAS15iLM=;
        b=RVdsqjwm7xN4eC7gsY4HfflaPhZ1XSqkyyNJdlvXkQdrZ6fZn1hqdtyw5VxUQyprSR
         Vah/00h/QJsIxqq20tckVp1gKmLv4eziBTc9h0nTMThM/5RkNLrQwlCPwadloCvtDdyw
         tGIaT0MKtTm7fvBT8T0sh2tz/yzy/nyS0+4EawjYGUOo0q+SL+POvXsQp24x7FTTl3YR
         IpWTr/KIY7zdSwgfJ6Whf1o9Mn0/p8w7KKDi+hiozHfOcnqnNTX31IC0ZoY/X3b5K+Ps
         QI3r349ELKU5PIYqNXgnnSKAZ+N2RZGXcoj6CqtyjgBRnoDHF6zNxENw+wWh8InKgTtf
         JDNg==
X-Forwarded-Encrypted: i=1; AJvYcCVbWIyBJaGNvdiOxu+0p610S+5SrYcRLIh9S3iqHQn7wDRkSwpYVZDkK6TMFNS6jasedRgNJjLbx2Gq@vger.kernel.org, AJvYcCW32hlGmkVsP0Lw20j6NUCjZsMG3dN8b0QKOUCynSuYV6YmDrcjPzSLSmsNIyN6/yyYsrI6xNvIQg8uGMlr@vger.kernel.org, AJvYcCWNSC+tHyC+ZZiPW70bbRlAySRrQGb/temPEJZDdlhQDxIOUf7JHIc9pt2v8jMuaPEwoW6bYf+pIZyl@vger.kernel.org, AJvYcCXzpovnT9p7f5lpgghw1AJQk1v5RD2U3TfwFNarnUotrrTrEimxMfPLzsHUHpLNhs5Fa+jbL/RuOYZl@vger.kernel.org
X-Gm-Message-State: AOJu0YwxlOi4oY7XhQpplVDFleo+ju0AkjSz6rvJcdqv3alJrnCZ7XWn
	tfjBKh3sFajlbIJge30sKcrt5mWtP2D+Gbf/nxbgNG0f3Q0b+5QR
X-Gm-Gg: ASbGncv297k87G7jNvE/VrHXYnig684eAtw7hfueVPLd1lMcsL0s0NhxOvMGvl/Q7ai
	3eq5ABFBWSfVPFH2RjW6Ue7td7wdLmVKa3qTte5BckUSqGUiWc4qQ8MVVyCOqPRz2AdAZXU4KBL
	isMPbuXoQmNgqaoev8jV///xtXbb9G7KrV4+ic02jyosfimevYiAYPaeJ817kW2ScmZfmX85KnV
	6sPr/BbXrSCVa14PNJtaWoVXn29yaDYuvIYI+F5UlQKhOnKZdxEa07K8I2trz591yAsfJcNFymt
	ejd9ogYpizunaNtn
X-Google-Smtp-Source: AGHT+IHgIwU8EKIYK2PDbSSxKKuKXD1TI7k5AoqJe5OL7pKcbt7fRbaJ6CDShheZnqef2sBXIGHehw==
X-Received: by 2002:a05:6214:1ccb:b0:6ed:15ce:e33e with SMTP id 6a1803df08f44-6f230dc388bmr178446836d6.27.1744583756982;
        Sun, 13 Apr 2025 15:35:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0dea07f3esm70937336d6.76.2025.04.13.15.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:35:56 -0700 (PDT)
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
Subject: [PATCH v2 02/10] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
Date: Mon, 14 Apr 2025 06:34:56 +0800
Message-ID: <20250413223507.46480-3-inochiama@gmail.com>
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

Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
compatible string for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index 2e92bcdeb423..4ed30efe4052 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - sophgo,sg2042-aclint-mtimer
+          - sophgo,sg2044-aclint-mtimer
       - const: thead,c900-aclint-mtimer
 
   reg:
-- 
2.49.0


