Return-Path: <linux-i2c+bounces-2258-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 850818751B2
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 15:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 407D0283FC6
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 14:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CB312DDA1;
	Thu,  7 Mar 2024 14:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oohfYNUk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B8512D771
	for <linux-i2c@vger.kernel.org>; Thu,  7 Mar 2024 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709821353; cv=none; b=cqSAVDAB8pbAgHJH7t7TOkZP9eCh4gA1BAjkzmTWiRsqQpWfvoSd8cFRsL27LT9pkqbRiHwcfQ2TGMDROrGmCnZz6cMXX7cgv42c4ujwSIN55xtBpDlJNE71HszGM1ghhSD3A77eU8seZ3nA7fN7lO1D3XeFqjrYPjoU+WZNsHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709821353; c=relaxed/simple;
	bh=78iixeHzmRLUp+gHDrMH9RDBXNHjQgI1z13TFNdH31c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5RTvx6q0ZsXIRXv0xHDPWL0hIrTqxeDFg27Ahm8JV6jCM2pNnWmmG7/KDWfG3XGe3vOlJfAhYjwgeRW0yoZT6PdifA6024mJEwCP7jryTMU3CgQWK6oFk1H319DsARSdGSWgJQCKOTD0H02v1MnJoZklUaa+++C3DVJukioE18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oohfYNUk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A728C43399;
	Thu,  7 Mar 2024 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709821351;
	bh=78iixeHzmRLUp+gHDrMH9RDBXNHjQgI1z13TFNdH31c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oohfYNUkAPw7L1otyreNv/N52uwpSAhJEWwp5g7AgGVVECEhDs3cVmBeU5QiiHauC
	 tXbVjgGgHtnB9zIRYnBuu1K/90hH6vcsrOH2vAVKIvPF6AW2GPH6tnoldLWIsQ2QFo
	 3/ndvI3op1wb4GW4WsWnVAx297wRszWNNpF9dXDDMkAaJjHfbZfcHNl4+RYoA9casy
	 IAFiXzJ4qyV75By6i4zHfzhLwGnmxN3JSU3o5pQjpzxSm0jY2Fihg33CUx65N+OeYh
	 8iRn9C0J7TP7jb+TTQxmGhdiQ2HEfyD7Eb19h504BspqaaztnxZDdxMmktePAbOo/X
	 5C3Z0e0X8FVlA==
Date: Thu, 7 Mar 2024 15:22:27 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Wolfram Sang <wsa@kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: exynos5: Revert "i2c: exynos5: Init data before
 registering interrupt handler"
Message-ID: <gffyfmg2eouelnqfjbnjrnfi5i26xrkfmukikhflsl7o2cdwz4@pbmre3dyhsd4>
References: <20240307140427.1942235-1-andi.shyti@kernel.org>
 <3bd4acd3-630a-4315-bdaf-9ce0bc5eb6b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bd4acd3-630a-4315-bdaf-9ce0bc5eb6b4@linaro.org>

Hi Krzysztof,

On Thu, Mar 07, 2024 at 03:05:50PM +0100, Krzysztof Kozlowski wrote:
> On 07/03/2024 15:04, Andi Shyti wrote:
> > Marek hs reported that commit 51130d52b84c ("i2c: exynos5: Init
> > data before registering interrupt handler") is breaking things.
> > 
> > This is a regression and until we find out what happens this
> > should be reverted.
> 
> We know exactly what's wrong. This should have never been applied.

when you wrote me about the regression I hadn't read Marek's mail
yet but I rushed to prepare the revert in order to have the fix
asap first. I'm going to fix the commit quoting Marek:

"
i2c: exynos5: Revert "i2c: exynos5: Init data before registering interrupt handler"

Marek hs reported about commit 51130d52b84c ("i2c: exynos5: Init
data before registering interrupt handler"):

Just above exynos5_i2c_clr_pend_irq() the clocks have been
disabled, so any access to the i2c host registers will result in
freeze or external abort (depending on the soc/cpu).

To make things worse, this patch moved registering the interrupt
handler after the i2c_add_adapter() call. This means that all i2c
devices that will be probbed directly from i2c_add_adapter()
won't be able to access the i2c bus, as the host controller is
still not fully functional that time yet.

This breaks all Exynos5+ platforms.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reported-by: Markus Reichl <m.reichl@fivetechno.de>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
"

Thank you very much, Marek, for reporting this.

I prefer the revert not to break the i2c/i2c-host-fixes branch,
but if Wlfram prefers, I can remove it from the pull request
which I'm going to send tomorrow in the morning.

Can anyone please ack here?

And... Jesper, how did you test this patch?

Thanks,
Andi

> 
> Best regards,
> Krzysztof
> 

