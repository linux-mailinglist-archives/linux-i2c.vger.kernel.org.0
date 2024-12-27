Return-Path: <linux-i2c+bounces-8730-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 455D09FCF35
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 01:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CF227A1392
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 00:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81108184F;
	Fri, 27 Dec 2024 00:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERRCHr3D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4041F191
	for <linux-i2c@vger.kernel.org>; Fri, 27 Dec 2024 00:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735258037; cv=none; b=gO7m8iz+3PWD8Hh9s79PdBLX9LvnJP6lKTaYf2j3dIMeV17JuWlrwkNjoI6c3W9kPAzQWC0uvR3FMIKA024tE3KKSZ5qPL1sBYenGCwQp7R6L8zbxrGtWVTmCs+v87km0J063zSIm9vItAvRewJtwRVvArd/vWAHI/JSnlUcjXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735258037; c=relaxed/simple;
	bh=YJLrjDEgc/+e5P1MD9lK7ecXy0WvxvRXiImdW5GVLEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEQ5AKgw9WlqWPs0Ye2W8mHTb3HQ10Wx3owqR6ZueBKG9FY2ONQ/8B0BxddB/ZzVHBeRdvXpwkI6lY2nu2n4DY3ryan5qZirSMXFhgFyTrwIPmY1tOV+RHSOTSAqdCyWYiUx/jTYplBi+OkRVQIyED+nqCm+4PZph6S9yDIMEpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERRCHr3D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E34CC4CED1;
	Fri, 27 Dec 2024 00:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735258036;
	bh=YJLrjDEgc/+e5P1MD9lK7ecXy0WvxvRXiImdW5GVLEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ERRCHr3D4Qslv3lZgL/61PWRt1RnL+7pg4zkICuWA+sa8ZqtxIpKxu0jlVqUbUbS3
	 LZFwetmA6qwFxws5oWi06ImGL/kqavnfFzLkbtYbOPO1yMCflEk6OyX/It+v/yY1bG
	 BgZlTUoKgWmxUtHebgMmoavXpYIloNXaRxJoHm5BBVitvsuPOk1jTykGUMleVAb7If
	 DGRc9KDL3n+6Brq0ddfiZ9JzXoxFpuPhWT6VfgvQuUny/qVmFJVOuGhJtKMZVSf00K
	 sjdvPK7bL6lsUWoYWqG7FdaBE6gWi/VYPiZrlKGGlD+MWbzJVXOHsQ0i4L+uSmIsRP
	 RKBuypJuYdPVA==
Date: Fri, 27 Dec 2024 01:07:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Actually make use of the I2C_DW_COMMON
 and I2C_DW symbol namespaces
Message-ID: <3lngh3xdllg5bx5u6uhzn42r557axqyrdpcmezg33nv75rngjv@pxifwvw3rhae>
References: <20241203173640.1648939-2-u.kleine-koenig@baylibre.com>
 <Z09bp9uMzwXRLXuF@smile.fi.intel.com>
 <aenflylxg46hie6yj2hzlelnzbq42mox24fzzz7o44dvb3j575@r2hgad4ghgym>
 <Z0-vKE3FLxa2BWmS@smile.fi.intel.com>
 <k75ryxfif2jhzb4b6ipkyxol22rt4p4uv4dquajkiwj5m5du6s@mxe2q7s2n575>
 <Z1Fb7eYPr8y_l2dT@smile.fi.intel.com>
 <907e39c2-ca06-4b51-9fb0-5b0745bf0f56@linux.intel.com>
 <Z1Fjuo9Js0NzX5lH@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1Fjuo9Js0NzX5lH@smile.fi.intel.com>

Hi,

On Thu, Dec 05, 2024 at 10:26:34AM +0200, Andy Shevchenko wrote:
> On Thu, Dec 05, 2024 at 10:12:43AM +0200, Jarkko Nikula wrote:
> > On 12/5/24 9:53 AM, Andy Shevchenko wrote:
> > > On Wed, Dec 04, 2024 at 11:25:40AM +0100, Uwe Kleine-König wrote:
> > > > On Wed, Dec 04, 2024 at 03:23:52AM +0200, Andy Shevchenko wrote:
> > > > > On Tue, Dec 03, 2024 at 11:46:07PM +0100, Uwe Kleine-König wrote:
> > > > > > On Tue, Dec 03, 2024 at 09:27:35PM +0200, Andy Shevchenko wrote:
> > > > > > > On Tue, Dec 03, 2024 at 06:36:40PM +0100, Uwe Kleine-König wrote:
> > > > > > > > DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> > > > > > > > is included. So move the define above the include block.
> > > > > > > 
> > > > > > > As in the other email I pointed out the doc says that we need to undef the
> > > > > > > symbol. No need to move it around.
> > > > > > > 
> > > > > > > The only requirement is to place that before any EXPORT_SYMBOL*() we want to
> > > > > > > add it to.
> 
> [...]
> 
> > > > > Perhaps we need to update the documentation first.
> > > > 
> > > > I addressed that in https://lore.kernel.org/all/3dd7ff6fa0a636de86e091286016be8c90e03631.1733305665.git.ukleinek@kernel.org/
> > > 
> > > Thank you!
> 
> > Andy: is this your reviewed by? If so then
> > 
> > Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> 
> I would like to have a clarifications from Documentation to be settled down
> first. When it's done, depending on the outcome it may or may not be my Rb tag.

ping! Andy, I don't feel like merging this patch without your ack
as you had quite many comments here.

Can you please check here again?

Thanks,
Andi

