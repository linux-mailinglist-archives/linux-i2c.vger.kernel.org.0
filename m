Return-Path: <linux-i2c+bounces-9000-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56971A0747B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 12:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11F94188A718
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 11:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0628A21638F;
	Thu,  9 Jan 2025 11:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVUw8XMr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2CF202C43;
	Thu,  9 Jan 2025 11:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736421555; cv=none; b=bgpLwQr9Vqrj9oZKlLEHTfM9UBfjl5AZm9G49ez7b6qYhtWtcYivoK9LNMSFu3FGnekPBMK8rgZp9yuAqsgDNE+vZ5ycrzTGPFwTKfiRtOQwVxyO2LadUQ1TqvEjtmtRO/KsZ8Z7KOHpP8yCh7jZiCdQHyiI4omyO68j/RoB4MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736421555; c=relaxed/simple;
	bh=WxwcIJ8QgAtWHwR589DNkCS616Mzly8B+XKgsKObjbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJBwnLRsK8je5iqbLIHFlbA0PEn0FBWpTxAr9Yab6Pk7YPRPWjXh9onudPLSULRs6+i8AC1Uq47kXi7JD0/NulEKJq7qf/S4fWx1ScRaxw4tTB4eaV66jy0wIzqqC0gB5m1um6L7/R/mcuo8Fj2xGhS7KL2eO/X6W+xXGNaB8AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVUw8XMr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736421554; x=1767957554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WxwcIJ8QgAtWHwR589DNkCS616Mzly8B+XKgsKObjbk=;
  b=dVUw8XMrXv9DyEHX4HXnGpjkzImfbhZFrz9JZ0kbDaheqe0uYfmujmIz
   pP0jLy+kbFgyuYmQdW4XkplYhDTDNr3cIcgjXvFcPl7xXFGmLFYy0Ex1N
   G6zKWtjxF+G6S+yiifwY59AkB6R/7gpxQH7QUnum7AxiY7m8jTOiJz+JK
   RgelL+YTlvhWyCmDFarYcSWiTOTa5e6wIfiJAA1HGaotQGnpnLkDb7G/D
   8B+JUUhKROSbZfXQFcTgoZdM11LvxUR2G1Kxo69V1eekekb4ZRdVMbb+j
   tAs3PozkyyO1ECJ1d/In7aMehVje3klOKF7QRYiuV39Ilf+MMLVWs/c9J
   Q==;
X-CSE-ConnectionGUID: tmfUX6chTOWf9IDk8hXvOg==
X-CSE-MsgGUID: y6wEAGe6S1StGp40mXKiMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36835797"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36835797"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 03:19:14 -0800
X-CSE-ConnectionGUID: MUvp1eN+RgyuCwmZVbCW8w==
X-CSE-MsgGUID: ww/B9R4ES/qhaYFVVkk6lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="108280463"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jan 2025 03:19:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D94B13C3; Thu, 09 Jan 2025 13:19:10 +0200 (EET)
Date: Thu, 9 Jan 2025 13:19:10 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: R Ha <rha051117@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
Message-ID: <20250109111910.GD3713119@black.fi.intel.com>
References: <20250103051657.211966-1-rha051117@gmail.com>
 <20250103051657.211966-2-rha051117@gmail.com>
 <20250103093353.GP3713119@black.fi.intel.com>
 <CACHtJB-rZ6SKF3d3xTsbJ=zQ+fPVcCcYxXLX_yMRdpE_4tyYYw@mail.gmail.com>
 <20250105083358.GU3713119@black.fi.intel.com>
 <CACHtJB94K5OLdHgs8dDj4jDBtZmsdymovboCcJJUt5OkD8o+Mg@mail.gmail.com>
 <20250107072746.GW3713119@black.fi.intel.com>
 <CACHtJB-4UGaqKw5zZjE_vPeYX+bMUMiHPNfNYzD6Wmv6jdAuhg@mail.gmail.com>
 <20250108055150.GY3713119@black.fi.intel.com>
 <CACHtJB-33Pgoj0xORt75G0=cyoKem_K=Dfeg0iQNow18v2sV6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHtJB-33Pgoj0xORt75G0=cyoKem_K=Dfeg0iQNow18v2sV6Q@mail.gmail.com>

Hi,

On Wed, Jan 08, 2025 at 03:29:34AM -0600, R Ha wrote:
> On Tue, Jan 7, 2025 at 11:51 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > There should be Device() node for that too. The ones you listed are just
> > child devices connected to that bus.
> 
> You're right, after searching for Device nodes I was able to find this
> snippet. But it doesn't seem to have anything related to HCNT/LCNT
> values either, but maybe they're hidden somewhere.
> Thanks for the tip again.

Can you share the whole acpidump? It is easier for us to check the
necessary descriptions directly from that.

