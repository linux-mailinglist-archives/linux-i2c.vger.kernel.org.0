Return-Path: <linux-i2c+bounces-5282-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2E094DF5D
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 02:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 339041C20EB9
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 00:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A644C66;
	Sun, 11 Aug 2024 00:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4To2Hv4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416234689;
	Sun, 11 Aug 2024 00:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723335759; cv=none; b=XSkpg1IRwrno50oKl/nlK6ft9YT90Rx9bQpYwPTFpSI6oiq2dBlH7YLEce1hLEMnEOwtsMl4BCLn5bkVM3OCtsQMapoH7JK1Ruaz7pdHhsR6mOOf65lI/eIEpFYDqIRMSgzjUqWWR+fe15C8ba1GSrgziifQMvU8yp0Io7grldo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723335759; c=relaxed/simple;
	bh=p2b60XdkdQpNkq0moIBMnfnbnRrr+23Ws/v8H5Jva3k=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLnJeJzyGNQlLEdh35LiReRgB4LnQ6DczYvC/gTd6P/REe/dKcYpN33qmlBJJCAY4QUKAWNgPjkALl+/EGSXWNG275z9nXRDEnPX2GcKIXUkfcUnWaGHw9YBCPUACB2S8BEpJSLaeWvMn7/Liumx7PJRl4H1QOJWClNDTuJDVDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4To2Hv4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1547CC32781;
	Sun, 11 Aug 2024 00:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723335758;
	bh=p2b60XdkdQpNkq0moIBMnfnbnRrr+23Ws/v8H5Jva3k=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=L4To2Hv4S50T+DY8a38CbeVqIGCu5ve2IibVJw+ZCZRj5ltAaH73bV3LA1CFlZAMy
	 XXiMtgzYtfjxSwPvbxDJPOsvQIQYXegP+xEgvhh49OHcHYM7sAx6gq4P8FQyBTy9rl
	 Kzby/5bc5tsqHClx0KO2uvAEvhAz5YUxy7p2OyumCiHlCrmrpj2A49vTszYRKZA/k7
	 BVFwR+6S9+P5bMitJZDYi9hQRU5S+WVef8Ze8oFQqtiDZVFK6fxfzlzxsO2qqM0xev
	 b8AhXv3hQuyxX7HxkQRe3ASyB6k2TGVIKTtfFfWMsknsRPAg3UmuYXKjJe0ONnnTVG
	 qohUhziSjdG6Q==
Date: Sun, 11 Aug 2024 01:22:34 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	Gaosheng Cui <cuigaosheng1@huawei.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.11-rc3
Message-ID: <iv6kyqlhjopmq2rm6h3mlkmwday7oxwne635mlasiq6pfzoxpe@q45nn3vpmrh5>
References: <3oxrthtenkyypr5pqpduxyndw6wxihn24s67p6ppogkcdd6mjd@s5pg3swp6flp>
 <ZrYaLQ1GZFBAii0Q@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrYaLQ1GZFBAii0Q@shikoro>

Hi Wolfram,

On Fri, Aug 09, 2024 at 03:31:25PM GMT, Wolfram Sang wrote:
> > two fixes from Gaosheng in this pull request on the Qualcomm Geni
> > device.
> 
> Pulled. But I wonder why this wasn't just one fix because it is the same
> error path?

The second patch came as a suggestion to the first patch and it
arrived after I merged the first.

Besides They have different Fixes tag and I spent some times at
checking and they look correct.

At the end I left it as it was sent.

Thanks,
Andi

> > Wish you a great weekend,
> 
> Thanks, same to you!
> 
>    Wolfram
> 



