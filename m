Return-Path: <linux-i2c+bounces-10111-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D4BA7D18A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 03:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCAA51641C4
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 01:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9657E1B414B;
	Mon,  7 Apr 2025 01:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOyyRVkc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40521B0402;
	Mon,  7 Apr 2025 01:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988042; cv=none; b=MLIP2pj1g9tslaYGD/0Zck8OK8BLVljfy2B3dyI6T9a0waeFlmZ/OjSSrenPk9Mlcb4FwMy5DyUY+0I0xh1lV/ZcDuLzU8tH4NmAtwtEQoMJEC4AH8a1lBgAiy+6hMODvmKvX68GhPHc8oe8E5tE3wbfZn8DmYeISKw5cjkC3GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988042; c=relaxed/simple;
	bh=ynhhcwUo1f150hGrFqj3199JYk2ae3C5gR/H9LcXv6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uEpLEC9ncnQvXE/V76p6OTqW9U2Y9f19zOgoGT3HspBr6p4jDcrLxPMjYJUkaCYK3ku47SdvhUVRsdQy1IMfIU4XfuRv2+taN6Sw0hdE3/BirOIRzrkvVGVp1athXBFjhi8V7GlaUGzbbEgXMIBg+Fmv23/YV2vOfMFQlcwW5Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOyyRVkc; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4767e969b94so69106371cf.2;
        Sun, 06 Apr 2025 18:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988040; x=1744592840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrYRh8veKbR/WK++iUDgB0vjWe+7SJfZOYD+1QkYjj4=;
        b=kOyyRVkcD6msXXgPdQ1voomPkPEXoiyaeyk0srqzv0guyfn+2rFrXWA12AjRx1Y3sb
         /6+XjrJtCCdISv0DmDnpJpm4QN8lKSBQkaQC5I8yTZhdjvBPcxdhoPnlYxJJSAJr95ip
         Yn+pRKZx4OJ3EAB1jOoGEqMnf8cOjaeDNOw0vrhv/rvU5wLtUaa6FgXUtlDosbBEy2gB
         42Aqo2Lquwkan/7ohUTqwT+95PxyLGPSLCfVE5MHrsNdZrA+GfjlfnE4raOSrBOu2TnX
         qsqpGojisPgxDn0a2GNvcHyIS0jXWF8w7OWWG6zyTF3DtLq3VAWiyD8rPJUcrCUxows0
         07PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988040; x=1744592840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrYRh8veKbR/WK++iUDgB0vjWe+7SJfZOYD+1QkYjj4=;
        b=EW17d6265ipK7shtJFCj3L2mhg2bDUcN+rOnMTCQqaF32yhVBcXmHaPIwlX+Ztb2Bc
         xaRVGvClS0Ye4cfAQ4ZE6RXey2PXCosZIKGbMBBfsUxX/qQ9S1LdDM7fAsjhVJX7AC2p
         6ULKHSV0kfrnOQHcAfH4KcGCwheOOdFmS8aeP/KWqg0fubAw59QhSbU472tTXOFzJVDm
         Ddt8btggvPoL3oM22ETqhnPCTJhcj7XKiUNeiXCJDHY/dcXg0+gJlCjZ0rxxggaeFLeF
         mPQkBq14Lmk3ooLCrTS3gInlXj0FxXN+sPdKyUBC2i+lZHAW7QxNsvSMWjw+1ducpwHi
         IA/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6gDB3DLwqCwr7g8q48cvBlRzlA1z/giXmnx99xjIGKWQug311S0pTmYdJX5U8ONCMa/5ZtpZwHHZl@vger.kernel.org, AJvYcCVwGoPO3x7anJCwn4nDx6SdDATtAiliu3/78At2iyGaCe02XMq0ODI4Rh4Pf8xTupNCqnYkd+6I76Mu@vger.kernel.org, AJvYcCWcdPkqeivJzE4NINnR8+rnvqhuxu9j7I2iW7qgZfGZQANlITwRL55pHNHuPn5fP+nh5415TXavSU/C@vger.kernel.org, AJvYcCXeaBGclpqfHzf7nT9lL0TrXYe0eVbQHTM+ajL3V5F4yYDU7W/DFO9y1LUuFdfTnMsXXjpPkdgyks0Ei4f3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/g1akqXq1Oz9QyOKIMzigBxkN3fDYIfBd5qiYmU0HtRQspoX7
	29bXUhbn6ug6N9Wg0kxzWRnbu+BTPDJBH1ChYqc3ajNqxBO/xT18
X-Gm-Gg: ASbGncuwUZCU1IAzkS/8R5fsHCqE0+v7IOW82KbKAOcXERJqQ7OfV9AwmTyvdCFxgxT
	ul4DoWKeExToc8W9HKArO5mnVNewXqwN7Eg+XJ1wQNUdkL9BbdPmzLXabn7oXOwF91HGdxKfx3F
	wa8T4X26q2zaZfXVfZzRdaQKrzO4rmrDM85zeCUpEyzRHQ+Oj5OMd45tcJ61L2YznSvYSSLLwjr
	HB8zawCJjWMZ2ZSTBHA1OgPN5aMZYtvLwwvfRADEerWL/U0ezIp/7NkTbd03eIETEDmKzWEeq56
	0XD/p8cys1eIx94TlQ6q
X-Google-Smtp-Source: AGHT+IF7NSVs2pn61LScnRGHsXZgfeBT74D3nMQV8mVDwQLJa+8ffQmAQysOQ6zzmkdzOgl32XpRIA==
X-Received: by 2002:a05:622a:11c9:b0:474:f1b5:519c with SMTP id d75a77b69052e-479249a8342mr185000501cf.32.1743988039684;
        Sun, 06 Apr 2025 18:07:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4791b1443a6sm53214521cf.78.2025.04.06.18.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:18 -0700 (PDT)
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
	ghost <2990955050@qq.com>,
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
Subject: [PATCH 7/9] dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C controller
Date: Mon,  7 Apr 2025 09:06:12 +0800
Message-ID: <20250407010616.749833-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for Sophgo SG2044 SoC I2C controller which can be
used specifically for the SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/i2c/snps,designware-i2c.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index bc5d0fb5abfe..677b39865af0 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -38,6 +38,10 @@ properties:
           - const: snps,designware-i2c
       - description: Baikal-T1 SoC System I2C controller
         const: baikal,bt1-sys-i2c
+      - description: Sophgo SoCs I2C controller
+        items:
+          - const: sophgo,sg2044-i2c
+          - const: snps,designware-i2c
       - description: T-HEAD TH1520 SoCs I2C controller
         items:
           - const: thead,th1520-i2c
-- 
2.49.0


