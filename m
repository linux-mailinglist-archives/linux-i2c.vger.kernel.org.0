Return-Path: <linux-i2c+bounces-11915-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43543B02103
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 18:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A3204A74AE
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 16:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6752ED14D;
	Fri, 11 Jul 2025 16:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzUleDm2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7D1149C4A;
	Fri, 11 Jul 2025 16:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752249650; cv=none; b=ltBOYLKY3HbJbssIq4jkHbmXUtm1iXFU+94+25ar0+/UQXobZGmL7QzTX91h2I7iudaUb0R+1GDBMcJYjIZXRPX81Jyr6EkGB8Hh1Jy4dSAWC4BjBUGf2iqGrn5lNfx3+8QZPQgu6oBfLBXJlX10EnEsBz8lB5fDWHM8dqLFrno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752249650; c=relaxed/simple;
	bh=nakvtkAYRCu5QQhjHX805Oih22xwG4vhtQD+uJsWIdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELKMbyUh7tYVbqKeSSsnCr6pBA2QoUVj/3i7B9hKJYgyk4eSdNZ1Kgdenyn1misMftuDrdGg9ock907zoMazOAUUoxihjF+AQhqXwi3Ek/0bmgcOoILEyOu+mg9U5brt4laGaNUTvhcb7vxiiONjLFqk5lg0cTPds8Sh31/XlTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzUleDm2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F837C4CEED;
	Fri, 11 Jul 2025 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752249649;
	bh=nakvtkAYRCu5QQhjHX805Oih22xwG4vhtQD+uJsWIdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NzUleDm2HLMr0yEUvT1iBR5Ceix7aO3u+pQyCuxrAwm7vE462lzkGmuIqEzfBdt4W
	 Dgu42sJjuM7USAJLhVFoPTA4N/UvLsYEXmrhJ7uyvORDv8uC0NR0wyAsyTwcJ6PBbW
	 QEHd8zr4/zVvdkeQHofE0x87vGMclkVK8OOcC7wYRevOuFV5GlR8s+NrkUkV5WJL0P
	 GT5J0hP1FY1l2rPU6nQnnk/N3PZ4gpVCaNtKMpZEw9ztPoE2fssMACc29T/U5ngjoM
	 djMHuYOHztWgI3Rqh7IgAA0/i/IIr+mQ+25KlWTAKMEuGx1a0ZTy4SmpvgP0emV2rP
	 rSpMBd53gg6kg==
Date: Fri, 11 Jul 2025 18:00:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Akhil R <akhilrajeev@nvidia.com>, digetx@gmail.com, 
	jonathanh@nvidia.com, ldewangan@nvidia.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, p.zabel@pengutronix.de, 
	thierry.reding@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v6 2/3] i2c: tegra: Use internal reset when reset
 property is not available
Message-ID: <iqx5wzywy2x66n2y36mx4fckrr7wy4lqu3dsejcovghjtmgoz7@zwslylpivy3q>
References: <20250710131206.2316-1-akhilrajeev@nvidia.com>
 <20250710131206.2316-3-akhilrajeev@nvidia.com>
 <aG_FvfN6xXuULolK@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG_FvfN6xXuULolK@smile.fi.intel.com>

Hi Akhil,

On Thu, Jul 10, 2025 at 04:53:01PM +0300, Andy Shevchenko wrote:
> On Thu, Jul 10, 2025 at 06:42:05PM +0530, Akhil R wrote:
> > For controllers that has an internal software reset, make the reset
> > property optional. This provides and option to use I2C in systems
> > that choose to restrict reset control from Linux or not to implement
> > the ACPI _RST method.
> > 
> > Internal reset was not required when the reset control was mandatory.
> > But on platforms where the resets are outside the control of Linux,
> > this had to be implemented by just returning success from BPMP or with
> > an empty _RST method in the ACPI table, basically ignoring the reset.
> > 
> > While the internal reset is not identical to the hard reset of the
> > controller, this will reset all the internal state of the controller
> > including FIFOs. This may slightly alter the behaviour in systems
> > which were ignoring the reset but it should not cause any functional
> > difference since all the required I2C registers are configured after
> > this reset, just as in boot. Considering that this sequence is hit
> > during the boot or during the I2C recovery path from an error, the
> > internal reset provides a better alternative than just ignoring the
> > reset.
> 
> ...
> 
> I would perhaps expand the comment here to explain ENOENT check and what do we
> do in this case. (Note, no rewriting of the existing, just adding a paragraph)
> 
> 	*
> 	* In case ... we compare with -ENOENT ...
> 	* ...
> 	*/

If you write it here I can expand your comment before merging.

Or if you prefer sending a v7 is still fine.

Thanks,
Andi

> >  	err = device_reset(i2c_dev->dev);
> > +	if (err == -ENOENT)
> > +		err = tegra_i2c_master_reset(i2c_dev);
> 
> >  	WARN_ON_ONCE(err);
> 
> Other that that, LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

