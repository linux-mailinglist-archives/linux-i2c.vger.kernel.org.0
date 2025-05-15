Return-Path: <linux-i2c+bounces-10994-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C14AB8517
	for <lists+linux-i2c@lfdr.de>; Thu, 15 May 2025 13:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 999531B61704
	for <lists+linux-i2c@lfdr.de>; Thu, 15 May 2025 11:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDBA12980B7;
	Thu, 15 May 2025 11:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnOivIrM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4923819;
	Thu, 15 May 2025 11:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747309251; cv=none; b=LGrxeKB5PSjSwigjkhCK2C1oG1wMpPaCB/1OwdlwsapVH2ViDnEuYccPkpiULAtQMon8uxxb9zfwPYuAemJA3z0Kmt6i3Pzpdawr+xLm08WYSVy6DYU0QxSsmuD6vFHZkKpppwiIfBJghhF9/C8oRrljFIoBSK3e2IEVaFeNYAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747309251; c=relaxed/simple;
	bh=AtLrKuyB/2mv1b3YAJljBOxYlY0Y4WwepVYWImQje1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jal3KKph9jtrNQRweYiKraNGrPYkhK1xa+n96y9K+VjAJUMEISrmTHGl3fgfhwNz5CPyb0fF5YN83gKGzlMAdHBqxgG+n8VSC/9ZDwZC8652l/0dwllkDJGzsb0U8ZAIl5E7WF+IL6jTVkdHEnQhM1FfljBfIDifMuVZfPwuQUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnOivIrM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D59C4CEE7;
	Thu, 15 May 2025 11:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747309251;
	bh=AtLrKuyB/2mv1b3YAJljBOxYlY0Y4WwepVYWImQje1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnOivIrMpnQgHRo/eEvXMJRZ6zFtOo1KqVTzjuYabmi1wOzGb6TFo2fxKlbCKAFDc
	 Qdm7ri21X1blh4QyzFqFK5p+92yj+TEs9UNZa0/Uy/65s6S0nBkG1zBPMorZq/Wkg2
	 XbUsf+fHGIX6dQJG7x1ZW1Chr9XEFTFG99ZyYexGRMvIqP2EcK3bdZXrhIji4OJ3Vz
	 J82Xb8iQ1D5wAhTjJhcWs6FKCRK4yXLbALX9lF4f0cn37h2k4rfJlpVYZYcijpwFnK
	 3EcakqZvpDzlKNDB4hy4QQcL/X6hfMqBvNND5fXbFJN/oiMM8q3t9g8jLj/dZokUv6
	 wqjbfkQfssTYA==
Date: Thu, 15 May 2025 13:40:44 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <lqspn72kegy6b7rrpefbajvomcefs3d764ndtwescwhg7jz6bx@hhu4gzkcms62>
References: <20250319145114.50771-1-francesco@dolcini.it>
 <tds5osuthulo4bnlck6dgx3g3aoanca3my2uczdhcipcfcxgpp@opzseflynjar>
 <3C1EEBEB-E691-4EB7-A008-A1FE9CEE7238@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3C1EEBEB-E691-4EB7-A008-A1FE9CEE7238@dolcini.it>

Hi Francesco,

On Wed, May 14, 2025 at 05:51:27PM +0200, Francesco Dolcini wrote:
> Il 14 maggio 2025 17:14:32 CEST, Andi Shyti <andi.shyti@kernel.org> ha scritto:
> >On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
> >> Rework the read and write code paths in the driver to support operation
> >> in atomic contexts. To achieve this, the driver must not rely on IRQs
> >> or perform any scheduling, e.g., via a sleep or schedule routine. Even
> >> jiffies do not advance in atomic contexts, so timeouts based on them
> >> are substituted with delays.
> >> 
> >> Implement atomic, sleep-free, and IRQ-less operation. This increases
> >> complexity but is necessary for atomic I2C transfers required by some
> >> hardware configurations, e.g., to trigger reboots on an external PMIC chip.
> >> 
> >> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> >> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> >this patch is causing a build regression. I'm going to revert it,
> >please check the test report that has been reported and you are
> >cc'ed.
> 
> I am looking at it, it's a warning with W=1, not a build error.
> I would not revert this patch, just wait for a follow up patch
> or comment that will address that warning.

please send a v2 already fixed I don't want to keep a regression
even if it's a small warning.

We still have time until the merge window and this patch is
already reviewed by Carlos.

Thanks,
Andi

