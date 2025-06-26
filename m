Return-Path: <linux-i2c+bounces-11628-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64875AEA892
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 23:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35CA97A7519
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 21:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA7A24E4AF;
	Thu, 26 Jun 2025 21:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+hlhwPj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AAE5479B;
	Thu, 26 Jun 2025 21:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750972235; cv=none; b=INEgXvCCEe2qcmB+XQiiyQHBomUl8we3QbZ0WIctQweeJgp3YmHHxMIEEIRUOcWkt4XFp5HLys01I4kYk/xp/Vt1q3QqjJxkvm5ijka2Hbaj43O5xlT3nxUjp+oB0z1PDiUn5yqo3Oznu2X+ou1+IzEXH2B5o4b0ymPzQL5o0pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750972235; c=relaxed/simple;
	bh=2pVH4lCdwLTdq7UY0LCJQ6LUSrPucSQUm9GeMgpyRv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXeEYuZmp6uJiK6UyWEgxO53m59kTt7nNxjy9RtoK/4CcDR2KAK7XzNpLTTLO1O+ZvhLL0PR75u4jW0dTAMFBrjLUn5rsbJ9aolYv9QoWw5In6qiYyH+WYIX0KmETzM42ifiuiOHCb5NPCz2JUL3NOjHJpT5sfjH5uaqbK6wzV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+hlhwPj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC89C4CEEB;
	Thu, 26 Jun 2025 21:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750972234;
	bh=2pVH4lCdwLTdq7UY0LCJQ6LUSrPucSQUm9GeMgpyRv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+hlhwPjR5jNqudoQQnXqbRVXAKa99P9+841M9qjr8qCMsc7NFV0SoklmqxHn7cBa
	 8vmTt4m5pCqfSNQtoc0uQWEvTK4aosDgoZwliHHi9lmlaLCKrrIlDZjHEYT6FzgKBw
	 hhJhoZwQvzouiZ4t60TciyNviyhnCyzr9e9Tp9aUd/GiRSmbCDj1K8L+w296Ss/GUo
	 XsKIqPjJoLzda7hyaOkQTSHgtBFhoDxGDhBsN5vJmpgsxU1FTaaC6dCTr/NGyUQ1SA
	 YdYjhB/q3DZhQseTyr0CDGQEQjwUQ5eiNZW8eRWsd2ZOjF8OhRG/KEajOsWM1tTvMi
	 Z05tIi3KzCsrQ==
Date: Thu, 26 Jun 2025 23:10:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yongchao Jia <jyc0019@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v4 0/2] i2c: imx: guard and drop prefix
Message-ID: <5e2sd4nlwdcbutsxgosij3d45g2ngpzgn6jmn567pjdxsgwzee@gh6duqrxbex3>
References: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>

Hi Troy,

> Troy Mitchell (2):
>       i2c: imx: use guard to take spinlock

I merged this patch to i2c/i2c-host.

>       i2c: imx: drop master prefix

This patch has been already applied here:

614b1c3cbfb0 ("i2c: use inclusive callbacks in struct i2c_algorithm")

Thanks,
Andi

