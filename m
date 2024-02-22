Return-Path: <linux-i2c+bounces-1925-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A94E985FFF0
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 18:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62B0C286BEE
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 17:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE36157E7B;
	Thu, 22 Feb 2024 17:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZ2WbDfz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007BD157E66;
	Thu, 22 Feb 2024 17:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708623901; cv=none; b=OjMKgNQSKqzAGw+9DyTpODfMLvMsOhwTiRep1YTFQz4V9t3rgxm0sjwFYsLh7rzw+rNJM1qoNo9sPis9VmgGXYRM6YdT59Mml/P3Kxbq1/ziEjF2qk7KmWusLe0LOpzElCrw7IBJXpqVv5l1kjJOhQfEV9p5uKB6kz/LSKk3bQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708623901; c=relaxed/simple;
	bh=sZFV/9GvDSGC9zghoHO3Ea/qtSo9ed2vqV6HVidrL90=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VU+K2hUvcnq8K077IADPsm9SE11NgbGANudbmRnksbadSdjGHhQSddExdb/KG0Z3ACzS4Em0aoJb3Ht1eiGFYzpBrl7bW5F9g9tGvzhJMJqhbcwiPqorJyxhpWu3sQ6IcfSiYwbDFhdu9g7lOAT4fanY6UqWRCd+8T129VJpnAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZ2WbDfz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634BDC43394;
	Thu, 22 Feb 2024 17:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708623900;
	bh=sZFV/9GvDSGC9zghoHO3Ea/qtSo9ed2vqV6HVidrL90=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=ZZ2WbDfzmne//J8JAZX7g8jMHekZXzXy8T20ThgZx5FiNGL4AICs5lApxNhs31snl
	 us6vGx+MYz2tLgsjQ/MbXtOECuxoa/wxkz0Uxu72IWN2XGZMObolfdmItgh6H6WcRy
	 szFLFSXGWSU5NN4PIvH2dWTEz2ClQi59+hV9df7tRZaFl08m+fSw4W0DzHGdMDktem
	 qnSv0zALK+7hiYActCJa1f8B8dkgX4Ce2709e1BGXtgz05sN6M4asP0M+7yLQmVqkh
	 4/59BX5SsMqqIN8GthhUwi4HlY/dnU9rtsc3TIg8OByXHYYF0XfyHKWcJ1gOvJCUh4
	 ccm+ASWxpXU9w==
Date: Thu, 22 Feb 2024 10:14:04 -0700
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa@kernel.org>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH 01/13] dt-bindings: i2c: nomadik: add timeout-usecs
 property bindings
Message-ID: <20240222171404.GA3334332-robh@kernel.org>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-1-19a336e91dca@bootlin.com>
 <20240216022704.GB850600-robh@kernel.org>
 <CZ6E24VPJKJG.35LACFD6ZV5KE@bootlin.com>
 <CACRpkdZZhhzg5SY7U5dv_OfLEVejRFom4V9nCfkQXunAw1ZXSw@mail.gmail.com>
 <CZ94LGRSF9KN.15ZO1VRMIQVR8@bootlin.com>
 <CZAX02IL1N1J.2GQR9D73GLRZB@bootlin.com>
 <ZdY2WzKbElloXC4-@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdY2WzKbElloXC4-@shikoro>

On Wed, Feb 21, 2024 at 06:43:55PM +0100, Wolfram Sang wrote:
> Hi,
> 
> > > > > i2c-mpc (fsl,timeout) and i2c-gpio (i2c-gpio,timeout-ms). I agree this
> > > > > prop has no reason to be compatible-specific.
> 
> Anyone up to convert these drivers to the new binding and mark the old
> ones as deprecated?
> 
> > > > As Rob mentioned this isn't in the kernel schemas but in dtschema, so
> > > > you need to patch this:
> > > > https://github.com/robherring/dt-schema
> 
> @Rob: My memory fails a little bit about these two schemas: we have the
> github one for generic bindings, not strictly related to Linux, right?

Well, NONE of the bindings are strictly related to linux unless they say 
'linux,' prefix.

> But why do we have then i2c.txt in ther kernel tree? Why don't we sync
> regularly with the generic schema?

We need to remove i2c.txt. Often that hasn't happened because we need to 
relicense the text from GPL only to dual licensed. From a quick look, 
i2c/i2c-controller.yaml appears to have everything in i2c.txt, so I 
think we can go ahead and remove it. There's only a few references to 
i2c.txt to update with that. I'll send a patch, but please double check 
whether you think i2c-controller.yaml is missing anything.

Rob

