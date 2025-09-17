Return-Path: <linux-i2c+bounces-13028-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC1FB819A9
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 21:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA783626527
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 19:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6197C314D0C;
	Wed, 17 Sep 2025 19:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hztTDeD5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E709730C110;
	Wed, 17 Sep 2025 19:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758137005; cv=none; b=YYlOapJGumFNKbKugnKGj8jWVBlq0+/vMvQDv/fSuJ2xUXLNw6+O00jM8mLj4CiWVNnuG4o4RT6pzA3uOolpRpCcrhfG2cZmxa6f9/dQCjAOwwW2IRKyw3klZUhVWR9cW3K2bDA5kNuNJE6R8nhEAU1av+TNwRL3sky4WJJ97CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758137005; c=relaxed/simple;
	bh=MFa4MrLLeBxJ4spNgJzdHnMZEO1qEG9apiibEMwKF+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dGu13itbM5cWhtbPkm7DPCwbwwo/aogCGIihXFgNUxsSBIZpy/GLBGifnN3xdz6U1n80H7HKhK/p2OtGTAMuAbrHtpsAF7d6nkpMYUwSZNrykT/z9A6Nv0RvPcfuPf5wH5JEtr2D22+6tgx/UOTfHAVhbTAbCwVvgWpq2a+OntQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hztTDeD5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3109DC4CEFB;
	Wed, 17 Sep 2025 19:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758137004;
	bh=MFa4MrLLeBxJ4spNgJzdHnMZEO1qEG9apiibEMwKF+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hztTDeD5xlD8jRixl4Pxqbhj8i+b07MKO4vukji5FOvcufnEFBVDnUG3O39XqxEDf
	 fRfRqP9SzSW+KP9YaaoIOGCbEGdM+/jH9zvtgkeb1fk21D0+Woe/fz4mx+4nkTwi8t
	 pI0F4pL4JR1rij724ydjdyWMqqm1SmfSaS0M0ZYYyHU6tr0Hh43jZy3SDWqKIDH8BL
	 V8o35BqbbsomC6B9QR0d5mM/lCO9neVYWqrcCfLAsnPfjuwFR/QRHSj9pPcRtGKc1t
	 9JObbpttreKLKaZxdOPbdiny+a14JCdMCRGm3Y0swnxHw2i4zX8ohFjE/+jhCjdYcp
	 RhV6wSpUEI5kQ==
From: Bjorn Andersson <andersson@kernel.org>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	konradybcio@kernel.org,
	broonie@kernel.org,
	johan+linaro@kernel.org,
	dianders@chromium.org,
	agross@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: mukesh.savaliya@oss.qualcomm.com
Subject: Re: [PATCH v7 0/6] Add support to load QUP SE firmware from
Date: Wed, 17 Sep 2025 14:23:19 -0500
Message-ID: <175813699406.66282.993438408948834854.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 11 Sep 2025 10:02:50 +0530, Viken Dadhaniya wrote:
> In Qualcomm SoCs, firmware loading for Serial Engines (SE) in the QUP
> hardware has traditionally been managed by TrustZone (TZ). This setup
> handled Serial Engines(SE) assignments and access control permissions,
> ensuring a high level of security but limiting flexibility and
> accessibility.
> 
> This limitation poses a significant challenge for developers who need more
> flexibility to enable any protocol on any of the SEs within the QUP
> hardware.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: qcom: se-common: Add QUP Peripheral-specific properties for I2C, SPI, and SERIAL bus
      commit: 9bc7130822c4c7f3ef39f20174a379e476586ab3
[2/6] soc: qcom: geni-se: Cleanup register defines and update copyright
      commit: b44a593fb53a6f5e135af2c5351546f80c1285ac
[3/6] soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem
      commit: d4bf06592ad68ac4353a81c73e8e662cf88aa2cc
[4/6] i2c: qcom-geni: Load i2c qup Firmware from linux side
      commit: b645df76536c5b7d40e60450bf8011f70f34415f
[5/6] spi: geni-qcom: Load spi qup Firmware from linux side
      commit: 99cf351ee1c46b39c0581220807290b1dd56488e
[6/6] serial: qcom-geni: Load UART qup Firmware from linux side
      commit: 3f1707306b79cafc5a11350befd5a4081b807760

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

