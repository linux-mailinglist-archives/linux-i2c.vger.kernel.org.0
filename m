Return-Path: <linux-i2c+bounces-14902-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB6ACF41F7
	for <lists+linux-i2c@lfdr.de>; Mon, 05 Jan 2026 15:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C0CA302F918
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jan 2026 14:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596D9339B43;
	Mon,  5 Jan 2026 14:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3KqJ2cG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9166F339879;
	Mon,  5 Jan 2026 14:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622106; cv=none; b=hIJlDmBTdpxcA21oQN/QYdf65yIRhg+nF3dDnCZWgotDmQIr7OleferxYa9czg4WEcAc9tS/rS/9V7nIu1wmHMgCWhPkeuvqeAymY1quSaM0lrU/CW1Cn29lyYNUj38W/IEk1Xng8LhYnjzOVTwUnjB7f/EJtNLMSB6pPTqGjTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622106; c=relaxed/simple;
	bh=KJ3/OSaFFQcTSMOCTZ+h8tfTkIoUsMzdCb9AU8yW8yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VCpZyqExFMsFl7GNs0M3/752FI+UFQA51BLqGMQiC+pICEXEjJpO7zyIP2dgif2XIQy43Vg1Ffx5A547wMEho+Qthd9Warvri+9YyeL/VoQxJ8Sh5ziKz+c3xsVcBWE18FIxDrHoQp5VGsPKcOhh4VX3xe5BhkHK+u0zBbv8Xm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3KqJ2cG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E447C19425;
	Mon,  5 Jan 2026 14:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622105;
	bh=KJ3/OSaFFQcTSMOCTZ+h8tfTkIoUsMzdCb9AU8yW8yg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D3KqJ2cGV4APyaS59rUJtpGSHVSFDxglqls7hKl9QqRFTzwJyo2Tooo6uPwh3crGO
	 befSaAfNSNeCJt8Pgmdf31THCm8OFGOYqMNgnaF27i6pw9TbWXuVnyS2//qzsRVRqv
	 pyA4zzdSCbKViaaBWawxpGTUkXMeKfHiSL4C96RhWNQAiIRcBHDj0rT3ZQ1EUAkDNX
	 15dpdXCaPVHL8/9fQw3eHT4XmrGpBMCOpClQTKqvp2crJz3vLJHndhpA4TRGZGoAM0
	 9Ed8c5ZGLqZyBRe6rtTaosnB9/WipBGZxV+Hs1lJ35HlXqT58iuXgwXj60JnclqpDr
	 tWKCqJvh4SRJA==
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] Preparations for camera support on Fairphone 4
Date: Mon,  5 Jan 2026 08:07:32 -0600
Message-ID: <176762206374.2923194.14364085953938262000.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 10 Dec 2025 10:05:26 +0900, Luca Weiss wrote:
> Start adding some camera-related parts which can easily be upstreamed.
> 
> This contains the EEPROMs, fixed-regulators and enabling the CCI pull-up
> voltage source.
> 
> 

Applied, thanks!

[2/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add camera EEPROMs
      commit: 89bce44320b4c39f3ea48591f7c04c961e404eae
[3/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add camera fixed regulators
      commit: e1d3aeff520638d9d286f66e734c2cc8b489d5ee
[4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI pull-up
      commit: 7a53133ac4b5b26924146bc1b044594894ccc400

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

