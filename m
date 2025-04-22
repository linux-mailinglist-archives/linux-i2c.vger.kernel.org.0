Return-Path: <linux-i2c+bounces-10547-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC2AA977CB
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 22:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59FA57A6B81
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 20:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9260E2DCB4B;
	Tue, 22 Apr 2025 20:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="GLYDmg8r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="GZl1KifZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="eAx/e6EX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fallback23.i.mail.ru (fallback23.i.mail.ru [79.137.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843672D320C;
	Tue, 22 Apr 2025 20:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745354375; cv=none; b=PfjEOvISp67pdTBpyQvq8Sd1WeiCgTUDQoa/DYnvu6STi9AUU7erge/bf4WUH6CoLBBpailREvtZmY41naAcLPezX4wIcnV/XmESeAQJxUSJBOihtSBanO60FeiZVA0S0zd/QD755dOGYO9dG1QsqwZvPnR+E42QTlK95JGIyog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745354375; c=relaxed/simple;
	bh=iB/3spXTyoXhYOC6DMJxePFcQgRtzeJq/vnZrNM2A7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hbTTI2et0k7A45JFWAautAPTbWLE0Lho121sZiRFVC7vFdVnkFAPy53gzsxQcCIq09kVBsfhKZL8bz+cTTp7PqzNyzurJED/oxnlw6cwxw71YufCd8SFxJwAXTrzQsiJkptXTC2QcqIxI+xbJJ07UnZ0YbzL3601qefOHQvizdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=GLYDmg8r; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=GZl1KifZ; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=eAx/e6EX; arc=none smtp.client-ip=79.137.243.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=oep76IvVDk1lFblYSYOJ8OGL1w/RX6NPSq5NyE1/9N0=;
	t=1745354372;x=1745444372; 
	b=GLYDmg8rYTPctWW0eVLR9KR6tHutjZrSN3TEmJ9G1KUNYxAROIN31H218zv1huPNZpBKeqkcutfqFfEfVSPZVzwG1wyHwiD5uk7Qj+fV7CwAaDJPjmuMNY0ZWg6L81dEfjvpZFq3ak5urXNxnHe0zEfNEBTsT+COHJ4usb2bx3M=;
Received: from [10.113.20.137] (port=56898 helo=send262.i.mail.ru)
	by fallback23.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1u7KBr-00DlZm-38; Tue, 22 Apr 2025 23:25:59 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=oep76IvVDk1lFblYSYOJ8OGL1w/RX6NPSq5NyE1/9N0=; t=1745353559; x=1745443559; 
	b=GZl1KifZ3UoHYf/36t9im4J1f5EzevSm2wgfLVyIxWabq6lxrOhtkfRiUJQFGhJ6LsrEznzYdyL
	qaVv2wJ0ig7tR2VX5oS9MrI3ZEDQZSNMYWLEhhXgzUinWaDF6scCSQou0bYk/7PC1npJHknbbIHi5
	FH9OT4YSl/mZt9/HYFk=;
Received: from [10.113.236.93] (port=53278 helo=send277.i.mail.ru)
	by exim-fallback-5f8f9b6d5b-nbkz4 with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1u7KBe-00000000M2b-0yd7; Tue, 22 Apr 2025 23:25:46 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:From:
	Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=oep76IvVDk1lFblYSYOJ8OGL1w/RX6NPSq5NyE1/9N0=; t=1745353546; x=1745443546; 
	b=eAx/e6EXxfkumrjUcIdy+hCgaCaF7DJ7Wv3Nhb+GFMy4pKfpHgxOgjqg2yHbDL+cHxj+vbDMoDn
	2UyphvrGavOxkDftejPbTuj1J4JOpqRJ9tT8Yk2erZSD7u6zMNXoMui2nWiTDSYIWBKWmuLkHTfOW
	LceO70Pq4Nmr/XScRwk=;
