Return-Path: <linux-i2c+bounces-832-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED51C814BE8
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 16:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A30F31F24D51
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 15:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032D737166;
	Fri, 15 Dec 2023 15:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRh1Obav"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0821A358B1;
	Fri, 15 Dec 2023 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702654628; x=1734190628;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gggyTvhIQQffYiqOsRc4Wa77hkTIwY09FT5eCjUPRzY=;
  b=IRh1Obav5aH5lTJWE4dh+NM3s6D5sH46UXUECWzvgE1RDyrfgxLOZbM+
   X+q42fm8Q4TEyL40IHHuM8NFrkkJj6m8Q/rxCbbMsNlEa5//dvHhqf2HP
   CSmMtiSZAHqVvp0QeTx7JJgGqnrPEjV5qKQHCezO7Rzxpwkrp9GxZod3N
   xfl18HwG0hS3bYsMDddJjOD7+7ltM8tTqvnBnSBBTBMKH84zxNuhRysVg
   8CULVZ5u1xwXhvM5zrc69kGS2x8sjXuuP68yJSgKA0Tnf1Qa31ucd8L1R
   JGeOs1Sb8v3wPPi1W5Op0kzZ58Ajpw5pV0lI6NBihIlb3//j9W0t95XXG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="385708007"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="385708007"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 07:37:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="809009870"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="809009870"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 07:37:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rEAFJ-000000069q4-3gRQ;
	Fri, 15 Dec 2023 17:37:01 +0200
Date: Fri, 15 Dec 2023 17:37:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-pci@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH RFC v2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Message-ID: <ZXxynbIS8kd3KQuy@smile.fi.intel.com>
References: <20231212114746.183639-1-shinichiro.kawasaki@wdc.com>
 <ZXsvkWeJvdkvrf5e@smile.fi.intel.com>
 <20231215075210.GA15884@wunner.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215075210.GA15884@wunner.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 15, 2023 at 08:52:10AM +0100, Lukas Wunner wrote:
> On Thu, Dec 14, 2023 at 06:38:41PM +0200, Andy Shevchenko wrote:
> > On Tue, Dec 12, 2023 at 08:47:46PM +0900, Shin'ichiro Kawasaki wrote:
> > > +/* Cache BAR0 of P2SB device from function 0 ot 7 */
> > > +#define NR_P2SB_RES_CACHE 8
> > 
> > This is fifth or so definition for the same, isn't it a good time to create
> > a treewide definition in pci.h?
> 
> This isn't something defined in the PCI spec but rather an x86-specific
> constant, so should preferrably live somewhere in arch/x86/include/asm/.

I'm not sure I am following both paragraphs.

> If you have a "maximum number of PCI functions per device" constant in mind
> then include/uapi/linux/pci.h might be a good fit.

This is indeed what I have had in mind, but why is this x86 specific?
I didn't get...

-- 
With Best Regards,
Andy Shevchenko



