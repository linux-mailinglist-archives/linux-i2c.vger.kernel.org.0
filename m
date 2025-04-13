Return-Path: <linux-i2c+bounces-10307-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC13A8746F
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 137C118899B6
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B08B1F5838;
	Sun, 13 Apr 2025 22:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vxi6+Rtf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8DC1F55ED;
	Sun, 13 Apr 2025 22:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583781; cv=none; b=ZxORzHViW7PyOMyGM1Gn+fjUOf9eU3icyhaZTgci5PIG28MG6Wa890YG9vy4EDwb8rAY/2S9/wJsrrSvpajRw45YuPS868/Ih7mHSpHdRkcW+28Gh2ExVlsdsfBPVCRh4Yd2NKqjtRvfi9s4kkFF1F0JXAn9V0b1K+roO+W0Obs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583781; c=relaxed/simple;
	bh=RtgXCHZc+h1RKl4LYdPxb9zDI5WSUHiQRGjVvqplY8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uMMH0iapaI18A9EUenes+68Mfg2uovJK9DTXcOwFZU8L7+v/tozfI1ijuEcUMWDg/6osZnRx5wq37b3HTk0KFqr8qHl6NFrpVeX0giTQeHMTyXFSoIUqGIKYcCRJyu+m7b4Wq1Mea3ne2cocAjCsBHF8kquyQDRzhw5GESbYRq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vxi6+Rtf; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e8ffa00555so31065386d6.0;
        Sun, 13 Apr 2025 15:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583777; x=1745188577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daviB1cPKUPKVTzlHwAPUCR9r/kY67ATms+WR51ErJw=;
        b=Vxi6+Rtfq2+fw2s625DTgXK8MnfpHerhf6Y+0XbVmd2+raYQSYtndojolazMAYEHbz
         y1upGG9S6oiRkbE5zal+mcXx/xhiorYGKfAeoq5emEtTccdEpvOO9a01R8m5T4N/77g8
         GkdD0y8lB6Oibb1o0oqkJXltOs3WYohmcyxoklxwBatANjs4/qQcAKxLOzifdrg3b7vP
         lJW84pREvjca/9SJkb5efIurY+DviaQLSxsXqcE1rzsZUvycQMWbQPTUzUoRWxJkevdz
         ZDDRSWld7zUJJDQbUg82Jy6ZehU5IpBrVA2Zp50TERDmPtR35aHO6QNCCVQUyv4wfKhv
         fNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583777; x=1745188577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daviB1cPKUPKVTzlHwAPUCR9r/kY67ATms+WR51ErJw=;
        b=nrmGzH1++shIYZKvoVgqlwe1jck05hrp/Tx3KaGJJQyUZpRH/hKj5MU6IDPQ6kBD1I
         jCEAJ7VDiLFf/1bpmti2wabNNkPXXF0tos3JmKkPKTLtXbuH+VZcxY6VevBUfDKeKIlY
         BoHCewQmdRssSIaiEXQQpu5GTyVoAeQ6DfBYyy+GuHzvpD4w+fjEExB5NNETyZgooJTe
         Ks09CJH0CNcCmYP9jdopzNN2lAUVeKzNENuh62wNx5p/ERhEx2q4/2aALlZCg28oaOZC
         lJ4eNU97zO+rbzDDlQfwHMG8Y4fb4tygCBQAlqmVU+o5h+9we43LHbXQRcf3gtOsoWR2
         NGQA==
X-Forwarded-Encrypted: i=1; AJvYcCU1hsdiO/IMtHhtZouPJeYHAEf8h5Vg5zf1AKew+2zolZt7gPSZ9Ztj8jspfQCaqzZiimCD9JguS4sgXJb0@vger.kernel.org, AJvYcCURC2onbdSlJ1wEkf6jdkxZmMmFdvxGuPHXRp23NcAk0LLBklT2gqQBeyQ2sV1abUBQ6eDgEcZ0jpV0@vger.kernel.org, AJvYcCUrInoxm59x4a8Ycg7D5lTxzl8zlx9FLRDxv08XibLpgtRMhgrJYRxfCmvjGoxCLJYJRZAnGIjkBMzT@vger.kernel.org, AJvYcCV/DNfi5/wMi8zqM4K3qODt085o/4i3DmTTnDnlURTeb6mH+qFW0ufR/+fQ1OmQFek5s+I5T975QJfn@vger.kernel.org
X-Gm-Message-State: AOJu0YwrEWnHRWo3VmSIaIdDus0EDJvtTf6RBS1gS8CgCg/sT56S75nS
	IsAQjUu4ra5xKyzf4GQJTOFIHLfmwdkVNhio8xGOJUcvpsKrVyEH
X-Gm-Gg: ASbGncuPHrIBpOucxL4j83QBtjyUYnU0lF1SVbgVsodzm6C0HZ9Efg/EcMuQrZY4UdD
	qYv6Dqye2UDo7fenC1t+NoNYcYDTip2flBKAMS3pd5oFo47P/C1pOqT+zXzMeq3Kx83uhHh6X5P
	WDdiCtCs8VmzyHaJMs0rVtAgifNCw4t1K8EAqSMxlynBttEQ9cL32caSeWuN1E83vYo0+OOra/5
	syYRVXTS6pRk1gRjMdB0f3YabAkYyy50ob9+shICH6gFeWHIWP/liN36a9r9SubAnLzJWoj/0Mj
	sxgOzLyJG3YglaYq
X-Google-Smtp-Source: AGHT+IH7HeWo8kUCZYyXEzOfMHfoiorUFdL+FJ/xQY39VdlD+gIfOhemdYptpXdGIj9JLJ3nuLc1RA==
X-Received: by 2002:a05:620a:4045:b0:7c5:49c9:e4ae with SMTP id af79cd13be357-7c7af1528bemr1539566485a.32.1744583777535;
        Sun, 13 Apr 2025 15:36:17 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7b82dcaaesm290676885a.89.2025.04.13.15.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:16 -0700 (PDT)
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
Subject: [PATCH v2 08/10] dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C controller
Date: Mon, 14 Apr 2025 06:35:02 +0800
Message-ID: <20250413223507.46480-9-inochiama@gmail.com>
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

Add compatible string for Sophgo SG2044 SoC I2C controller which can be
used specifically for the SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 98567dc791c3..d904191bb0c6 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - mscc,ocelot-i2c
+              - sophgo,sg2044-i2c
               - thead,th1520-i2c
           - const: snps,designware-i2c
 
-- 
2.49.0


