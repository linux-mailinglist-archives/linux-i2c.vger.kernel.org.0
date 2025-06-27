Return-Path: <linux-i2c+bounces-11655-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7B0AEB527
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 12:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FABD566B6F
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 10:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C284265CB2;
	Fri, 27 Jun 2025 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBFf+IEC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A6A78F2F;
	Fri, 27 Jun 2025 10:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020600; cv=none; b=nH6QkQtU/ikkpKoNpq2lievhBnvTadFhoGrbcMWh7s3PRgvvhzwRNelkKo4kHH3M9Dc2kfH5S2bLz1PHsEakldb76g2xwmQAQNhOXBkatagOgQuVEinrMT7vRWm0dflseyKglG4OL1buDj3mNz8m+Oyg02TNQAyzY7WUMfyBptI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020600; c=relaxed/simple;
	bh=F+uRNln6GKUDwBvy95ZRcxSahVIFgheNcF0YXMwj5YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aibp0KZLHdmg08r7/yyo/525debVUnNID73O2LHPQkJGoIvzGqsmYiVE4VA2jiq9GaSZ0FlcgTqrnFyQjFGP8H1q9MsTPoS7AdEdndBrnjvj4hVW9oz1AJtjQB3wtDFLOc4Ly9W/THdpQ9UAzUHeqCQOrPhQMQ5X82or6i/t5+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBFf+IEC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751020599; x=1782556599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F+uRNln6GKUDwBvy95ZRcxSahVIFgheNcF0YXMwj5YA=;
  b=hBFf+IEC4+HCAZ1V5QYeV5blp0dds7HdBATDgReWPktpHTVu+2RAGTjL
   XQQfA/sPm6QhKuccBqjN4H4am3cWS/hIGKEdYwKqiMQelYMTA3bCQbChN
   tuPBszG7w9q4XrFF/elUqlLXP8itg/VxVXUWwO7qXYUeDNd1W4PVJe6kZ
   hN2WWchUp7o/tEkgmcJi2mySdHEXe6GGzKy7ud16xmgsEjf7EKetdvjSx
   8TkZakD6iRAuowIaq/JgC4uNow1t3DtKOe/kuHRBW47Yh2rgtU3ICoE2+
   b7NhNc+Rk7pGbrAXXXckIaCRRle6OA3JBbtppKzVVvZhu7rRilOAyTK7P
   w==;
X-CSE-ConnectionGUID: ETiL+x9ORz+vFPDtkEXjhQ==
X-CSE-MsgGUID: RaGhCI2wT/yvBbLJwSYsrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53455544"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53455544"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 03:36:39 -0700
X-CSE-ConnectionGUID: l6OZEQAVQfyxuEWK9z9ljg==
X-CSE-MsgGUID: avz7HfigQ52NZ1nUh6WloA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="189967185"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa001.jf.intel.com with SMTP; 27 Jun 2025 03:36:32 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 27 Jun 2025 13:36:31 +0300
Date: Fri, 27 Jun 2025 13:36:31 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] drm/xe/xe_i2c: Add support for i2c in
 survivability mode
Message-ID: <aF50L3QcyJQ6VRxQ@kuha.fi.intel.com>
References: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
 <20250626135610.299943-5-heikki.krogerus@linux.intel.com>
 <aF1YGk2TNda9r32o@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF1YGk2TNda9r32o@smile.fi.intel.com>

On Thu, Jun 26, 2025 at 05:24:26PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 26, 2025 at 04:56:09PM +0300, Heikki Krogerus wrote:
> > 
> > Initialize i2c in survivability mode to allow firmware
> > update of Add-In Management Controller (AMC) in survivability mode
> 
> ...
> 
> > +err:
> > +	/*
> > +	 * But if it fails, device can't enter survivability
> > +	 * so move it back for correct error handling
> 
> While at it, add a period at the end.

OK.

Because of the vacations I'll send v5 already today. There is still a
failure report from the CI system that I'm not able to interpret, but
I think it's happening because the I2C endpoint is not accessible on
every GPU. I'll try to solve that by limiting this to BMG for now like
it was originally.

thanks,

-- 
heikki

