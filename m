Return-Path: <linux-i2c+bounces-10308-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B549DA87470
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B319016D837
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1861F868C;
	Sun, 13 Apr 2025 22:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTKc6Gjn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F4917C210;
	Sun, 13 Apr 2025 22:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583783; cv=none; b=OBKnPIGDnC/Y0xvVPBP/D9eFyHjCvui3L8KQ6yGyZYWu5DflyHN/114UmS6WGuTfX7lauxMPN1G/SYOyZmA7eagfmRnIAGlNzlFVGv1Bu6roqc3fKQ/wdD8faw6K576SAqgicaDFNgwiZp29PQxwzztj/R5QeI0sXNfj+njbvdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583783; c=relaxed/simple;
	bh=iQhEhvtWreTKjDgVMOLNuvuoP3LvWPCieVInBZgjSEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0eDTqrE/ye+1wSVyFRe2bCM+K6lQDWnS2XWDOcMtFBWBzmNQpT8bRnikF7ya6rKK0wCFvy9N0Q8kdBqeONrEPsu9TrisKsOiFWq0j3F7I8UZHqqUHK38Gf3W4wklEGexfO+Eib/9PnaobS9nahfV+VJT0h33Io3dGFe3PbkUKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTKc6Gjn; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so40243086d6.1;
        Sun, 13 Apr 2025 15:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583781; x=1745188581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujvrsKKJBm/oWRSDuVcF1H3tb7POrXpYuyY0zyS12hg=;
        b=dTKc6Gjnt+auXKXS+75HsNqY2lbTNFlxxAiSw2/Udgc3Q0V4pmltieVnKvkHx8v5Cr
         3tsq5bGtr9SLAwfezD2vuDZE0JC2dVIFZl/JAUrIao0RDI4c2EBExUCSXyIi2fDbpCr4
         PHhTgnvXwPE1R4tOUxkRQfcr45prvKBetjDTcwz/dxq/8mdeu1180vY0jRN+Da++aZXR
         EnjoIu+vuxVZpFmezOOxcaWLbHJowMjj7EYtUCIFOFSKpN/x2jLuTYoYrNXJRbR6M3Ly
         9Lzmv2p7To9JQpac0QnUs3ez1N66MDWWg5laYOxww47mkdzTk4i+DdPPlHbvCpDwWi31
         5dkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583781; x=1745188581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujvrsKKJBm/oWRSDuVcF1H3tb7POrXpYuyY0zyS12hg=;
        b=GhmkZI/LPVYR7hVI+HPa/Ro+yxJuM1UwEeuqGDvpQzyT02oX+5fHmSombDzssTxImM
         gb+FaKc3lGs6UOI2iQ8yt9g9T1Tt4gA6notyRWEgJL0Pzv7Bx3BU226VQ2Jxkvmz8e69
         r7Z2cgpIXEhDOPm51e6rVGCteaqa/hJY7j4Tg86h9cK6Iy7UMjrKepTL38J/hTWl4/8q
         SvgSzmE9/0W8rw5JU2Xw2sPhDanj/fMuordOZkvPyOY7IxrQNY9U/7yDzv6W8HRSxcXG
         n3tyyCC+WzxEibXfjqlXiD3BMO8FABlRPeK3r/O1VORPYJQkxgVZYVnjOiB6qR9WxqXd
         njJA==
X-Forwarded-Encrypted: i=1; AJvYcCUlLARMWt6Zlbe1riYAqs/66Fs1Qt7kUmbk14ZugenrqM2srpLVTQiRyG/geDABYiJaKBJsg0MiWfGx@vger.kernel.org, AJvYcCW2PwnzZpOQdsh9u61ngP30ttCsNO/XQ8FgF88tFxbiaMIsTfpz3Pqoqll5bBmkX2EpEHnhT0Khw51G@vger.kernel.org, AJvYcCWakJ+oQqFhjr0WekjdqejlqIrvc2oAO5SUgSE5YZRhPo0Wn76bTop4NOiFyK8mX5R/0TJdWYplT1SZ+Q8P@vger.kernel.org, AJvYcCXEdb4O07B8YTxGGFC9nCPk00qrOQdQzGNeuR+jli1JhQSPZ6kYi4yUPgan6U+WbJZEIFXmXXU5YNjs@vger.kernel.org
X-Gm-Message-State: AOJu0YwdmptNmldpjaYTHiFpFyT5QH+ixMh+Ru275vwuz7TMkmpikrHO
	x/rBvMw9BjJrMQn208edOd616c7xAHRxJUY8zzX8VR+i5vTOi4qP
X-Gm-Gg: ASbGncsbZHZwSTiPj9p2lbFbOftIcFCc7oyQICTo/5TlK+JaaPRS01TputHxL3Lkjrg
	VpxO3g3A5BVt59mznYNlsi6k6SN93oteDg0pM0Xb7TmCBFRvcTdzzrphyL31N+6/iA+2PZVR5zt
	UqHl5gOKC+J84AqLfGVyBV/wuIT9FfmSWtywZvp9iYnLhDI3kVq6FXmeBVuS/2nKC0lHEn/W4oI
	OLXYHhSnT+PMFdVn1DeGpnok7s/LwBBN18PFgZymedEpjSBc4blF8Aq5ReUVTkCxptqcmwZ278u
	n41mlYIKO1G1qeAS
X-Google-Smtp-Source: AGHT+IG/MwghfEhc97YvFHZWLozw9xlagqWPjSNN/9ACmR9MjI4Awfl/moCJE8mwkkuxdSflay6C9w==
X-Received: by 2002:ad4:5aea:0:b0:6ed:18cd:956d with SMTP id 6a1803df08f44-6f2230c7614mr156245706d6.22.1744583780708;
        Sun, 13 Apr 2025 15:36:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0dea10755sm71031576d6.112.2025.04.13.15.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:20 -0700 (PDT)
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
Subject: [PATCH v2 09/10] dt-bindings: riscv: sophgo: Add SG2044 compatible string
Date: Mon, 14 Apr 2025 06:35:03 +0800
Message-ID: <20250413223507.46480-10-inochiama@gmail.com>
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

Add compatible string for the Sophgo SG2044 SoC and the SRD3-10
board.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index a14cb10ff3f0..b4c4d7a7d7ad 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -35,6 +35,10 @@ properties:
           - enum:
               - milkv,pioneer
           - const: sophgo,sg2042
+      - items:
+          - enum:
+              - sophgo,srd3-10
+          - const: sophgo,sg2044
 
 additionalProperties: true
 
-- 
2.49.0


