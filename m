Return-Path: <linux-i2c+bounces-7207-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9025F98EF5A
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 14:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D5D9B2305E
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 12:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49723189905;
	Thu,  3 Oct 2024 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQcExD/t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12310186E42;
	Thu,  3 Oct 2024 12:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727959168; cv=none; b=i7cZN0d1aXVzPOOAfqUEFt8dj6lq6AmDnCq08E6WYS1aZWQ3v32E+RcF+QWQIiDKvROQkhIyAOskzsESgK5GEoxZSkXvjXSXNHw8/FTA9N1VuQqQIDCoThUcLmVtPrmvLCadUQW/T/qNqE5OP0w2gVCJeDdHr3McQK0LS/zELdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727959168; c=relaxed/simple;
	bh=jJqZlWZyRRWoe9bZ1pTGj+NsxagcVSsJs5dIspW8QMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1JpEJ4EwHOWMBl2LkrPxA65u7tSl11BuDlrhe7ECp+OjuBGfhON06Sj1ueDJ+RtX2lrtdLRIsSFiZgqegMrk9swphxGYRJf2eRyug/z8EXXZOat6GTkNH+yEky2gZv7i5RsMP1mMr1ZFvQWMGNeX+vlMfL744o61AtwZmnpoXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQcExD/t; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727959166; x=1759495166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jJqZlWZyRRWoe9bZ1pTGj+NsxagcVSsJs5dIspW8QMY=;
  b=DQcExD/t6LGZAyZr5rqu4MuMqZ4559rIo9EqHQ7HOeqmQ/knjmD1swI+
   pjM5ItyW6Vnz4HOhIH15VtMWVC9P05N5/O16t30MS/F6AfleC0pRSsQie
   Zc1bV10uOaRpJrtDySoFnfYsDZYX8UMxHR6QaVEQ3uqmgN+H8hGDZxGfO
   5F4kV3TTT107bnrrhuMJFIriZxyFtnNoUFeUY1aqJMmvTGFA3CiS2N3j2
   Jmnpb6ohkqZ4qzDdr+1gIks86k6EbHLHHZb+u1KPQT2JPt5+EiRf+xjvo
   U6RG1Vvr5blNKeoKxbj5wzckXpK4VsF8Izot5yGFxGSA42L9HRhypdqrd
   w==;
X-CSE-ConnectionGUID: epIsiQW8TNa0Ns7XenoPvQ==
X-CSE-MsgGUID: UlWk40AGQH+5XwVjQjR27g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="14766788"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="14766788"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 05:39:25 -0700
X-CSE-ConnectionGUID: VZ4FQ9ZJTiukwSGcRxIw8w==
X-CSE-MsgGUID: Q+m6TP+eSkKye7Bb4NxYAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74188410"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 05:39:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1swL70-0000000G8x5-0KUx;
	Thu, 03 Oct 2024 15:39:18 +0300
Date: Thu, 3 Oct 2024 15:39:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
	"brendan.higgins@linux.dev" <brendan.higgins@linux.dev>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Message-ID: <Zv6QdUuiUFvXjcd4@smile.fi.intel.com>
References: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
 <Zv1aOedi9xl2mg9b@smile.fi.intel.com>
 <SI6PR06MB75359904E108D7D0CC89A329F2712@SI6PR06MB7535.apcprd06.prod.outlook.com>
 <Zv5u1gTK9yug7rbK@smile.fi.intel.com>
 <dun5dterlkikft4p2yuuebb2e4nyzed7xeofmeivzldeardhmf@kzv3iokk6cxn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dun5dterlkikft4p2yuuebb2e4nyzed7xeofmeivzldeardhmf@kzv3iokk6cxn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 03, 2024 at 02:20:54PM +0200, Andi Shyti wrote:
> On Thu, Oct 03, 2024 at 01:15:50PM GMT, Andy Shevchenko wrote:
> > On Thu, Oct 03, 2024 at 03:41:57AM +0000, Ryan Chen wrote:
> > > > On Wed, Oct 02, 2024 at 03:02:10PM +0800, Ryan Chen wrote:

...

> > > > Is it possible to switch to new terminology wherever it's possible?
> > > > I.e. master --> controller, slave --> target. See, for example, f872d28500bd
> > > > ("i2c: uniphier-f: reword according to newest specification").
> > > > 
> > > Just for cover latter? Or I should modify for each patches commit message?
> > > Or entire i2c driver statement need switch to target?
> > 
> > I believe everywhere, where it applies: driver code, comments, documentation,
> > commit messages...
> 
> If the datasheet refers to a register, state, or any other
> hardware property as master/slave, we should retain the
> master/slave terminology. Otherwise, we should follow the i2c and
> smbus specifications and use controller/target.

Indeed, makes sense. Thank you, Andi, for the corrections!

-- 
With Best Regards,
Andy Shevchenko



