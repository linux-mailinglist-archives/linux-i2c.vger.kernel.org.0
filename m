Return-Path: <linux-i2c+bounces-12545-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E57E2B3EB77
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 17:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68CB73B8D5F
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 15:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49387199BC;
	Mon,  1 Sep 2025 15:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBG6Gal+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4F919EED3;
	Mon,  1 Sep 2025 15:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756741539; cv=none; b=jiJr+4HE+LsKOy6RkLjBIzI4YiguyXyKW2CqaQL9dC3rNOcn+luRTXv1NfZVLQj4fEOJIauFcuV74CUSL5NDpc0YyUU7nJEKD4+1crjLnAINQeUyo6A6vdbAUOd8H6JGESZujjhokgk+7lfuxJbfIbKaO5QS8mfygU9YkV7Z0T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756741539; c=relaxed/simple;
	bh=zxaxdww8toDhus2z2vp/yYJXW2OksJavlXEQDZZP3JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2uA7HICkHONI1G+6M49JnbJNzgAKNCvNlph45XQgfFeiEVUbCTfk8vcDj651iud70ZvfFU+UR8iqhBJSOzZG3vmEeqLOAdhyFP8KGrMsIQc6DQAADDHe9dEPQnBmADkchICBP4/YsyjYPjylOF08NWDxkV5YknBPIdDepCxMws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBG6Gal+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756741538; x=1788277538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zxaxdww8toDhus2z2vp/yYJXW2OksJavlXEQDZZP3JI=;
  b=QBG6Gal+WbVfxpp9I4S1nQaOdhhjHA/vlfdHlaNK10QFelGEecGtlSab
   mW9EQ6gGjX6SB3XMh/Fp2/0AcuuRXkFv7bBdOMdYjpXs4GXLqtgUL5SPf
   S3sv+UkpdyhFOJ80sjxEsv1uVEIzZsCps6DRoFEjh7BtMIgzyn008N6QN
   jYWF3g6FdevYIMqebrqlCDqicyXusePxXICHcVHN8vwkvGdIP3eowTlmT
   c6qOw95IKZOpJZciIGLv6AgoUSyi1NKD11ncQvJUJYwcCx108vH0oPxrN
   PgNRVWAMjPHmQqGEsWJ3415RI/5MLlc0DZGBvSOKIZPauIaO1yjE9QZmm
   g==;
X-CSE-ConnectionGUID: SmtdwcGeTBGDPgmIKVLQnA==
X-CSE-MsgGUID: lJ1sBseqQLykJjSOy8G3VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70433353"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="70433353"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 08:45:37 -0700
X-CSE-ConnectionGUID: L5oquOi4RzSHvuGPIcM5QQ==
X-CSE-MsgGUID: meWZh0FPSAi3ZPDUVfbplQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170917036"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 08:45:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ut6io-0000000AScj-2OEy;
	Mon, 01 Sep 2025 18:45:30 +0300
Date: Mon, 1 Sep 2025 18:45:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH v3 0/2] i2c: pxa: fix I2C communication on Armada 3700
Message-ID: <aLW_mqrhnRIsW-pc@smile.fi.intel.com>
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
 <aLVmKrxEzYgbMUQU@smile.fi.intel.com>
 <3d3c9d5a-d3a4-4c94-8199-a5870474aa23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d3c9d5a-d3a4-4c94-8199-a5870474aa23@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Sep 01, 2025 at 05:24:51PM +0200, Gabor Juhos wrote:
> 2025. 09. 01. 11:23 keltezéssel, Andy Shevchenko írta:
> > On Wed, Aug 27, 2025 at 07:13:57PM +0200, Gabor Juhos wrote:

...

> >>   - remove Imre's tag from the cover letter, and replace his SoB tag to
> >>     Reviewed-by in the individual patches
> > 
> > Note, this can be automated with `b4`.
> > 
> > 	# Start a new branch of the same base
> > 	git checkout -b v3 ...
> > 	# Apply last version from the mailing list
> > 	b4 am $MESSAGE_ID_OF_v2
> > 	# Do actual development of v3
> > 	...
> 
> As far as I know it can be used only to collect tags offered publicly on the
> mailing lists. I can even use 'b4 trailers --update' for that on an existing b4
> tracked branch.
> 
> However, the current case is a bit different. I have replaced Imre's tag
> manually according to our previous discussion [1].

Right, but technically it can be done via `b4`. I thought you have done that
manually. Seems I misinterpreted things.

> [1] https://lore.kernel.org/all/aJyM3N9T4xI4Xo1G@smile.fi.intel.com/

-- 
With Best Regards,
Andy Shevchenko



