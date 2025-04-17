Return-Path: <linux-i2c+bounces-10471-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E66A92CCC
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 23:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC1771B64398
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 21:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D5D20966B;
	Thu, 17 Apr 2025 21:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j0n0fJjt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BE41E4B2;
	Thu, 17 Apr 2025 21:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744926115; cv=none; b=jguwmPc2rTWoDePOzz0+HPVNpadJ4ilmhngoh4iMmJK0IaHMPne/hJTE5DP7Rye9b9ckJSGsiUOF2ZQ4gaA57fQhpy4MEc7P0w4SCFlLO7ZTkV7g663obwuQ1ChHodPrv3gaShTHAubHgg24bVZ/ZsEaB8q8k19IKc7jBxH5+vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744926115; c=relaxed/simple;
	bh=pHNrlN3TZ0Dz44eAymjQKJzusOSRhuBN+CARL/3NRNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3EyBIo0seuLAiGIgj1slHVFjWgvgZzDfLOSqCqXwZljtMFDTd4Samwm3iVFKe26KQ3Zh3wwd93l/hxv5eWYEkxjUc/8QKQqVhMVAetAdyy9vBfiibWJFIjq71d3jAOG5VHnCTMsC3WujsQKJKaz78sFj9MUobYVRtkXdbotg5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j0n0fJjt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81304C4CEF0;
	Thu, 17 Apr 2025 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744926115;
	bh=pHNrlN3TZ0Dz44eAymjQKJzusOSRhuBN+CARL/3NRNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j0n0fJjt0zExw5dVmyIaTIeJCCMYii+hijBsJH91FkNNnDOmgWVoxdG0npgxPzioP
	 NBnHTlVFW4p/Kj6ZFVjVwKU2yaiuGwVLf/Eq7WOLXY4o5ElWZPLvA1BC+eZGAUhA4i
	 wDGmtz3Tnz3Lx/+XdfX59JBHHBrNpM4SAwTHUd5rVH031MBMYDYR/1ZV9vo29k0zsu
	 66N42YC7TgOQZUXgiQen1cpGqcHzFnbztqhoxUN3zkBLO9iLzfIREaPWDGgnLht5YE
	 GFtaXGhj+Bcys/1eGoWc/Ff16SvoewZkOBmeNSI5teb42eDawLBGRQdpPU4V7Xb+Dk
	 r/6Kw4GpHLbYA==
Date: Thu, 17 Apr 2025 23:41:51 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: [PATCH] i2c: omap: fix deprecated of_property_read_bool() use
Message-ID: <vcwjwrjgzwoil5ydds4findhcgl2ujoxwia7eh7yrbdc45yx26@kmpmvataffzr>
References: <20250415075230.16235-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415075230.16235-1-johan+linaro@kernel.org>

Hi Johan,

On Tue, Apr 15, 2025 at 09:52:30AM +0200, Johan Hovold wrote:
> Using of_property_read_bool() for non-boolean properties is deprecated
> and results in a warning during runtime since commit c141ecc3cecd ("of:
> Warn when of_property_read_bool() is used on non-boolean properties").
> 
> Fixes: b6ef830c60b6 ("i2c: omap: Add support for setting mux")
> Cc: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Thanks for your patch! I'm going to drop the Fixes tag, as this
isn't really a bug fix but rather a warning suppression during
boot time.

Thanks,
Andi

