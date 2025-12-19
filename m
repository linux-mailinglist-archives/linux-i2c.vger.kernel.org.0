Return-Path: <linux-i2c+bounces-14652-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E5ACCECF4
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 08:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62A473020826
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 07:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF562D6621;
	Fri, 19 Dec 2025 07:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOEABHYl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8230B2D3225
	for <linux-i2c@vger.kernel.org>; Fri, 19 Dec 2025 07:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130167; cv=none; b=UkCiMKJk6H42xaxICSoIcwvsO6tbMnqQt00m6hZdEtQ2PG8dqg9N+ztSKhkXw4RnMsjSlm7LrKXiKNuu1ez+aBjAmAs37QN4uG0qn8aaEyyZec+cTwtIYl3KxlgdJkbUv6WpX9VQv11e6wPOuJ8uiWMWb/aJhvPosRNzie2Ecrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130167; c=relaxed/simple;
	bh=Ynzt5v58obwnhda42H/gajIJVLz4GWJg6Tg2WmflUX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cifB9KKJ7AmRdA1zV1dHX+q8ti5q9tQx6Hd6e/QMgf4m2KN0dLkEnfRn2MFDCvVwFAaKSwVc8beQUTENXsZlj6PPxOgUUoflV37N2lPFslIyITGhNRPCEWcJnPSG6BwtZ6CRP9kAYcfLFpzM0lplE/I+lGWg5yzG+f9RiBcg2kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOEABHYl; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so1526450b3a.2
        for <linux-i2c@vger.kernel.org>; Thu, 18 Dec 2025 23:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766130165; x=1766734965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gskLEpYvfTmHkZ8CaNqOvSk3HkUojmzZhMB2CXBxgs=;
        b=EOEABHYloNlOdOzdL5QFKJ1w/IsODNn4Vf9pBaUjkJAlHyWa2kfAkvd/TwDxjttfNX
         g6fN7IYcghL6yS2T/kRLLoauoYTqxD4qC6cysF7ldcMc9TCiygCM4uVuV54OC7sPs/7q
         cwW7KzahWkKprorYUA3An2zfWeTOyAObUauAkqT5jvjAyxyOg+12eyU9xG1JZdcMpYbb
         qP9V8b/YPp8Q15LpepuAOx+lr8mPIqnSbJeVB0z7IHKspvsvCX4XXgYwy+K12Ug7Klti
         PjT0xNdgmMJ9LtOYKPu7colxnegYvHpO9B8YZB2vgSOEDWSBTIxHoPAgo7HXIggLF+nH
         t4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130165; x=1766734965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7gskLEpYvfTmHkZ8CaNqOvSk3HkUojmzZhMB2CXBxgs=;
        b=KGiyprF4DPCi/Dnj+ckx+31w0NqKQwS/sVTBN9somvDrRfxjElTF+uzXmOBgCRxm0j
         ofsovknRLeSQuzH2FuiHlKnd44bM6F3wg1+HbqVFMK0XXkbRWP5ZJdDn6hMx0nBOeXAR
         /vM/WLg75aN3wWPxzTF4M7jTCaVWJKZFLO1GNmiG1WQts1OplW2lqcesKM9vZE4P8NBU
         3YHL4jq+1eRlKZyVIgEvTRq0p6vbnogG0+EaAJ3KV8EAj9r17/a9HGLuyQe3YvltAgjK
         AK6mR6DKDX0vrsazOyuucbA7mKdh+cHb/Wa2qQ0ibb6mHu6cEWErgaPEdOyolhYTgt3z
         0Jbw==
X-Forwarded-Encrypted: i=1; AJvYcCVRU+bG7pqS3KsKYymxDpC5ZieX1HKsivUHR1G7trIafzpv+WjQhpcCLX3hOrC74rolHsI5d+9Gxa0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt6PIYoFPWoNQWxfv3dRGqaZMexJ9uG9b01lgsiw7ZLfeAMBWF
	/Kqy9VWWMm5OR3WGaitX/E6PG54IbVO/o9g+HO7wvcPgccfIWZAvXg4b
X-Gm-Gg: AY/fxX7L15/9/v1mXOFkpAd23F1B9K1p586Xdxg32f2jasVN1bFImcsU8yqE4U6Lr/p
	5MeWgvXeypk8A5phdLjEqHMd69Ezuqwo9UQj5zv/7QkS9fvXasNUBVgRR6+pmSlKTAaFaMsDPz+
	N+upp0ucje8u1KgbHMJXTVQ+KkhA7rLZTErmFA7lCnf4+PdHlpCQSyzKzbVuglXWQI3FkfRtxkq
	s7ICAYnGEy86zzm1xPjIDNtJSvQxf/3AJtPDFs6SpMq4ijmy3JPFQQJgH4lHeGf032T3q3mZRqh
	tA7k/V2e27+pBACjVWtBG7+8BEFidfekgmWO+rpIe3eOSrfgV6MVJXzGVbACImqI/J74g8Fkliu
	63kQjpU6m1OQKqPc0fgeBfiWHKX1t3kT9G3shnOKri32vNvNIq+CH
X-Google-Smtp-Source: AGHT+IH8um1u+/F9IR4mQclrwTJCUs1YBwb7PhDmU+FSfhTQhTdwaDaF9aezKXIjOn8tGRCOsfD+xw==
X-Received: by 2002:a05:6a00:1d27:b0:7e8:450c:61c1 with SMTP id d2e1a72fcca58-7ff66679547mr1708853b3a.49.1766130164675;
        Thu, 18 Dec 2025 23:42:44 -0800 (PST)
Received: from localhost ([221.192.179.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b4234e2sm1512802b3a.27.2025.12.18.23.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:42:44 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Fri, 19 Dec 2025 15:42:21 +0800
Subject: [PATCH v2 2/3] i2c: k1: add reset support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
In-Reply-To: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
 Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130147; l=1515;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=Ynzt5v58obwnhda42H/gajIJVLz4GWJg6Tg2WmflUX4=;
 b=qMfQlZSVzRGvXZdg3oEioN5Cn5Xm2J1x59daHMj1raOdC0lTKCnZqnLoQeM/xYyg7eq3aQSEi
 yhbHPR9x9ooAJ1+wCoS5U5WsMyorqPVeBT+RjAIOxX0vOoHqgDQp5hl
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

The K1 I2C controller provides a reset line that needs to be deasserted
before the controller can be accessed.

Add reset support to the driver to ensure the controller starts in the
required state.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 drivers/i2c/busses/i2c-k1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index d42c03ef5db5..23661c7ddb67 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -10,6 +10,7 @@
  #include <linux/module.h>
  #include <linux/of_address.h>
  #include <linux/platform_device.h>
+ #include <linux/reset.h>
 
 /* spacemit i2c registers */
 #define SPACEMIT_ICR		 0x0		/* Control register */
@@ -534,6 +535,7 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *of_node = pdev->dev.of_node;
 	struct spacemit_i2c_dev *i2c;
+	struct reset_control *rst;
 	int ret;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -578,6 +580,11 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
 
+	rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst),
+				     "failed to acquire deasserted reset\n");
+
 	spacemit_i2c_reset(i2c);
 
 	i2c_set_adapdata(&i2c->adapt, i2c);

-- 
2.25.1


