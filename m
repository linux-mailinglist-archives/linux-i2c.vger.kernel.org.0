Return-Path: <linux-i2c+bounces-10108-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6334A7D17D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 03:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FF1816FA6F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 01:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F6015A85A;
	Mon,  7 Apr 2025 01:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fe6ihRZu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910BF35959;
	Mon,  7 Apr 2025 01:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988031; cv=none; b=KqlESTykGJgo3J00vsrCUwm3HpSJebE7YpsX2e96iOuNjRVZFTaFO8tDCWPBXhpjYj8pK6NJWsT5GVvZUraLxc2f6OJFINuaRErmPCVs7iYAoZ88QCBn0vNwXUKFzI6sNw0y08pyD7pcG3lVXs5BcWu7qugmfoWWVrTkfxlM99c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988031; c=relaxed/simple;
	bh=jYTLY64D0l34lxLFo3j+PHTtaLiCbOVjmwJfDziXE8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rWQSGC4NvStU0Zv5YEocL764aHm6WNh59M4JvLW6sngwe2hh1kL6VlSQYgkmFP3l5vfu7sjVxsED0/Td206xjvKtA3SGs/0Ij4LFhQcz+Lvq7lufwy0oSGVypLqETpCyGKYpMsrZOzW02wUR2hkRPC1uM6OX9qGD3MjhPlqU4Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fe6ihRZu; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-476b89782c3so42882761cf.1;
        Sun, 06 Apr 2025 18:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988028; x=1744592828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JF2Z/LMww8mdvu9Fif8Aazjm67LPyxM6t9FzcA9LKH0=;
        b=fe6ihRZuPkQtShY3JPas2nc+xtPAY+Q7PqRFp3GfjK/JtoZMRnhhvWrHe6nLViNNSc
         nsG1FwDig95ZQTbs7QaE8uP7NKPGClgAUwCBLofLKPphHcBz7LV8u+EdO6GdgJyVA0Vy
         Hlgt4VAiwPs+zM97u+rbHgxD9Qi7njq19yPHqcE8fPlEaKfqXMFDybWjnCjhQeJY+QAT
         LOMKvzQuzXf0uwVYF3QlQ7tZ+9R4+EtN68/VCgL2VrXcNRgJ0UBMmUWEW4JkomZ9i9ZU
         tuAHckfZH9CFCAMoVbMdIInmKl4Qk/1YgQTuEmYWHu1iNMFQ7bZDXTTcgunD59u/EBRc
         FRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988028; x=1744592828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF2Z/LMww8mdvu9Fif8Aazjm67LPyxM6t9FzcA9LKH0=;
        b=d5iSfqszW1/QtliGbmg/rHFyNJtEfucc5jcdkvLBaLTu7o25C9GPbjfvWFp2oBmal5
         KcVtJ1kr6W47pSlpNigsDFT9nFgN0w2zva7cZWb8eH+oL5EfQrtj2bIvbMbfpvp9gnS7
         iVPSLE41B78Ks8zX8fM6v3WLEWhZofSRetjbvi6hBbMJya0lzyM1NLgERL+Nkhu2oiP5
         QAUSRk44JxauYm1qs+pMSidC1sUt5lzLd4jx9WU4Sw1jRIfMb9nTmaan9Ds/sl7FWjav
         bA5a5UM+hussZF8nlB/ASmQps1GkekqCxcZzUIJ1TG4OWwjPHIV4xgPe4zg9xwbMfPu5
         1VcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSV5XI5M5HzOZpQjXHqUge01uGLLKrl2U5z/Z5nuoXZvG2i7eRZSOF8HuDObI15AVjGsy+9jtiDMbi@vger.kernel.org, AJvYcCVUPF+ahTvg3Tzob+/JaXoUEH2r9viXckEhmA4XVcATuxnUO4YKs7lf1UwauZ8DaAvBb4sIyiKH7uML5CG8@vger.kernel.org, AJvYcCVpiRwqrRybypNtHx4igZ+MM1AZuW9S4ne0skbPDGJShnqRL1Xt01FLVspYazL4E7dtCBpbOlMONk/Z@vger.kernel.org, AJvYcCWDsOh1OkR0+otVLTmrBPjnP1kj+3i7f85gDl0P/9dc6AXJ2LRkYrb/rCfTL7cVlv5XivHzfOq3vyxT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu9jhbj8ArT4cEzFKy5/XglXG2VU8yBLzLCL1lxg6c8V/8ptx4
	RCCvGLOscEABepI5DKTgIIU7k4Ea+fc9CNhiItdnSh6XbCo61VRQ
X-Gm-Gg: ASbGncsh97ozFHFEDURa9fZFVKr4Na+V9JRCtryLcmQSeaNcZsVZdeh3Y8gDbwmHr9P
	O2J26b0Dwuxoqen9prVP+jLoGr7DAfPyN5dgOTI2xXTwJeZD9L7hcaQSewp3xn5WeIZ/x4bA+VH
	u+Dixlx6QLeR3FF1wdHvonH5F/ga1yj7ipQ9ovq2VlxJqWf9Pm7KEZPXFVz6x0UWJhDQW31mAXG
	X2VTpVM40dsxwLMo+nyd8wnkARLrbJk0WLfCpn+LVu5GXVySit4CMFK6iR7o5rXBqD+dLln7kgL
	AL4NodwQgMfI6H1sz/vE
X-Google-Smtp-Source: AGHT+IEjRuU35AfPurfPXYbUmQsHwNGIrdGvMyKJUg9772NQKPw8J7O6eXPVhRjVY/XGKChEAioTSw==
X-Received: by 2002:ac8:588f:0:b0:476:c82a:9fe7 with SMTP id d75a77b69052e-47924911dc4mr120825721cf.10.1743988028468;
        Sun, 06 Apr 2025 18:07:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76e73558bsm530443385a.17.2025.04.06.18.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:07 -0700 (PDT)
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
Subject: [PATCH 4/9] dt-bindings: reset: sophgo: Add SG2044 bindings.
Date: Mon,  7 Apr 2025 09:06:09 +0800
Message-ID: <20250407010616.749833-5-inochiama@gmail.com>
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

The SG2044 shares the same reset controller as SG2042, so it
is just enough to use the compatible string of SG2042 as a
basis.

Add compatible string for the reset controller of SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
index 76e1931f0908..1d1b84575960 100644
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
@@ -11,7 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    const: sophgo,sg2042-reset
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2044-reset
+          - const: sophgo,sg2042-reset
+      - const: sophgo,sg2042-reset
 
   reg:
     maxItems: 1
-- 
2.49.0


