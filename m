Return-Path: <linux-i2c+bounces-7805-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 130999BD77A
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 22:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D7B61C22897
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 21:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B291EABD6;
	Tue,  5 Nov 2024 21:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vdaxjyxk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDF71E764B;
	Tue,  5 Nov 2024 21:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730841387; cv=none; b=ViuPRFTMC7g73CZvAj5nFFiZyi/Sb043DV9q+gCwqsd4/n2pbNH1M1jGrko9ZsUMckQcyaOH3z8P3fJsatIsFwiEusVbIk9ivSH1jHJScIOTwon7fN9qMzsvYd81PYTa1AR5rzVsJbF/LXkzb+WR16mjO6zoi2tJWuB4FIeV8+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730841387; c=relaxed/simple;
	bh=5rpe4iZzYi3AlRimVpUol2fpx7cH2kwenEWo95T9tjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIA3dVSKbvxBD7LGtlutPzZqbxiDYPVpDd4aRqs+AAW2Mju+BgnKiqBzRdEWxoHXDrJphEC5DumPW+s+eytLq1djbJ1FmwsjczrTKzyAOlNApk6D/4Oe9kqU8Vxa87hnVlA9rdQaa5UD5TnjX9q5qVwIRCmEjcETT0jnHbgTjR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vdaxjyxk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3676AC4CECF;
	Tue,  5 Nov 2024 21:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730841386;
	bh=5rpe4iZzYi3AlRimVpUol2fpx7cH2kwenEWo95T9tjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VdaxjyxkAZZAWAh04z0zuoLAv2wCF9C+gOip/n2n2GM55qXW8gWOat8IXa6mjqGss
	 FlyABqCY6iAFq2vanFyBZpSaxvobqbYAd6MZJK0fJ0gesT9CGoKVqnRevqUA32rf2o
	 0QEBB5bpI5KoK/sBTINqDrW1t1u6UjwMAwKGbU7USEeJFNtqx+W6U5C+ZFCrd1r/dB
	 NAJ+5hWKsG4qDR8q37cbwA3/zn/tmhkxZ3MNH83rHncM5xhVx7rz6PyuqQFxHheHOx
	 i5nROwIOeHvHb7ZwfIJ7/TziLG3DMzEDHsz7BGWjcHDTuGT4G1AE6Y3vd0KikvuFBE
	 L9uwXADXfY0dQ==
Date: Tue, 5 Nov 2024 22:16:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-cci: Remove unused struct member cci_clk_rate
Message-ID: <gesmcfuhjrdrc2ibw774xzdmrgu2alkyomp6umwcdaoj2hxzib@ru5w3nug6l7g>
References: <20241031113043.523385-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031113043.523385-1-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

On Thu, Oct 31, 2024 at 01:30:43PM +0200, Vladimir Zapolskiy wrote:
> The removal of the supply clock rate check implies a need to remove
> some unnecessary left-over data from the driver as well.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Merged to i2c/i2c-host.

Thanks,
Andi

