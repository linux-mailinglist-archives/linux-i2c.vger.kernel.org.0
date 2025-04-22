Return-Path: <linux-i2c+bounces-10556-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C52EEA9791E
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 23:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D05D17CC54
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 21:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B592D4B46;
	Tue, 22 Apr 2025 21:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="OrwMvmKb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="dpUyRses"
X-Original-To: linux-i2c@vger.kernel.org
Received: from send54.i.mail.ru (send54.i.mail.ru [89.221.237.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFCC242D83;
	Tue, 22 Apr 2025 21:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.221.237.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745357937; cv=none; b=DUoAX385MDxpM+YjnJkQxJU0Dc1qiCdkaebdz7h4wdzjELidl1IS7mWQVjsxT3WLPM4dXQfL48m6ipU9OduvQn02NvLIOt30xzTctpaj3Bk6eGKYDj65fQN2fwxdEQlaEsfalAB/Fg2MamQeF0EefZ5NUzoxZnSyKw9jFwLcPOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745357937; c=relaxed/simple;
	bh=QNH0B/g+tDmurClTQUP159jZnOPK6sdRBKdTWE9wjqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGQh1gYmLupkQAiPfyLuLBxddArCbCCu3AWYy8ZHgzq912FnMpWBYiopXAjdavpGRKLvxK/WErV+XiCn7o3Q7JqCk2jU0jEFr34zhLmzU1PQUnT62Fblj9clHFK9R2gWy94lUJ0QqHZyRXD3MnZ1j28Aw7UCJ2ydhYe1busMIws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=OrwMvmKb; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=dpUyRses; arc=none smtp.client-ip=89.221.237.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=K/0Uf6iJO3AEumK+EOFioz6MU9y4ok3T+UtORsT36+g=; t=1745357935; x=1745447935; 
	b=OrwMvmKbrqLXvLnhpSy6cl090unm5+u4G2Dq4l01sN9lGQXsESQhjsJ+hHvNwYTsRXsVYYAVx7H
	dMaA8QlEKebh/KDrA85KHAPijtps2yrTETf2NTUKoZLg9xwyQFR2KyYZiZW5rMHKI9yXGh0Owaebn
	XJjRBeO9XC8kTudOezM=;
Received: from [10.113.196.182] (port=43116 helo=send35.i.mail.ru)
	by exim-fallback-5f8f9b6d5b-4p5cf with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1u7LKN-00000000R3j-4A9q; Wed, 23 Apr 2025 00:38:52 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=K/0Uf6iJO3AEumK+EOFioz6MU9y4ok3T+UtORsT36+g=; t=1745357931; x=1745447931; 
	b=dpUyRses7Xns3eJwTfWboYmXwVjL9hyXa8C3qhvqig6PzjiBCKfDcKql9GGYyli/FJTNhMqoWdX
	8jsYjWFyEH62zydkjM0h4Zu7cN452PXI3kFcMN8YNTX7xuUygK/kPxwPHbnSZew7rp3LtPPFRrQzC
	/iCTD4Uch7ugqC73O64=;
Received: by exim-smtp-77d8cdf77b-wlhm8 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1u7LK4-00000000BOp-3ASO; Wed, 23 Apr 2025 00:38:33 +0300
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
Subject: [PATCH 25/33] dt-bindings: remoteproc: qcom: sc7180-pas: Add the SM7150 compatible
Date: Wed, 23 Apr 2025 00:31:29 +0300
Message-ID: <20250422213137.80366-9-danila@jiaxyga.com>
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
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD985535D2C87FE65BBBB88238522A04F3259E3B8317EBE436000894C459B0CD1B93DCA55A11E95DF9733594132A326AF8BE2851FBA67ABECD4003125D169E88A0005401ED2CA4B53CD
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A3DED2DACB82E709C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6759CC434672EE6371C2A783ECEC0211ADC4224003CC836476D5A39DEEDB180909611E41BBFE2FEB2BF055844E10E72790F2F716E29DD36721C8A50D7CE925F4A4F7B2FC45257496679FA2833FD35BB23D9E625A9149C048EE26055571C92BF10FC26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF80095D1E77F4578A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC0446B76C3DF766473AA81AA40904B5D9CF19DD082D7633A0C84D3B47A649675F3AA81AA40904B5D98AA50765F7900637B0B8ED7B846DF791D81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16B6D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A5D2915B867B2036F35002B1117B3ED696ED71671FA5DDA560E20DC3F561CE4150823CB91A9FED034534781492E4B8EEADED8273DE7764599AC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF3D7DAE94B2501B941FE9FE066586354743B683CB511A9A97C4E623D099C80C83245B1B6CBED8166A68A835CA8743990BC0D4B02AECF1F9CED59B53E1D0EAB012B7C77D21729250FCEFF8118B638B08AA02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS+uSU+BUhgvkDDBLwmhJNc=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F8C19DC884C49516A1356DD24693B53BCBB8F5E6F8CACF810D4AECC21E98409332C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4F4CF43BFC943A60553B7021BC3C09F8BCC8DB0ABA578393B68F3CF0E9FE49B69E3325780BABEE66FC31BB23B05CC7ADA6FADAA93CBE63E8DD670A5901851E161B9AB3BB27307D9A3
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZDUHnkX9EGqoJvaN2goLEWQ==
X-Mailru-MI: 20000000000000800
X-Mras: Ok

Add the compatibles and constraints for the ADSP, CDSP and MPSS found on
the SM7150 SoC.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index 66b455d0a8e3..439350f88985 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/remoteproc/qcom,sc7180-pas.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm SC7180/SC7280 Peripheral Authentication Service
+title: Qualcomm SC7180/SC7280/SM7150 Peripheral Authentication Service
 
 maintainers:
   - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 
 description:
-  Qualcomm SC7180/SC7280 SoC Peripheral Authentication Service loads and boots
-  firmware on the Qualcomm DSP Hexagon cores.
+  Qualcomm SC7180/SC7280/SM7150 SoC Peripheral Authentication Service loads and
+  boots firmware on the Qualcomm DSP Hexagon cores.
 
 properties:
   compatible:
@@ -22,6 +22,9 @@ properties:
       - qcom,sc7280-cdsp-pas
       - qcom,sc7280-mpss-pas
       - qcom,sc7280-wpss-pas
+      - qcom,sm7150-adsp-pas
+      - qcom,sm7150-cdsp-pas
+      - qcom,sm7150-mpss-pas
 
   reg:
     maxItems: 1
@@ -60,6 +63,8 @@ allOf:
         compatible:
           enum:
             - qcom,sc7180-adsp-pas
+            - qcom,sm7150-adsp-pas
+            - qcom,sm7150-cdsp-pas
     then:
       properties:
         interrupts:
@@ -79,6 +84,7 @@ allOf:
           enum:
             - qcom,sc7180-adsp-pas
             - qcom,sc7280-adsp-pas
+            - qcom,sm7150-adsp-pas
     then:
       properties:
         power-domains:
@@ -95,6 +101,7 @@ allOf:
         compatible:
           enum:
             - qcom,sc7180-mpss-pas
+            - qcom,sm7150-mpss-pas
     then:
       properties:
         power-domains:
@@ -130,6 +137,7 @@ allOf:
           enum:
             - qcom,sc7280-cdsp-pas
             - qcom,sc7280-wpss-pas
+            - qcom,sm7150-cdsp-pas
     then:
       properties:
         power-domains:
-- 
2.49.0


