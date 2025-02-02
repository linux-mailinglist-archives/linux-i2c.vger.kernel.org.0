Return-Path: <linux-i2c+bounces-9248-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E073CA24F7B
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Feb 2025 19:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D9193A4587
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Feb 2025 18:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC8A1FE467;
	Sun,  2 Feb 2025 18:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HBreNpT+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0861FBE87;
	Sun,  2 Feb 2025 18:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738521518; cv=none; b=h/Yq4EZH49p8EQmODpB54IHiZRibnirjBNUpc2sjRUdg4zy+xOJgUek5BezHiz32sYnmJ5K+xsksDmEOKZGJbHmEevUpjfBA+vFE9Rvo6uN3mu6mWHNyDyGVKTX0d6jcUewU42Xo0ctSrly/5AHwXr/w8HhdGCDAovNYlKSm25Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738521518; c=relaxed/simple;
	bh=/1IewTiZbmQBp1G6EX+8pjxa8xy0IWsaV+GmJE5iXFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0BnfIMOa750vjIslGbS4uwn9jVoLXkA/QANLLU6WS1Mj5sGLrm182vcqljElINWsOaam1rdIeRBx1+wbJzzsXZYhD9xLuLMnX/FrPhH4YNM2MWWk8S4IjcDQ2mzJv3Zx0fSv2d8HbABj6tXiofjpknBlp580bCCm2smkhXeRGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HBreNpT+; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 071CB254F1;
	Sun,  2 Feb 2025 19:38:34 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AhsCCaCtE3s; Sun,  2 Feb 2025 19:38:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738521508; bh=/1IewTiZbmQBp1G6EX+8pjxa8xy0IWsaV+GmJE5iXFo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HBreNpT+ttIa8CGLsZ5CcF08z1c+8sveRXPbZMTmUUqy+hblw1ddRyHjLiZ0MF+ok
	 i4NIJ1nrlvWjQWg0ey2lCnu3lzxdsZrzMRMdI1sSjIcPAdkDR5bLdubxACk/5cjmAt
	 433/Vfo/4G98V59OJdNA9NCcvFJ9p87sa/gG/69toYtftkF+NI2HhHqe3FLhUfjBjC
	 BHFYtaNMBK1hlnk+Bb8jBZhdXygk0tj/JhHg5SJUYPwe5ln4LuIbNQe+dus9GNzHfJ
	 B6IGV6HHlm5pQs2WJKZpS57JyFSwR8OVy/ggV+GCat4U1rzSBd0RK2zKjBtPBIK75J
	 goaIpxd1Nqgrg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Mon, 03 Feb 2025 00:06:34 +0530
Subject: [PATCH 01/33] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos7870-chipid compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-exynos7870-v1-1-2b6df476a3f0@disroot.org>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
In-Reply-To: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Jaehoon Chung <jh80.chung@samsung.com>, 
 Vivek Gautam <gautam.vivek@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738521464; l=984;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=/1IewTiZbmQBp1G6EX+8pjxa8xy0IWsaV+GmJE5iXFo=;
 b=HPseafre3G8+clhlVS1WJKZVT7jwJzhFKM2sGawnkEHiBn7JiPjXw4NhJ7G0nQFgC59FtSAIa
 XxYQgScGyr/BRyfi3Ksk7w2C/l3g5/Gjn12L8Ju83LEviQCRTS4bHfn
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add the compatible string "samsung,exynos7870-chipid" to the documentation,
with a fallback to "samsung,exynos4210-chipid".

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 385aac7161a0db9334a92d78a57a125f23ca1920..9105ad48563a42ecaeb3dbca37df734d5b93f52c 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - samsung,exynos5433-chipid
               - samsung,exynos7-chipid
+              - samsung,exynos7870-chipid
           - const: samsung,exynos4210-chipid
       - items:
           - enum:

-- 
2.48.1


