Return-Path: <linux-i2c+bounces-3283-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6F28B4FE9
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 05:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9651CB21F92
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 03:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B271DBE62;
	Mon, 29 Apr 2024 03:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoKFQTIP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BBD101CF;
	Mon, 29 Apr 2024 03:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714361948; cv=none; b=eUJeZOsmimKVUmYvmXE+Fyv3HhMvuT30U3oQ2JisnNtIs/dilx25BHyQAmdm1NbrdIjatSs0AZfjf1CyTLT0fSllOgZr2fXkY+qj4NSx1DepvsqUaWuSe5WU/eKYhk+EMT1Vc2xLpK1Vjsi0iF7RccZ9hh5bAiEoRNFMUDYl2zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714361948; c=relaxed/simple;
	bh=iakWI7Mf4uRK/ih2cOJxcuO2fyIzQOI0yNm5bLeIEsk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JkTw2I2QNN+iEPee9BvPizXWNjdyAjFG/b3ZURBVxxEbHE7EOO2KCa+8kIVNu+k2JF/ekAqOQIV45nfbcJdNOfO9Fdfne+xaHVZFEF4NF93jKeOAjN/rvVKi+Ps/xXAhLJ6E+5YGLR32hjUxLR9PFpKVEi54r0/+V37ynKKSflg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoKFQTIP; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5aa2a74c238so2981039eaf.3;
        Sun, 28 Apr 2024 20:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714361946; x=1714966746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xt+OQWGykPEfjSn0Znwm2hVPzDYvMYT7oTvPMGqtVzk=;
        b=JoKFQTIPS0+5WQ3EPJizfitUDE4rQCTUZp6o6/OnHFII+eWt42gCmW1TVPpXg6ByL4
         E2s7tVrEHJLH/GKjKzno2ECbIzWSfssnuhj3AI2C9mg3LAIUSdnoFCXJZuWQr7mk9XnT
         GpGCQs+naDzoTPjndgyLN4BEOr7cJCpo3INxBJZwyYnSga5m/ORtNyaYQXiQAmocLyqh
         aRttKVTZ3lINMxOQ0wy2jVgmDSPiDXcgvAGRHl80scPjymPMEa4cJzeLyGLv/0FjXt6e
         CGNrCZC2ZT+SEeNEU561EnM8JIyLJaycQEE5ZQMbGvDC5KQp28FjbdgTPVr4WOHpjU7V
         h3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361946; x=1714966746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xt+OQWGykPEfjSn0Znwm2hVPzDYvMYT7oTvPMGqtVzk=;
        b=MCBf7yBpfCCs6DyeeKRNLI4xRwuFrpGJ0zDx8ugXBkR5CeWZGh94QoUCfPQ7jSy5LJ
         jOE63M0kjbLVbQpCdLoh0frDEtNu0zLz5v8J6Xf2s56LHLWSPtSLNrhMIopHL80YgmBP
         //gI4S+FbqGBpyZy2LYnkgL5e7rGZVOlDx94QF8/YAZsfr0KHr8Jh3/cUVy8gK0ZYlKi
         gudjzr6aYcC9JEjkq6qxz3IFMPeeohvVSpSW5uz5EStjyuJ45Je5zOO776kREuyohyCk
         9oJH2eR2GcDaJvbSg9pamrdDEpNrUzgCSPdZxpZXSClUKpRDTTelGSwAh4FQOt5Q+bZa
         4FNg==
X-Forwarded-Encrypted: i=1; AJvYcCXlopQsbjxhFVVlf9nSIwLPtQpKkdnQis9bfSEkbNEjp37Aq1GJVijCEVaFvp9BKwPVkhF5G7f/tp7QUc627OW4yXzeHbb/EhbdKV9QTLSGAl3kqHmKzOQPmnwYFPfmNQO5vUCK5GFJYpurGKPbix+wFp+HiGcM5Ut8PNaC7qdA16E2f151olCk+ACDdmXf5QIeVTyOSXzQe5uMnBM+eRQVAom/RmQf40Z1gJSXmFwuDoKBj0Lv3pObcVoA
X-Gm-Message-State: AOJu0YzHnLPY5ibsLP9kEFe+5RBBl+/QSez0HUAMAD8xgj9pZOgplOsc
	w47JLuM2g32zXT2zXj4C/e4tTE8bPJEEZB4uipSj7YNwcPjbg5oD
X-Google-Smtp-Source: AGHT+IETkAsL9CVDORGdHIgNdYFvgwMLk9YtxEKXpKPPlV6+NYPwFjuxGJSVouMAJ7OElJcLMi5jwA==
X-Received: by 2002:a05:6358:9604:b0:18d:787a:4155 with SMTP id a4-20020a056358960400b0018d787a4155mr9654379rwb.1.1714361946013;
        Sun, 28 Apr 2024 20:39:06 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e2aa-928c-7bf0-01bb-028d-772b.emome-ip6.hinet.net. [2001:b400:e2aa:928c:7bf0:1bb:28d:772b])
        by smtp.gmail.com with ESMTPSA id i28-20020a63585c000000b005d5445349edsm17835424pgm.19.2024.04.28.20.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 20:39:05 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v3 2/2] dt-bindings: hwmon: Add infineon xdp710 driver bindings
Date: Mon, 29 Apr 2024 11:38:26 +0800
Message-Id: <20240429033833.895122-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240429033833.895122-1-peteryin.openbmc@gmail.com>
References: <20240429033833.895122-1-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree bindings for xdp710 device

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index e07be7bf8395..f982de168c4c 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -134,6 +134,8 @@ properties:
           - infineon,irps5401
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
+            # Infineon Hot-swap controller xdp710
+          - infineon,xdp710
             # Infineon Multi-phase Digital VR Controller xdpe11280
           - infineon,xdpe11280
             # Infineon Multi-phase Digital VR Controller xdpe12254
-- 
2.25.1


