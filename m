Return-Path: <linux-i2c+bounces-15161-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF2ED1F534
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 15:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9180D30049EA
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 14:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7CA2D594F;
	Wed, 14 Jan 2026 14:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1+Kkgc4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E0B2D595B
	for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 14:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400049; cv=none; b=b0QMNp/tKP/KMQ/ZEHvwiEj4qbVGPbcOAKh3+tEAnHRQSUDpGQpOTAFidFELlvHUxpbBUvnVmPwPT5OT1mKT8uWr+xgu7dSgE2mSqC6UOqVtzPJIH7JhuYtS8spTpbjL6+ZpNC/ipVFXycryi5KM+cwmRDcZudTuVE0nODfaCMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400049; c=relaxed/simple;
	bh=uI5UZ4Fop9VKEyQ8e7Vhlvs+3JV7DOHuBqbOoz+T8Js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWZyvHoV0VPMHMr07HCM8pkd5Vj5ZKZroduhnqk37hHwG88WQYEA74fWbyoUXsrscmVGUEGZh93w0Sapjni8d3LrzwWQwu7cs7fGztH1bNITsrFjr9KLrAEUXU9n/nESemI6ierzzyJRBv9hSdvYns/Ps+CiNrwGk1Rzdg9+aVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1+Kkgc4; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so14010047a12.3
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 06:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768400047; x=1769004847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THHBPsnJ5h41RArKKPut42z3fPvZexdj9Mfmq6vuelM=;
        b=D1+Kkgc4N5Hf2VYP4ZAtPG+BZA4mOc23ozH+iTMdAh2SVyQ+Id2RsNv0wK5dtREfOm
         pt2W2Ql0cCkjGYz3ZRjtGiMYKFTmcxHFyTu5zV6YcvwM7pgOnFMVW01oYyT16oXYGgBC
         CsDa21NSE+Bto/LtGPFxgoxK+Tj84RXzDSJ/rqrWfDPuEywjRBCQJamxjNJD8LhzStxI
         XhuBLsRd5MvEAJQvSskWcDP5ny96FmWTYUj2p0t2hKUAOO6RtLZZWRhpMAie09Ud349Y
         ANyfUr/w9R9uPkppexe47De3gwfIMpzpYshbeUsPIdjqUmEDQOJY+aEipm3MQI01fOx1
         sQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400047; x=1769004847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=THHBPsnJ5h41RArKKPut42z3fPvZexdj9Mfmq6vuelM=;
        b=XlIBYhIy7xnG9sn/nebbCcbqhgqgBj2TYIZq2ZTlyPUOEWM2OESAXvgWfY16jKMe7e
         jEbj/kRIY0UwrELGSdHLpGDNX9ffJK4SvTO0vNGSenlUZyY3hrP7V1vBQ/2+Nw8vwz0f
         ROtkUW9vY2lrN8N/xJYddZ9c34ahOEgj9Z9XrymzHAqSvSErUSzxUvwW+mlWGNGX8wNH
         ukeHjzIakPhW84fDqmGJecRo3Y1IdMbTOArI6GKk86l0SvUV22qyrpj1shvoVZCqyf3X
         KETWtJ5Cyg1pJY18S7t23eANRvMiSFwbfMUO7bHQdf/HIju3yxpWKVaF4+ZNNFDVqsu+
         stiw==
X-Gm-Message-State: AOJu0YzZf+VOWAslCpHyhmFnz+q0OpRBBi2opM4PvsF0ZYz5jISJ8SYI
	NHctexw8XVfZskaOZluKya3YOwYTnH17lX8p6veEqUpmwu7mvxmQMY4U
X-Gm-Gg: AY/fxX59St2o/KZH3oVef1Q/9EwNJkPKCTcmCptmcLed/txpwLAS9B+QRN8EMcn4wJa
	/V8bkkZ75QKQu09idlTcoqiHD0dlZKg0aIOt4u8Wkzv+hzfrDN7DjZyV2YdWP+a7oWDEQYFYwc3
	rZ61saXwjTd48hWivyXmedPcJx0cx4cseaabS/VgqvUJMDhVm5I9oUNN2e3V8Hmi8u09cMzYNV+
	d06q6JN9FErzToHEI+hXBbKGRRQOn3mZuw/TvBMsmhu2ecdOZ0YeQW1gCSWXXw3VD4c8rMQ66XK
	2R/mWNzKMSvo/JQn7Xupk7GKgqAobiSFtkXx3ChqD3zsAkfymSCB//eVXrYO/WLWT5BQSqy01Up
	7jfPtA9XNeMNhHtVQyal9b5S+MI87/WlCWj+msCnZAA/Jjy6x+ap0cwQkx5svHIdkHBlrcGt0qO
	8RO6qNAgzM5f+LaqXN1FOelg==
X-Received: by 2002:a05:6402:1ecd:b0:64b:7b73:7d50 with SMTP id 4fb4d7f45d1cf-653ec1021femr2004998a12.1.1768400046483;
        Wed, 14 Jan 2026 06:14:06 -0800 (PST)
Received: from C-PF5D4647.localdomain ([147.161.248.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22651950a12.29.2026.01.14.06.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:14:06 -0800 (PST)
From: Jie Li <lj29312931@gmail.com>
X-Google-Original-From: Jie Li <jie.i.li@nokia.com>
To: wsa@kernel.org
Cc: linux-i2c@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	Jie Li <jie.i.li@nokia.com>
Subject: [PATCH v1 2/2] dt-bindings: i2c: add force-set-sda property
Date: Wed, 14 Jan 2026 15:13:52 +0100
Message-ID: <20260114141352.103425-3-jie.i.li@nokia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114141352.103425-1-jie.i.li@nokia.com>
References: <20260114141352.103425-1-jie.i.li@nokia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new "force-set-sda" optional property.
This property is used for hardware where the SDA line is open-drain
but the standard driver-level check (like gpiod_get_direction) might
not correctly reflect the ability to drive the line for bus recovery.

Signed-off-by: Jie Li <jie.i.li@nokia.com>
---
 Documentation/devicetree/bindings/i2c/i2c-gpio.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
index afd4925c2a7d..82713fcf87e4 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
@@ -37,6 +37,13 @@ properties:
     description: sda as output only
     type: boolean
 
+  force-set-sda:
+    type: boolean
+    description:
+      Force the use of the SDA output toggle during I2C bus recovery.
+      This is needed for some hardware where the SDA pin is open-drain
+      but the GPIO subsystem cannot automatically detect its output capability.
+
   i2c-gpio,scl-output-only:
     description: scl as output only
     type: boolean
-- 
2.43.0


