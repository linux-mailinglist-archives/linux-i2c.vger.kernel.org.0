Return-Path: <linux-i2c+bounces-11917-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C7FB02A0A
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Jul 2025 10:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D482165EF2
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Jul 2025 08:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A9126B768;
	Sat, 12 Jul 2025 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FakQ2o7u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F19B19F121;
	Sat, 12 Jul 2025 08:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752308719; cv=none; b=TNooQs8r+8x4VPBozEwWL9jOQ+PTY5HQRIbZ78ja3VFyEw2c19Pi/4SHm6IgKKqLhFmkUJ2d79srAT//RvBuzy8k/35xUi0RxYfyp9t2rCdoAOmvKVsHLOiYB38v2c8D4UGpbqTg+3xAAXhPonLKMqiJOK5zy5AT23HILoR0654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752308719; c=relaxed/simple;
	bh=Q1ofZlBrikKFTLPf3zhZD6ZmkOhZH8tx6juLuCyik4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlcEMNbZhg2i3+A79l5YCJ1cRQFDQbj67/byRE/Jc8GXuQxoFrxvhrTWsvxZ64lJgoiLSP5CBNGOH/pi9Cr6dzH0KTCQ7Y5cMOsSnRzSVc9+ugeKw6UypbR3Pv6A3qopj1/4A6pebPO8PU/qYYicLuMI6tYCrYABYoEKoZ99/UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FakQ2o7u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BE2C4CEEF;
	Sat, 12 Jul 2025 08:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752308718;
	bh=Q1ofZlBrikKFTLPf3zhZD6ZmkOhZH8tx6juLuCyik4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FakQ2o7ur/BdRJYPS4kSdSvWmdXVqrrjYQRZrmziMl4apYkSR9r1DHztXPxAkRF45
	 /XpjRzGet5Y/XpOdnm2u9keQ0EXUp1HV5LdIO9XbFHZ/BHEm0e8Y8fHo+gHeKWUrz1
	 /QsZR1OEeFR2tjyAWvmKKQR+fB0fcy1YPGYUkrOX64e/sPmqGK9rvaopsaFLuEXCbL
	 KuKaZoSYKwyb8Z7uGOTgRLtApOeotzsqdSxWh0RdGctxf6i3Be4MdzKWbC03za3pkV
	 nbg/pwWwjhrvDnD6nyCIJ+h7dMtT1+wd7ra2qpCSpnNw4SpNCo4R80SNk6YhB1QPOv
	 e2gasIATfftfw==
Date: Sat, 12 Jul 2025 10:25:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Qianfeng Rong <rongqianfeng@vivo.com>, 
	wsa+renesas@sang-engineering.com, Jonathan.Cameron@huawei.com, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: busses: Use min() to improve code
Message-ID: <c43lavd442fz2ah25gvxxptcx3wughgkxnpx4bvlltktqiyqo7@pfufqjlujcwk>
References: <20250709042347.550993-1-rongqianfeng@vivo.com>
 <aHFelLqnfsuaeh2Q@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHFelLqnfsuaeh2Q@black.fi.intel.com>

Hi,

On Fri, Jul 11, 2025 at 09:57:24PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 09, 2025 at 12:23:46PM +0800, Qianfeng Rong wrote:
> > Use min() to reduce the code and improve its readability.
> > 
> > The type of the max parameter in the st_i2c_rd_fill_tx_fifo()
> > was changed from int to u32, because the max parameter passed
> > in is always greater than 0.
> 
> ...
> 
> >  #include <linux/of.h>
> >  #include <linux/pinctrl/consumer.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/minmax.h>
> 
> Do not blindly add a new inclusion to the end of the list. The list as you may
> notice even on this small context suggests that it's ordered. Please, keep
> things in order.
> 
> Andi, if you don't mind, please fix this.

Yes, I actually had this fixed but I had forgotten to push. It's
updated now.

Andi

