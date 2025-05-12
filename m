Return-Path: <linux-i2c+bounces-10939-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C4EAB460B
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 23:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE50A18953DF
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 21:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56A3298CB7;
	Mon, 12 May 2025 21:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3ZZ5w5c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D48A2AEE1;
	Mon, 12 May 2025 21:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747084921; cv=none; b=Fd2UPvWk/NzxDE6hiLxTQ8I9W3NaF9CypyJaKGN5Gv5/bZCrAjwu3dESGHtapmNUfzlGdx3Cuh7GvmyGGrRslyzoAllVS/GaBoA0cmnD5PNhdervg+B+JS7f6XnK3Que971pyk8QcdfrL28lBzdB7Yw7LgYg1RgO4CfkHGKE3iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747084921; c=relaxed/simple;
	bh=aFYcDwYxXrLjIDCIgnPMduQEvVa991+JxlfnAmkMZbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBXGBNEJ+SF+fiwZzcFFzM0WNZQBGNFsNhwxQb7rsPHNH8WEmmsP6LtZXBjaLrWfzz7JisG9TlFuXAkL/pS/digwMab1FmSJ/H5eqy6UptzxcR4b6xbN/jShypNt0MbxnRToLRWzOsoyA1OGl/s4MbErKUIh+k5ADCWUCFS7L7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3ZZ5w5c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1944EC4CEE7;
	Mon, 12 May 2025 21:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747084920;
	bh=aFYcDwYxXrLjIDCIgnPMduQEvVa991+JxlfnAmkMZbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3ZZ5w5cHA2B336NXZh4FoaRl+FdmeJtSBYbt4pp3Tv7SIFI0B7Yz8au7yDFPZ51/
	 1R4LXgUzBO0OAqu/1Dqc5zVkqo15Qzh/kYoVbtpiMeV7C1LDp53W5k7nUCc+OUhlNh
	 HrK/B72mGkZko5InZEXAjc6yoqNWt9c7XNTghlZ9IrCWjtgfRH9+GrBrT29Y0m4X/S
	 XlVTAFahKkNf/qTZqibff9MDui4wQYEhgIhdt8H5F50B2BFu4NDTDb6Kz0Cg5nW5XM
	 I0V9GN6vJkez6x0k4KwkSLnfb04d7AYmcBR8ANa4hrDaMSprQsz3iMrRoku6ftGr/B
	 XvbhP7M9NPVJQ==
Date: Mon, 12 May 2025 23:21:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v2] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <ay6kzvpilixtbiki4z7splkvp3dukhocuxlpmawcrakzdrwedj@qmgb5aiv5ud7>
References: <20250509140949.56324-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509140949.56324-1-francesco@dolcini.it>

Hi Francesco,

On Fri, May 09, 2025 at 04:09:49PM +0200, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Rework the read and write code paths in the driver to support operation
> in atomic contexts. To achieve this, the driver must not rely on IRQs
> or perform any scheduling, e.g., via a sleep or schedule routine. Even
> jiffies do not advance in atomic contexts, so timeouts based on them
> are substituted with delays.
> 
> Implement atomic, sleep-free, and IRQ-less operation. This increases
> complexity but is necessary for atomic I2C transfers required by some
> hardware configurations, e.g., to trigger reboots on an external PMIC chip.
> 
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Reviewed-by: Carlos Song <carlos.song@nxp.com>

merged to i2c/i2c-host.

Thanks and thanks Carlos for your review!

Andi

