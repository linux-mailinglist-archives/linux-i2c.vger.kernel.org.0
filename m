Return-Path: <linux-i2c+bounces-10545-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBEBA977A7
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 22:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57FCB5A1847
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 20:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5D02D9974;
	Tue, 22 Apr 2025 20:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="zUtb0yv+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="kVyNUqBe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="DNtSQ4GR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fallback2.i.mail.ru (fallback2.i.mail.ru [79.137.243.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEE229CB35;
	Tue, 22 Apr 2025 20:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745353773; cv=none; b=oGqf77o6iWIz3AuG6S9R2wL+ILWtp3ka8lpK5Mk7K2+g1r/dP/6MHCCAazHPu3PE051YZjOi14VrpmMo193D+uliPBKt8LPdImj/d77WZ1/Ufr7gDHiwjerxVELVkUuZtp1///XPxMTkwhE3Nqs/VDIZijsHt94GPHK6E1t0rp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745353773; c=relaxed/simple;
	bh=JPelI2bhnQz7zsB7eR/a1mEEVlE6uig8Ae2p8QPy81s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GdBHF2MKiCRsfnT3hMbSBq0+zMlKqhnYFwVRiEdXQueyDRYQ+b+tjruIkjbt9EHoFgIwGoHq2zxthIEerRy5VPkp6r9wQWElSShZNmgMJT1tZ6aosDGNDvSdRCQTUAoQud8frdQBuwrthkkbA+W/nji4VHMWGccbECP8/YdFFZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=zUtb0yv+; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=kVyNUqBe; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=DNtSQ4GR; arc=none smtp.client-ip=79.137.243.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=aUrSDhZGtU7Iw2QWsdQPGJ2jdZo27Sv6QdF54RiUTyY=;
	t=1745353771;x=1745443771; 
	b=zUtb0yv+NRwhQcyINKFRSKfBeE9gVzDKrbRSi/aw7GIfsp73Jlu3PpamM7eXBCValaLqQYY1MIymrXbR013qb3QVuo7EVO4dCaNA1Io8I99dVht60T27Gh/ItoUWEDaqexNZ9c2/byio7jksnYlJbnRqd42z7Oz7AAUYcVmwEvA=;
Received: from [10.113.185.212] (port=55548 helo=send288.i.mail.ru)
	by fallback2.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1u7K6X-00CREE-VT; Tue, 22 Apr 2025 23:20:30 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=aUrSDhZGtU7Iw2QWsdQPGJ2jdZo27Sv6QdF54RiUTyY=; t=1745353229; x=1745443229; 
	b=kVyNUqBeHg5/VR30ECIQobcdFpnUAsTHFhrPKJ/TxbP6wcB6Z/0oN0RJuLXlsjSQYPwpuxTpqxp
	qr3T5LZDPdvLNTIqgSR5g4iHwt7Tv+PJ+cNdRYItWNJGkvXdho5jSCT0DrK7IWgRRuqSvjHyY3WMa
	2k5I5Vy9+e1RQWexFQc=;
Received: from [10.113.247.109] (port=53326 helo=send129.i.mail.ru)
	by exim-fallback-5f8f9b6d5b-6hmp9 with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1u7K6M-00000000CUS-1QKN; Tue, 22 Apr 2025 23:20:18 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:From:
	Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=aUrSDhZGtU7Iw2QWsdQPGJ2jdZo27Sv6QdF54RiUTyY=; t=1745353218; x=1745443218; 
	b=DNtSQ4GRAqVFF4Ko3QTiQHwqWRBjkUVlPTJQJLr6L8f+H6qhKYNZVK0Jb/+ug20/Q3VZZJvHjgc
	5ZLVC6LpVZE63IqhHfYClmIq7cGpq2Ebb6XYCdjoNFPxUUJVLQLgRB0vsCVVgf4KN3mPHrI8xk1EQ
	Zr9oEK+0Y5Da+3EbWRI=;
