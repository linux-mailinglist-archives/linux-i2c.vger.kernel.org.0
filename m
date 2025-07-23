Return-Path: <linux-i2c+bounces-12012-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD630B0FD11
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 00:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDD92168CF0
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 22:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F123D2343C2;
	Wed, 23 Jul 2025 22:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwxmoRom"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C66111BF;
	Wed, 23 Jul 2025 22:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753310744; cv=none; b=jISY40yTmny1OGj41qcRO0EXZxAHTJm9F0W0Qtg/1+B/O/iXu8sbut6bMD3EHChurykeNWsQ27Oevq+wcG2kzorWm0W2hm1PvRKv1WErHGy21Gh/jcj70PfVXQ+GevhbG/AhmeZq0Ujt0NVEwjBqB/HNqJERXESC3ofKpsAVSLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753310744; c=relaxed/simple;
	bh=DRFNNor9xetjNiwB4R389Nfb+5tJZq+R1Aro9dByQfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aex0HNmNF1E8k/DSQVr1+hNpl2DycCywUbLkmfJwE0vI1FFo0DzegcOdInhPBNHmqQGrK3j44hp6GEVLMZBoCqCQ7JYt4H+bj6DHUtdX0cPQOuFxXHMWShkAF/Xfw+DKZkKB/UFFVuErFeTWALkm6lMP8HUYUBPptYMvbhHf+qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwxmoRom; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E77C4CEE7;
	Wed, 23 Jul 2025 22:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753310742;
	bh=DRFNNor9xetjNiwB4R389Nfb+5tJZq+R1Aro9dByQfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwxmoRomU7GrGGtJSXA4s1kJdftFcy7FZPWIm/HLgZAVbK7nKpDOiNgw2Awe3exDu
	 6zs+jrw+nWV/vHGz4/O7JVec8VY7TU8D07RE0RcCh0zOZeeqOFuKUOts/nGojMqs6p
	 3PeHoiFfgiqwk+kioCLOQmMUzokDjx9vY6Q+D7UbRf2lAX2IcnIWNGeL+MhMcF0+Lv
	 t4UEAj3RxUM9LeJXnOalgXdOiIuw9/CZfAhUxC7XfePulNByggMv3i/RYTBAsEkjgy
	 V75zdGT9DdSPwCFl+1pJ0NP9CqbMNZGj8Y98ANAzeGIBeqrpdncvex1vyjpA2opMfg
	 uVmtiOtlUpNBA==
Date: Thu, 24 Jul 2025 00:45:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: i2c: exynos5: add
 samsung,exynos2200-hsi2c compatible
Message-ID: <cpurwsy6vfu2fxkks3upcwzla7kldido7ro4vmq6m4rij4lmk6@mwbveb7ftpdv>
References: <20250722121434.443648-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722121434.443648-1-ivo.ivanov.ivanov1@gmail.com>

Hi Ivaylo,

On Tue, Jul 22, 2025 at 03:14:34PM +0300, Ivaylo Ivanov wrote:
> Add samsung,exynos2200-hsi2c compatible, reusing the autov9 support
> since it's compatible with exynos2200's i2c controllers.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

merged to i2c/i2c-host.

Thanks,
Andi

