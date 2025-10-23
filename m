Return-Path: <linux-i2c+bounces-13743-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F29AAC00987
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 12:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E312C4E7FBB
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 10:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5761F309DC4;
	Thu, 23 Oct 2025 10:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhRmCHL9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44543054D3;
	Thu, 23 Oct 2025 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761217132; cv=none; b=SOJSoI2v8uPO1BtNUaotPsp7Yq9NHfF/hIWsuaF3EaQXuLj0CMFDI6pz5+/2clM4PVb0sl5I31YLh0lBrioG5Q54YNviL3zygWdQOQl33oXwj5T1Zk11hOAR366oJ92FP5c1TQvQEVJmR6FJJHGIO8z3OptDN1y68NYYhHMicfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761217132; c=relaxed/simple;
	bh=R6UW0ZVQUKE/m2NNBlAe9KC9Lu26GRWU78BmPRkjRfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAA5DID/ZES5UFdRBAlo+zFQL/ouo4h0nWTWXFc5PB/VRAuCWrt6dDQbPFDx2p1+oU1sWDK1bqIg0Nq+4L4xhYZtxdtrd3h7fatq9mmgEW4ZUWbQHwe8HtqzU5zZAIA6TrcOT2JNIAgfDkTNZYOHfmAJofpOFyT3JMU3MOi3xHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhRmCHL9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE116C4CEE7;
	Thu, 23 Oct 2025 10:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761217132;
	bh=R6UW0ZVQUKE/m2NNBlAe9KC9Lu26GRWU78BmPRkjRfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EhRmCHL9MtHY2uK7BccTtMz3HJLasv6irs4GVrest4QPeIwY0nG0y4NJR2oDl1W/a
	 Uztx+EAJpAJd0SyYMXWbc+TlL/PamoyQlCbpH1bW3Yr0ubJ9E70UuN+AvFOUJIY4Si
	 RQ2aj4LSUCHcuSSLN4uTGuc/1p8B4Z5MsHQ0+i30rVS+SU+cR28thnYKGGtOrO+no4
	 HmEF3ArxkJM7J6t/jkNuJygz47cbgWVZ0kijhXa7LTX5iEzQ+X2zH2gZaUh2rJL2LP
	 9DHI3zLz9o7ayMbMbx3e00wbJTIVQDZZ+70d3mvK64mIio7NqLAw+jp342EPaZ0pld
	 41tS0bLE7WQpA==
Date: Thu, 23 Oct 2025 12:58:49 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: syniurge@gmail.com, shyam-sundar.s-k@amd.com, wsa@kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3] i2c: fix reference leak in MP2 PCI device
Message-ID: <jlvcp2cb2cpdjzkfet5nosusjuvbzvil3zf7csbdfjan3pkidn@jdrneilgrmz7>
References: <20251022095402.8846-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022095402.8846-1-make24@iscas.ac.cn>

Hi,

I'm sorry I didn't follow up on your last comment. Thanks a lot
for resending it.

...

> diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> index ef7370d3dbea..60edbabc2986 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
> +++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> @@ -458,13 +458,16 @@ struct amd_mp2_dev *amd_mp2_find_device(void)
>  {
>  	struct device *dev;
>  	struct pci_dev *pci_dev;
> +	struct amd_mp2_dev *mp2_dev;
>  
>  	dev = driver_find_next_device(&amd_mp2_pci_driver.driver, NULL);
>  	if (!dev)
>  		return NULL;
>  
>  	pci_dev = to_pci_dev(dev);
> -	return (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
> +	mp2_dev = (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
> +	put_device(dev);
> +	return mp2_dev;

I still hold the same opinion, but, it's anyway a small change
and the difference is trivial.

Applied to i2c/i2c-host-fixes. I will include this patch in the
next week's pull request because I want to keep it a bit longer
for testing.

Thanks,
Andi

>  }
>  EXPORT_SYMBOL_GPL(amd_mp2_find_device);

