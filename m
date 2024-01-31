Return-Path: <linux-i2c+bounces-1546-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF23843314
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 03:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0031C1F2787F
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 02:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF02E5221;
	Wed, 31 Jan 2024 02:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDXBxBQf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4045226;
	Wed, 31 Jan 2024 02:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706666426; cv=none; b=HRk97dumHq6CDjC1m+1ESv2+sW5OeybFZX3j4k/D0+6A0qqPfx2uoOz0hDQDz/K/Ngz7abhDHY6EKjT2nTh73MSGtwzLCrDBWHV+BBGb7AzKLAlrfdEQ7JWAmT7/IRI3jtmXHUlul8wnvrIXJpfRI4Yvd6uno46DOpP3krsu1pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706666426; c=relaxed/simple;
	bh=K7tOJo64O5pvBYbotIkcoCqboHJHVg54FtiejNKpCYs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WrEWA7mo7M47/Ndd+EWSTZu2SgFOKRKMRvcpgISoT8avMUKIwA/pMCYoV1MzZGYb/meq561tXRETbcn6QSrEWVti5Ld5WvEpvknWf6Tnzyj1OvnszkgID02aVyFhuJAyZW7wvDef9E74Iokabx+k5YbfMgdMwxJANk4I2djURMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDXBxBQf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41098C433C7;
	Wed, 31 Jan 2024 02:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706666426;
	bh=K7tOJo64O5pvBYbotIkcoCqboHJHVg54FtiejNKpCYs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eDXBxBQfYShaK3XZUWhY0Y+KCeT0Yohy/OzaY3oH3KVa25qOr7Cdf/kT9uze1bsWk
	 +Vgh7qwxIr9vVs+dsprsPKhM5kwwYzOoxA3rmihPF3XVYRvxRzcmWRILsEQkuf451f
	 VDp/h/nQv5l45I2rTndztQqSJjvypD6Njf5MKSwhX3E+hzdkk9f1EqFKHRqiIjHcJs
	 8+S4+Xf66JFtE7KkOYBQ4VvGHxjau6xu6VCkf6iB6bxZB6EP0CPz8U+XByWkCCkmmW
	 02cPlqAH2x491QK+FmXjaW0WgFPoCnvkq3OXEwaNnARrZQXa5rOB1vuVFhHOYHNwDZ
	 XebD+05RCbSHA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 248C0C395FE;
	Wed, 31 Jan 2024 02:00:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] mlxsw: remove I2C_CLASS_HWMON from drivers w/o
 detect and address_list
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170666642614.31142.11271705375637726130.git-patchwork-notify@kernel.org>
Date: Wed, 31 Jan 2024 02:00:26 +0000
References: <77b5ab8e-20f2-4310-bd89-57db99e2f53b@gmail.com>
In-Reply-To: <77b5ab8e-20f2-4310-bd89-57db99e2f53b@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: idosch@nvidia.com, petrm@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-i2c@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 27 Jan 2024 16:08:18 +0100 you wrote:
> Class-based I2C probing requires detect() and address_list to be
> set in the I2C client driver, see checks in i2c_detect().
> It's misleading to declare I2C_CLASS_HWMON support if this
> precondition isn't met.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net-next] mlxsw: remove I2C_CLASS_HWMON from drivers w/o detect and address_list
    https://git.kernel.org/netdev/net-next/c/ccf1445204a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



