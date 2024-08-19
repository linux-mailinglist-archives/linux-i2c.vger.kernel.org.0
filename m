Return-Path: <linux-i2c+bounces-5501-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEE0956866
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 12:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A2FD1F229B6
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA26161B6A;
	Mon, 19 Aug 2024 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="g8VccP8N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D6016938C
	for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724063059; cv=none; b=kndPW5XpmfhrEIDzf7nkMD80vqLU+jYObSvOAjGS3A8q01GMvI6j15gFMp6DFxw42NJQyRCNOyQp1FUQi7fblwDjn4cQbUhNS2LgGxVwvKUbps3wBFRDV6ZRVuA5ibJv2KKdof6wEPyVYKY7rZcwmSy4upJwdr7xBXHqo5Gg40I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724063059; c=relaxed/simple;
	bh=We4lIcABz+/VMh+pMmwTXfXq0ehwsRaqvb4IyArJf7A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b3uimJbJd25rpV08mThfZq0xYuUH5Jt9UDtWu7OD+SuLqi3ndz6x+900n0LTcU3/W4qTtZhL3WtKYscD5xDTUYeLT1gpFNRq7ZT1e4yaUxf7jllHs9leLqVIQ7AfbfYUiz0kpu8J+eBPFz7K+zQsPwU7vy/WJ+ufN/ZQ4g1jvDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=g8VccP8N; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-429c4a4c6a8so33774715e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 03:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724063056; x=1724667856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SI43j+EEtv414YYPEwcU4y+b9LtqoIQo864XaHlQUDc=;
        b=g8VccP8NK9/d/S36J9ffVkuKINuDArDKLUcn+iVLTFKyPKVhMoSqoCzeMlb55Y9a8P
         CDn7cEaSKtleZ1tfvvaoQqBjeZMHSoQxz1TaamHF0HhFkFD9YIQjIiWBE1wYMf3EnYIm
         8vNONqv0KSvzmPNaFT4jGQfqe7z9R1laEnM+Lur4nI5XERbEXCgPveFyVo1IAaMIgr5X
         Xc7yOpE5kmFVBInhi8C8Tc5KPQzWXtlPLJBJ9QlVOs7+fx4ZTfQVm8CCglNcdWalFLD1
         ShuUTDeQv7mZ4RQXEu3WSRhl66B0uPOHH+0COkMX9PBrjprkHfCqB8Aq2/SMIubQi55e
         Cn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724063056; x=1724667856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SI43j+EEtv414YYPEwcU4y+b9LtqoIQo864XaHlQUDc=;
        b=G/zhfCSN3YFK8lTFr6DwrM3Vzy8OFoLTxKvE7+Xc+vibcpVbG7fJFy5DX29xw+hvhD
         giG9lqPotONt/GTNKb93FxKsYs10oa2EKFQp3MEqPa64nEgjJNPdZYdJhF2ro462O2E8
         eyEluN9lKaR2rwUe9Qgrw/4msNYUqAxlnBut8SKIIlOJOIRVEX2fppXtgTK+ubUVlRS4
         wD+sCuIqhEoG33TwcvkBaswLtC4N60qo902Kc8Onzj1W0lgp87kYn3WkwDzvJwRT/yVz
         kYvd0HCzfR6yWdRwTIc3W+XogKdf2Svnq95bXF+btdRnqI3+qmI0WS9J7xN/VH0bfd3z
         xKUA==
X-Forwarded-Encrypted: i=1; AJvYcCXMMYf+OG8unjEF+YrMdhLCJzAWfnkmNnDgyQiMMCfn15eeSmpmB618dSRR6CZKYFk11NicevkQkeNnuXxylxCg1dth967MbvRu
X-Gm-Message-State: AOJu0YwbrHwn9d9+rTW38RxZ0QeWDGrsKxKTfOyIdKuB0kLPmuQ6MoCk
	7R13Ox/NxfVxf7ZVC/5K8qyvE/Agg5MhiD92xl1pGBLL0fTxsXMdHpl09DkpXWg=
X-Google-Smtp-Source: AGHT+IGqCdNpnNbVJTDzzh7pxVTfPX4VHVv9PlP34Qh4lr89USV34YwvHByUmcrWrLm3nWSK1/Lj/A==
X-Received: by 2002:a05:600c:4f89:b0:426:602d:a246 with SMTP id 5b1f17b1804b1-429ed7f92dfmr67808575e9.32.1724063056497;
        Mon, 19 Aug 2024 03:24:16 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed650402sm106690275e9.11.2024.08.19.03.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 03:24:16 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 07/11] dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
Date: Mon, 19 Aug 2024 13:23:44 +0300
Message-Id: <20240819102348.1592171-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with
the version available on Renesas RZ/V2H (R9A09G075).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- added comment near the fallback for RZ/G3S; because of this
  dropped Conor's tag

Changes in v3:
- collected tags

Changes in v2:
- dropped the renesas,riic-no-fast-mode-plus
- updated commit description

 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 7993fe463c4c..505a8ec92266 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -25,6 +25,10 @@ properties:
               - renesas,riic-r9a07g054  # RZ/V2L
           - const: renesas,riic-rz      # RZ/A or RZ/G2L
 
+      - items:
+          - const: renesas,riic-r9a08g045   # RZ/G3S
+          - const: renesas,riic-r9a09g057   # RZ/V2H(P)
+
       - const: renesas,riic-r9a09g057   # RZ/V2H(P)
 
   reg:
-- 
2.39.2


