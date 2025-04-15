Return-Path: <linux-i2c+bounces-10344-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AC5A89DDC
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 14:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FE6A17507A
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 12:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A0729E040;
	Tue, 15 Apr 2025 12:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2BqASOY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4E0297A77;
	Tue, 15 Apr 2025 12:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719559; cv=none; b=GZXDKTlVuIAoDvYOzKDZU4GZtHHSKgN7HttF94yPxL4vM2siwC+5XdbWKwIh/VEGquWDbHug9D0RWIvWTpNUkNLcOlx/YPmKrOh8+0lTf5DCAoutfx5K3DrGMOUCNE5xDeHhcYZq2qyot+I4agcvoAZ6VM9N0ND1Kzb7LWumEaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719559; c=relaxed/simple;
	bh=hj51LJSrIDJ6v7LWBhVZb8UiMw0jv6RgoxBncZhvdQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doIZlQqKKxhBkFH62Fkm6K/qFlAmSeyjv+WQVjISKTl3Jxe7ndyNDeND0dDystiQg56LZyLUA4P6ehB0RqBDQuVkxmnqCOmFCRxEC8aUoC1yLeIzol4SFE9eCvPrQrBudANVXPqt+aRRONJXHz9Mumef9u+zpvOOZ66EfMYNDT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2BqASOY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744719558; x=1776255558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hj51LJSrIDJ6v7LWBhVZb8UiMw0jv6RgoxBncZhvdQU=;
  b=a2BqASOY7ZNkyv6/6rdGAnRAgA/bTDiNp7/laYGkOMUK5JvYWsECih6k
   wrP5XLqFdzaczTm8DdKT1VTkj2PfVXBELw/iJj0obUDkmQyak/beiW5JS
   xroRfftWckCgMAcEqLe4o/1XNnLnwNoaST6l7W60towiiEuBGkk5zr1rm
   7KT7gNCJ1YozcVt248RGumdaiDSgBIeOr6b15WmZk9WTNYrUoqV/i1C8m
   phpD3chsKGeM08/q0fRcsHPrg7SbuyLkCmkY/eSmfkHtiZVcCF87TECeb
   qV2SzJAMAqoDoxB2aO6VnPxWwHV/L2TdJaY30rBPDwxIoOvQ0kKJ26Oh3
   A==;
X-CSE-ConnectionGUID: iL54V8RDSPSBttPOxOu3wg==
X-CSE-MsgGUID: Jlw7PrS8SxCpUUuz4YUG6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57608717"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="57608717"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:19:17 -0700
X-CSE-ConnectionGUID: CRCSHD/aTsq52Ni4gnPGLw==
X-CSE-MsgGUID: T7Vi5/NkQ5qCdYo8/ipJHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="129876283"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:19:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4fFv-0000000CXZp-28pY;
	Tue, 15 Apr 2025 15:19:11 +0300
Date: Tue, 15 Apr 2025 15:19:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: Luis Oliveira <lolivei@synopsys.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	kernel-team <kernel-team@cloudflare.com>
Subject: Re: Hitting WARN_ON_ONCE in i2c-designware-common.c
Message-ID: <Z_5Ov9j-tF8rABDZ@smile.fi.intel.com>
References: <20c191d9-5f7a-4ec6-a663-dcc8d0b54c18@kernel.org>
 <Z_5OYSxZS05LO7cE@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_5OYSxZS05LO7cE@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 15, 2025 at 03:17:37PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 15, 2025 at 02:03:26PM +0200, Jesper Dangaard Brouer wrote:
> > Hi Maintainers,
> > 
> > I'm hitting a WARN_ON_ONCE in drivers/i2c/busses/i2c-designware-common.c
> > when booting the kernel on our Gen12 hardware.
> > 
> > I'm using devel kernel net-next at commit 1a9239bb425 (merge tag
> > 'net-next-6.15').
> > 
> > I assume you want this report.
> > 
> > Maybe it is not a critical error(?)
> > ... looking the comment in the function:
> 
> Have you forgotten to compile in the drivers/acpi/acpi_apd.c?

Also that driver has the missing error check in acpi_apd_setup() for
clk_register_clkdev().

-- 
With Best Regards,
Andy Shevchenko



