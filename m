Return-Path: <linux-i2c+bounces-3155-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DADEA8B26A3
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 18:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98EF62841F0
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 16:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6065714A0BC;
	Thu, 25 Apr 2024 16:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlKxe4EI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5FA2B9D9;
	Thu, 25 Apr 2024 16:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714063091; cv=none; b=kQe+Lytv/6RGKJN+SI8FuYMYwHWr/wlE+09czez5PhE1mjrqsdrYPD+k1TYO/fkuvoOMQgHUr2KW3znP3UrB1Baf7H2wsQjigg5A2FSc673s87e7Fz3CYAY1iUAuzmSqYu8qWsLbXCbvOQ58z4QtkpEK1e01nVYeB+EScYdkLTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714063091; c=relaxed/simple;
	bh=Hr42VLVkDSczruHp17DxXitKoNznJEPjrm7oGuJmEA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yg2TP6qmtlkMc0Hs+pFfbmx2ce4Ie5mNmYnN9KwZL8xGAT5SKukriZJBspE+myn0h/8beePBsQvGh42s4nqsUkOae5LXnzMhhN2SYYh23bppnh6fw/xIq/3p/yL+1X254vOxg+QBqod7BDOj5in5H0DhSn3+OruwVQvfxI/9j0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlKxe4EI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB88C113CC;
	Thu, 25 Apr 2024 16:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714063089;
	bh=Hr42VLVkDSczruHp17DxXitKoNznJEPjrm7oGuJmEA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OlKxe4EIHto/OHkpLtJHEIlErhfZL/nM6DCLpK/HCQdsvhJzEQRKyrcivpIL3EjeA
	 oZstCNFKKheT830H7KGKTXNqWAppl/AMr9Uo2aT4MlQhJA7nFF8HnirqJ1ujKrZOoa
	 UvSWrND5rG+r6S0LteWJn/KRd+ZTTmnrF5bt7wVBTABymal1tSoHv6sIOXVg1p/Io7
	 bMh4kO1cY/rVEnfO+teZ4qau2dIXfx1vxygOS6YI3ZYIzDgI4Fjs9eI10z4iv1Yq8+
	 VMarle5m3SnA6eN0tRlMz4t28OHNqpDAAU9TtiHZMVh35s6S/A1MK1VlniO5Bsq2Mg
	 jaKz6iwm6x0JA==
From: Conor Dooley <conor@kernel.org>
To: jszhang@kernel.org,
	guoren@kernel.org,
	wefu@redhat.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	miquel.raynal@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: Re: (subset) [PATCH 0/4] Add I2C support on TH1520
Date: Thu, 25 Apr 2024 17:37:36 +0100
Message-ID: <20240425-amplify-fedora-7a632dfddf62@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=801; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=bJxc87ZNEk362nkKg2nRaOFgtTkAl1SGbkD4frpyflQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlabedYs18IXejeeysgQ2bLY72N9iyXeqdyt/zSM3JPY bD8ufFJRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZiMpuRoSn+UliF38sVDzZL 3ztTf/TZvclJqvszzzyN0jpkr370/xRGho8GOf5Gz2bJO6xgybG9KrBnvYB1Q39Q7Y7ZTTf+BH1 N4gcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 25 Apr 2024 10:21:31 +0200, Thomas Bonnefille wrote:
> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> and a default configuration for the BeagleV-Ahead. It appears that the
> TH1520 I2C is already supported in the upstream kernel through the
> Synopsis Designware I2C adapter driver.
> As there is no clock driver for this board as of today, this patch
> series uses a fixed-clock named i2c_ic_clk.
> There is also no pinctrl driver yet so pinmux must be handled manually
> for now.
> It also fixes the order of the nodes in the device tree to comply with
> device-tree coding-style.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[2/4] riscv: boot: dts: thead: Fix node ordering in TH1520 device tree
      (no commit info)

I removed the "boot:" so b4 is probably confused.

Thanks,
Conor.

