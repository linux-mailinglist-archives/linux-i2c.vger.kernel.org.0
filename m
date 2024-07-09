Return-Path: <linux-i2c+bounces-4804-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBA592C5A2
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 23:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80B821C22C89
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 21:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1D218562D;
	Tue,  9 Jul 2024 21:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4TNSWGg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A237185606;
	Tue,  9 Jul 2024 21:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720561410; cv=none; b=D2Au0trxv11tbe7rVnBt0fuZYEbKYGGiCqDV1OiE46+lIUUORwPCx/lmrbYEZiXtb/hH1hMR4pGGlu9LsMA16VQybrOYFa5F0diyf2y/T4a6NSt8oena2Ku4JLIhvANR2gRq+OrSB00e+owW/y/3W32cchoISxan5c/FnaSI/8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720561410; c=relaxed/simple;
	bh=OD0TYclQRhvMgSsLouvEf8KE7wRcW6pq0NuumqRB3u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJog08coIHBLF2KajisaV+xWdUzVt2TQSCYIPwaElfsl1hGMJ7+UH1IM9UUGszKsiUanucxZO8X/ug75M4LzBhZE/+9+i03XJ9Yg4qepwzdAioMYA/VdIjUE2tTzs4X46UiaIeRjCIbFln9Gq4nBAq1V+aeLatNIKZrej4u7B4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4TNSWGg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A9BC3277B;
	Tue,  9 Jul 2024 21:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720561410;
	bh=OD0TYclQRhvMgSsLouvEf8KE7wRcW6pq0NuumqRB3u4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4TNSWGgDOep99FjU1C842r2QDV772Jvg7lXFFCLlinbb1mwftPN1G7IfHImybget
	 nDtxE9avoiyqRC8qPgMWG53+avujzQ0sDSS9iuYXYiqs6Ptrqi/wbar0uSzI2IU4OH
	 Y+VrtHpHvI7WvfucvxFoXYRrmdvHWv/Xh9mxoY3rgGawCjQshXXov3El7vqsgsIf4s
	 mi4xd1dQe0oiM6vgUQfYoddYzhLxYXnAjtpuAjzXJpNq2Meo1bF2sVJYFIgcce28wD
	 jgxORBe4S+y0WaUNBpUjkxWR92zk0m5Ak2LBrrd59dtVb0r2g1h25aWib5dSx3T5mY
	 /Bv32lR1VPhCg==
Date: Tue, 9 Jul 2024 23:43:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, 
	Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v3 3/3] i2c: mux: gpio: Add support for the
 'settle-time-us' property
Message-ID: <oh4nijkjbv4rmti3vje57keiij6l6xtaqfk3phtqvfpfucrfiu@3fmihuzdpkxw>
References: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
 <20240617120818.81237-4-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617120818.81237-4-bastien.curutchet@bootlin.com>

Hi,

On Mon, Jun 17, 2024 at 02:08:18PM GMT, Bastien Curutchet wrote:
> Some hardware need some time to switch from a bus to another. This can
> cause the first transfers following the selection of a bus to fail.
> There is no way to configure this kind of waiting time in the driver.
> 
> Add support for the 'settle-time-us' device-tree property. When set,
> the i2c_mux_gpio_select() applies a delay before returning, leaving
> enough time to the hardware to switch to the new bus.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

