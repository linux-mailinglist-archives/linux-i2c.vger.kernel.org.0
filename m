Return-Path: <linux-i2c+bounces-8728-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F09B99FCF32
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 00:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E2C01637BF
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 23:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4351B6CF0;
	Thu, 26 Dec 2024 23:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RgiRlcHr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460841946CC;
	Thu, 26 Dec 2024 23:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735256603; cv=none; b=mnKFzUSZBu10UNXSqNxO4jzmlZdPgH5os7WKn8H3bTlTb+LQnCf73uM+FHCRE8W5mE4tRapJCXprAeX9RTuKKAVCOAkQvt2e656hC2dIobeqRHQuYSE2wQba3dP45OQYN43+/4wN8HrytKO3ICRXD37JcLMnwkV/BD11MI/Y4fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735256603; c=relaxed/simple;
	bh=d1r/cZx7URICkdrXL6Iza4ELRVrvNkHRrHDOleFVbyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SztkbCqfZMXQoKCzVowsRyL6r56E7jvO2xYx9Q3tCRf/npTNq7RwOdcITeug3N0MDpSvxBPepV/Bf1u0LKwhuahIr/lcaaj4+P88wzKOkpFGPWEu/8U0FMTVnDWcl7NLHtFjxGslUiHyNxwMzY9JwJIm/L9QyBBNuxpsMbXa4hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RgiRlcHr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380BEC4CED1;
	Thu, 26 Dec 2024 23:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735256602;
	bh=d1r/cZx7URICkdrXL6Iza4ELRVrvNkHRrHDOleFVbyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RgiRlcHr8qh8suwOozeCJQ+yvM/bbMpiXladFlTxtu66OtLWo8hvwrsCEbczI+Qlv
	 /mfKvTAure4YX65jm4E9DwHA+bOHezOOxqEnua0mlUya+WZL6blpN6J6zH9/9A+kmQ
	 iFi+4ZpnYEuVmS+lzTMMymoW8+/fzUDVE5QbzwWN2qO4a42cvddM2ppUxtZB0u+018
	 sPNrKVDUVq8ycNVxOMQX2mct5Ngu5zUCKCj72iGND9ZgS1kA+6RQ0rDEdviaT2q0+A
	 8w8PiB9BreWL5ACDYdcai0e5jt89bPqE4e0sja06NrLMmW8D8XFxPAFciZ4h8pIjoe
	 gteUVjICMJOIw==
Date: Fri, 27 Dec 2024 00:43:18 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 3/3] i2c: davinci: use generic device property accessors
Message-ID: <d2jtkkymp2t5lszkykuniymcxlklamhadpq46rkymlg2b5gluz@cp7esf7xldg3>
References: <20241211102337.37956-1-brgl@bgdev.pl>
 <20241211102337.37956-3-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211102337.37956-3-brgl@bgdev.pl>

Hi Bartosz,

On Wed, Dec 11, 2024 at 11:23:37AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Don't use generic OF APIs if the generic device-level ones will do.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

