Return-Path: <linux-i2c+bounces-13000-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4138FB59EA0
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 19:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F7E1461BA6
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 17:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9B93294F5;
	Tue, 16 Sep 2025 16:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNfloWg+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF833294E8;
	Tue, 16 Sep 2025 16:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041915; cv=none; b=r2+jpjNrXECXOQtShMumCjbaEZZMXBFhpDXuZe1WTGNy5K96XckHgzFnzTdsdns00fDvVIyM3D3t4X0I1byOK9Gii4icwElpuc50NwsesLfemi5gZqPHRm/pM6BFq4AQOgxDdGWh9G6BAMD22ntiMuMIOfhniG7EsRWd6Lc6RkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041915; c=relaxed/simple;
	bh=D3qvIg6ko2yKinLTtLMypu7l8kYVGM9TPZja3TTO2pY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jWc7j+csKtpQm/inuEwvRgHQdMO5GnqzipV78H3xMnv34MJ3wFD39SFdmMbrsVtmTBmkE69jTGDy4kSB/K1Eh+pEIU5IgdUpCT/hc8V9wq9JAuPOJ4cRtp9y7NuV0yFFWm8TDOphM6k+74UD2zRNUcUAoQj5GkuRH9oJOuhovkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNfloWg+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC4FC4CEFD;
	Tue, 16 Sep 2025 16:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041914;
	bh=D3qvIg6ko2yKinLTtLMypu7l8kYVGM9TPZja3TTO2pY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iNfloWg+RYVsWVVUekTMIF7SiaatayhzqVsocVe2bBlFAtCHkJVS6b5eRCX6NhaPE
	 fakx5iD9ewvQI2s/cwIpuNxDO2C+e+TJ3YAQimnOOaHiAnWSZzBOFIup0SrF4Fd1qm
	 h+P6GV8YjwhS9mfPXaYD0gAtLqVUBFlf4+nX8YVv//zQAm3/iNXMl/7q/p5lV2rId+
	 UU+x1b1b90QDosYsKb0Ff+b5k3TRLUohBEqr/XTsDeDKQ2ImqbWgwQ7n780sSyh8fv
	 1SvXu/HVTCfILKAqE2b2txlgRoZezxvLIZ2j52GagqR+LPsoCVV0cSpYPNDD8iIt1B
	 tchFKDp78eyfg==
From: Bjorn Andersson <andersson@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	bryan.odonoghue@linaro.org,
	Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Wenmeng Liu <quic_wenmliu@qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 0/3] Add CCI and imx577 sensor support for LeMans EVK
Date: Tue, 16 Sep 2025 11:58:17 -0500
Message-ID: <175804189857.3983789.14525162950764666455.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250912-camss_rb8-v6-0-c9a6c3d67392@oss.qualcomm.com>
References: <20250912-camss_rb8-v6-0-c9a6c3d67392@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 12 Sep 2025 23:19:24 +0800, Wenmeng Liu wrote:
> This series adds cci definition and imx577 sensor enablement
> via cci1 on LeMans EVK.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl -d /dev/media0 --reset
> media-ctl -d /dev/media0 -V '"imx577 0-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: sa8775p: Add CCI definitions
      commit: 3964a91e552880c356ec4d3f09eed927f48e9c66
[3/3] arm64: dts: qcom: lemans-evk-camera: Add DT overlay
      commit: b68fc45910d4eb1b3bb7e160282fba5a4bdd8409

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

