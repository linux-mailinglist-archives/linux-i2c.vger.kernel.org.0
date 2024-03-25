Return-Path: <linux-i2c+bounces-2582-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E2A88B586
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 00:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CF2E28BF17
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 23:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD5584D03;
	Mon, 25 Mar 2024 23:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ujm6WHQ7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D065B5DD;
	Mon, 25 Mar 2024 23:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711410369; cv=none; b=E44PiawFOWpsFm7bEpYzcNAGclw2crHpJ+keZqvCg6fDncnp0nDMy/HkwZBtB2T/YgzokJKOogeKCPX2IwLbav2pkXArTS+UD/sRPqqWDCdO80JXLOg/m3H+F3he4BZOE6yG2vGeWKrHRalk/EkbuvhsvlHcaFRmVb4PdXlbs6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711410369; c=relaxed/simple;
	bh=xWu+wvz1ydwovyg7bmXk0qu+jst6uNaTpA/1WFmjEls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzZQmz4zUmIWnGedDNhW+J8e8j4eaJk19866VIYpp78ffwtM8ps1LOTEZFEWihYK9fMszDF/ioEc3ltoGBm5/4sNmLUG874yswdsy4ngER/VjHDoWDnTVjdo2WDneH6Ah2ZRPkl9ruxmGmAtK7gFM4/BVFt1l6hiMhvUDVEgk+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ujm6WHQ7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1C7C433C7;
	Mon, 25 Mar 2024 23:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711410368;
	bh=xWu+wvz1ydwovyg7bmXk0qu+jst6uNaTpA/1WFmjEls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujm6WHQ74wSf+M5Nm1O6mvRiF8n7CTcJBnqYNdc2nBmOtrrOBcwGTzyXW5L16YAO6
	 Tn2X1Kn0xFef97HzMgEM9Lm4yRbAbVrduLzafLDzxTypYKE3avE1dqap5jsQrjMTBS
	 Cr/ERsRi3yyOOSD1GS4MT/6+g7ifh8BbjuplTTQm7hvRV2ket9jpjHnuOzaBkAq6gO
	 ymDfN4ys9QHPRdAH4rVg87YtJ91QsyYg5xr+okYJgaQaieXe/QlP7JWH17LKaVNlZI
	 7T4yU/zcvyQQc0AyShtJS+ZPBhZ1Eo92kIrSHV0Oorjs0Dhs6kp85lbQf25320Duu4
	 kFAzy1bkt9i2A==
Date: Tue, 26 Mar 2024 00:46:05 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/64] i2c: ali15x3: reword according to newest
 specification
Message-ID: <sfqu5ez35apbrfafrymhgc3fu7znnd2hdbw2ahyckx2pfko2mr@52gwpj64zphv>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-3-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:24:55PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

