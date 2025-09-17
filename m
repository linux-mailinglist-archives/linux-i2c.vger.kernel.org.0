Return-Path: <linux-i2c+bounces-13027-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F2EB8061C
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 17:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4304586084
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 15:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CC3371E83;
	Wed, 17 Sep 2025 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZekiJBnx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C5F19CC0C;
	Wed, 17 Sep 2025 15:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758121246; cv=none; b=lEungVWkaZ50En2t61GbalJUwxPGY6tEnLFVt2s8oithE0VUufKAe/CiXt/B6psLOH7Lpsq+gX+wMB+bUmONnCy7/biftMLtQq5jqzKzP3Zuax+WY9Xl91lkX4YM8mSa5J+zjAphMKN8ch8RCrAA8Gv+k/AwKGHhgHHMzByjUAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758121246; c=relaxed/simple;
	bh=n8b7BCp5JPPR7LVBqJbWYtWx0G87/2qE/nO7QOyYb94=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kEuj/AahQvjEcmpDbze5yOxObPJiAB1gQ0yNI4DTY6vMF0tFMejHFzd0S4CzCW34TZ+Cvy66rue6Yy3xenSmjsHj5glOejLtrVzyZd2s/BnMCu/dzznTOHRzV1tne8put9KFSP+dfn+NypdOcGwPYVsSkMUOKdHioBaGnWQIo8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZekiJBnx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E83C4CEE7;
	Wed, 17 Sep 2025 15:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758121245;
	bh=n8b7BCp5JPPR7LVBqJbWYtWx0G87/2qE/nO7QOyYb94=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZekiJBnxnAXSJunQHScmVci1aFkwUH3Bh9u0Mmdtm6LfiGIzJiYiiyrRbVuPcDYEa
	 4bmMB4DDPS7AFxpc/0yBbThk4WqvgYiBFFHbLHqF8j0CUowpoBjeiwVdh1SYCWko6j
	 vQp5Zpuy34nWfdDsvgkhnb0pjbnps70A4bAC0ygbt/ipKVqlVSYcPuZ2d+DNBaqG/6
	 isw3hIm43JafCd+wG7dw+Vfcm+160vOr80cswynjD94NMoapg8pp+tPArrjS266Ipf
	 ZQPRjQ/akDXHsF8JEsIejtndCy/qZBHEbkVvk+BuL/6NuECBFhNm9uOlDEpZ8n3+LQ
	 JriYcOrnbi1ww==
Date: Wed, 17 Sep 2025 10:00:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Monish Chunara <quic_mchunara@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, linux-i2c@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>, 
 Sushrut Shree Trivedi <quic_sushruts@quicinc.com>, 
 Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>, netdev@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-mmc@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
In-Reply-To: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
References: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
Message-Id: <175812100719.2051822.15573385822403919775.robh@kernel.org>
Subject: Re: [PATCH v6 00/10] arm64: dts: qcom: lemans-evk: Extend board
 support for additional peripherals


