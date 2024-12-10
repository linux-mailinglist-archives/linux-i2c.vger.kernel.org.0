Return-Path: <linux-i2c+bounces-8431-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2019EB9BA
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 20:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EF4D1885C91
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 19:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492F321420B;
	Tue, 10 Dec 2024 18:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGIBTn3w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048F1214200;
	Tue, 10 Dec 2024 18:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733857199; cv=none; b=X1lZNVs7h8pWp5gXu7Smgj+vfU1UUqhOBPHOcDf1YwbfTK6Qfc46DxjS8zlx/fP4mnAAkBygIb34mgiJ4YLs3SJAR8SQKyQaUPkFMDtbgFMqSGz0A0DV1q2e7fu08FAVap+WdsKXs9asuG0BkBUlNuxMjJpIGrxERi+75KS0QmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733857199; c=relaxed/simple;
	bh=2NRBUcwP6ADVM9R7gTZwPbbRPE94lPjt0cZuUUXJ6GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKHctoRo9KJMsaVJL3P/M1zoqDowWrQuAxft87r6HQeHqlVtVlt30L1w7XFvLcDb3f4I2rIzlmoaB/PDVTQjLTpVBVnBE864rOBVSiRH/jJgcwkcGYP1wqEI9+8opdnDG3AI32FxsHeFOzDvRaPJf06/rR+WEEEp+kACMHEOOAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGIBTn3w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04288C4CEE2;
	Tue, 10 Dec 2024 18:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733857198;
	bh=2NRBUcwP6ADVM9R7gTZwPbbRPE94lPjt0cZuUUXJ6GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YGIBTn3wtYjyRu94EIEgV+ps+3x1ocKtGE0nwB9UMNSC1/dfPJv0NZUvdpeTDIuOm
	 DYkr4BOfikTdT0TnCKjNFEPvhSIRJXiUMgjeC0/MkjsA9nBpouepqWLgAtuqjMxyjn
	 FnX5zer9cyr9SnkRAXrQX2xcpP84IqzIokThXor0926VT/qof9GuqTyIoajI+yeZEd
	 TYEJLEtN9mHP+mifcy+FgxN9Qq7jVTUvXSPAsath9fKYoqY3JYL3poJFV7eGK2ATux
	 B1Gmj1owed+dKcG3Sa4KidGm1uGB13WCB7jk96RG7e1PHASKXH3Hgx8qfNZUa/dpTk
	 Ec5cE9GpPvNxA==
Date: Tue, 10 Dec 2024 19:59:54 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: nomadik: Add missing sentinel to match table
Message-ID: <6gfa3lvgmdqsr4kjaojphlxiu6soxiri7xjcttdpljcd5btbl3@xboan7zamrfp>
References: <34b6ee90437fe19526d9388f2f304d175596cb1f.1733473582.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34b6ee90437fe19526d9388f2f304d175596cb1f.1733473582.git.geert+renesas@glider.be>

Hi Geert,

On Fri, Dec 06, 2024 at 09:28:06AM +0100, Geert Uytterhoeven wrote:
> The OF match table is not NULL-terminated.
> Fix this by adding a sentinel to nmk_i2c_eyeq_match_table[].
> 
> Fixes: a0d15cc47f29be6d ("i2c: nomadik: switch from of_device_is_compatible() to of_match_device()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

