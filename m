Return-Path: <linux-i2c+bounces-3421-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6379E8BCA2C
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 11:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEDC31F21A1C
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 09:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739961422A3;
	Mon,  6 May 2024 09:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5IX8YHr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F4E1420A5;
	Mon,  6 May 2024 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714986227; cv=none; b=NECro32HJD/COf9CWwRdUlU/qa5Z8CSzuccIt+FNJHBd6LdqX6ZcLtGPZcbhKS49RP6AtM/XCLPDRRCQyqpgJWW5WtG3nX9XD0CXor2Z9JulPLyReo71L/x6RIDczkQEXMv67nChQbPsWHUtvZws3E0V4s+10xjAc4fuMfoFyxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714986227; c=relaxed/simple;
	bh=yGvwfqxOwDtZIpQ45MQz3mBo8YyJF34tK5vAm9AJIlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2D+eyGN0+/+tf7wysnj/JdulUcRKMwqnTAMe/MFxWmcRml2Mc9z4xhW1uQnwW//kxPfjX6EMDBSQckviLfUTq347eRDgrxMqbFEwN+Sl9asa01s08pGD97UfDs/qrRO5PueTBAfBPXuGyBDlz/F/E6g/NVofgDR6GcznqPA3+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5IX8YHr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383E7C116B1;
	Mon,  6 May 2024 09:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714986226;
	bh=yGvwfqxOwDtZIpQ45MQz3mBo8YyJF34tK5vAm9AJIlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a5IX8YHrhAYtUZofX9g2jsWYgoGJ952Oyt4SgexdHc6vD3qfG+5XN9VhJtIhgOVpS
	 S2OL3QYT2PyT/COSBAQjcrSbD/mTPTuXN9RQnRuV3ybpyma0ps0yQe6pz/ddVWQ7Es
	 fLF6sybktOPCKIxCCUjzUEmmWLR7Zd3cPWo2lRyi0xmZn6DXHyG9+FvL9Cdee5Glf1
	 /JtS8OANkzrAcc0MbcjsTPWuui3Lb3CJPjKK42r22nGliL/ve4u70PNW7yw/HFbv6Y
	 DIieJTyREACH2naFCAU3oasvH7NQmnCmYMK6VlYH3AXKyV59A3JTfs37b48WETnqwc
	 w9R8D53FRp6jQ==
Date: Mon, 6 May 2024 11:03:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Ard Biesheuvel <ardb@kernel.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: synquacer: Fix an error handling path in
 synquacer_i2c_probe()
Message-ID: <z5qdyk2onwohenaclbflb7jlfn3wadafjpxsxzpvkmax75mpvg@vhhasuuutjzh>
References: <a0fdf90803ab44508aa07f9190af5e00272231df.1704545258.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0fdf90803ab44508aa07f9190af5e00272231df.1704545258.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

On Sat, Jan 06, 2024 at 01:48:24PM +0100, Christophe JAILLET wrote:
> If an error occurs after the clk_prepare_enable() call, it should be undone
> by a corresponding clk_disable_unprepare() call, as already done in the
> remove() function.
> 
> As devm_clk_get() is used, we can switch to devm_clk_get_enabled() to
> handle it automatically and fix the probe.
> 
> Update the remove() function accordingly and remove the now useless
> clk_disable_unprepare() call.
> 
> Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C controller")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to i2c/i2c-host-fixes.

Thanks,
Andi

