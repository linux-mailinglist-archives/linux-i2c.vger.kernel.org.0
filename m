Return-Path: <linux-i2c+bounces-10473-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA601A92D31
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 00:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B03E8A0938
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 22:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98F020E706;
	Thu, 17 Apr 2025 22:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjCCN0eN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4BFA927;
	Thu, 17 Apr 2025 22:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744928321; cv=none; b=Txrrfpnny7G+LLJSCVuLJA4r9ue9wTH6hjeF2jmIjTojTp9L7l1rlBK0NNchbJ2iel6UadSnr3Hzg31MeI9WcaZC3VdlP9fKOjoPL4/Jl5K5KB6ppjDl9fwRhGFJG8HWORAmtFqYwIglmUe3WtZyBC5ExpE7tOCl9CoqPOScv0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744928321; c=relaxed/simple;
	bh=QjJTP4Xml5PPnWy3nkDp7pe0ewVgS2VUneSvY+aKt0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFT0f0Co8Zaj56EcBY92D5dM+k3SjbFQSHohsudj9YJ02o/n5oJhR4dzCyOudQo4MKqT4m+PxPny3W0O9KO+zaOAdeSLEjzE+88ZwNZ2v1Sb7ZPnwE0dRVZsYChoLt417dRQi9SbCCfIssvMzXufmgU3Ivbz/HJXLP/OEM8/zxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjCCN0eN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD55C4CEE4;
	Thu, 17 Apr 2025 22:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744928321;
	bh=QjJTP4Xml5PPnWy3nkDp7pe0ewVgS2VUneSvY+aKt0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XjCCN0eNeWaws2QkPN2scvCWqqO7bHQRig0v8geeJw22Eo1RvJh7Cy3i97Bc1HJ7o
	 ml6g7peo3og01ORmfIc9AHAtBw+ql0wLGoeeG+0cfRxHAhL/1BDEF0pgvC2G28J0kt
	 M5YJw6Eq8dAzKVFzfwitPCKEzkqtIPvcgB24ndc3OLPHYq60JAvq1wjhIorcef8f6d
	 VslUf+mZ7YZKM5WbzHkulH9KCVzUe3rk9USKt/lOg4vvBsLFxqkR/US+i6z9kFWWJv
	 op9IKvLiOQbUtJJbWqyqMC99isiAH5XyrCI92ktiOm936K3KGT3IhysCyZI4mjz1Nc
	 Ur9GhBZglP4TA==
Date: Fri, 18 Apr 2025 00:18:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: [PATCH] i2c: omap: fix deprecated of_property_read_bool() use
Message-ID: <njmy47do6paacr334gbiiwywuuzujqnbhchwj4vt7r5ribdleq@zskrmx6egtc4>
References: <20250415075230.16235-1-johan+linaro@kernel.org>
 <vcwjwrjgzwoil5ydds4findhcgl2ujoxwia7eh7yrbdc45yx26@kmpmvataffzr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vcwjwrjgzwoil5ydds4findhcgl2ujoxwia7eh7yrbdc45yx26@kmpmvataffzr>

On Thu, Apr 17, 2025 at 11:41:51PM +0200, Andi Shyti wrote:
> On Tue, Apr 15, 2025 at 09:52:30AM +0200, Johan Hovold wrote:
> > Using of_property_read_bool() for non-boolean properties is deprecated
> > and results in a warning during runtime since commit c141ecc3cecd ("of:
> > Warn when of_property_read_bool() is used on non-boolean properties").
> > 
> > Fixes: b6ef830c60b6 ("i2c: omap: Add support for setting mux")
> > Cc: Jayesh Choudhary <j-choudhary@ti.com>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Thanks for your patch! I'm going to drop the Fixes tag, as this
> isn't really a bug fix but rather a warning suppression during
> boot time.

forgot to say that I merged the patch in i2c/i2c-host.

Thanks,
Andi

