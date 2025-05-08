Return-Path: <linux-i2c+bounces-10890-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC942AAF789
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 12:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54F5D4C2A81
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 10:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D3D1D5CC7;
	Thu,  8 May 2025 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hk0uqXZr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E3B42065
	for <linux-i2c@vger.kernel.org>; Thu,  8 May 2025 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746699048; cv=none; b=f2zpLb1rCXtUwi5bS9NUODdIQsmx1glkihqLjow8gu0WGxKPX7DvG8Xx98381NSAU/60YMsXcBEnbJOT1nELyFEnTzSg7WJ5A4Cnv7sGL+ZXUVRR4cVGknXxcAT1lJI1eoFhS4U4pQ5Wre30api/zyYVrgRwxGWp4YxTxHlkW0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746699048; c=relaxed/simple;
	bh=XDwl/JLmK9by8NqkgZMEAOsNVksbzl6AUeBC/0CXYQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9jfvFwUh2uzl0T+0Ab1YRCnQupu4OftBfBw643b7rp+vpnndB3OJjrvyc3XEKG49RsJmnO+D6dqgMcvZw58ad3dUJni1LYSFR7+mxWWw0OiYBCi3NYhkH5/jR4xIMFJ20vmyvfVXcCE/czTAhmsLN6OPAKfmhQdV8yEz/gK2cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hk0uqXZr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BC0C4CEE7;
	Thu,  8 May 2025 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746699047;
	bh=XDwl/JLmK9by8NqkgZMEAOsNVksbzl6AUeBC/0CXYQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hk0uqXZrme0s4fejGPyCEDky5bu3abb02XhEoG64x3pwXIWh1WqVeUNcC3xzuSYQ1
	 H8Kw8XdpO2rZKPohpzl+XvbM4OuU6tRgWo5l3+ms9h8LiPKjNf0LwVW0zjKIWPIT1x
	 u9Abq7YWgh3oFKKQ+Y928FY62Wmukag9pLjjXoiZfkSxWClC28DuqXTq68zfBbNiQa
	 i+5paMfnGPrwmBwbd/Y4gRxYRsIKljYCKuKkvcmHl7YQ5F2dAegXeHACcOl1E7snB7
	 IKERjYJVwOPDte01VAWdRypH0dgrd8lM2JyKFgHUvZPygR+IqRg4KKDe9uWJ5CVoZx
	 KIJGUaoDkE3tw==
Date: Thu, 8 May 2025 12:10:44 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>
Subject: Re: [PATCH] i2c: mlxbf: Allow build with COMPILE_TEST
Message-ID: <tnduqon4gxxq62gsox734gzuzkw7eu5zk3chccfgl5q7ekzzi3@ncck2dswptmq>
References: <20250505215854.2896383-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505215854.2896383-1-andi.shyti@kernel.org>

Hi,

On Mon, May 05, 2025 at 11:58:54PM +0200, Andi Shyti wrote:
> Extend the Kconfig dependency to include COMPILE_TEST so the
> Mellanox BlueField I2C driver can be built on non-ARM64 platforms
> for compile testing purposes.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Khalil Blaiech <kblaiech@nvidia.com>
> Cc: Asmaa Mnebhi <asmaa@nvidia.com>

merged into i2c/i2c-host.

Andi

