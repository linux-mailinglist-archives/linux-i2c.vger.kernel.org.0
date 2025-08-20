Return-Path: <linux-i2c+bounces-12361-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C11C9B2E2AB
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 18:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B26B11884E6F
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 16:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD193314DF;
	Wed, 20 Aug 2025 16:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfkjQSOV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179F013B58D;
	Wed, 20 Aug 2025 16:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755708623; cv=none; b=l8vOuwrClDIdiQC42MOi3UMIkts7NWjCSVURdPlRwVirdQljfPsSea1NT0gIbSSppxk/70f4UM1yQKPf9t1Js1nJjp/+qsb12rmxE0RCoyz21h36wkIneSzJvGWCYJGpqXJ4/VtbSey2FK4fVn25m3CZKlC5Dl9mR4iQv6LdFKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755708623; c=relaxed/simple;
	bh=CtbPTX7io4A3Gz773g0fcOqxjCbVp6eJsQ6NMB+qqN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lED2HXxKMbbIk0Ae+d4b7CI2Skzu1OXbcbx257tn5wCTEhgGWeHe4+Kt4LZn8+/eFLSSei6FbgT/B6Zb++21fPv1cwbfF8XV27WLhquGoAhJ5ugDyFL38VWuqt3Ufcbhm2Zcgt3tbmeluxuU/6Hn23FjBIURLJL6HMnpi+OZwIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfkjQSOV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49CAC4CEE7;
	Wed, 20 Aug 2025 16:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755708622;
	bh=CtbPTX7io4A3Gz773g0fcOqxjCbVp6eJsQ6NMB+qqN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nfkjQSOVZ3kCT0Y/Ex1hFMpGO9+3OIBpWKvnbNqBte3J4Ae+8lZN6Fv6EY9Oxat/w
	 NedTgQzXwb5JcQEde2pRZpK3SdF8jVBJJ+rwEbsW9N/OfA8Y5DnKQVwL6qGVqND3Ru
	 upoqfFiHb/SejQN+/U+6PT8L0WK6vu0oULm9JrBn4tYOzZBpw58gKYwADNwb7CnLA9
	 xBSe3CUv4uTvcORhuoq3H7+0bwMvAz4i9VjDo3v+3KKVdcGjdklM0bpt91QcdK9ioq
	 DWnpWESUCrSvBx1cyqrZdHEg8H2TORAMhJdVwC/TLmrS0SlxNDXXWMEx93MDL54Os+
	 ks8yAuotHcC2A==
Date: Thu, 21 Aug 2025 00:33:08 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: designware: Avoid taking clk_prepare mutex in
 PM callbacks
Message-ID: <aKX4xEYE29JC_g14@xhacker>
References: <20250820153125.22002-1-jszhang@kernel.org>
 <20250820153125.22002-2-jszhang@kernel.org>
 <aKXyVvFOvpsaAEAB@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKXyVvFOvpsaAEAB@smile.fi.intel.com>

On Wed, Aug 20, 2025 at 07:05:42PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 20, 2025 at 11:31:24PM +0800, Jisheng Zhang wrote:
> > This is unsafe, as the runtime PM callbacks are called from the PM
> > workqueue, so this may deadlock when handling an i2c attached clock,
> > which may already hold the clk_prepare mutex from another context.
> 
> Can you be more specific? What is the actual issue in practice?
> Do you have traces and lockdep warnings?

Assume we use i2c designware to control any i2c based clks, e.g the
clk-si5351.c driver. In its .clk_prepare, we'll get the prepare_lock
mutex, then we call i2c adapter to operate the regs, to runtime resume
the i2c adapter, we call clk_prepare_enable() which will try to get
the prepare_lock mutex again.

Regards.

> 
> AFAICS it seems related to the bus recovery mechanism. Is this what you have in
> mind?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

