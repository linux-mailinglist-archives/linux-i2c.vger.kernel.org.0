Return-Path: <linux-i2c+bounces-10532-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 620E9A976B8
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 22:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 832601899F94
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 20:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9FE29AAED;
	Tue, 22 Apr 2025 20:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="RDmneCZd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="i+zjNpg9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from send193.i.mail.ru (send193.i.mail.ru [95.163.59.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2409413BAF1;
	Tue, 22 Apr 2025 20:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.59.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745353159; cv=none; b=rBzovBQyieO1VD0HVv3EZOE3poNbJ3gXdPLYo1OTVijvB8S16KSs3QvV0Epznnp2c2tYF9I+a3sWJbbdxVdRFQUTTrIfD4/ZZbT76Z/ycB+7CbXvyV5KLNIi2o1JnlaxACGLKYD8XDOpP60Tn3zIpYNBSBCF2EbkqdMakd04gOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745353159; c=relaxed/simple;
	bh=46VHL5vhmoCeAp1Ym4uU4sBzGu8tfsJBNOQzyM37tHU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NXz8unvlJO4oz+36CJPIA0CipPQ/0hyOefXOBtR/ojRnJHRuBpTmHCHVCDrlOxmMiGpbmijIv5OojtDXtJHOOGQ/CC7yd7hevP7cMq997NhSpSp8T0q7krP6hySD/+Awfn9GznkjA+s+gsf7gqapcG1UwDIixlZBvR/v/UaQrjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=RDmneCZd; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=i+zjNpg9; arc=none smtp.client-ip=95.163.59.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=iebI3MkzhqhNb0buAHKTzfrAJp6HFa4fEyurj7k9QOQ=; t=1745353155; x=1745443155; 
	b=RDmneCZd8FqLl3b+7e7p1INSdHpltEQHLR//T+pLL6nuctKmFJB+7EVute0QH5xDKdzsFALovFr
	eQVAbP85le+r57yxaVzbYecmsJBAc/TBf3HEQTz5FhwRgzoUFHkT0Rs2ZJNbQfdK2aYvb7eAnGsSN
	kwgzj0P3lcnt48HRFKk=;
Received: from [10.113.178.221] (port=39216 helo=send82.i.mail.ru)
	by exim-fallback-5f8f9b6d5b-vxn2x with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1u7K58-00000000AVC-1x28; Tue, 22 Apr 2025 23:19:05 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=iebI3MkzhqhNb0buAHKTzfrAJp6HFa4fEyurj7k9QOQ=; t=1745353142; x=1745443142; 
	b=i+zjNpg9XcqmCBgsyaBQK1s6cn0DDoN8b5hN5XpwMLkCQJuiLcBdYzAd29KpVZ8Sv+AqbdD+4My
	6FQGFZMXNHNg7p1RVIt8zPTjtx+9eGKyNEt9/KY0HjU0jVAlxITWOou7spiGZFCaXabtw0DVYSMSJ
	+ciyiU3azaPEilWFbxE=;
Received: by exim-smtp-77d8cdf77b-httmk with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1u7K4U-00000000Adc-00tp; Tue, 22 Apr 2025 23:18:23 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 00/33] Add support for Qualcomm Snapdragon SM7150 SoC and
 Google Pixel 4a
Date: Tue, 22 Apr 2025 23:17:01 +0300
Message-Id: <20250422-sm7150-upstream-v1-0-bf9a9081631d@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAD35B2gC/x3MQQqAIBBA0avErBNGM8KuEi2kppqFFk5FEN49a
 fkW/78glJgE+uqFRDcL77FA1xVMm48rKZ6LwaBp0RqjJHS6RXUdcibyQTmHaLV1jSaEUh2JFn7
 +4zDm/AHbvmj+YQAAAA==
X-Change-ID: 20250422-sm7150-upstream-9900414931e0
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
 ~postmarketos/upstreaming@lists.sr.ht, Danila Tikhonov <danila@jiaxyga.com>, 
 Connor Mitchell <c.dog29@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745353049; l=5706;
 i=danila@jiaxyga.com; s=20250422; h=from:subject:message-id;
 bh=46VHL5vhmoCeAp1Ym4uU4sBzGu8tfsJBNOQzyM37tHU=;
 b=60mTGvAzuTQlti9MzBWZQskN1/mP/WrztAI3VHmiWGObIrhdL0cs3fw9o6Vu7Rzc44MOXIPWV
 76QqaNXqQMJCD650RdNwWNX2rE6RhX9PN7kzj3ltUPynEFJYHHTVEii
X-Developer-Key: i=danila@jiaxyga.com; a=ed25519;
 pk=kkU4G47tvpSEUdBQEkXuWvTk/3WmGrVrdzZiKAKjBJo=
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9563C565BC8219237D5DFFB79FDCADED6DE48DADD37CA2EEC182A05F5380850404C228DA9ACA6FE2793C387FCDC7C71EE3DE06ABAFEAF6705253A7DBABE01AAB36CAB699290A87B9A7B9585C59A2DDEF7
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AB524098FB2F2222EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB5533756605D4038907BE0FDB876012C3BF043B45497C9FA7C24C7B2A6F557F55DE11AA42389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C000E2D00546020E658941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6AEEA5BB16A939343CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C224924A474D822E1F61376E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8BE53CE7BD399AAB573AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E7355E1C53F199C2BB95B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A5EC0757841F447DAD5002B1117B3ED6963706A8DEBE433A298D59E407A97E9958823CB91A9FED034534781492E4B8EEADD6B8D1F75A55B56DF36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D548E8926FB43031F38
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF703FE251F748C1E5D27308FD4CF5D7396D50190868D45AA71A271C5A8A138314F09515A9A3E4BB8D68A835CA8743990B341249A7E886F8880E280A9F3BCC449B261E0ECD5CC99FEB6557FDD6B607B6B402C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS+uSU+BUhgv4DNKjNUrt/4=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FE33E25B1C0D8A9380D8E165B5AC4796C06FAC53478C042799D6F4D2EBC31AC922C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4F4CF43BFC943A60588C99C423F47DE0B9E5CE1735208E14B68F3CF0E9FE49B693D0DD15183EF2CA6F3006F2CF759E9EB895EC5891D4C12BA4C864F44338D3D672947B12AF19300AA
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZxCvlsRkEy1jXVDAHWlwDOw==
X-Mailru-MI: 20000000000000800
X-Mras: Ok

This patch series adds support for the Qualcomm Snapdragon 730/730G/732G
(SM7150) platform along with the Google Pixel 4a (sunfish) device. Since
the most critical drivers were submitted and applied in separate patch
series, this series is largely composed of DT bindings and device‑trees.

To date, we’ve tested SM7150 support on the following eleven devices:
- Google Pixel 4a (sunfish)
- Samsung Galaxy A71 (a715f)
- Lenovo Tab P11 Pro (j706f)
- Xiaomi POCO X2 (phoenix)
- Xiaomi POCO X3 (karna) / POCO X3 NFC (surya)
- Xiaomi Redmi Note 10 Pro (sweet)
- Xiaomi Redmi Note 12 Pro (sweet_k6a)
- Xiaomi Mi 9T / Redmi K20 (davinci)
- Xiaomi Mi Note 10 Lite (toco)
- Xiaomi Mi Note 10 (CC9 Pro) & Mi Note 10 Pro (CC9 Pro Premium) (tucana)
- Xiaomi Mi 11 Lite 4G (courbet)

A huge thank‑you to the SM7150 community for all the devices-porting
work, testing efforts, and bug reports.

Patches adding support for the aforementioned Xiaomi devices will be
submitted as a separate series, contingent on this series being applied.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
Connor Mitchell (1):
      arm64: dts: qcom: sm7150: Add device-tree for Google Pixel 4a

Danila Tikhonov (25):
      dt-bindings: arm: cpus: Add Kryo 470 CPUs
      dt-bindings: cpufreq: qcom-hw: Add the SM7150 compatible
      dt-bindings: watchdog: qcom-wdt: Add the SM7150 compatible
      dt-bindings: sram: qcom,imem: Add the SM7150 compatible
      dt-bindings: thermal: tsens: Add the SM7150 compatible
      dt-bindings: mmc: sdhci-msm: Add the SM7150 compatible
      dt-bindings: soc: qcom,dcc: Add the SM7150 compatible
      dt-bindings: mfd: qcom,tcsr: Add the SM7150 compatible
      dt-bindings: net: qcom,ipa: Add the SM7150 compatible
      dt-bindings: dmaengine: qcom: gpi: Add the SM7150 compatible
      dt-bindings: nvmem: qfprom: Add the SM7150 compatible
      dt-bindings: crypto: qcom,inline-crypto-engine: Add the SM7150 compatible
      dt-bindings: interconnect: qcom-bwmon: Add the SM7150 compatible
      dt-bindings: i2c: qcom-cci: Add the SM7150 compatible
      dt-bindings: clock: qcom-rpmhcc: Add the SM7150 compatible
      dt-bindings: interconnect: OSM L3: Add the SM7150 compatible
      dt-bindings: arm-smmu: Add the SM7150 compatible
      dt-bindings: clock: qcom,gpucc: Add the SM7150 compatible
      dt-bindings: remoteproc: qcom: sc7180-pas: Add the SM7150 compatible
      remoteproc: qcom: pas: Add SM7150 remoteproc support
      cpufreq: Add SM7150 to cpufreq-dt-platdev blocklist
      firmware: qcom: tzmem: disable sm7150 platform
      arm64: dts: qcom: Add dtsi for Snapdragon 730/730g/732g (SM7150) SoCs
      dt-bindings: arm: qcom: Add SM7150 Google Pixel 4a
      dt-bindings: display: panel: samsung,ams581vf01: Add google,sunfish

David Wronek (6):
      dt-bindings: mailbox: qcom: Add the SM7150 APCS compatible
      dt-bindings: soc: qcom: aoss-qmp: Add the SM7150 compatible
      dt-bindings: interrupt-controller: qcom-pdc: Add the SM7150 compatible
      dt-bindings: usb: dwc3: Add the SM7150 compatible
      dt-bindings: phy: qcom,qusb2: Add the SM7150 compatible
      dt-bindings: ufs: qcom: Add the SM7150 compatible

Jens Reidel (1):
      soc: qcom: pd-mapper: Add support for SM7150

 Documentation/devicetree/bindings/arm/cpus.yaml    |    1 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |    6 +
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |   29 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |   53 +-
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |    2 +
 .../bindings/crypto/qcom,inline-crypto-engine.yaml |    1 +
 .../bindings/display/panel/samsung,ams581vf01.yaml |    8 +-
 .../devicetree/bindings/dma/qcom,gpi.yaml          |    1 +
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |    2 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |    2 +
 .../bindings/interconnect/qcom,osm-l3.yaml         |    1 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |    3 +
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |    1 +
 .../devicetree/bindings/mfd/qcom,tcsr.yaml         |    1 +
 .../devicetree/bindings/mmc/sdhci-msm.yaml         |    1 +
 .../devicetree/bindings/net/qcom,ipa.yaml          |    4 +
 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |    1 +
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    |    1 +
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       |   14 +-
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |    1 +
 .../devicetree/bindings/soc/qcom/qcom,dcc.yaml     |    1 +
 .../devicetree/bindings/sram/qcom,imem.yaml        |    1 +
 .../devicetree/bindings/thermal/qcom-tsens.yaml    |    1 +
 .../devicetree/bindings/ufs/qcom,ufs.yaml          |    2 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |    3 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/sm7150-google-sunfish.dts |  901 ++++
 arch/arm64/boot/dts/qcom/sm7150.dtsi               | 5010 ++++++++++++++++++++
 drivers/cpufreq/cpufreq-dt-platdev.c               |    1 +
 drivers/firmware/qcom/qcom_tzmem.c                 |    1 +
 drivers/remoteproc/qcom_q6v5_pas.c                 |    3 +
 drivers/soc/qcom/qcom_pd_mapper.c                  |   11 +
 34 files changed, 6031 insertions(+), 40 deletions(-)
---
base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
change-id: 20250422-sm7150-upstream-9900414931e0

Best regards,
-- 
Danila Tikhonov <danila@jiaxyga.com>


