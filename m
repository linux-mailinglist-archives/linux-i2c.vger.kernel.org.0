Return-Path: <linux-i2c+bounces-11052-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D24BABCAD2
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 00:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFDEA7A1C06
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 22:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6DD219A94;
	Mon, 19 May 2025 22:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaKm3shb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D04E21170D
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 22:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747693432; cv=none; b=f3NeaGLUZfBtwMked7+YgLRkJZOCnpU8Du2yyinMVVSktOzkxZWTA8+np26rxKqXi5ZNLZ22GrCvqOCiJIH/GCZ2sWQIvSB3Y1WFnGkScBcDRNW58i+Pj0zDMilmHMabeq+w7km8zOF7dUMj1G4GU5ecExDOtwXx1tv+A8eNEVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747693432; c=relaxed/simple;
	bh=ldJrmT4/TZpMqhV4eUCpR3pZnv6x7algeZkoIxSGhks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRVdM8kYkDTX0NF7a4xWKxcT6bxvmk3yuvEkRShEGpQ7918WOjIpu6n3D3xDn7CEl1aZOZCs6KlkDrUzx8ggkYMdAqV/nGAOeohO7+WrGjIon7P0jAKP/UQPFkXD5gQMiullEWGHh/AiEsKMXV1XsWkZojanDHQRU4p0MDip9ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PaKm3shb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5583DC4CEE4;
	Mon, 19 May 2025 22:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747693431;
	bh=ldJrmT4/TZpMqhV4eUCpR3pZnv6x7algeZkoIxSGhks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PaKm3shbbpNn21gcvLgyzbMWsBTcnV4wSYeVKMnUfeHEWm0cctqvrU5m7RxomCUAV
	 ZONuiLc+LfvrV9tGjw9Hi7R6eZEaAgqPk9SWPQrz9dFoinzZWIXsBPNMc/ziXpx8dn
	 3Hn4PphTSL2svSPuuWSikl2gtBeusVSlQ+6FyuVR68ZHAvKE1XTHgQUTqu2PIN8aGs
	 9/Ex8QyPgGrcwrLB0iO0OjK9wGshZsu87uhxGh2LOr/3+3aedZIhJk+TqDLD4Ocab+
	 exH7lkb0MyBiOV/VXSyD4dY2GmYv6Yja8TEE7J5FIM6R0X8msuLL8lfoHR93XlGLWM
	 KdJ2uBZB6r3wQ==
Date: Tue, 20 May 2025 00:23:48 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Enrico Zanda <e.zanda1@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: viai2c-wmt: Replace dev_err() with
 dev_err_probe() in probe function
Message-ID: <s5sb3xfm4esdupz3745nzqbkxfilpl27s5pkxi4muzksamoisq@yof3vobthh5u>
References: <20250513210246.528370-2-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513210246.528370-2-e.zanda1@gmail.com>

Hi Enrico,

On Tue, May 13, 2025 at 11:02:47PM +0200, Enrico Zanda wrote:
> This simplifies the code while improving log.
> 
> Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>

merged to i2c/i2c-host. Thanks a lot for your contribution, I'm
quite happy to see now all the probe functions using
dev_err_probe().

Andi

