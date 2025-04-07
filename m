Return-Path: <linux-i2c+bounces-10112-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E49D6A7D19A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 03:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB6263AED86
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 01:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33811BC07E;
	Mon,  7 Apr 2025 01:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhLb5mWK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A331B87D1;
	Mon,  7 Apr 2025 01:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988045; cv=none; b=ebq/xIj7kU3iC1E7uQhjs3AezGieifN7+7XNPapnlzJAqUiwwsBiK0sGefPVbYvTaYQzNDpAGVkOEQmizSRk9C7H7fQySXK9bgREtfKAeSfVzu7vB225BACcOZPtUGkaimHWSnqMwoj28ILHihbqPNLlwjoU5FtbeBav5y9epN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988045; c=relaxed/simple;
	bh=popsEnpdviwZkd0Dtrr75Wt3oDa3FPnEI9/NClYd4xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5sFC/uj1ssjt5+R5KyCH7txcvu6Y0WLnU2Jwe+a01xg8v9tu4NtmOKp2po+zi1RrD2X6ybMeUi6v3ahRkM7zufZ4Nl4WYpUoll8wODEu4R8EM4g1ArwN07Ilmgj6kmzAF29cSnElV/czdJZMcSdYtqytKpErIHT3Sd96RJtRNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhLb5mWK; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8fca43972so46245276d6.1;
        Sun, 06 Apr 2025 18:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988043; x=1744592843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fgr0LN814PpxiHyiT7OJDCs0PtpZxoE4k4904FmXN1A=;
        b=EhLb5mWKqvd4SIBTQR6wSVvFxgnbJpR/LeSMzLIHepJ86RDHRXEhPDHJjwlliosdHK
         Cv1kTeXUuw9ijSKctFbTwMrjGjzE+SNaMV3ZR9+JJ7ytl0Amm6Fa3K0k0ebj9hwXyxzq
         9qGczPR69QH5YW3jTFVdf6CPmyL/oMbXKYCthS5kwlo7fjSrsXPjuXcTaaRL22pOjXGc
         BZwdzXsqxvD8BHUs/DTaXTFOG47D/Xk4wRWrqDEd5pP5aydUpX21lW3IQ5Zy8CCg7K4M
         GbwFxYeO8kshOGgGdefoAotVxyFb2shHzfk3s98bkuBxwd7UI6FDyMYaodlFvZiOODNq
         Gijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988043; x=1744592843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fgr0LN814PpxiHyiT7OJDCs0PtpZxoE4k4904FmXN1A=;
        b=J9rrHMBYzQMNjE3fxR+3h81/MuS8AbZuaKUqoyPPUcs9Mf1hv2nJsd+oSyvWzCPM/j
         Ydp6CK33513mulgPOasOmKz8yFfqqPH8HFVnC1sGmf0F9mFCPZOwdV1KMtkU/Syqj7bU
         21RLvt4vn4dldYQiY9SpiNDaO3pIOPZoAFlQKGpnvI+LmZwNua4IrKXT4ErG3KfRrYum
         BsbKzVQNA248XKNAQqp2k/Ct30l36mD5Mrh2FW1Z/2K7byiJazRrVuq331z71+W4E7Lx
         4zHFO8RwCu8OH7FqbTYOsoT6cMlgFkREtswGJvH/tbJ++8AjAOrWBl37qlVTZe/RX8RM
         dF/A==
X-Forwarded-Encrypted: i=1; AJvYcCWuAigFiNzeDudiwng9Dk5mRQi/uORNYB9zyAbXDynwURJvB/sSgpIPoD+IBIBiJQWu7rGtu3JiHg233lV8@vger.kernel.org, AJvYcCWxsoZy+SB11V4xeWobCSXyi8sEjN85b04xiZHd8ZxcV1UwHtGKXZqsiIHZta9tt8fY3AQClYJ35xj7@vger.kernel.org, AJvYcCXNpKjI2UO8VWUljL5VdokPEbSdfw7wxv1FqqSSjx2ghvZGnrceMRe/dsE3VokSbf7sUmTBUyKC1N+K@vger.kernel.org, AJvYcCXYaJC2uPLmkJWWJYwAzPMi9MS+6KkProiHUyK+Aus4f038T53yHYtlDnrhyElIcdKVchJW51+sUtlm@vger.kernel.org
X-Gm-Message-State: AOJu0YwZOCw9F8dv8aqpUM3MEuvHpnyORHVv5fd9lrUj/y0eV2g2afK9
	dNKGPwE4U5Fom+ecmWOH0iutCzKoBekahxwnBM9X4hLaT/IRamXi
X-Gm-Gg: ASbGncstsVkhcshKViW/YgkEiM776TSs5tAhTUjKbxvH8YopkBJGJpP2IggGMxkLSYx
	tIVpSueKHqnMl7kArmajEgQ15QcCtTt8O0+sUJhdfol1OUmVEnaBOMZerSgU70VorPX8+AWXT4L
	4Pa2bG0b0gLH4HdM+Rq74ZalDLhDAzQyd4PyYtex5/jsfkvMRvVN1hM4OBb+mnQ+HNTjs5kU4Uz
	qU1ioc2o0jIxRDUc7RYE8maRwYeFb54tx3i8/6RxVQzO5YcJsOGHIGNn+oBp2q+vZ+pMGqiLB+z
	hKVMls3Il0/PNlbBW0D2
X-Google-Smtp-Source: AGHT+IHUbWneKrGAUPwQnZkxyFwqsL7dFlvzrPr8w+sNokg1K3CrLnlYjlNIEnDh2HEVz8EqSTmwBQ==
X-Received: by 2002:ad4:574a:0:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6f01e794739mr119268666d6.29.1743988042941;
        Sun, 06 Apr 2025 18:07:22 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f047c9asm51783546d6.59.2025.04.06.18.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:22 -0700 (PDT)
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
Subject: [PATCH 8/9] dt-bindings: riscv: sophgo: Add SG2044 compatible string
Date: Mon,  7 Apr 2025 09:06:13 +0800
Message-ID: <20250407010616.749833-9-inochiama@gmail.com>
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

Add compatible string for the Sophgo SG2044 SoC and the SRD3-10
board.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
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


