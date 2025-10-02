Return-Path: <linux-i2c+bounces-13295-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E2CBB219B
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 02:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD47719C5B4B
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 00:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060B0290F;
	Thu,  2 Oct 2025 00:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9G0n4QA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD79928FD;
	Thu,  2 Oct 2025 00:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759363489; cv=none; b=i2a/82Jn9r18HdA7Fk//BM4GyA1dXGyZ728UGSEx5y/yOes3+/ABx+w2iDjeK8xv9rpVqQdnuEO3QbxEX6C7qErEZ5XljCVvc3BNupx2JzPNlqUzu/u4dvbvt2VNFmBMNPzqm07XzMkwKOL5J0D0rOkjcKmL3FzGIcTqp+ZjQYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759363489; c=relaxed/simple;
	bh=KdyteF5tCo+JKkuVtwOAYeO2H6zBCO/h1lpvaV1mrXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeXeYgU9BNtWw4sRa9htQKAcQfprC+sUJyKbDXOUHm+PuC8+OLF9lm8eA09XEgr440wZj28uB6JENGQMfAi1WgkPvWD1DnvBilu6taRBa6wdQcb/NI73w20xsweUFu+2afbQRHRr8uIPYxJHkWwjqrxocCYCvzynLs7cIqBzxuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9G0n4QA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2083CC4CEF1;
	Thu,  2 Oct 2025 00:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759363486;
	bh=KdyteF5tCo+JKkuVtwOAYeO2H6zBCO/h1lpvaV1mrXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A9G0n4QA1Pz1O1IafG+wkL6fjRJceuV66R6FWIrgHItkdN0BoZgd5ohQPotXp2h5i
	 iyeA+29Vwsh/au1e81CuY6SatqRQPGA6iJz0o+w8qr0fQS01ota2dP8cGdMZGrufpT
	 fi+hQYruWGF9qSjy1gn9cANU+HFqnavtFiRKhG0gssHdoBkjoZ8E+H1MNvBhXp0oD9
	 7Ua6JLf/uQixMDKwUz/A2oK2aWx7PzB8tBmUUwbQihFRQaaELSlskgIwfTbbPQyXVp
	 kNSEspAkhT3DYdke1vXv54XI7i5Q4JporcK+VfYsi2IcR0NcYQ0aHs0GEg424NRo9i
	 UzSn8hmSqCt+g==
Date: Thu, 2 Oct 2025 02:04:41 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: syniurge@gmail.com, shyam-sundar.s-k@amd.com, wsa@kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2] i2c: fix reference leak in MP2 PCI device
Message-ID: <eibktb7odiqdmcyv5cumc7h74ajjyv6ojn3felasxzcl2d7w2u@5nz7ybmldf35>
References: <20250928071933.1627-1-make24@iscas.ac.cn>
 <7cu6uvwjki72rz6zoshfg3vonawikiasxheotmrsowqoalk2jb@7iu7cenha7p5>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cu6uvwjki72rz6zoshfg3vonawikiasxheotmrsowqoalk2jb@7iu7cenha7p5>

Hi again,

On Thu, Oct 02, 2025 at 01:56:30AM +0200, Andi Shyti wrote:
> Hi,
> 
> > diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> > index ef7370d3dbea..60edbabc2986 100644
> > --- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
> > +++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> > @@ -458,13 +458,16 @@ struct amd_mp2_dev *amd_mp2_find_device(void)
> >  {
> >  	struct device *dev;
> >  	struct pci_dev *pci_dev;
> > +	struct amd_mp2_dev *mp2_dev;
> >  
> >  	dev = driver_find_next_device(&amd_mp2_pci_driver.driver, NULL);
> >  	if (!dev)
> >  		return NULL;
> >  
> >  	pci_dev = to_pci_dev(dev);
> > -	return (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
> > +	mp2_dev = (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
> > +	put_device(dev);
> > +	return mp2_dev;
> 
> the patch is good, but I don't think you need to declare mp2_dev
> because to_pci_dev(dev) should work even without hodling the
> reference of dev.
> 
> I also have to agree with Markus that something like:
> 
> struct device *dev __free(put_device) = ...; /* it can also be NULL */

sorry, please ignore this last comment, because if !dev we
shouldn't call put_device().

Andi

