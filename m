Return-Path: <linux-i2c+bounces-10559-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB31A97947
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 23:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18C6A178A82
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 21:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9642DA116;
	Tue, 22 Apr 2025 21:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Sx1bLBQY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="ef17bfW1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="tD4Yu/sx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fallback13.i.mail.ru (fallback13.i.mail.ru [79.137.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D9B26C3BD;
	Tue, 22 Apr 2025 21:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745358046; cv=none; b=fksq1HMysHaqcgMNoS5b8igCie+5AexIH5xziZU4kMs88z/Dsl1FZCrqdyOOUWJSSKZY0COeygtaJqj1fj00hcfm+EgOpr4DowDLmp6RP0x8q7VS5t/5PNXrlKALesLhLutMFGdfUTKmEiSCXNp9JP5fiy9c0gf++uIAYCbwlGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745358046; c=relaxed/simple;
	bh=0bPZDaYypoOJD+jN69F2QwDWFFYR77OyDAs9dQYQrNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pf4edwdcuNDfX/sV0LgnXrrTFXIjGb0Womud8XIZFrz8blXl9AFsQlQ/ZNwO1K+IzPuuA2TUsrSQO9EP9UnSmgt+eAg2YEuOP1EpigRNB8T0Q1TQZ7s6pdYjONOk+g9ygonKelY+2sYqKwjhdh0cErwrjL+qoZeSGb/NSYDoET8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=Sx1bLBQY; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=ef17bfW1; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=tD4Yu/sx; arc=none smtp.client-ip=79.137.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=CQyvRHUKzd4Eh06EDGA+uBIS4Iq9kLla8oNpjUKrVxM=;
	t=1745358044;x=1745448044; 
	b=Sx1bLBQY80dhf3yfc/mquTtujaa9LQwVFSBtlgC8sHPT7i8oH6E6Z4jfKN20mnq0T9alzEoLwrqKpfFOlED7jw78jzzd00PMcqVWF35nRGIl/mqFvg81l7ZayqvHTW+ZBKaHYynq/HSKHnWeWH3sCDwQ4dNaQPaFqQI/vyLCBWI=;
Received: from [10.113.127.61] (port=51526 helo=send170.i.mail.ru)
	by fallback13.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1u7LM8-00Bv5W-Hc; Wed, 23 Apr 2025 00:40:40 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=CQyvRHUKzd4Eh06EDGA+uBIS4Iq9kLla8oNpjUKrVxM=; t=1745358040; x=1745448040; 
	b=ef17bfW1J4Cj1xrOhvaaIC0G/TB5z1X6OKvgARHft232wQnss7AuGqLiKvUe1GgvzNI5c3EBIdh
	tGgiSnYIgCcdFcHkSXUncunK36SfLVJI1nOOpnhHaipK6p8ekdznUjyzWLiL70xl65B5hGNNul3uW
	RInH9P6TrA+vJ++jcww=;
Received: from [10.113.139.122] (port=34622 helo=send150.i.mail.ru)
	by exim-fallback-5f8f9b6d5b-l7rwm with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1u7LLx-000000003wh-2SCH; Wed, 23 Apr 2025 00:40:29 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=CQyvRHUKzd4Eh06EDGA+uBIS4Iq9kLla8oNpjUKrVxM=; t=1745358029; x=1745448029; 
	b=tD4Yu/sxPGilCIp3ML2CEPK7okH1/M6LJtJwTHNPTfNVATaiU+fvZ/jluRX7Dp+2uIk46N92IpV
	8OQSq+0+aLcUalSvHO9zKrdjl6tLYsBc2ZiNjes3VAhVo4z+R8xthGH6/GrpGmpr3TO5wzV83QyMT
	/Tx0lbSJYQ4d9SBjAxc=;
Received: by exim-smtp-77d8cdf77b-wlhm8 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1u7LLd-00000000BOp-3MBp; Wed, 23 Apr 2025 00:40:10 +0300
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
Subject: [PATCH 28/33] cpufreq: Add SM7150 to cpufreq-dt-platdev blocklist
Date: Wed, 23 Apr 2025 00:31:32 +0300
Message-ID: <20250422213137.80366-12-danila@jiaxyga.com>
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
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9563C565BC8219237D5DFFB79FDCADED6DE48DADD37CA2EEC182A05F5380850404C228DA9ACA6FE2754A9F63876CDF2E73DE06ABAFEAF6705B29356FDBC8B4D71C5C08A08416C8BEB611C1030484FBD82
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE792E16514AF283DFAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB5533756605D4038907BE0FDB678BB734911AFDDCEC33EE6F400E0359F2EF5D263F5E9997389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C068077CCD40B79AC98941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6E323A604FE95ED09A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC07BC8266CDEF267E3AA81AA40904B5D9CF19DD082D7633A0C84D3B47A649675F3AA81AA40904B5D98AA50765F7900637C5678F1FF88595B3D81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16B6D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A54AA6E7C84F2CDF495002B1117B3ED69624FE88B7A4234A1E8D59E407A97E9958823CB91A9FED034534781492E4B8EEAD21D4E6D365FE45D1C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFE979B237AB22BDE2824CBDF29A8418D0BA5706B17D5903FCC57F56A4A555DA7224CDA40E848992A868A835CA8743990B6D8528BAEF45915BD59B53E1D0EAB01234D1685B6535DF21EFF8118B638B08AA02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS+uSU+BUhgv/eIKrg/IW0g=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FC453986764D1C6BFCE7DA15FCD53A221CFB9B046F21A6900FAE0F39DAEFF91F02C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4F4CF43BFC943A605C6C1A77FDB0143BE94EA45A41698E33D68F3CF0E9FE49B69E3325780BABEE66F53F818FF85ACC0A8F00B9F6E3DE5BE5E7FEA01E9132CBA1342FB936F8F16E239
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZkHRRh3hWSfNegAO52yjOtA==
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4F4CF43BFC943A6056EDE1EC92CC346EBCE0A1C7606D3712268F3CF0E9FE49B69E3325780BABEE66F3264232D495C9A874433A25DB477C8BE4A5A712E9EED2853
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZkHRRh3hWSfM8DFBap1K3qw==
X-Mailru-MI: 20000000000000800
X-Mras: Ok

The Qualcomm SM7150 platform uses the qcom-cpufreq-hw driver, so add
it to the cpufreq-dt-platdev driver's blocklist.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index a010da0f6337..ab3880de536d 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -168,6 +168,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "qcom,sm6115", },
 	{ .compatible = "qcom,sm6350", },
 	{ .compatible = "qcom,sm6375", },
+	{ .compatible = "qcom,sm7150", },
 	{ .compatible = "qcom,sm7225", },
 	{ .compatible = "qcom,sm7325", },
 	{ .compatible = "qcom,sm8150", },
-- 
2.49.0


