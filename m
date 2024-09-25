Return-Path: <linux-i2c+bounces-6994-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACFA98610E
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 16:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15B9F288D83
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 14:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEA2187FF6;
	Wed, 25 Sep 2024 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTsQjfi4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0A4188011;
	Wed, 25 Sep 2024 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727272365; cv=none; b=kHHyvk4Tp4mJqkECWEapnJZd9x71pSzS6opJws9tKTdDoMUXej4hLUdkOoKrBbdgxJWvtdOxC8dzD6pmqWnKU60T+D/nXMs5d32mO5bl3y5Sco6WIN5qyt2Yu4OAx/bNoGyzoAR+BS07BekeoDpR3LIcaWeZkiKl+TJ2aI9lxDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727272365; c=relaxed/simple;
	bh=szWYh/k8Wut3JQcCumvWA+GxufyWMJx3lS3HCro3hVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKJxiO8O8APa7AV6rt2BXkZr2kOe3ZDkIim1eij3DV/C7t8Wj5oBl+g+jRvy9rDFpzeYI0lV0sSEnpk6vrp+p+EfZdbsi9pFNvMFvHVbfcXi8Fs75N5556PJUgEnUCui/EKx5A66W4Bssv96OZwHUrK9AZAbsZY7qnq6x//V2sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTsQjfi4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62561C4CEC3;
	Wed, 25 Sep 2024 13:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727272365;
	bh=szWYh/k8Wut3JQcCumvWA+GxufyWMJx3lS3HCro3hVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YTsQjfi43RkygNFBoYyx8OSG3TurslCGQjHiy7nBJZYORF1+akf4Z0bCNlbFzmS4z
	 2uj0Tz/1HgFFJJdMWvsP+Klyu3R4dlkEg8/tOXrdLsRRcGEbOxZWca+E5cQRBrzLXN
	 WJoOTkJTqXN2DgslObyMai3Yef5b801FRt++7qAtvAYLCAML2oKoXLXuvnVnsPY4m2
	 0VTxmS0Wrby0mrxicDRlkAubdUMphe7QyOZ5ucAb68i89GgGc3X7GNt5elggPvqm+r
	 X6nVJRpY6+9hJ21ergM40niMC6ipgNaIZTqngoPblqbJ4PSazdcZACfz4sqUyGohp2
	 vEh2kHAXPaang==
Date: Wed, 25 Sep 2024 15:52:41 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Gerhard Engleder <eg@keba.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: I2C_KEBA should depend on KEBA_CP500
Message-ID: <7zmfqcadn45biuk5p2dd3tf6ccgj54n3bjb4j454n3cyjud6wa@ahcevypnprqh>
References: <39a6ce50b152c8e435c78825ab56aa714b54fce8.1727170404.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39a6ce50b152c8e435c78825ab56aa714b54fce8.1727170404.git.geert+renesas@glider.be>

Hi Geert,

On Tue, Sep 24, 2024 at 11:34:18AM GMT, Geert Uytterhoeven wrote:
> The KEBA I2C controller is only present on KEBA PLC devices.  Hence add
> a dependency on KEBA_CP500, to prevent asking the user about this driver
> when configuring a kernel without KEBA CP500 system FPGA support.
> 
> Fixes: c7e08c816cd2fdf8 ("i2c: keba: Add KEBA I2C controller support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for your fix, merged to i2c/i2c-host-fixes.

Thanks,
Andi

