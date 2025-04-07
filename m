Return-Path: <linux-i2c+bounces-10105-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80870A7D16B
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 03:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C80F7A4276
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 01:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86EDE6088F;
	Mon,  7 Apr 2025 01:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kl+g2vVK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C7F36AF5;
	Mon,  7 Apr 2025 01:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988020; cv=none; b=jbVZppffhJpEbJ2TcFdZmmQC1AE2rO4gcYUpDkJDdW1JgZwo7GVTKA0/3D9+EC2TiZ2y44l3UOqaRtV87EX64jHz0natlk9tGc63JCVdmJP01AAmBMnC14Ewk0blKKeZTZ+4UKXqnb4+MgY5C3HFcWNZWkO2wAuDqlO/VPE70Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988020; c=relaxed/simple;
	bh=67Xb0cRe3kqLGS8vDJK44RPpdgPBDQqj7cmtau1ZK38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=allbi91nvKxysUYttI6+tE8cLbpy7pB0IE3LUKVKe6txqTWiUknuzBxSQSmh/X2SQIYq5QSfUBYpgqyo8n58tS4V67Im9NSpztljz9RIGOhhuXasxMtk3cA0fyA+dqQ4IkhgFZJNQenPJ9MEfSEFirvHf3cLkWOrZPJVNuTXb/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kl+g2vVK; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47691d82bfbso80912351cf.0;
        Sun, 06 Apr 2025 18:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988018; x=1744592818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFs5RauZ5QOy8Ab3T4kUtd0LneBhBgJkwOZmpV0EdcU=;
        b=kl+g2vVK9mImOkwb50KlIXV+34Q1Rlr0DCmIQoTCqLFWV9Cto84HWaOXFQl4Df8za1
         mmIWrK8wtjGmn3N4AdtsKvLk4fa4BrZ8G6hortmhlRQdN3yH/Qw8VMrUY/pX3vBbLgX6
         qL5wbDauCoPWyLox6mQXBM7+lHJqszoD9ZKzYdeK35rDB84ptnP3WhS70jCio4Ar5jKO
         vKez9yXSjpOBCyme1MNoLpQ44pvo5td/G7eNKafOBOIAL3UuVZ+I5hBTY2/wqY+d/A0C
         UdjXmtdHqmZ/bue2sW13oHAThEEDkp1zos2GGjlHAMuzfIt/fhb+MJdqdIcltWlblBj/
         XbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988018; x=1744592818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFs5RauZ5QOy8Ab3T4kUtd0LneBhBgJkwOZmpV0EdcU=;
        b=mZAaDuGH57DdrTW0hEG7l9+0d8E/t7sGZCLcKHtXSWfpIfGmbCy3gKFUfzoya2cHMg
         xp8PJtzNauD/Azxpw7ZRYM1vP0Ni7p4JgdOVbUQOe5+M2V8ezFJ0njdRScl/jBkMy4Ie
         b1K/OIw4yLsunf0HyAr7lDWIPyDZcWcKXW2iEyyUwWhz/pJISvTh8SqFhTPDUdzrC6Lo
         ElvCOW+d0cq4jg0tChzoQ7FjLnkXoaY0Y0JiN8+P4tPeJNo50SntinpiaTogA98j8mSJ
         yxmrGPqBs21I2g5hnYIbuHbVxYkHqTVBTGpezi+OKhge8Scx0KUxH713mWOPsu5b0hKR
         W2jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKUIKozZeFdMd7as/FPQOCLYjSzRsZCJpEwHfObDUX/CNb4BF69Hyp8RLlCg9WmWIukrUChiFIyOj4@vger.kernel.org, AJvYcCWd+aOnmroDWtqtY1mfCVlFpWS4kJlJtl3ZiKlTvKOpr9dJY4RMfWx8i7YBnTnWVHWvOapHDDL7po2q@vger.kernel.org, AJvYcCX3xG4kVE/nWG748X/gkXXC9DNDDiLnpgwqBqgmjwpEccKHxuFR0k1AUDJx7OT3ujVTH1aq7JXl8r+o@vger.kernel.org, AJvYcCXGhmg6ZU83/unRljqi+o+GTHqLXpdaObRRYDNED/wYRwffOefHSVN+bI47y+L4LU9xzM0Njoy2p/WAA/ev@vger.kernel.org
X-Gm-Message-State: AOJu0YxcBxBosuCUSQMr/TCMmtTGJ3/mLFLGR3un0/ZrRgm0KnbnoMJf
	MQ9pxz6hUddc8+slQulh3GkPvtVnzCUfY4eAnJBa9QEn43QdC1y7
X-Gm-Gg: ASbGnctOMfGV44V+wk1XNS3tP0Anu0DgeWUpGdkmf2wCamDH9btY1pKjqmTtTP1h1da
	0g7/WALCrxoFPtfYG5KmW6suO/Rau8ayix1YPzRinBgJmK+woBvlx9vdyeBSILuYk8C1Ba8i4AQ
	Aaz36YN1UhPSoQJU3m123ZOKQqmUB05NRwKkZv4B39bNZntkd6gC0JBOQfYnFr5YMstU7fdYQqs
	U0UnSRSx0hpY5+2GS0o3AjYRjF7M+BXXH7MhJZx7sDuSISW6VgI3/W21pRGCi2jufvR8dK+KWkr
	T6edVjFrcbOjWqLL6FqU
X-Google-Smtp-Source: AGHT+IGThLD0f1Wc+dVeoU1jl4PtajVlgXRPCMJv4ypnlzRq3f4lx9CHT6fpIIMYrngbXMnRUpODkA==
X-Received: by 2002:a05:622a:48f:b0:476:add4:d2c0 with SMTP id d75a77b69052e-479249a7edcmr176008051cf.35.1743988017797;
        Sun, 06 Apr 2025 18:06:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4791b1266aesm53295311cf.64.2025.04.06.18.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:06:56 -0700 (PDT)
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
Subject: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
Date: Mon,  7 Apr 2025 09:06:06 +0800
Message-ID: <20250407010616.749833-2-inochiama@gmail.com>
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

Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
compatible string for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
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


