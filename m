Return-Path: <linux-i2c+bounces-10563-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C30A97995
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 23:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3591D461358
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 21:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4E02DDD04;
	Tue, 22 Apr 2025 21:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="vtgVQCm9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from send174.i.mail.ru (send174.i.mail.ru [95.163.59.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC1924466B;
	Tue, 22 Apr 2025 21:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.59.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745358151; cv=none; b=j4/V3Wj93S1O/Pgbek5TEUP8P5KQpjIgZtkDzzaqTMKfB3UaImddKjMrBoPaD21fGYBR87bGQHIezVZlEvB4ddZy945uGgD5U0yOomnRLihGbvCMhiyj6j+B1PFJOa+ilv/01yMtDWOSuaylMSnwZIpCqvSXHJcE3czIeaBb0jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745358151; c=relaxed/simple;
	bh=eAGJVGHr52gCkRks7spnQYDT7+t0+FOz6jGZvOnJk28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrBb92WbmRQd4GKPLzYyTqmfaQ4WnnOuf55s/7kicqWfmMSNgHORACttJXU+bwvtf1x/ZfjxvIHx5UkrPVMFszlVHWyEAfQtA1ezGlvXjpabqInipmX8A4FS4tHH7Xx5ZRZ70x5VYHuWus3SUP07yl8qRXcR8/bdPQqV3C8gVnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=vtgVQCm9; arc=none smtp.client-ip=95.163.59.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=AihJLKVZXaR+g5VYMa9Q+hKTKxPRcUhhhd8yuHNB8cY=; t=1745358150; x=1745448150; 
	b=vtgVQCm9eNmPYhYs1CDDKhDA7p/q3U/3UzbhKN4jdK7KwsjlgbRZHh+Yrj30LzH6mpWuGN2YxD2
	Mr0OXI95Ea5rt8Q/il14W7W6APaJ8H2zCONcM0C4UUJG3xLyxvo5XEOkS4BpEcjIGKNXfVLLweGpr
	o9+FMSjXenVSlcMlVOQ=;
Received: by exim-smtp-77d8cdf77b-wlhm8 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1u7LNk-00000000BOp-2PUS; Wed, 23 Apr 2025 00:42:21 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alex Elder <elder@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Andy Gross <agross@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Georgi Djakov <djakov@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	David Wronek <david@mainlining.org>,
	Jens Reidel <adrian@mainlining.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-hardening@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 32/33] dt-bindings: display: panel: samsung,ams581vf01: Add google,sunfish
Date: Wed, 23 Apr 2025 00:31:36 +0300
Message-ID: <20250422213137.80366-16-danila@jiaxyga.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422213137.80366-1-danila@jiaxyga.com>
References: <20250422213137.80366-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-77d8cdf77b-wlhm8; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD985535D2C87FE65BBCEB406D2985502DE651E0E6CBA378FA300894C459B0CD1B966146D042DC94A8533594132A326AF8BDEDEA41B171FD621DC93281C933D57C0750FC9643A608EC1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72F22E6DC541F75D9EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637ECAF4C2CEE0D0B2F8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2B3B1E2A3A8D0B81E2E070BE324C7D3C4555B88E1619BAF87F6B57BC7E64490618DEB871D839B73339E8FC8737B5C22495FF0BFC5AEE34BE6CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0B27420F9988F54058941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD269176DF2183F8FC7C0430B4546ECB778427B076A6E789B0E97A8DF7F3B2552694AD5FFEEA1DED7F25D49FD398EE364050F0AC5B80A05675ACD3DBBCB839D0549ACB3661434B16C20ACC84D3B47A649675FE827F84554CEF5019E625A9149C048EE33AC447995A7AD182BEBFE083D3B9BA73A03B725D353964B2FFDA4F57982C5F435872C767BF85DA227C277FBC8AE2E8BDC0F6C5B2EEF3D0C75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A5F3A4C20AE1BFF6545002B1117B3ED696B2A5708A05F1492B1E49B01306B5E3AD823CB91A9FED034534781492E4B8EEAD09122B91796FF21FC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFAA096278F38FCC1E60FD1892EF2B9ABA211CBC885786DCA12845D3CC6C9FBDE6ACCA692FBCDC96C268A835CA8743990B2177CD1772E9538CD59B53E1D0EAB01270436F0DEE694E65EFF8118B638B08AA02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS+uSU+BUhgv2gKwfCjEhao=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F728288CFF7AFD822CC811723C208B4178CE2F44239217BC4F426582E0103707E2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

This panel is used in Google Pixel 4a (google,sunfish). Document the
corresponding string.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../bindings/display/panel/samsung,ams581vf01.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
index 70dff9c0ef2b..a3a1de32d8be 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
@@ -17,7 +17,13 @@ allOf:
 
 properties:
   compatible:
-    const: samsung,ams581vf01
+    oneOf:
+      - enum:
+          - samsung,ams581vf01
+      - items:
+          - enum:
+              - google,ams581vf01-sunfish
+          - const: samsung,ams581vf01
 
   reg:
     maxItems: 1
-- 
2.49.0


