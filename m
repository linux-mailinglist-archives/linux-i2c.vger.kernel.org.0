Return-Path: <linux-i2c+bounces-9592-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C1EA46115
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 14:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21855189B32F
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 13:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AB421D3FD;
	Wed, 26 Feb 2025 13:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehqYx3Iv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C419F21D3D2;
	Wed, 26 Feb 2025 13:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740577253; cv=none; b=DX1wsYNOe97uk6ZeZNQcDNf032Eruh5PfE3fnyPIcYcPcoaRewZfYzt7K4I25BIbDXfBQAEYF/nHYcfhezXZIkkI4robHwSdtz9Qo/NLnrR+x3at8LEb4rZPfYke/rcePoC1Q/ompNOZlSJAcuzlHr1yDP3Yjj6OxYiatoFuvPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740577253; c=relaxed/simple;
	bh=n04S9VbqhiiqdQwFXbsvHwByyGdRB1rNCTH9pn6rqVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KZI2GlgZBxVKgt78Mo4MH4FWooWwJeKlgngQr2SFxZNA3suzAuZ9xdEoVNtfP4T/piUH0qNNwNoo8OHsL467S0jQKofC2ILaAftPplKrALUV5f4j4SJw94R5xP6VEleYTofDFGsK5L9QjlX+NzsPQE4/dF+zZULYOip4ZWIIJsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehqYx3Iv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B704C4CEE4;
	Wed, 26 Feb 2025 13:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740577253;
	bh=n04S9VbqhiiqdQwFXbsvHwByyGdRB1rNCTH9pn6rqVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ehqYx3IvF8Se6HE4ZBL+PFaRQqnILLojO4OGxoyToHK0cShvUhaUUu6DvItgWQ0Jn
	 mJ4qAAY2Kq9G9/lX1QqYaGVQfc3bdwmyyICAltgEL7alAHvgjeuSYQeVYPM9Ddn8dx
	 f6nKicaA+gymiAUiuTzYHsSMgf+Z4Lzi1FJh5YRsfWXX/7wbgumW0WRbvmo1ffI+CZ
	 p94IqW4hrsWF2cHAMtyjoIiLZ+tyqmgEuRauigwqi3axNWHYBoaEasoQcilcR8XwTF
	 vpcXwQNY+p89OQWJADIHTWrcE4JKrpl7d/Vl5U15RtWBCX90dFGpIm7My02QdHV+xR
	 vaxRIdpDM+PCw==
From: Bjorn Andersson <andersson@kernel.org>
To: brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH 0/4] sm7325-nothing-spacewar: Preparing for the cameras
Date: Wed, 26 Feb 2025 07:40:44 -0600
Message-ID: <174057724684.237840.17593685823629213204.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203111429.22062-1-danila@jiaxyga.com>
References: <20250203111429.22062-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Feb 2025 14:14:25 +0300, Danila Tikhonov wrote:
> Nothing Phone (1) - sm7325-nothing-spacewar has three camera sensors:
> - Wide sony,imx766
> - Ultra wide samsung,s5kjn1
> - Front sony,imx471
> We tested the UW and Front cameras by hacking the IMX412 in our fork and
> they work as expected. Wide is a C-PHY sensor, so unfortunately we haven't
> tested it fully yet.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sm7325-nothing-spacewar: Add CAM fixed-regulators
      commit: 542b34247f3a5aeb4d094b21522803448005685a
[4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Enable camera EEPROMs
      commit: 588a6d006d640fde038d794bbf8db99a2cc2646f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

