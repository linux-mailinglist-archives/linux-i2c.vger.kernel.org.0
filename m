Return-Path: <linux-i2c+bounces-7200-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E2598ECC2
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 12:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E6701C2213F
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 10:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8AB14B972;
	Thu,  3 Oct 2024 10:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chbmN3cS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C96149E17;
	Thu,  3 Oct 2024 10:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727950560; cv=none; b=B6qMU27gbCc+d5F7a7HBbG5evuM7otZtHcjuDapjUJzqNIYdgrlGiXtwfo9bAm1v+zRqDN4pieOMQtBTCJBueFPuo95ON0jfbrjXcdnsBKbrdMBzpbdcVQ1VRWBDfV6HoVWRkXyFeoMLqYxyRomuviBa2u/WyN7sAkFH9FS2I3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727950560; c=relaxed/simple;
	bh=qqEr/d7JEF3M3078b1QH5LAWJO35b+cVIAnjF94+Bxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDDBY3+mdGLGp0ls0dL6MP0il9azs6B6mS0pFajsOo60pW8XFFnPtaoE8/mkpkcDxEzICa1fmLhDtE3wa/Avqq+Lk8p096zbCn3eOwZ9H9dZjjJaqKHqS35tzSa7ETO8rv4ZSgJ98lMkPwUmKcv95XbaW1wrXhgC/Hfl2DQbbYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chbmN3cS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727950559; x=1759486559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qqEr/d7JEF3M3078b1QH5LAWJO35b+cVIAnjF94+Bxg=;
  b=chbmN3cS6bcwkyO57yOVBGuu4aY+/98K135N/jshvHr6QKYp788skx+K
   r5jncrXk2wBHKuFdT2m66TTITtOmVrVYnl30qyQ1inrwj9VIuTMMxdbNx
   P1p7d6k2fVqXxd2rDZ7MpSkQcEfEQo2qz8eZFgyB96K6IkRcAAI5eGKx2
   A9la9tvmNm+J2L+DticRrszpoPu4kH9KgT5yz0RSfFUhr0GAb9gJ0EJEh
   /4qcBmvWpkDHpNay32QHEafmh5rISIq3D//3HUdebjVbgHoYLlYIqAYOx
   hMrQyyo/2JaBOpwKPxT2iSS+VfhR9qUqlAcJf3o1oJvYtYgC/Xa6WF3Ag
   A==;
X-CSE-ConnectionGUID: cTd2I2vGSPu2sICHGxr3Pw==
X-CSE-MsgGUID: wtS1hPyKRa6TTo6MrC3Z4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27316565"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27316565"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 03:15:58 -0700
X-CSE-ConnectionGUID: scu9vYm7Q3m+jU3LjkymsQ==
X-CSE-MsgGUID: DmjSEk4eQZq8E6Eebv1+Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="111764920"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 03:15:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1swIsB-0000000G5Fu-02QF;
	Thu, 03 Oct 2024 13:15:51 +0300
Date: Thu, 3 Oct 2024 13:15:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
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
Message-ID: <Zv5u1gTK9yug7rbK@smile.fi.intel.com>
References: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
 <Zv1aOedi9xl2mg9b@smile.fi.intel.com>
 <SI6PR06MB75359904E108D7D0CC89A329F2712@SI6PR06MB7535.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SI6PR06MB75359904E108D7D0CC89A329F2712@SI6PR06MB7535.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 03, 2024 at 03:41:57AM +0000, Ryan Chen wrote:
> > On Wed, Oct 02, 2024 at 03:02:10PM +0800, Ryan Chen wrote:

...

> > Is it possible to switch to new terminology wherever it's possible?
> > I.e. master --> controller, slave --> target. See, for example, f872d28500bd
> > ("i2c: uniphier-f: reword according to newest specification").
> > 
> Just for cover latter? Or I should modify for each patches commit message?
> Or entire i2c driver statement need switch to target?

I believe everywhere, where it applies: driver code, comments, documentation,
commit messages...

-- 
With Best Regards,
Andy Shevchenko



