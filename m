Return-Path: <linux-i2c+bounces-12221-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8F0B1FBAF
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 20:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC0ED3BA804
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 18:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B20B27466E;
	Sun, 10 Aug 2025 18:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlWFNxs6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F51F18C933;
	Sun, 10 Aug 2025 18:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754850372; cv=none; b=c4fiWFwV1ugf143Jml1jPQmMGHMD40xfooM9gcNH3ktMBlYs78W+WbrlIbdyCOWfPy0fdCQDocwOadRYDl3qDPneWHf7RkLr1S4BBJER4FUUBuxoY0extIWGY/A+B4fx7NNMumF637e6hQdynW0J7db5kBe4Znk1kGoO7L6PHJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754850372; c=relaxed/simple;
	bh=2zwGXhwxWi13w4nSYysw2oa5FejZxpDZAD0f4uYQPXw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mmlO7PNTpDrEcEVYbbmMoePm3MVV7Apz5KTit3ZeYzTKDSIiaB16cbnk5tKi3sEZ4/hjCnvQuoCMFfinwhqrrBNYXkL/z0nZeQv4wdXCXjBialTgVTvCgdLGfQE5SlKivUXH9MgeHqtMp/qOu1TSrNNOpyF2fnHO2g3rpTxL0kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlWFNxs6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC488C4CEEB;
	Sun, 10 Aug 2025 18:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754850372;
	bh=2zwGXhwxWi13w4nSYysw2oa5FejZxpDZAD0f4uYQPXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GlWFNxs6lw9T8Gm49EYpEh52ouUPv13/JA/4lmKZ0BB3cac3L15n1SHc4SwYbHI0r
	 dHxxLcPZfYjeymneVBx2ztn6zZazuFq3i+oo/KhOQGBnvAp9V+4UlpP0uvwRsVNhxW
	 iIT0K6hkQ/NI+xjGhXTHrZYUIDrh7g8I2Xv4aTPu7gyifTMHiqfgVBg3ekE3H4Z13b
	 Qxbj3eSZkw2hEK6JeAvUaRUpVUB56JhZ6Aqnm1MJ23OKSPDNehs58amTM4uxlilEUz
	 f5tpirlHuI8KQqxSlXnd9RssLF/yW6IqVsGTqKCC1zUuyJ3Lalk+cOtj8QPIL9Bcpu
	 pAp9RUuBCAnjA==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/9] I2C dt nodes and bindings for Apple A7-A11 SoCs
Date: Sun, 10 Aug 2025 20:26:01 +0200
Message-Id: <175485029275.49938.2043201584717247270.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 10 Jun 2025 21:45:19 +0800, Nick Chan wrote:
> This series adds the device tree nodes and bindings for I2C on Apple A7-A11
> SoCs, since the existing driver appears to be compatible. The drivers for the
> attached Dialog DA2xxx PMIC will be in a future patch series.
> 
> 

Applied to local tree (apple-soc/dt-6.18), thanks!

[2/9] arm64: dts: apple: s5l8960x: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/68e01988b208
[3/9] arm64: dts: apple: t7000: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/5b1ab37ccc60
[4/9] arm64: dts: apple: t7001: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/a56771d333ed
[5/9] arm64: dts: apple: s800-0-3: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/5bee6cb9d9df
[6/9] arm64: dts: apple: s8001: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/baf703b08374
[7/9] arm64: dts: apple: t8010: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/9f286293541e
[8/9] arm64: dts: apple: t8011: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/1d16ae50cb1b
[9/9] arm64: dts: apple: t8015: Add I2C nodes
      https://github.com/AsahiLinux/linux/commit/e1313c2185d2

Best regards,
-- 
Sven Peter <sven@kernel.org>


