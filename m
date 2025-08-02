Return-Path: <linux-i2c+bounces-12110-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C33BB189C6
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 02:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC84F5A0290
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 00:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F117F367;
	Sat,  2 Aug 2025 00:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVTA83cf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A333E4A28;
	Sat,  2 Aug 2025 00:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754093637; cv=none; b=TFXzDRwwWnXgDf6rA9dCV8UIweQbx2gWp25K3kbuJBxgFF3UvTDH04EHe31A2z673t7ZQYshYrLCiOz0CObUyaRLiQOKaNtD91g6CfJx0GYaK52iz0U9W0qmitgFo68zyV5mPIcs9EZzC4rlHpRO39OF83BqvkF85qLO3Zvq4go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754093637; c=relaxed/simple;
	bh=chRdwITcytwXEaLXV8FtUw0oKyNhtxp8XDO5cKD3phw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DyIbLuZt/6jF4JAWoT//3esRHiBnkQnkblCkTrWGWWYHykKRPd/BiUOKF0BTPhhqSIdSwtfy/hxrZu3asTZi7THZCVuQpuBX6gnK9fevNGJ5TUyJktCVlV8VVlh6S17DCxb6Pojlxv5g/qGkr1ZWIOHAkpIDyTYta6YlYVd13wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVTA83cf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3298FC4CEF8;
	Sat,  2 Aug 2025 00:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754093637;
	bh=chRdwITcytwXEaLXV8FtUw0oKyNhtxp8XDO5cKD3phw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LVTA83cfobIyLFRCK2+1QLUDhYwXCsj9WwoR9zh1kYbTSqBdEyY2t5p+85bVqKDWj
	 EwsTpcBTdc3hD9NAaYLA4edDJKMM/uH9OHurDyyQZ1lAWFNupoab258z1o8kHvqgwC
	 i1ey+xROc6WXmPTGbBviB9+zm04KKYpG085cQ4HE5kcdL5xdf8AJzXWTA6icpMLAfz
	 62b9Jl8H66I+4zEpeheB+4suzGBKkqJeHV8+INlflQ9uB1D3Lbhyu6OGcQNwfK0JJ6
	 QO+MkhqpUuS0KqagSfNO2LhzzztRpeuUk8POzwRKq5jbgtSbe/krbLDEqzc1E3W2rF
	 BHZdC2n+0o5UA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD16383BF56;
	Sat,  2 Aug 2025 00:14:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dpll: Make ZL3073X invisible
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175409365249.4093813.14032905204294437624.git-patchwork-notify@kernel.org>
Date: Sat, 02 Aug 2025 00:14:12 +0000
References: 
 <97804163aeb262f0e0706d00c29d9bb751844454.1753874405.git.geert+renesas@glider.be>
In-Reply-To: 
 <97804163aeb262f0e0706d00c29d9bb751844454.1753874405.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: ivecera@redhat.com, Prathosh.Satish@microchip.com, jiri@resnulli.us,
 kuba@kernel.org, conor.dooley@microchip.com, netdev@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 30 Jul 2025 13:23:32 +0200 you wrote:
> Currently, the user is always asked about the Microchip Azurite
> DPLL/PTP/SyncE core driver, even when I2C and SPI are disabled, and thus
> the driver cannot be used at all.
> 
> Fix this by making the Kconfig symbol for the core driver invisible
> (unless compile-testing), and selecting it by the bus glue sub-drivers.
> Drop the modular defaults, as drivers should not default to enabled.
> 
> [...]

Here is the summary with links:
  - dpll: Make ZL3073X invisible
    https://git.kernel.org/netdev/net/c/a4f0866e3dbb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



