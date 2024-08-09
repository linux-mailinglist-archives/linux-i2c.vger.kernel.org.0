Return-Path: <linux-i2c+bounces-5232-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8D294C784
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 02:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CAA01C21DAB
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 00:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026E31FB4;
	Fri,  9 Aug 2024 00:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQjF6ADL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BA61FA4
	for <linux-i2c@vger.kernel.org>; Fri,  9 Aug 2024 00:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723162342; cv=none; b=R0ChXd7vgUuY7YCjEQEeZ8MUqu1/4X3Kusr7B1pFzwYxP7HRoCMXzl6lgMDYtJ4qN/GE+PZFom68YwEkJ2YNxSojuO8uKs+Fg0j9CHDwOG5+0GcihbUMUP2Q4rdec8QMHHtVJ4DjQ2TCPnS6QkH2yiGN/hd/CeiJQjnAcXtSy7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723162342; c=relaxed/simple;
	bh=2L2nn5UDsr1UOSrf67N2pzoB7nNP/ucBSTLYNqjeppQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYQtdr6h/xyK/o5nPeS+42bvrInO2j9b9Y8AX4+V06L07lgSm7gSmV5ZGUZ7lvwcI85fKBx2b+VLGgw2pvJDLePxSm8CUQkfX8l3dEgP5CKFxlSIASXtV5xKWbn2RGKTA7cGsZwqPyBAcjvcPmEMyda0G59RTLi4BU719BJed8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQjF6ADL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE499C32782;
	Fri,  9 Aug 2024 00:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723162342;
	bh=2L2nn5UDsr1UOSrf67N2pzoB7nNP/ucBSTLYNqjeppQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oQjF6ADLu9UNKT2v64LoS/EwquB3Ga54LNXh4kU1QssU0nKallxivMPDZt0Doc3j6
	 zbfRkH5npx5S/2onPy6LhmV53qcDJijWajOkkZDcal0RhVn0exgghhVKuv/z6F2tSa
	 9xvfc2JzNTLaF9dHcOpC+yeQiCY7ZnVa9MLAJtxyGu+8LnYQLcgJp0D7Z3T0PYgINh
	 QnqdubQrkfT9G0xUx3lXfIeu6gYmDJsm0LaQRzzMbP+RVfYgOC+FBPhU0lNXSyYCgb
	 FCqmOswTZHGrH+8w/ps4X0Y3OoLEnaEGKfepoQjMAdLw9yS++aPtpmDfG4mOAFKsez
	 AFIwS/tqs2HGQ==
Date: Fri, 9 Aug 2024 01:12:16 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: o.rempel@pengutronix.de, linux-i2c@vger.kernel.org, 
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] i2c: imx: Switch to RUNTIME_PM_OPS()
Message-ID: <uv6v2pgsbkptg3msrcysyrflxpca4lnadj67je3yfej4csjogd@lffjmbneurkk>
References: <20240807181456.78760-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807181456.78760-1-festevam@gmail.com>

Hi Fabio,

On Wed, Aug 07, 2024 at 03:14:56PM GMT, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Replace SET_RUNTIME_PM_OPS() with its modern RUNTIME_PM_OPS()
> alternative.
> 
> The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
> compiler to evaluate if the runtime suspend/resume() functions
> are used at build time or are simply dead code.
> 
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

pushed to i2c/i2c-host.

Thanks,
Andi

