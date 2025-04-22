Return-Path: <linux-i2c+bounces-10555-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6895FA9790F
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 23:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D0765A21A1
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 21:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9462D0267;
	Tue, 22 Apr 2025 21:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="wgphLHOU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="J4+RA0PF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="ETD4FSjA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fallback22.i.mail.ru (fallback22.i.mail.ru [79.137.243.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBFD2367D9;
	Tue, 22 Apr 2025 21:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745357918; cv=none; b=Aty1OYWtC3UUt5mYcd2iqOVQBG8C81OckMasT81gG9zjoeL+bzHOKgwyvaODY0tz7pQqw2s6YBs8JK7H79OAlNfSSulEj0e0xNB1Zym3bO9o8bD/gmyaY9FzAccPz+1Ale0ug09t6KXOMjbA5HKnx6EzUzIPpzGF5XoZ2sbC4J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745357918; c=relaxed/simple;
	bh=LiIL7llg9mqaDReNbbXiPVtVC4IhEFYUwm9P2HEcIZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ouXO1C9SnnQc9Lu6gZ6tVQr1w5TC6m1+YVAfZCfZulj0wVJzhOj8cKhphSQ3E+paJJWnn9LWaueNNVN9ErI/1ExGRqrNtz0UNIXYQfmKn+8cI1R7xOM/sqvCVIGfo7VyfB4R/bP5QrHoy40JDsMEsfPWN1KF5QIiZ1Ywmn/hVzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=wgphLHOU; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=J4+RA0PF; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=ETD4FSjA; arc=none smtp.client-ip=79.137.243.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=vXgB3vdoYNF6mOm+I/3W/2lvr129sQo0Jyd//NlhK6A=;
	t=1745357916;x=1745447916; 
	b=wgphLHOU1WL6bz5juE3LH1ny0+PTU+jgrh5QFczaspzb1lRsnJR8OQ8A+GJ++xaRgK766V4/OVHcUlUXC8RIT0lk/vouZGbiyA9KH4xYbMD0MzaWDrNRxI8/Dzl/gZk5Si/LoBBc9VbKoihsCMIEvewDAMKwveoa5QewhlQoewo=;
Received: from [10.113.253.145] (port=45004 helo=send275.i.mail.ru)
	by fallback22.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1u7LK5-0089Vf-Lc; Wed, 23 Apr 2025 00:38:33 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=vXgB3vdoYNF6mOm+I/3W/2lvr129sQo0Jyd//NlhK6A=; t=1745357913; x=1745447913; 
	b=J4+RA0PFna55dRKJVC2NLlCEW2ftcPFVsp+PWN/wb/R0Ur8Cj475pPxXkPxZLar8qzpAr88wc1b
	NZFZfepEml3Cc3obfWZaXfnEA4O2mwa1INrTXmjyQueSUBT9SbKZAQUMslFzg1/36brQsz1iWNXds
	9TzmdYlubqZolM/jSvY=;
Received: from [10.113.196.163] (port=48410 helo=send195.i.mail.ru)
	by exim-fallback-5f8f9b6d5b-bs65f with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1u7LJu-00000000Or4-0KYS; Wed, 23 Apr 2025 00:38:22 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=vXgB3vdoYNF6mOm+I/3W/2lvr129sQo0Jyd//NlhK6A=; t=1745357902; x=1745447902; 
	b=ETD4FSjAQaZDIBN1EXVXs0Jslnik5+CtgO9zRsuZ2ptVzqB/QeLYcBIh8OnoIXg73EAILUzhDYR
	E44wj9mOB1BDCR8/QfBgdSTDYobfExhmJoYg3RS3VsKGvqmVm2OevGPUOtdI6piw42mLZlBzHCX0n
	+/QRBuTgxScgv+U8mFQ=;