On Tue, 16 Sep 2025 20:29:22 +0530, Wasim Nazir wrote:
> This series extend support for additional peripherals on the Qualcomm
> Lemans EVK board to enhance overall hardware functionality.
> 
> It includes:
>   - New peripherals like:
>     - I2C based devices like GPIO I/O expander and EEPROM.
>     - GPI (Generic Peripheral Interface) DMA controllers and QUPv3 controllers
>       for peripheral communication.
>     - PCIe HW with required regulators and PHYs.
>     - Remoteproc subsystems for supported DSPs.
>     - Iris video codec.
>     - First USB controller in device mode.
>     - SD card support on SDHC v5.
>     - Qca8081 2.5G Ethernet PHY.
> 
> Dependency:
>   - The ethernet PHY QCA8081 depends on CONFIG_QCA808X_PHY, without
>     which ethernet will not work.
> 
> ---
> Changes in v6:
> - Update commit message of patch 02/10 (v5) to reflect QUP interfaces and
>   its ports - Dmitry.
> - Link to v5: https://lore.kernel.org/r/20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com
> 
> Changes in v5:
> - Dropping these changes from the series, as they are already part of
>   linux-next:
>   - Audio change [1]
>   - MMC dt-bindings change 01/14 (v4)
>   - EEPROM dt-bindings change 05/14 (v4)
> - Change bias to 'pull-up' for PCIe 'perst-pins' - Konrad.
> - Link to v4: [2]
> 
> [1] https://lore.kernel.org/linux-arm-msm/20250822131902.1848802-1-mohammad.rafi.shaik@oss.qualcomm.com/
> [2] https://lore.kernel.org/r/20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com
> 
> Changes in v4:
> - Move 'bus-width' property of SDHC to Board DT and also keep the width
>   to 4 bits - Dmitry/Konrad.
> - Update commit text of eeprom bindings to describe the reason for the
>   change 05/14 (v3) - Dmitry.
> - Bring all tags from v3.
> - Link to v3: https://lore.kernel.org/r/20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com
> 
> Changes in v3:
> - Re-order QUP patch 05/13 (v2) to not break i2c node enablement in patch
>   03/13 (v2) - Dmitry.
> - Update commit text for QUP patch to highlight which all clients each
>   QUP is accessing.
> - Add dedicated compatible for Giantec EEPROM, because usage of generic
>   compatible "atmel,24c256" alone is not advised.
> - Update commit text for EEPROM patch 04/13 (v2) to emphasize on EEPROM
>   enablement - Konrad.
> - Put 'reg' property after 'compatible' in Expander - Konrad.
> - Put 'pinctrl-names' after 'pinctrl-n' in PCIe - Konrad.
> - SDHC:
>     - Update interconnect nodes with ICC_TAG macro - Konrad.
>     - Put new lines for each entry in interrupt-names, clock-names,
>       interconnect-names - Konrad.
>     - Put bias properties below drive-strength for consistency in
>       sdc-default-state - Konrad.
>     - Move 'bus-width' property to SOC DT - Konrad.
>     - Move 'no-mmc' and 'no-sdio' properties to board DT - Dmitry/Konrad.
> - Add 'Reviewed-by' tag from Konrad [3] on Audio patch 13/13 (v2),
>   although the commit text is changed now.
> - Link to v2: [4]
> 
> [3] https://lore.kernel.org/linux-arm-msm/b4b6678b-46dd-4f57-9c26-ff0e4108bf79@oss.qualcomm.com/
> [4] https://lore.kernel.org/r/20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com
> 
> Changes in v2:
> - Split the patch 3/5 in v1 into separate patch per author - Bjorn.
> - Use generic node names for expander - Krzysztof.
> - Change video firmware to 16MB comapatible - Dmitry.
> - SDHC:
>     - Arrange SDHCI-compatible alphanumerically - Dmitry.
>     - Move OPP table and power-domains to lemans.dtsi as these are
>       part of SoC.
>     - Move bus-width to board file - Dmitry.
>     - Change 'states' property to array in vreg_sdc and also re-arrange
>       the other properties.
> - Remove the redundant snps,ps-speed property from the ethernet node as
>   the MAC is actually relying on PCS auto-negotiation to set its speed
>   (via ethqos_configure_sgmii called as part of mac_link_up).
> - Refine commit text for audio patch - Bjorn.
> - Link to v1: https://lore.kernel.org/r/20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com
> 
> ---
> Krishna Kurapati (1):
>       arm64: dts: qcom: lemans-evk: Enable first USB controller in device mode
> 
> Mohd Ayaan Anwar (1):
>       arm64: dts: qcom: lemans-evk: Enable 2.5G Ethernet interface
> 
> Monish Chunara (3):
>       arm64: dts: qcom: lemans: Add SDHC controller and SDC pin configuration
>       arm64: dts: qcom: lemans-evk: Add EEPROM and nvmem layout
>       arm64: dts: qcom: lemans-evk: Enable SDHCI for SD Card
> 
> Nirmesh Kumar Singh (1):
>       arm64: dts: qcom: lemans-evk: Add TCA9534 I/O expander
> 
> Sushrut Shree Trivedi (1):
>       arm64: dts: qcom: lemans-evk: Enable PCIe support
> 
> Vikash Garodia (1):
>       arm64: dts: qcom: lemans-evk: Enable Iris video codec support
> 
> Viken Dadhaniya (1):
>       arm64: dts: qcom: lemans-evk: Enable GPI DMA and QUPv3 controllers
> 
> Wasim Nazir (1):
>       arm64: dts: qcom: lemans-evk: Enable remoteproc subsystems
> 
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 365 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi    |  92 ++++++++
>  2 files changed, 457 insertions(+)
> ---
> base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> change-id: 20250814-lemans-evk-bu-ec015ce4080e
> 
> Best regards,
> --
> Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit c3067c2c38316c3ef013636c93daa285ee6aaa2e

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[251, 1], [251, 11], [251, 15], [251, 18], [251, 19]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[250, 1], [250, 11], [250, 15], [250, 18], [250, 19]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[251, 1], [251, 28], [251, 32], [251, 35], [251, 36]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[250, 1], [250, 28], [250, 32], [250, 35], [250, 36]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[250, 1], [250, 11], [250, 15], [250, 18], [250, 19]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[250, 1], [250, 28], [250, 32], [250, 35], [250, 36]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[251, 1], [251, 11], [251, 15], [251, 18], [251, 19]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[236, 1], [236, 11], [236, 15], [236, 18], [236, 19]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[251, 1], [251, 28], [251, 32], [251, 35], [251, 36]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/lemans-evk.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[236, 1], [236, 28], [236, 32], [236, 35], [236, 36]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/lemans-evk.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#