Received: by exim-smtp-77d8cdf77b-httmk with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1u7KBI-00000000Adc-1ffY; Tue, 22 Apr 2025 23:25:24 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
Date: Tue, 22 Apr 2025 23:17:14 +0300
Subject: [PATCH 13/33] dt-bindings: mfd: qcom,tcsr: Add the SM7150
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-sm7150-upstream-v1-13-bf9a9081631d@jiaxyga.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745353049; l=800;
 i=danila@jiaxyga.com; s=20250422; h=from:subject:message-id;
 bh=iB/3spXTyoXhYOC6DMJxePFcQgRtzeJq/vnZrNM2A7w=;
 b=YupfB/INRRo0jdIK2JIsQpatSMq2jiDRptDhHdyWQOF8EXHEP9nvkRFDZkftHiPUgi5Yep5rj
 OWRxIYvW/32C8GgNmS+iF4TDJNr0ZnZqQYAu6rDcTbtPmaNDIanFgTB
X-Developer-Key: i=danila@jiaxyga.com; a=ed25519;
 pk=kkU4G47tvpSEUdBQEkXuWvTk/3WmGrVrdzZiKAKjBJo=
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD985535D2C87FE65BB428924C3407BD0482EEFE9AD9C1224FD00894C459B0CD1B90481F82A0F86BA90C591814E25D11F9FB5F4AEDE62B93BD818467F1A5D86361FF8D9167951636B18
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F1942E6D70B4A2F0EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006370EBB47D88F71BB738638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2DD6AE2AF9C8C992F2E070BE324C7D3C4F05332FBFE46C99DF6B57BC7E64490618DEB871D839B73339E8FC8737B5C224936DA1BED736F9328CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C04CF195F1528592878941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD269176DF2183F8FC7C02271980798FBD5E27B076A6E789B0E97A8DF7F3B2552694AD5FFEEA1DED7F25D49FD398EE364050F0AC5B80A05675ACD0A5971FBB7557E96B3661434B16C20ACC84D3B47A649675FE827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BDAE3FA6833AEA0C275ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A5C2115259C21A1E765002B1117B3ED6966908B757469F2E36CCE9A60C8CB01D7C823CB91A9FED034534781492E4B8EEAD577AE849BCD98940C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFFAF7C1AA7FDED7D2B26DC9353A3EF692CBBE4864294D57EF5A986D6EDDF44F65C2F598A3E54AB45168A835CA8743990BE1AE8A8D9947C33F0E280A9F3BCC449B48A628B3FC2DAC6EEFF8118B638B08AA02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS+uSU+BUhgv+uGOS1i2dQQ=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F06305510B7D0CCFD81508210FEB0A3EA3FEA15F7615E6C5CFB827C7355A6A2512C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4F4CF43BFC943A605C6C1A77FDB0143BE89F632B0FE86362B68F3CF0E9FE49B693D0DD15183EF2CA61BB8ED703FAE52326B72C8F9B1ECA232494E0D9C86073E32194ED3D835EFDEBC
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZt3vHzALP3UecpuJTSFx9UA==
X-Mras: Ok
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4F4CF43BFC943A60553B7021BC3C09F8BCC8DB0ABA578393B68F3CF0E9FE49B693D0DD15183EF2CA6BE43604BB8A0DF1306CA3F47D61938E6C8FFCFA74AD93A64
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZt3vHzALP3UczAdJHa8MmYQ==
X-Mailru-MI: 20000000000000800
X-Mras: Ok

Document the qcom,sm7150-tcsr compatible.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 7e7225aadae3285f59ec303294cf1515772a629b..649101c8bd3372f9dfa891ab61fc441c36ccfd0a 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -35,6 +35,7 @@ properties:
           - qcom,sdx75-tcsr
           - qcom,sm4450-tcsr
           - qcom,sm6115-tcsr
+          - qcom,sm7150-tcsr
           - qcom,sm8150-tcsr
           - qcom,sm8250-tcsr
           - qcom,sm8350-tcsr

-- 
2.49.0


