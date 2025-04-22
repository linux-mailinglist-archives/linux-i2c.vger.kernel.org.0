Return-Path: <linux-i2c+bounces-10548-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FA2A97866
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 23:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30EB618893CB
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 21:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D574B262FC0;
	Tue, 22 Apr 2025 21:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="XpX/w6d0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="gR6Zs5l2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="dq2JgWJZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fallback22.i.mail.ru (fallback22.i.mail.ru [79.137.243.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8064F1E990E;
	Tue, 22 Apr 2025 21:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745356619; cv=none; b=fh4ONpOh4QP3rxnWffD2pzjjRqZUgb8lfF8PNGoD5xp5Mw8SctFpwobMUIe/3uaZAQTzQndrscjpDJBa/kY2yCvhW9BvB2dQ5X9qZ7Ll3fBzQGNuPZYt+W0Q3tX+gmxWQ/OwIarEQwNekucegg9aAtkOcMvl8Rt4jMmNRxgCMdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745356619; c=relaxed/simple;
	bh=UlZcRVK+a92eLIZYjPN9zXLFDMXvypch4N+hC2kg2Wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jGlQpH3uTz7OYWpv5QeJlIdXI/+95OKjTAdJY33ELZ/7PAb2GuV4mSWfTQBSfJ63R6MHONXWW+Dk0zuRH3vn5GV2PRg2TtK/TOL4kGod59qJTyDE+vIKFjY02atSnX1xkM7k59sFAH4YnO26obfIiGS4vjBodbQyPmDXojYzlkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=XpX/w6d0; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=gR6Zs5l2; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=dq2JgWJZ; arc=none smtp.client-ip=79.137.243.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=uNa3SZcYrcJTVKmkXu+2cQMrgDoV4sKgiiX8WQpVzAg=;
	t=1745356615;x=1745446615; 
	b=XpX/w6d0i4njYL/utPvuYCXQtlO9ref30Ne6NL1bsDH8cQajjiKFiH1kUjbJwm5vgNpYP3jaBrfp3rlaH9Lk/VbLeby5k3o7x2wp5vGAVjb1ksbGaNh5U312Bt+R6l5u6zAvRUDJqo7sDkNkCVFFf0jxSWc6BJkx4/1YZ05n0sk=;
Received: from [10.113.180.207] (port=54952 helo=send124.i.mail.ru)
	by fallback22.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1u7KBJ-0075jb-Cs; Tue, 22 Apr 2025 23:25:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=uNa3SZcYrcJTVKmkXu+2cQMrgDoV4sKgiiX8WQpVzAg=; t=1745353525; x=1745443525; 
	b=gR6Zs5l2jT9NzWhKwwfuyT5WeP+cPwFN7CzslyRtTpcm6AUalmuaBb66TZ2AdReNfyJvXEBYq1g
	hBZxONi5Lpbxt2jZ1/2za3zo5AabjzdDw6emQRlqvw5KEFpBn84/gW5+wZH/41LLAFIc6C1TB0tKu
	7DjC+ld7mF8ttTNautw=;
Received: from [10.113.8.69] (port=52858 helo=send58.i.mail.ru)
	by exim-fallback-5f8f9b6d5b-wbhdd with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1u7KB7-00000000Sf2-27uL; Tue, 22 Apr 2025 23:25:13 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:From:
	Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=uNa3SZcYrcJTVKmkXu+2cQMrgDoV4sKgiiX8WQpVzAg=; t=1745353513; x=1745443513; 
	b=dq2JgWJZRpetKua9j35SBa3Z9C9NjUUZHSaFAv+u5fvUSxS56CGRaVK3QRPi0hYduVWTXdKcAEA
	JcQs0bWa0Fo5aRdgPB7pazCYQCBN9bah8jwEtflCLKEMe8CFakQFHdSg7JB0JwlLp3GtaT1BjcuhE
	4n80dnGaiveIChQTm2A=;
Received: by exim-smtp-77d8cdf77b-httmk with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1u7KAl-00000000Adc-3ODX; Tue, 22 Apr 2025 23:24:52 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
Date: Tue, 22 Apr 2025 23:17:13 +0300
Subject: [PATCH 12/33] dt-bindings: soc: qcom,dcc: Add the SM7150
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-sm7150-upstream-v1-12-bf9a9081631d@jiaxyga.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745353049; l=763;
 i=danila@jiaxyga.com; s=20250422; h=from:subject:message-id;
 bh=UlZcRVK+a92eLIZYjPN9zXLFDMXvypch4N+hC2kg2Wc=;
 b=mlRu39jPGweL8U11k7jVy/5VY3GxxZkeZ9hbTVSGizFMcMq8u7LfkK2OU7VijemBBO8rPtCfl
 X7Ax1iiItz/DBRhFJ0bHU9rqpAn4BLdP510QnljP8+/VvGIxHoQ7iia
X-Developer-Key: i=danila@jiaxyga.com; a=ed25519;
 pk=kkU4G47tvpSEUdBQEkXuWvTk/3WmGrVrdzZiKAKjBJo=
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD985535D2C87FE65BBFD1E2C9EE75BBE7095C942D0D66E533700894C459B0CD1B92FC88EB54E9E129EC591814E25D11F9F4A899466AAEAED43E87930C8331D046FD64C754CAC7C657B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F65C230EDDCD559EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063727599E9BE65898D58638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B209C2E0FC00BF2B612E070BE324C7D3C414DDCE98C92ECCDFF6B57BC7E64490618DEB871D839B73339E8FC8737B5C224936DA1BED736F9328CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C04CF195F1528592878941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD269176DF2183F8FC7C03DBBCB839D0549ACD8FC6C240DEA76429C9F4D5AE37F343AA9539A8B242431040A6AB1C7CE11FEE3DA7BFA4571439BB2BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE75A9E79F66F1C28F3731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A593A41314538C01A85002B1117B3ED696C482E5AF98E3E0E4886DC9BC01168B20823CB91A9FED034534781492E4B8EEAD049D0ED29243A754C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF87ECE6054F966C919092B4A0788706A84A523300480E1E440ED81FC104106340DDCE95BB4BF576A668A835CA8743990BA7513BA9D04A63A70E280A9F3BCC449B748C363EDDB88291EFF8118B638B08AA02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS+uSU+BUhgveurU4sFvbHM=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F297E2F7312AB2B46CFE9FA76EDA5B4B79EB202ACE64FB364096DEBD9FF49AF3D2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4F4CF43BFC943A6052140CF51BDAE00CD9067EF4BE7899B3068F3CF0E9FE49B693D0DD15183EF2CA6D254FD39C587BB7BA9B8ADD70A5543A9F114D2F9465A695670AA6D154C32D730
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZt3vHzALP3UdQA0SoXgDYpQ==
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4F4CF43BFC943A6056EDE1EC92CC346EBCE0A1C7606D3712268F3CF0E9FE49B693D0DD15183EF2CA60FD51400743FCD0F558F9F2CFDAF968CDCEC3112C94DB226
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZt3vHzALP3Ufl2zZuSc24WQ==
X-Mailru-MI: 20000000000000800
X-Mras: Ok

Document DDC compatible for SM7150.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,dcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,dcc.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,dcc.yaml
index ce7e20dd22c9788adc3c5e238f5e550691d0a8e4..fdc6fc17ed716d3ca148e8c86f958a8c29638896 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,dcc.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,dcc.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,sm7150-dcc
           - qcom,sm8150-dcc
           - qcom,sc7280-dcc
           - qcom,sc7180-dcc

-- 
2.49.0


