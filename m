Return-Path: <linux-i2c+bounces-13001-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDDEB59EAA
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 19:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFB391C03317
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 17:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE12232D5A6;
	Tue, 16 Sep 2025 16:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufGW4ipa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAB1329517;
	Tue, 16 Sep 2025 16:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041919; cv=none; b=DUXq8vthkEBxBGZPYTU3tHm+myshRgQN8K0CgXJZt6I+UbVgTCCbLgRxSmuhET2b6g1ohxjhPviWXSjxNytzxN3fIkaN4fVsrW2junZKcVkMgDumAphRZ1CPLX/6+9r7K3X3lL8d2ytlPUYNKG5b2KG+xi3moIuLDoCUuvmu0jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041919; c=relaxed/simple;
	bh=cN2ZRIwpPuuTuFydKsuswQytPt7ZVYZueiDnIohjvxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zia4YqMQgCEV9MFnkqQFQMpYvuZpLaDNbOwiXJmgItyd9Sz/Sgt/SBrqvYFAjJWoI+j7t61cdevfwmXyE+plCgzQFyq90dRQWFkHNCRdblWSrsKtgw5YoSoAEvbnUXft/vr8XRfOWXBGg1PUXae2Y6ggn2xbvmkGIjmzhE4eYgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufGW4ipa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B765AC4CEF7;
	Tue, 16 Sep 2025 16:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041919;
	bh=cN2ZRIwpPuuTuFydKsuswQytPt7ZVYZueiDnIohjvxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ufGW4ipaBuqkZumNSbHozdOrPtbsJc8gOophMG/yqg6lu3A61SeJaSBfuxc/Rfoqz
	 7HlzyPzelhOESnR9HvCdsZNEJSi0JGD8fNAsXzEEQIFoRTSAwhZcdWAv9sfxBiHIa+
	 QsQOlGSghSU+nZNF2/mgsoKRKupQOzyAmoiHjNrT2lu9yNP/GsbWi/27oN/DI1AAfl
	 zhkF9YltDSNt97izaa1CNRYiHmiKhHSE3sYTraXEXL+suTLKc3XHHn/EbzUMw00Lcm
	 wpZyb0qfI6x5YGMxPsO/qMDVtdIuHtZCvSyscPc5RJV+CeIM+h3vbjB92oM0yZBh+Z
	 f+0pQYAh9+jHA==
From: Bjorn Andersson <andersson@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Monish Chunara <quic_mchunara@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/10] arm64: dts: qcom: lemans-evk: Extend board support for additional peripherals
Date: Tue, 16 Sep 2025 11:58:21 -0500
Message-ID: <175804189844.3983789.17270960228782770722.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 16 Sep 2025 16:16:48 +0530, Wasim Nazir wrote:
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
> [...]

Applied, thanks!

[01/10] arm64: dts: qcom: lemans: Add SDHC controller and SDC pin configuration
        commit: dfdbe4bf6ff386d96c1dc8c7407201d882fc4113
[02/10] arm64: dts: qcom: lemans-evk: Enable GPI DMA and QUPv3 controllers
        commit: 5bc646aa0c7a444d4e81d8e3cae4baf463e1a018
[03/10] arm64: dts: qcom: lemans-evk: Add TCA9534 I/O expander
        commit: 6ae6381f871803246e9f655537999f163656de33
[04/10] arm64: dts: qcom: lemans-evk: Add EEPROM and nvmem layout
        commit: 81618ba3fe33017be5e1fce99891abd220a775b8
[05/10] arm64: dts: qcom: lemans-evk: Enable PCIe support
        commit: 94d7d37f6ac34bd683a93fbf1013736616fc3677
[06/10] arm64: dts: qcom: lemans-evk: Enable remoteproc subsystems
        commit: cac44c46970adb4553bab5c5aa528462a5fe98d0
[07/10] arm64: dts: qcom: lemans-evk: Enable Iris video codec support
        commit: fd32b5d586ac650ce1c6f58535ec79cd2632be09
[08/10] arm64: dts: qcom: lemans-evk: Enable first USB controller in device mode
        commit: 7bd68ef80661a9436120702e1300b56904fdd022
[09/10] arm64: dts: qcom: lemans-evk: Enable SDHCI for SD Card
        commit: c3f107b514c357cbc08ae70a69700222e7d1192d
[10/10] arm64: dts: qcom: lemans-evk: Enable 2.5G Ethernet interface
        commit: 71ee90ed1756724d62cb55873555e006372792c7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

