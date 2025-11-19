Return-Path: <linux-i2c+bounces-14159-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B22AEC6E578
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 12:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F1494E2B29
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 11:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F2F3570B9;
	Wed, 19 Nov 2025 11:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRaZA/wC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C35C3563FB
	for <linux-i2c@vger.kernel.org>; Wed, 19 Nov 2025 11:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553204; cv=none; b=qEHJMK2w2oRGMKbiV+1YPv7n5MV28U/tAiaEA0nmv565ZO+Xoqw7nxs0VpAqOxPQ5+ufb/38uGnjLqzAUFw2v5Ka0i93PVNtjjogn+qwITJO6tI7hIwLo8DAd6XCgMVePvdi4LRxmd4yY5VkPm91kXIfd8D2vfElYuHQxASLxUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553204; c=relaxed/simple;
	bh=wFzeQXtiZ3L6svBdjl69noOh9R1d9Ukhuf/3rX8Jnhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eqiZstghqZDH8Lcww05zId4vRnfrs6WaoRPxkjB93IzucjX8cIhqxnTGolCq59Qp7Mq81bgCyALtFx8Hr9mcfGJ02Qyyzp1Evhg6pRhDw1KUAgW00eHYAMjyWQe10uNnBoozoRs0t5Zh6fnBnxxz5Xgflb47hsPaRqLWaTvxhk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRaZA/wC; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-297d4a56f97so75723255ad.1
        for <linux-i2c@vger.kernel.org>; Wed, 19 Nov 2025 03:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763553202; x=1764158002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skfEWO4eN+7+KQ+Krvs4ImgFcRb4mPoxQdEUCrGLOW8=;
        b=DRaZA/wCJMPduhaNtgTujlXT1Yuay2O+v2Nplr4qkwPEcY3OgoFQmzEZN//CAqjho1
         z0zTkNJUHrB9sbE2+AZe958rGEQgqJ3ljO7N4J+HtzMpzbNgo+dyuulTFc1MMs9XX8nL
         uzw3DIQsC5XGHUSrXBa22hzV1AeQnW8b00o5xoV8EBK1X0VS+Cg4drI8wqGaKSWYA2LU
         9wikYnriQU3qB/dnCt/Xgiqvkj8FFUWBGJyK0MqYAw8ChP/FSxXZHZYxn1DnbtI1V6xa
         o5V8oK+hqTwFPXAUmXyF01OumrcYrseW8ruo0dUY7liw/Bl+4+BfNHU01s6hRS/jMs17
         Qd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553202; x=1764158002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=skfEWO4eN+7+KQ+Krvs4ImgFcRb4mPoxQdEUCrGLOW8=;
        b=V47Q+zVwS4bMJfuWVXmlhJu7jrFLscKSqeTI6ts+CbBGsK5S+v9nE5aoNa0V4JPQsh
         U1/+0vdAxNVMKR6HITDxPTqmxO0WHICMnGEy/9rpXBtkUtdwxwt/n+ZQqOUz5fqC5xyd
         v1NyxW92Wfkbpjgt181s3VZprIZ7mKDIzjNawHG5f5k/CVBLCQE5quSmwm/gaKNn9ufZ
         T4JTum7D1l5bJn6FgK2XnW8GZG546RXp7WgFZPksWPXXHeXn3j65Wx/ZlENXbCEuA7gq
         q4qdLfV42CaYNdYx+yYmblE/5x/pvmqLUfDd7Y4aV/LiTJWX1e3GgcKzcNgtF72j46r+
         LgcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdpxoGu0fGtmFiu1nU7RW+23O+h0hu38xWcBlwQuzz8fWSBewv5LDAyCvF2ng36C0lFpp8bDXJ1LQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQuQ9PQ2W4HEf04wJsxxlCuzDx6qfRLwrzAEmfJgEwzvwppUXW
	wgHUVQNFlwKOOR2NzgOngAnESmLK8a8hmoCie51vf6v/p7OM/vjL0uJq
X-Gm-Gg: ASbGnctjt8zZoiyAwzxx7nh0RpeVvSsZ0nNfzuBD3wHnqcVyr3trgG5Ntp5W3rQljmc
	8I75lDyg+ehBawP08/8V4W2itxVz0XFukYNqHR818wgqFUNEAPkDKUlwtZ7A9eAbMhtJ6OYe4jz
	poRt9fqyt0iJH8phLtyNsdNGntR1xeLh+Q2gzX3TaTy7MST6GjX5mdly1sy5QAXZXcIMiwEKIJl
	4VB0BAUdMXTu+FFQiKXH5sCjiYUt7fDgNe+0tydwigOed1tAUTBjvSk05JP/Bn1EF9fjKTXWZfS
	qP96dRVIkqFlSnW4EsOdh6bIj9A0tIOKV9hBUiSTJG+wQEH5rr2PasKOn4YJzFFCIQ10BDq+w8z
	CozAPfs2HxAh//VZyINGl3DoleZPgEtusoyfPYbnH46o5XfaTOTwgqSjSXFrY8xmtY9+iXx4vPh
	mUIcWUlJb2r0VCPChEPQ==
X-Google-Smtp-Source: AGHT+IGET/ADp5+3M/u89aHoTgTVYMvdcAxh0XdPkWhPO8kQbc9hPt6srasly6bIofN3a5NJPfXDpA==
X-Received: by 2002:a17:903:2449:b0:295:275d:21d8 with SMTP id d9443c01a7336-2986a5eb5e1mr242990795ad.0.1763553202409;
        Wed, 19 Nov 2025 03:53:22 -0800 (PST)
Received: from localhost ([2408:8410:7820:651c:873:1d7e:7195:d122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2348afsm203445405ad.3.2025.11.19.03.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:53:22 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Wed, 19 Nov 2025 19:46:43 +0800
Subject: [PATCH 1/3] dt-bindings: i2c: spacemit: add optional resets
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-i2c-k1_reset-support-v1-1-0e9e82bf9b65@gmail.com>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
In-Reply-To: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763553189; l=738;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=wFzeQXtiZ3L6svBdjl69noOh9R1d9Ukhuf/3rX8Jnhg=;
 b=4RO6EP06dVMPaF3EjWiiIGCCWCqY2xaCe3VBWKV7PFNvltdFcuEanM/AKzxhjXnUjU9i+7cb+
 0Qep593NG1tApNtUxjRfBGcXA7WIBA6FeUH/NIA7iZBOR8rTw7y5XBj
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

Add optional reset property for the SpacemiT K1 I2C.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
index b7220fff2235..3d4faec41abe 100644
--- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -27,6 +27,9 @@ properties:
       - description: I2C Functional Clock
       - description: APB Bus Clock
 
+  resets:
+    maxItems: 1
+
   clock-names:
     items:
       - const: func

-- 
2.25.1


