Return-Path: <linux-i2c+bounces-14659-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8E0CCF923
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 12:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F4263032E65
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 11:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0140930FF04;
	Fri, 19 Dec 2025 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uhboe+vq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B8D31197A;
	Fri, 19 Dec 2025 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766143601; cv=none; b=h3/m8Xwsbf+y5E34fFusQOLDhl2IdUMvAZJt9sFw0z2STHc4o72+NQwiBrZ7HPVqn3M+BuvA3NPgOLjoVuAdOGAjjgzX92hknyhicpXkFOu8HZqD+/+/T5TDzZnI4onWHM9TGE3mpbAJmq2yYQyh1XYWSgoiHxOPw4dxPBNHOAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766143601; c=relaxed/simple;
	bh=emCDmsE3rurjfQPDmhdnWGfjUOSO12N/ORlhonGNo20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCQ1/VoE09rA2mIoJTwFElrQqZu/u9C57fXRn/N7Ds0kZz9tkWVmdBCw0E3KUV9uhfcjustPhRRwWpEfsFsX7B/j2RHRVMEkhgCHa/2T4QNDjNkVACETaz78BSZEF5tysZp+ILZDf3+qzkBZS9r1j0JyPO2BoV9+wBwDVQe6Pfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uhboe+vq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44492C116C6;
	Fri, 19 Dec 2025 11:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766143601;
	bh=emCDmsE3rurjfQPDmhdnWGfjUOSO12N/ORlhonGNo20=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=Uhboe+vqiisKPjFv6ErbJkTs47pFlFEKevXBD2LojW0gPHaQO1TTcsMF41eHsFJSs
	 7dkcSHjrzC0C4kxI7AafLr95Q2H9QXR/iR2630QyiRnaHmEmaNzVLW4FdLMQ+uq3Jn
	 OVoAmYuSsLD5JsdqkmPwRyxRgoqCT4NCeKdhpgpj0A1kwg60A/XkmaExRKBqXDnyXy
	 6JRP3uuRrQZhEGCz2HlA5dJci8wWDrPr+JIYx/z82R7urzc4ymXBIkWWWwgNc28vpW
	 IK2+GIV1/WFBMAV4vuDH/D+f+svrmo1k/Jf1YlIU0C93UeoxgVgiKGtIEfI3eCy/ja
	 R4uC+abCEUFVA==
Date: Fri, 19 Dec 2025 11:26:34 +0000
From: Lee Jones <lee@kernel.org>
To: patchwork-bot+linux-riscv@kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@kernel.org
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, dlan@gentoo.org,
	elder@riscstar.com, andi.shyti@kernel.org,
	alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
	broonie@kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
Message-ID: <20251219112634.GJ9275@google.com>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <176613181654.3684357.18070317581817603415.git-patchwork-notify@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176613181654.3684357.18070317581817603415.git-patchwork-notify@kernel.org>

Hi Konstantin,

> This series was applied to riscv/linux.git (fixes)
> by Alexandre Belloni <alexandre.belloni@bootlin.com>:
> 
> On Tue, 18 Nov 2025 14:08:04 +0800 you wrote:
> > Since P1 Kconfig directly selects K1_I2C, after the I2C ILCR patch was
> > merged, the driver would fail [1] when COMMON_CLK was not selected.
> > 
> > This series fixes the P1 Kconfig and resends the I2C ILCR patch(This
> > patch has reverted by maintainer [2]).
> > 
> > Now, P1 Kconfig patch has been merged[3], so I2C ILCR patch can be
> > merged as well.
> > 
> > [...]
> 
> Here is the summary with links:
>   - [v3,1/4] i2c: spacemit: configure ILCR for accurate SCL frequency
>     (no matching commit)
>   - [v3,2/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
>     https://git.kernel.org/riscv/c/16bd954c9336
>   - [v3,3/4] regulator: spacemit: MFD_SPACEMIT_P1 as dependencies
>     (no matching commit)

>   - [v3,4/4] mfd: simple-mfd-i2c: add default value
>     (no matching commit)

I was just about to send another snot-o-gram about people picking up
patches without the correct Acks, but I just realised this is the same
Patchwork issue we spoke about a couple of weeks ago.

This formatting is very confusing, since at first blush it looks as
though the whole patch-set was applied.

Please can we only list patches that were merged?

-- 
Lee Jones [李琼斯]

