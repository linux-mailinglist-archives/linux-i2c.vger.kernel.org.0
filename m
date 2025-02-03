Return-Path: <linux-i2c+bounces-9264-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD6A258A7
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 12:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A99183A3B7E
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 11:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9024C20409D;
	Mon,  3 Feb 2025 11:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="bbnXyaD+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="0J+4jJYB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="kTvSuKso"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fallback21.i.mail.ru (fallback21.i.mail.ru [79.137.243.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2852010EB;
	Mon,  3 Feb 2025 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583709; cv=none; b=L7aKJycdutIKmhINb4060Ak1MDKFzCUB0qVZUFYkuWNlb5uUjKSwfaJWLBx233KtNPwgzez+FcaNkLbz8ls5RDQ4BovMYkrcLl9M4ZtRZOx+pt5O67haBZ8GGApaOJFoNL/5TfmVYzhEnU3q7LVfgsb9TLrkj0+HXXQgExZYDeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583709; c=relaxed/simple;
	bh=e4+DZ31SGWKw2dweo1MRWUqZefrpqABhdxq7i/GhwcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFxzjvEyKpFymGJ46AcJ9AVMEyVby5waNHC42XuyUthb5MFd7PaYh0pwTQq+z1P1e6ckCJCc/OjDkedAoGJdmTiiUlcH76y4X53qgygoeu+xKg77wh6L/FEwbyP3FRIzHOiW5cjwSUTY87KIEqCJNC1KV2V/X337loqAneHApeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=bbnXyaD+; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=0J+4jJYB; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=kTvSuKso; arc=none smtp.client-ip=79.137.243.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=SgLaT8WXiik5sROnKIF4ZOwPVnVfGepOMXuDI3Q+RDs=;
	t=1738583706;x=1738673706; 
	b=bbnXyaD+e7Xyx3KsM+5H8zWWQ+dhf6m+VRTqraiv4W7kBXdr/+aSxg5WUEF8wtfSkuUuLBix3nc1WRSHj98ohqZTYDkY0tDbVkxXYe6JBnalbHVBe8DxX9cpvgKavwWVCFiQfxjO3BiTjv819kAVPwIPBnavHF49iJISM5sFUYA=;
Received: from [10.113.18.238] (port=43722 helo=send146.i.mail.ru)
	by fallback21.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1teuPu-005hfS-Lm; Mon, 03 Feb 2025 14:15:02 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=SgLaT8WXiik5sROnKIF4ZOwPVnVfGepOMXuDI3Q+RDs=; t=1738581302; x=1738671302; 
	b=0J+4jJYBqbMR2W+9sVXrDAsGhThS/I/EcCP7ZbEiNZoNKyky+j72xUKDyswWUVUYZqbQ3qatXc0
	60HKT9Aj5xyqEClWAryA3bYxOV+DtLWSKd3yz4wM35QbZGimD2uDSOJyUcESWvLCbszmSyViYCs2e
	PKGL13K3VJW0WJVbYME=;
Received: from [10.113.139.232] (port=40908 helo=send58.i.mail.ru)
	by exim-fallback-5fbdbdcb77-cprb6 with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1teuPl-000000007br-1uKR; Mon, 03 Feb 2025 14:14:53 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=SgLaT8WXiik5sROnKIF4ZOwPVnVfGepOMXuDI3Q+RDs=; t=1738581293; x=1738671293; 
	b=kTvSuKsoWPK5/vabuhJi59jQBnbxQZyY41JvYfUBa95SgqCT813o2HW90FyUOP6gLkWL3reqW/I
	GmAkoor7jYOgP78t2D6GNh+2RCUOmzlLKoVUCFDVat7rJptK5K8o96BLoM0CRfrKnSbrQaXKhmS85
	RFz+vsLqVst8VWjJ91k=;
Received: by exim-smtp-6d97ff8cf4-hcpzs with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1teuPW-00000000A0H-0PAK; Mon, 03 Feb 2025 14:14:38 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 1/4] arm64: dts: qcom: sm7325-nothing-spacewar: Add CAM fixed-regulators
Date: Mon,  3 Feb 2025 14:14:26 +0300
Message-ID: <20250203111429.22062-2-danila@jiaxyga.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203111429.22062-1-danila@jiaxyga.com>
References: <20250203111429.22062-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD985D89FF3B425BBEF0534A9E299FC2CEB60A57308E4B7C440CD62213F67905E7A203DBB16EF9BBA97BC5D9AA61015533CE3839F0700DABF944B7100E68FD373F2660823B2EEFD31DC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75109D1D8E2174653EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B28E90C11C329EF18638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B4ECEF0018181CCAEE9DB705B7A98D047CCE1ADAD02FA605CC7F00164DA146DAFE8445B8C89999728AA50765F790063707A1F3761B83B09E389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC81E44367C8E80A7B4F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C2D01283D1ACF37BAAD7EC71F1DB884274AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3BBA4E61E1D613941BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE7CD707F342D9BDC98731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A513258B46EBCADADA5002B1117B3ED6966CCA4F52E5D87B39AD0703CEB2EF9A27823CB91A9FED034534781492E4B8EEADADEF88395FA75C5FC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF3F7B3EA85360B66E5AB2A82619914C881E1676973F110873E8A4A101DD551511FB7A4CF61EC7A84FD5D9813428A63F6C0829777A8359E75337F80B1A62BB60B5DDAA7C98F48E93FFE4FDFA4A036B0C3902C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojODHyJtLJ2QhSK3GAy+m4Yg==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F3916920A183BFB23117A099264967948D9470BC1A7174064828D92E36CF2E6532C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C11582D74B19986F8F049FFFDB7839CE9E5FC588583EA33AA196B3707F70927924982C6B040247D50505272CF8332E735DAA48A056A56618E2
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSqgmQqKELHYk9yqHyU9iLcO
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C17F4F1A202AC583AF049FFFDB7839CE9E5FC588583EA33AA177A247DBCC45EA32C2835ADCB4EF6BB99D950CCCBE24A37E
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSocPAboFA1B2wyxHfUpwjuv
X-Mailru-MI: 20000000000000800
X-Mras: Ok

Two regulators (GPIO 72 & 107) for the IMX766 sensor are missing here.
Without a driver, it's unclear if they're extra supplies or pwdn/power
GPIOs (labeled "custom" in the downstream kernel).

So add only those fixed regulators that are currently predictable for
camera sensors, camera EEPROMs and camera actuators.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index a5cda478bd78..4f964e5d34da 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -253,6 +253,124 @@ vph_pwr: vph-pwr-regulator {
 		regulator-max-microvolt = <3700000>;
 	};
 
+	vreg_cam_vio_1p8: regulator-cam-vio {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam_vio_1p8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 49 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		/* Always-on prevents CCI bus timeouts */
+		regulator-always-on;
+
+		vin-supply = <&vreg_bob>;
+	};
+
+	vreg_camf_vana_2p8: regulator-camf-vana {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_camf_vana_2p8";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpio = <&tlmm 43 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_bob>;
+	};
+
+	vreg_camf_vdig_1p1: regulator-camf-vdig {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_camf_vdig_1p1";
+
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+
+		gpio = <&tlmm 35 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_s8b_1p256>;
+	};
+
+	vreg_camu_vaf_1p8: regulator-camu-vaf {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_camu_vaf_1p8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 71 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_bob>;
+	};
+
+	vreg_camu_vana_2p8: regulator-camu-vana {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_camu_vana_2p8";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&tlmm 68 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_bob>;
+	};
+
+	vreg_camu_vdig_1p1: regulator-camu-vdig {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_camu_vdig_1p1";
+
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+
+		gpio = <&tlmm 50 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_s8b_1p256>;
+	};
+
+	vreg_camw_vaf_1p8: regulator-camw-vaf {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_camw_vaf_1p8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_bob>;
+	};
+
+	vreg_camw_vana_2p8: regulator-camw-vana {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_camw_vana_2p8";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpio = <&tlmm 79 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_bob>;
+	};
+
+	vreg_camw_vdig_1p1: regulator-camw-vdig {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_camw_vdig_1p1";
+
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+
+		gpio = <&tlmm 108 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_s8b_1p256>;
+	};
+
 	// S2B is really ebi.lvl but it's there for supply map completeness sake.
 	vreg_s2b_0p7: smpa3-regulator {
 		compatible = "regulator-fixed";
@@ -714,6 +832,13 @@ vreg_bob: bob {
 };
 
 &cci0 {
+	/*
+	 * cci0_i2c1 bus is unused and GPIO 71&72 are repurposed.
+	 * So set only cci0_i2c0 pinctrl here.
+	 */
+	pinctrl-0 = <&cci0_default>;
+	pinctrl-1 = <&cci0_sleep>;
+
 	status = "okay";
 };
 
-- 
2.48.1


