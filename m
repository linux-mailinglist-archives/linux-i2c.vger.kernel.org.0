Return-Path: <linux-i2c+bounces-6513-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 631CD974234
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 20:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02449B24C83
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 18:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905AB194ADB;
	Tue, 10 Sep 2024 18:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDVYfZii"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F86116F0DC;
	Tue, 10 Sep 2024 18:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725993033; cv=none; b=j78/w5hL6iRnirwxUeSq92JGi1fexVuJwWoovYBToUyxRTtGq9cFZHXQSmypu1Zern7YphHSBGxHMtjxdfUa/MOMIpKmzYQZaTVtBYHd5DdJYis0EMQcGLn7G+zszxpMDuG2inVQy87keIGGZ1NTggqRjUn2HVsjNJW175XjoLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725993033; c=relaxed/simple;
	bh=WBWbOxkEh8EifaIQlOPhyijlRp1C9L0QC1MfPTVImgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNVBI6OBT5tWvGln7SuicvxKhaYWp9LiS72HzZT/AGi9vL302N+ukKYk8OZXmAfLLBa7H1FCXZkz1jhl39zMTZsD7W7uXNKQVPvYdxLcK9yNcez6G+NpU99xIm1dr0+ZFt5QZoOOfxwRC4clcMAjlstZ9ZhkzW7R5ZxNG1q59DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDVYfZii; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9AFC4CEC3;
	Tue, 10 Sep 2024 18:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725993032;
	bh=WBWbOxkEh8EifaIQlOPhyijlRp1C9L0QC1MfPTVImgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDVYfZiisLXKojjcbJl+I9BAsRhopU+3Nr8IjNZuoQhCGtz9NU2swrXpjLTKtUqP7
	 ADc7hKWXNXEv+vXb1l9UWybCv+4z2ecHPiS8rf+xubSA+d42vYG7MpmPjfYZ7bzBri
	 bHl/PDxO2YpJuRj7N3peBKpAtUG8pfP0PGmaDYHebaGRuBLrQ9oi23IjjFsGUJdSDm
	 Pxo2/+QwTsOtUwRUuHe6XW6Ow8nlJRUOI69CpkgAXTx+4mBHOQzxxH2t00EhIz0C6D
	 ZzBkyLi+a2iKEbv6cUapTn0GyoImcG/FhNlwIjjf70UtmbuclGKoXtA0oiYa61ejsm
	 5YLAypzZEsn7Q==
Date: Tue, 10 Sep 2024 20:30:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: support gpio-binding for SMBAlerts
Message-ID: <e4uqi6wcweurag4d5en6pcltqeiduecaeiv3ijfz6mrha2xfjz@h4bfe2ts5elk>
References: <20240909110430.28665-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909110430.28665-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Mon, Sep 09, 2024 at 01:02:56PM GMT, Wolfram Sang wrote:
> Most I2C controllers do not have a dedicated pin for SMBus Alerts. Allow
> them to define a GPIO as a side-channel.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

looks good.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

