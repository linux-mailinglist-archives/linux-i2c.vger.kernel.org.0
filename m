Return-Path: <linux-i2c+bounces-8789-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEA89FDC3E
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 21:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 074237A13EE
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 20:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1072B197A6C;
	Sat, 28 Dec 2024 20:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4HxeW0e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3CD73446;
	Sat, 28 Dec 2024 20:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735419217; cv=none; b=gkdPMQliDcLoOEwyAh/GHH6hAr1REWOU6YLvlomk8JrY9Av1jY5oFEy3ViwXs/sSXcNGHGIbm+IkbRqNSJeORtURLywmrXeqoxB/WxzuQxtItguHUbs7QGB6qXyxP4RIDJw0wJX9Z0jU6eX9Rhs5Hr92KV/dpAoyTL7bx3vLwig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735419217; c=relaxed/simple;
	bh=YiQg+tSMTFVqdZrE2vLVBv2x7p3A1peNxFFdIKqfqGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UOaMQABZSVipoU1tgDo7Ofo4zz03Cd82eid71FMNqxVkhi87EypfbgLgB/WaU1iqKoug2jlmLyo0CXLny7FYZinHt/BuKT4Y2egf0/HIAeLj7qv1Nzt82ffzivFpsa6eWIswGEoxpdKnGaMj+NTiTAzLFdqCRIwH+wQv4SxaOu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4HxeW0e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB45C4CECD;
	Sat, 28 Dec 2024 20:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735419217;
	bh=YiQg+tSMTFVqdZrE2vLVBv2x7p3A1peNxFFdIKqfqGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j4HxeW0euO8plHUTonaif3pvstPZLW6W9fGDBaRWhEhQiTGrYQ5MFLgMoQBMJnPB7
	 uTwQRX0ilutRJFnSnhhbkkgRFwUlYD2f8SpEKkWp9WcKGFJiiudXCBehA5XPoCqBW3
	 gfPKkDQAMk7k3ethnGnooWzqTLQav60xINXzoNESr2dW8JtfdLvf/BT4qCa5OITqfr
	 yJffHW6WvHfPxzN3bZDKPa942v/PEhaogNpDepZMQml44ofTAYLDJFYw5bYtHLgaqx
	 DipexVUlwgqQjUf1na2LddDYdxtDJ8/3PaeuFeRg15Hop9NuVMKzp/sJnytyQv7JMQ
	 LKZfe7mdq4CwQ==
Date: Sat, 28 Dec 2024 21:53:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, aisheng.dong@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c: imx-lpi2c: fix build warning "function defined but
 not used"
Message-ID: <o4hxr2redr6dp4ot35pbc5vyjldiec6sxy72xesharhphsvdsm@mnufmvmpd2dm>
References: <20241228090852.2049321-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228090852.2049321-1-carlos.song@nxp.com>

Hi Carlos,

On Sat, Dec 28, 2024 at 05:08:52PM +0800, Carlos Song wrote:
> lpi2c_resume_noirq() and lpi2c_suspend_noirq() are defined but it maybe
> unused, so should add __maybe_unused to both functions to avoid build
> warning.
> 
> Fixes: fa89723f7a78 ("i2c: imx-lpi2c: add target mode support")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412280835.LRAV3z0g-lkp@intel.com/
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

yeah, I have different PM configuration to catch these kind of
error and I missed this.

Rather than applying a fix over a recent patch, I am going to
remove your original patch and ask you to send a v7 of your
"imx-lpi2c: add target mode support".

Is it OK with you?

Andi