Received: by exim-smtp-77d8cdf77b-httmk with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1u7K5W-00000000Adc-3Nva; Tue, 22 Apr 2025 23:19:27 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
Date: Tue, 22 Apr 2025 23:17:03 +0300
Subject: [PATCH 02/33] dt-bindings: cpufreq: qcom-hw: Add the SM7150
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-sm7150-upstream-v1-2-bf9a9081631d@jiaxyga.com>
References: <20250422-sm7150-upstream-v1-0-bf9a9081631d@jiaxyga.com>
In-Reply-To: <20250422-sm7150-upstream-v1-0-bf9a9081631d@jiaxyga.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Andy Gross <agross@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 David Wronek <david@mainlining.org>, Jens Reidel <adrian@mainlining.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org, 
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-hardening@vger.kernel.org, linux@mainlining.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Danila Tikhonov <danila@jiaxyga.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745353049; l=1144;
 i=danila@jiaxyga.com; s=20250422; h=from:subject:message-id;
 bh=JPelI2bhnQz7zsB7eR/a1mEEVlE6uig8Ae2p8QPy81s=;
 b=YUimu0K4KxzdcgJmW+bu0NZ1NOlvHR1eeLb+GoKQt0P15BG2wX668B8Qkn6zQLr2oG/1KZK94
 WYbnqBhQGjdCjpF4cvVcX+emU8g4TRE2qAwZAYGEvlx/ShAP07OCJX3
X-Developer-Key: i=danila@jiaxyga.com; a=ed25519;
 pk=kkU4G47tvpSEUdBQEkXuWvTk/3WmGrVrdzZiKAKjBJo=
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD985535D2C87FE65BB05CD16499E6FE8AF56A73982410BD1FD00894C459B0CD1B9FFDF2C22124BAD98C591814E25D11F9FB580305F5A00C57DD04E7F5D00D4760065B98BC17AE4ABE7
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B05688F02FB57514EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F28F4AF03526AA8F8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2E11E2898C03AE5122E070BE324C7D3C4E58472E5985EA622F6B57BC7E64490618DEB871D839B73339E8FC8737B5C22496EA1BA7CA28B4A74CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C084ED00A64A654CBE8941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD269176DF2183F8FC7C0A825F8AE102D15AA7B076A6E789B0E97A8DF7F3B2552694AD5FFEEA1DED7F25D49FD398EE364050F0AC5B80A05675ACD985B8ACC81218E19B3661434B16C20ACC84D3B47A649675FE827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BAEB924C2B054B06E75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A57C85038453FB99025002B1117B3ED696BFF4570A8BAFE633250A03108B67251B823CB91A9FED034534781492E4B8EEADC0A73878EBD0941BC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFFFA0465EEFAE099FD79C4DDBC48A20E41C23BA3B104630D2A4623F346E52C67B384CCA0DA9D2472C68A835CA8743990B69BEA444A335EC4B0E280A9F3BCC449B6174C79A2A335BE6EFF8118B638B08AA02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS+uSU+BUhgvmpO8vHZJPgM=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F86CF29D712F2246C117A099264967948F4E412CB506F27D02553AF40AC366FE92C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4F4CF43BFC943A605C6C1A77FDB0143BEDCAB612C665EE96668F3CF0E9FE49B693D0DD15183EF2CA6C7C91E40AC792D1FF2787660B5C04CED545F0BBF685BA7D089B5554E9BA27BC2
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZXYdIGnMcKkYAa8mLvGlyoA==
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4F4CF43BFC943A6051BEB685425B5CA97CE3AC4A05355C76C68F3CF0E9FE49B693D0DD15183EF2CA646B7BC1B5A6E92450A7F092C78D055402F80C4B63EBFAEFA
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZXYdIGnMcKkaT8dyEyUqE0A==
X-Mailru-MI: 20000000000000800
X-Mras: Ok

Add the compatible for the cpufreq present on SM7150 platforms.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index e0242bed33420a39b8a8cff4229ba9eee994ca30..db5cfc794aea466ef207efaaa6e929a3e7c00a6c 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7150-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
@@ -144,6 +145,7 @@ allOf:
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
               - qcom,sm6375-cpufreq-epss
+              - qcom,sm7150-cpufreq-hw
     then:
       properties:
         reg:

-- 
2.49.0


