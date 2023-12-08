Return-Path: <linux-i2c+bounces-686-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F322580A99C
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 17:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADB21281209
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 16:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EEB37154;
	Fri,  8 Dec 2023 16:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="w429hnML"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439C9198D;
	Fri,  8 Dec 2023 08:47:47 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3B8GfGOd008039;
	Fri, 8 Dec 2023 17:47:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=selector1; bh=x2MSP5Q
	i75jzKXhvK1uOkEyWudp+uieZW3Apd56nqak=; b=w429hnML1chz9C80cpFndXU
	uK5kPvFd38w33BWt4lNUurLCwMnhhIiFXRYZEpmFixmVFGalkJzS8F3Y0W6B212+
	WmIJPfp7vHd77rzfJSdZQz5tiI7wIkNcbZ7h3LJ7+lx1F4ABuq/FS3ddkDvZzjCy
	vp1GVoHrogxFZmtYE0CVUb6m5J0MrWebASRCq70c3Odr1y4bywBS92OOZX7kdv0A
	uZCYb8tj27yAI5f0Pkj9FfyVXCByeA+2uUwhr+ocfK7ANJkl7rYtSdxz8N8UIWi2
	gc4aoWupDDwAhgWIinkHB5t0dSuMubWTyE8+P2Gj64E5pZWvLeTThSkukEQwMAA=
	=
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3utd2pnf0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 17:47:31 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5AC64100056;
	Fri,  8 Dec 2023 17:47:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53A2623692D;
	Fri,  8 Dec 2023 17:47:30 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Dec
 2023 17:47:30 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Pierre-Yves MORDRET
	<pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/7] i2c: stm32f7: enhancements and support for stm32mp25
Date: Fri, 8 Dec 2023 17:47:09 +0100
Message-ID: <20231208164719.3584028-1-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02

This series first perform enhancements in the way interrupt are handled
and cleanup in messages.
Then it adds support for the stm32mp25 which differs in that
it only has a single irq line for both event/error and has a
different handling of the FastModePlus.
Support is then enabled within the stm32mp25 related device-trees.

Changelog:
v2: - correct st,stm32-i2c.yaml.  Use if then else scheme to indicate
      number of interrupts / interrupt-names depending on the
      compatible while keeping the description within the common part

    - correct 2 maybe-uninitialized warnings
          * ret in stm32f7_i2c_write_fm_plus_bits
          * irq_error in stm32f7_i2c_probe, move the platform_get_irq
            within the same if block as devm_request_threaded_irq

Alain Volmat (7):
  i2c: stm32f7: perform most of irq job in threaded handler
  i2c: stm32f7: simplify status messages in case of errors
  dt-bindings: i2c: document st,stm32mp25-i2c compatible
  i2c: stm32f7: add support for stm32mp25 soc
  arm64: dts: st: add all 8 i2c nodes on stm32mp251
  arm64: dts: st: add i2c2/i2c8 pins for stm32mp25
  arm64: dts: st: add i2c2 / i2c8 properties on stm32mp257f-ev1

 .../devicetree/bindings/i2c/st,stm32-i2c.yaml |  28 ++
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  36 ++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  96 +++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  20 ++
 drivers/i2c/busses/i2c-stm32f7.c              | 334 ++++++++++--------
 5 files changed, 357 insertions(+), 157 deletions(-)

-- 
2.25.1


