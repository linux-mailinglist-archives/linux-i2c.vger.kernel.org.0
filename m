Return-Path: <linux-i2c+bounces-10477-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DA1A935B3
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 11:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED287189F5E0
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 09:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA6626FA7D;
	Fri, 18 Apr 2025 09:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlChjmoS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6206E26989D;
	Fri, 18 Apr 2025 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744970277; cv=none; b=slYnyuHExWy49HQ4uRzxApsRRxfkD8l+Ka3xhXh09sqSkhnuWccAha2/gxIDceHjvLWaRLATMWYp728UpcjnCxKBqF6jsXqfRHx89h6kpp/DY6HEqUijF9kX9/JfPZR1w0SJ3f/9yHdgrdnKpGeHwj4150ysrl3WOE9VRns3Huk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744970277; c=relaxed/simple;
	bh=p6b/J69kfFLUTq+QOgF6Rld0J2Pgf1L3YSf+igHN4mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uj05TERyeXi8MCg3LvDV/YYcHjfD+IHVBYmcWOnNQilGi2+5vSpz6aX/pnpa5svm8WKqGXYLOwtW4vRo1SMLF3iP3618SuK/IIpqciEaODQBJEISIDFf1ykmDGjgD5uE1350DTgDJSizVcbVcrSHKs0EkB7uCBTg3VmBI5YM7Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlChjmoS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAED8C4CEE2;
	Fri, 18 Apr 2025 09:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744970276;
	bh=p6b/J69kfFLUTq+QOgF6Rld0J2Pgf1L3YSf+igHN4mI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlChjmoScEr38nS5joVdOx23M6ct7g6/LappZMSOJiX4qHa8iRI/uH5nY3jjl7lL5
	 YRfd2VdRZ6rYq7eFehtFIcQtNNUYkB0V9jvXCj9FIXVfDsqQeFV9Z96D3ixRc0Omtn
	 QdlDPJf5SKCNR7Q302y6eAjyozMjQi+zPb0ePmByVn/b0TAZjyG4pXKrTLmK8hcYB3
	 QxM2MXfCqD0ZMtiuMy+xBiWmj2VCi8B6Sz7tE/JdbVlnDmcSYVNA5PgeRWLfpoaIE1
	 +dvNw0/tKUq7HlchgHhkmnqcOYOCCYO1IbMa8zbc4xTapy/VcvLDnTBjQy8nOyAyoL
	 l93MeZ9ObhIww==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u5iTt-0000000014D-0AfD;
	Fri, 18 Apr 2025 11:57:57 +0200
Date: Fri, 18 Apr 2025 11:57:57 +0200
From: Johan Hovold <johan@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Vignesh R <vigneshr@ti.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: [PATCH] i2c: omap: fix deprecated of_property_read_bool() use
Message-ID: <aAIiJQVAUdWJFVy7@hovoldconsulting.com>
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

Thanks, but I think you should have kept the Fixes tag and merged this
for 6.15 (i2c-host-fixes) since this is a new warning in 6.15-rc1 (and
that does warrant a Fixes tag). Perhaps I should have highlighted that
better.

If the offending patch had been posted or merged before such uses
started generating warnings in 6.14-rc1 then that would have been a
different matter.

Johan