Received: by exim-smtp-77d8cdf77b-wlhm8 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1u7LJY-00000000BOp-1hgd; Wed, 23 Apr 2025 00:38:01 +0300
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
Subject: [PATCH 24/33] dt-bindings: clock: qcom,gpucc: Add the SM7150 compatible
Date: Wed, 23 Apr 2025 00:31:28 +0300
Message-ID: <20250422213137.80366-8-danila@jiaxyga.com>
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
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD985535D2C87FE65BB21A9B097F84F02A1685867873C79256C00894C459B0CD1B93C7090F3E4E67D5833594132A326AF8B5BDEDC896250FEE03781E644FA50EF3D4A43D3E7D3A7B3F6
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77E216A0E97507353EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B24BDD37CF80F0E12F2E070BE324C7D3C4849A0DB0D096565FF6B57BC7E64490618DEB871D839B73339E8FC8737B5C2249E5E764EB5D94DBD4CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0CB629EEF1311BF91D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE0AC5B80A05675ACD985B8ACC81218E19D8FC6C240DEA76429C9F4D5AE37F343AA9539A8B242431040A6AB1C7CE11FEE3DA7BFA4571439BB2040F9FF01DFDA4A8C4224003CC836476E2F48590F00D11D6E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637AF8E4F18C523FAA9EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A58E2D570AAB45969B5002B1117B3ED69699BC86B4B94FE3CD0E58516B1639A14B823CB91A9FED034534781492E4B8EEAD619183A7BD6BC6F1F36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D548E8926FB43031F38
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFAE85BD11D1F4EBE16B06A2BE07B3E0C39317122D866890D5965EA46D1D17596E8D4FFD5EE536539968A835CA8743990BC9C4ABFA3630FB64D59B53E1D0EAB012B3D6C6F3BBCBBAF3EFF8118B638B08AA02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS+uSU+BUhgvRD+cKcgUHq4=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F528BBB16FD245C1CED188C5D0CCD93D4A1E44D8525A3EF5B8C6D7D9EAA8400502C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4F4CF43BFC943A6052140CF51BDAE00CD9067EF4BE7899B3068F3CF0E9FE49B69E3325780BABEE66FE4212C5EC32395C59A1ADDF8DD4A58757649A19D00B9D132361F75ADCAEABE6A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZDUHnkX9EGqp30WzGrJYzRw==
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4F4CF43BFC943A605C6C1A77FDB0143BE89F632B0FE86362B68F3CF0E9FE49B69E3325780BABEE66F6D752E30E80EA67A0B712E5211E9F1CC34185A86C1232CDC
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZDUHnkX9EGqpQA0SoXgDYpQ==
X-Mailru-MI: 20000000000000800
X-Mras: Ok

SM7150 is fully compatible with the existing SC7180 GPU Clock
Controller driver. Define corresponding compatible string, having the
qcom,sc7180-gpucc as a fallback.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../devicetree/bindings/clock/qcom,gpucc.yaml | 29 +++++++++++--------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index 4cdff6161bf0..2bbe42523f99 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -28,18 +28,23 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,qcs8300-gpucc
-      - qcom,sdm845-gpucc
-      - qcom,sa8775p-gpucc
-      - qcom,sc7180-gpucc
-      - qcom,sc7280-gpucc
-      - qcom,sc8180x-gpucc
-      - qcom,sc8280xp-gpucc
-      - qcom,sm6350-gpucc
-      - qcom,sm8150-gpucc
-      - qcom,sm8250-gpucc
-      - qcom,sm8350-gpucc
+    oneOf:
+      - enum:
+          - qcom,qcs8300-gpucc
+          - qcom,sdm845-gpucc
+          - qcom,sa8775p-gpucc
+          - qcom,sc7180-gpucc
+          - qcom,sc7280-gpucc
+          - qcom,sc8180x-gpucc
+          - qcom,sc8280xp-gpucc
+          - qcom,sm6350-gpucc
+          - qcom,sm8150-gpucc
+          - qcom,sm8250-gpucc
+          - qcom,sm8350-gpucc
+      - items:
+          - enum:
+              - qcom,sm7150-gpucc
+          - const: qcom,sc7180-gpucc
 
   clocks:
     items:
-- 
2.49.0


