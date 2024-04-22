Return-Path: <linux-i2c+bounces-3046-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5721C8AD73E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 00:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 151A91F22A1D
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 22:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9551F932;
	Mon, 22 Apr 2024 22:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THfEvfJq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B2A1D54F;
	Mon, 22 Apr 2024 22:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713824765; cv=none; b=ucNxfXIXnpeuKyu8j/eg8TFksr1i/mpxvMHkpOrTpmTbYPz7u2K5D3Yv4voPUaGLVHSsQVqpdUxDX3DqLp1FG0OQS6nQ0+Qoz0n3XIl9nKsAXvHSPMZZaTIjbucLmf799kMTlbOoZB9ce+cJQfEbjfbLl/PZCwnoVeD+K++Gmlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713824765; c=relaxed/simple;
	bh=Hd5Viy0Nj8LqCDVQU5jU/WzUH80cnkdPjYMuY1/EkGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfxvO8WIq8VZ3Jhv5USjX9F95l8YNEYtaorwq2BA9plD2fXkpRre5z7dlrycT9FUGyMuFGesO78mRUnixPReo12w6B21yxEnjJkMfMPG2Me22zFnxR+SIFC0O0kr8EIl9kPwfgjEMzer58vOja/el//Dh2CCHZpksOJxyanSXzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THfEvfJq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C928AC113CC;
	Mon, 22 Apr 2024 22:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713824764;
	bh=Hd5Viy0Nj8LqCDVQU5jU/WzUH80cnkdPjYMuY1/EkGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THfEvfJqi5eSjOqntwvhBOb4ekKSttKZn4kYPuZ+uDfzUb2UtCO7Bl9XPpuvZlQ0/
	 59Y177hTyz19Z/NOq+EANhhxQ9Y8PfcuohglhhFKlvO/KdNWuDV3beTuyr2399Vf0R
	 vZ7Ccvd2BSWPJwwcUzJ1ZU0vI1ATM5IKVnZ8nns1UbGHRFOZrH5qCxBpUg7670BedB
	 t4TraR6zJOx0McF9UzWBuF0+wUXE3atoPNySamVsJZCCfV67Q8lOCvJ0L2f3jvjSM2
	 qhwwcfRQKhJXEwLYhdC9RD5cft3bUxcqOfJN+R7SRIbT8BMgdsM8PczYjHZH/VvYsZ
	 t749YVHLCOTJA==
Date: Tue, 23 Apr 2024 00:25:59 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/1] i2c: lpi2c: Avoid calling clk_get_rate during
 transfer
Message-ID: <rejqts2qv26lbtizjd3e4wppwm4s3fn7lrloszfrve7zq4t6aw@relukzfcpj6o>
References: <20240422113629.1629891-1-alexander.stein@ew.tq-group.com>
 <7lcpupsaepqzxwovzvddtvrdr3f3xaxedxv5nfg4ax73gazu7t@mbc6ajq5suxh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7lcpupsaepqzxwovzvddtvrdr3f3xaxedxv5nfg4ax73gazu7t@mbc6ajq5suxh>

Hi Uwe,

On Mon, Apr 22, 2024 at 05:42:20PM +0200, Uwe Kleine-König wrote:
> On Mon, Apr 22, 2024 at 01:36:29PM +0200, Alexander Stein wrote:
> > The dependency from v2 has already been merged in commit b0cde62e4c548
> > ("clk: Add a devm variant of clk_rate_exclusive_get()").
> 
> Note that you might also need 7f1dd39aedfccf60772328c5b88d56dbd39954c3
> which is part of v6.9-rc5.

it's fine... I have rebased all my branches on top of v6.9-rc5.

Thanks!

Andi

