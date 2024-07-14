Return-Path: <linux-i2c+bounces-4980-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAF9930827
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jul 2024 02:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A9B1282650
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jul 2024 00:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D4BBA47;
	Sun, 14 Jul 2024 00:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FiG2RHHl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E0D18D;
	Sun, 14 Jul 2024 00:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720915231; cv=none; b=pd1ABvhGCRAxy5CyR6lGJ9zax6aTt8bH5edganCfTs/wVTOQ37TYC6M3oKnXzoZZ3AUOLvCGSh7u2Fcnlk0ow5JS1IWyDFGIIE5qgetbYQ6eHD9ruF8gnXT0oQWBhycgcyYchmR8Yp6e9HBH9DiL/ka9SMR1I7upYHomui+C0S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720915231; c=relaxed/simple;
	bh=koxBQfDdErp+l4IfuBnt4utYBLuPlb0fF2ASoCAI0P0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rqiKNaYZ6h1M98apK0cDjlfVMKaWbfyzU1RY/rPyKV8IS2kcpdkK8iJCNfmZWBlWp1ai4jx1SCDwC5BAagePQZOvFuoj6YGLa8kMjTbDmOOHL2Qe+dtTVSvX4At6j/VBHaUtK7Nom36JSRpw5cpq6+iXyjHPM7L86ZdfszNVM7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FiG2RHHl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AEA5C4AF0C;
	Sun, 14 Jul 2024 00:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720915230;
	bh=koxBQfDdErp+l4IfuBnt4utYBLuPlb0fF2ASoCAI0P0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FiG2RHHlMvcJaZjKCBDpDiMsetCw9E/qUeKLPVU0sXDdFvrB1xY0J0V51Rp8cAq/x
	 k2ul5AifAEZFWcQgFQmBAVKoM/JYHzzJONSDQN3hdo0SPW7HpI2bg1uvkd8GCIHhvj
	 2TKj4Nq0BptJLHcDmfFSv6legeRA4GYlkvhgDKYTJoF7xIudHFnyeLLMN+Jn3DlStR
	 ho9JTKPY942+WdIrl7wgk2K+6mXFAuVuPYaTZTPLjCs04l/MnGOm51tkZSEcUadMGc
	 EJbo7gX8SOptQm4vyUBo7M2zGFJQXPt45hxUYi7auiXKCEn0SZk2Kznu3DwM3iq01S
	 PZzTAImVTY8ew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6152ADAE961;
	Sun, 14 Jul 2024 00:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 4/6] sfc: falcon: Make I2C terminology more inclusive
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172091523039.919.13223034713999192575.git-patchwork-notify@kernel.org>
Date: Sun, 14 Jul 2024 00:00:30 +0000
References: <20240711052734.1273652-5-eahariha@linux.microsoft.com>
In-Reply-To: <20240711052734.1273652-5-eahariha@linux.microsoft.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: ecree.xilinx@gmail.com, habetsm.xilinx@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-net-drivers@amd.com,
 linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com,
 andi.shyti@linux.intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-fbdev@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 11 Jul 2024 05:27:32 +0000 you wrote:
> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> with more appropriate terms. Inspired by Wolfram's series to fix drivers/i2c/,
> fix the terminology for users of I2C_ALGOBIT bitbanging interface, now that
> the approved verbiage exists in the specification.
> 
> Reviewed-by: Martin Habets <habetsm.xilinx@gmail.com>
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> 
> [...]

Here is the summary with links:
  - [v4,4/6] sfc: falcon: Make I2C terminology more inclusive
    https://git.kernel.org/netdev/net-next/c/ba88b47816a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



