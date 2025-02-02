Return-Path: <linux-i2c+bounces-9249-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04568A24F96
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Feb 2025 20:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 689293A2F91
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Feb 2025 19:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41EE1FCFF3;
	Sun,  2 Feb 2025 19:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="TOl1V4Xs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C455635;
	Sun,  2 Feb 2025 19:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738523075; cv=none; b=oaQI9wIOfXeGcZDBd3yaBtIcURi3c1d0WzMr5UNVCoXBUKjRnNxWNJKKv1+vBbCMiuROZVO8JFvpSfXBwzbReMSV2TJTOmr7flGQjlR3E/DUdflMeiJrpbPsXtZhKLVsSZmK6oZ4dxjHgALRADIJPD7lneE+cj34jqa0uSM2vPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738523075; c=relaxed/simple;
	bh=F4FuSZEEnarvkc31jb8uMNPiHsq/gfamu55FjiS1n68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLZqeY9inJLVQqg+n/Iq8sNc9Lvde3110o6+Ck7dl68oJ4VrYcK++CFAsV5BnA5copkYZHwryJKGCeOcVv2LT/PGwG/SeaUJrp1oN4uYGiNVrHfgDBr37ZR2uJGPNPId49SkxwAP0FvBFEMmwQou/FHnYCU/hicxjWyuuiG3RsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=TOl1V4Xs; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4DA1525CCA;
	Sun,  2 Feb 2025 20:04:31 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Db-aZXRw_ZiT; Sun,  2 Feb 2025 20:04:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738523067; bh=F4FuSZEEnarvkc31jb8uMNPiHsq/gfamu55FjiS1n68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TOl1V4XsmZI+wikIirjbtvdnrQmN6PQN7tL9Wr7eHHIudgwrU6ywDOwSKNtFcEgYd
	 7FY94g24U0/SzKoTsx2nnGKnytBvFybeQTMccKf8G+xf1zOKbXWD9ZrhFCqJveloFT
	 0i5tH9fc1wQjuNoeWpmtk0o3DEl/Q6sycoav6wDlWU9AuatHQ7QrKTBxZOMApBUcEM
	 CL1Z9iWLgUd1lLfC12UqSRkV8bkqpGtHsJ9rWjMiUyos7B3P4QDllhkWBZYFg6DTCn
	 XJPfF7ZZQtjwqlSv+FoZJxaZO+7hzbXgn/VwI/U5YCFAazuL1Ldreya/Xe4v3qeJ4C
	 HT3W0q7LY4xIA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Vivek Gautam <gautam.vivek@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 02/34] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid compatible
Date: Mon,  3 Feb 2025 00:33:53 +0530
Message-ID: <20250202190353.14572-1-kauschluss@disroot.org>
In-Reply-To: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string "samsung,exynos7870-chipid" to the documentation,
with a fallback to "samsung,exynos4210-chipid".

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 385aac7161a0..9105ad48563a 100644
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


