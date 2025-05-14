Return-Path: <linux-i2c+bounces-10988-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B51AB6F6F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 17:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20117189D3A7
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 15:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0196F28153C;
	Wed, 14 May 2025 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDl1Eynw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A86B28136B;
	Wed, 14 May 2025 15:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235679; cv=none; b=HPSy+yNcljVuSa58+Tj7yrZ7QcxNL8U2qt9kHF9KwHtQOc8u5d96l3tKMk9jHo2sf73mjRgqD/CwK3YnEBZBSJf2gomtYZmoylTybTp6BaDLqi+UO8XRw1fVE0OCxyO/QtFMcr8PHquNle4jHCVN9aBCLm+v7vYqFM+sAgyqD1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235679; c=relaxed/simple;
	bh=Y+K0CTNazLFlZpMgylFelX29INIzg+H1k2D8sZ3bDcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZ5AhcclKpVdFscczBQO1I7LNAGMYQykQ9X2oWQET/IsGMbcWknrU8rIHEJejOL6Y0B+THHQhkmLO/nvaV/OTt9TAc1xLkly4h2Jkls4Cy4kpAcoEcTcwFUpXpURdqMIbu5S9EMxSZdOKdNMl+j0NKvvlGCwW0oGMVWmWSa324Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDl1Eynw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92A1C4CEE3;
	Wed, 14 May 2025 15:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235679;
	bh=Y+K0CTNazLFlZpMgylFelX29INIzg+H1k2D8sZ3bDcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eDl1EynwApjePrzqmYaRrqbwX6nnm/wMyxORcRzAaGmYbRq3J0exTHedYZIokVLqx
	 p3FqD3hdkB3pXgRwqpPPfEDXe+oFlCu5Klz4JiyjsaBu6H98BFH4UmWuA1ohiNLgvm
	 D75u7YH/Wt6zY/mw4npsQHfHbMORIsPkRvEewfK//AZ22J7moOPWUTZxbZHHGivW8l
	 VCYOdmCjMUwCvDDYZFxLVWE/7mgOVY2EQfEgIp8pcedDFCMY6CRPvM3qZLQedePs8o
	 EOu+b5IqY0/YFHMNOmtH/ISof9ldZevBTgNSwY8uJsT/4rgbR5/x/QdMDvNIPFV8E8
	 HM6KjfqQKg9/Q==
Date: Wed, 14 May 2025 17:14:32 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <tds5osuthulo4bnlck6dgx3g3aoanca3my2uczdhcipcfcxgpp@opzseflynjar>
References: <20250319145114.50771-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145114.50771-1-francesco@dolcini.it>

Hi Francesco and Emanuele,

On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
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

this patch is causing a build regression. I'm going to revert it,
please check the test report that has been reported and you are
cc'ed.

Andi

