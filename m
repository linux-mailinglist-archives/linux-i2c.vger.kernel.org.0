Return-Path: <linux-i2c+bounces-5743-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D410F95CF35
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 16:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05C851C2090E
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 14:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DADD18BC24;
	Fri, 23 Aug 2024 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEImtkXY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA3118BBBA;
	Fri, 23 Aug 2024 14:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724421870; cv=none; b=dOC7ZCLOTfQrO3dQuLC1kn5XhKU6ZYUCgFaA/8zIeWCG7qMQJy4hnLQunEWSc9IbWRaCM7/Ueya8+Ra8V/7hvIKDCUVjf1iJdgi9wWS8zkipM1NiKiB17LOTTZ4pN1t8nTW7/7dey5iKllkB252SsW8kv11/i7uZ0G6IWMk0/B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724421870; c=relaxed/simple;
	bh=RarjRljA012H8GjcXE0795+YxS0vJ/uKSKtUTKIt+3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOMSKq4LD0R6aCYRSQFbln/u5mJRa4jwE8hOUaCHIyIJBXdc+lCkyhosg8fjOlHqCzFc6K92ynhE+zJ/xp2n1j6ZPtXJOTKOoQO8WHToVJhBGl8yaJmQIKhX5sYCvnkFD6cmhikFVj1ybF6vZpnlL4KPKsQhRSACsGsYX/XJnQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEImtkXY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724421870; x=1755957870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RarjRljA012H8GjcXE0795+YxS0vJ/uKSKtUTKIt+3k=;
  b=FEImtkXYtBgaB7Rgy0+5vIGvWwWDe2GkC9acX/H88KrLIrKLipQGOQyO
   7P2PIRjSBJKgVp/acltwcVtVB3bFE4V9clTSOqP14C1Ysm+kvxmqbFhra
   ryzVTZmFB3w3SmkPr8Mf72H8GoPnbdf7gmgUOmq9YhLD5imYcau86fgkV
   3UlaXvnQDJ1hN4VHPFDPyKWgeIUDS4efwIJbmi77G6PJGykl8bu3YE11h
   Wl8Zle+3cu63lT2ljhvfu04mEOgMfL82GTx0rDT50phXv9CEQRwkQEsFX
   lhPL/8EGddbqLPMl7vF79C8gvRXhSg1UEV3b6XNjNMGR4Db6J/84UelMY
   Q==;
X-CSE-ConnectionGUID: KVLbtHE7QqeAnr+SJJ0f8w==
X-CSE-MsgGUID: OJwEWCdnR0qKkas4b06jFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23016209"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="23016209"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:03:59 -0700
X-CSE-ConnectionGUID: 5SVtqCkpR1OhiuzSknEhTQ==
X-CSE-MsgGUID: o2GSPqwpSdKx8bDzLi+utw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="66126708"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:03:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shUsq-00000000oWR-0s0k;
	Fri, 23 Aug 2024 17:03:20 +0300
Date: Fri, 23 Aug 2024 17:03:19 +0300
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
Subject: Re: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <ZsiWp5ENQ0BeBjMn@smile.fi.intel.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
 <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
 <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsXVU2qy0GIANFrc@smile.fi.intel.com>
 <OS8PR06MB7541945591A62B956DA28AD9F28F2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <Zsc9_UddBybdnM1Z@smile.fi.intel.com>
 <OS8PR06MB75419F3E3A222AE941DE3007F2882@OS8PR06MB7541.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS8PR06MB75419F3E3A222AE941DE3007F2882@OS8PR06MB7541.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 06:23:54AM +0000, Ryan Chen wrote:
> > On Thu, Aug 22, 2024 at 02:24:26AM +0000, Ryan Chen wrote:
> > > > On Wed, Aug 21, 2024 at 06:43:01AM +0000, Ryan Chen wrote:
> > > > > > On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote:

...

> > > > > > > +	if (i2c_bus->mode == BUFF_MODE) {
> > > > > > > +		i2c_bus->buf_base =
> > > > > > devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> > > > > > > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > > > > > +			i2c_bus->buf_size = resource_size(res) / 2;
> > > > > > > +		else
> > > > > > > +			i2c_bus->mode = BYTE_MODE;
> > > > > >
> > > > > > What's wrong with positive conditional? And is it even possible
> > > > > > to have NULL here?
> > > > > >
> > > > > Yes, if dtsi fill not following yaml example have reg 1, that will
> > > > > failure at buffer
> > > > mode.
> > > > > And I can swith to byte mode.
> > > > >
> > > > > reg = <0x80 0x80>, <0xc00 0x20>;
> > > >
> > > > I was asking about if (!IS_ERR_OR_NULL(...)) line:
> > > > 1) Why 'if (!foo) {} else {}' instead of 'if (foo) {} else {}'?
> > > I will update to following.
> > > 		if (IS_ERR(i2c_bus->buf_base))
> > > 			i2c_bus->mode = BYTE_MODE;
> > > 		else
> > > 			i2c_bus->buf_size = resource_size(res) / 2;
> > >
> > > > 2) Why _NULL?
> > > 	If dtsi file is claim only 1 reg offset. reg = <0x80 0x80>; that will goto byte
> > mode.
> > > 	reg = <0x80 0x80>, <0xc00 0x20>; can support buffer mode.
> > > 	due to 2nd is buffer register offset.
> > 
> > I have asked why IS_ERR_OR_NULL() and not IS_ERR().
> > 
> OH, I will doing by this.
> 		if (IS_ERR_OR_NULL(i2c_bus->buf_base))

The question about _NULL remains unanswered...

> 			i2c_bus->mode = BYTE_MODE;
> 		else
> 			i2c_bus->buf_size = resource_size(res) / 2;

-- 
With Best Regards,
Andy Shevchenko



