Return-Path: <linux-i2c+bounces-10536-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F347A976F8
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 22:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77E064613F7
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 20:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A392BCF5F;
	Tue, 22 Apr 2025 20:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="wvGXWFBM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="pId8fScz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from send100.i.mail.ru (send100.i.mail.ru [89.221.237.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9237229AB1C;
	Tue, 22 Apr 2025 20:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.221.237.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745353330; cv=none; b=jHrtFJ7jW1OmYWP+e1VNTDyxODRqSpcWkHpgRKFQKQxEU2z4iju37wjmPiFGv8G8uxP+2LY74ajy2dZVww5+zhmD9ndi41RwIufvgVPD56tfTnCdGLGuc6kFYc+0t3cmie/lPJvEvWuAgYz1zt7qgsJVgb+ECPPMieleTLmdIic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745353330; c=relaxed/simple;
	bh=K01DqB6ExasU84N95CvX6kIvxNjj7aFLS3waRLO2Sls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mj7qaF8cJh2oacw1vEi/tNl/ivOU07htPeeLI9XFfObbhv5GQWFvN6WN59r0c+8rlHexnHofAg+fPK4jhgO6gLe/RdAnli7rrohXL43dLaRiylfJ+ivvSe2WY1xDTmivV0NKTppA4x/u5p2pPJklQ8m9InftAQa0JyknfWT7g9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=wvGXWFBM; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=pId8fScz; arc=none smtp.client-ip=89.221.237.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=PR72KRgd06UPfY030vPKR423stOR7qdeTaKou2suxZo=; t=1745353327; x=1745443327; 
	b=wvGXWFBMzO6y6xYUsz4GPwmgdTM9TiF0643ezAmBfGy584pbiC9+WuFxj2UJvMz3R2ITZ5H/d7M
	F9uG3MZQjw+EQy2Cwm2fzcRCv4DpB9qyUpSaLk5B7Hcmob+wOwiZak2KuMeAROdepRX8KuSdxlrV7
	f8+HwhJ3Us3EKCTZ/JI=;
Received: from [10.113.69.26] (port=33768 helo=send128.i.mail.ru)
	by exim-fallback-5f8f9b6d5b-wtg54 with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1u7K84-00000000EZ8-2tfs; Tue, 22 Apr 2025 23:22:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:From:
	Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=PR72KRgd06UPfY030vPKR423stOR7qdeTaKou2suxZo=; t=1745353324; x=1745443324; 
	b=pId8fSczO61x2XZ5R2ad1HvX2uDdVRG9ufHBKlYeKNVDxSy0uIehdyXQI7T6bHsCx9FzPxKQsAP
	fWYUQpt7InvEwht8hQ7jnBTIc6GUDUmL/Gu9HE+sIcg8KEHgoKjKvrAn2/H3a1aKveFhB9oZrIBJl
	AnBKjCzb2Iq6xRASDJ4=;
Received: by exim-smtp-77d8cdf77b-httmk with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1u7K7d-00000000Adc-3Toy; Tue, 22 Apr 2025 23:21:38 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
Date: Tue, 22 Apr 2025 23:17:07 +0300
Subject: [PATCH 06/33] dt-bindings: soc: qcom: aoss-qmp: Add the SM7150
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-sm7150-upstream-v1-6-bf9a9081631d@jiaxyga.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745353049; l=928;
 i=danila@jiaxyga.com; s=20250422; h=from:subject:message-id;
 bh=sR9V6abMjKa+C/ULj5mtZI6pJJYzwUK43exCQHgo5GQ=;
 b=w0mMYdToCRpm/7RF1epFnPDgv9MgYellzUhxSkK5UI74ooQROP5U1nMkWQ2w+duwDSTeEeQfi
 kK/mKVKvtVKCA6oFbqNFWq5G+oLWu2u+JW+4W0z4xMl5DRCB/VDjZH3
X-Developer-Key: i=danila@jiaxyga.com; a=ed25519;
 pk=kkU4G47tvpSEUdBQEkXuWvTk/3WmGrVrdzZiKAKjBJo=
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD985535D2C87FE65BBF5E2B2338A33596FA8BA35E8EE9A09CF00894C459B0CD1B9B430D7E4A2A235DFC591814E25D11F9FE12376F715A92846A32EEC6BB77F3E791BB59B39F4C00062
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70A10A23A3B64B805EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063779089FB2CE4EA2908638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B20788C596737977842E070BE324C7D3C4123B0F31CD3BCE73F6B57BC7E64490618DEB871D839B73339E8FC8737B5C22495FF0BFC5AEE34BE6CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0DCF4F0DC832992758941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD269176DF2183F8FC7C02271980798FBD5E27B076A6E789B0E97A8DF7F3B2552694AD5FFEEA1DED7F25D49FD398EE364050F0AC5B80A05675ACD0A5971FBB7557E96B3661434B16C20ACC84D3B47A649675FE827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BDCE939D40DBB93CA75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A53BA0EC14CC05722B5002B1117B3ED6967EA5FB550F15E9FA715D9AB585B0EB04823CB91A9FED034534781492E4B8EEAD1DEE520572A35377C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF69EC2AE99771D31185FC62953F5954B398EC60D03AC33253833D0FB6FFBC78F680C7DAD1783D929B68A835CA8743990BDBAB8B6084AA30890E280A9F3BCC449B452398683F87B7BCEFF8118B638B08AA02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS+uSU+BUhgvt3etlTAvnmY=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FA72E89150FD5FE6BCE7DA15FCD53A22117BC2166E33CD49F5AFC337A9005D6352C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4F4CF43BFC943A60588C99C423F47DE0B9E5CE1735208E14B68F3CF0E9FE49B693D0DD15183EF2CA6D61BDC255ABF47A13A00E6EC799A75D5D4E9005A75AC715D0750B4769561A124
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZHZq4sRGdDlZJL5Mz79Jz0g==
X-Mailru-MI: 20000000000000800
X-Mras: Ok

From: David Wronek <david@mainlining.org>

Document the AOSS QMP compatible for SM7150.

Signed-off-by: David Wronek <david@mainlining.org>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 41fbbe059d80cebb214317df8ae15b86573546bc..b1a786b838d507628cb8d65049e9648d8baf192b 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -38,6 +38,7 @@ properties:
           - qcom,sdx75-aoss-qmp
           - qcom,sdm845-aoss-qmp
           - qcom,sm6350-aoss-qmp
+          - qcom,sm7150-aoss-qmp
           - qcom,sm8150-aoss-qmp
           - qcom,sm8250-aoss-qmp
           - qcom,sm8350-aoss-qmp

-- 
2.49.0


