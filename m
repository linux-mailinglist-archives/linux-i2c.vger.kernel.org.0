Return-Path: <linux-i2c+bounces-5837-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 360D6962970
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 15:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AFFFB20C9F
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 13:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874E2188CB4;
	Wed, 28 Aug 2024 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQbBxOiZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD4118801A;
	Wed, 28 Aug 2024 13:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724853362; cv=none; b=dKkG+xkwnAUmpZB13Ro2QvjQHX3gGkAmCctjJ/Fgk2UbdQ7HjmKmUSHY7bCHkGyvkrf/7FZ221tUwtbgvSLHWwzj67zyrgDAt5IDTNmQ+AIreua+HwUmkv+G5xm8DHhJQxXowQMgqVdiRmLDgWnR21VsONCzJKZxUP/RskxTV9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724853362; c=relaxed/simple;
	bh=0VzRvvBmgVfm22p7yRHWjS2uaHYDwDvXSohq3OgN8+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnIrno/DlnOx3FCYqRgSc/dptnFakZgXmSczp3m8TkClcteSODF5lrOEkfYgNgQuASCSx52HR4aQX4Ipkd+dEhgnnTFfWl9YciMc9TrC3+DxQP8U/jrd4CXSBf5DUIZluae+rMh41IVPhhPKufDa76HMD8btDVA6PEGh6A4gbsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQbBxOiZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724853360; x=1756389360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0VzRvvBmgVfm22p7yRHWjS2uaHYDwDvXSohq3OgN8+4=;
  b=XQbBxOiZgOL8vL0v/SZlGlwACUvSzMQNl2a1d2shS2iSxVonOM9KTtDJ
   brx27Ps7/sZs1vvBKeU6pUqGTKwNhle8a7wMcRIpKL9ULtzhSAgFjnQwJ
   LlqTe7t+gblokED5qSoevd5CvwH8d0+olFGBwbj5sOJel2rcz4UUl9zsP
   tBVdX9GbXtE0aANSA0KVd0tdgC8K8IGsuoZiuQcuANXI8++Xt26pJRiY9
   4D+fpKPbjT8Rq/AQ+DFbwIXS7swM8zrbYRXIr23nc61Ecdw+bHPR7yZck
   l7HC7qX6ZRYpGppCP2b0u8jBJtKaDgdwjy1a9WCnWzXyJRS1aZDsaiaAc
   Q==;
X-CSE-ConnectionGUID: kRi//x+NTLqzukKs2MZ6qA==
X-CSE-MsgGUID: IhSDKmTMQb6uCsByBLxQ3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34043155"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="34043155"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 06:55:59 -0700
X-CSE-ConnectionGUID: 7KbLavxjTum9E1alb/+xbQ==
X-CSE-MsgGUID: JxeN9lHhRK+ocKrrC6ERxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="67899095"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 06:55:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sjJ9M-00000002fDD-1iIN;
	Wed, 28 Aug 2024 16:55:52 +0300
Date: Wed, 28 Aug 2024 16:55:52 +0300
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
Message-ID: <Zs8saJYtCp6bO-3k@smile.fi.intel.com>
References: <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
 <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsXVU2qy0GIANFrc@smile.fi.intel.com>
 <OS8PR06MB7541945591A62B956DA28AD9F28F2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <Zsc9_UddBybdnM1Z@smile.fi.intel.com>
 <OS8PR06MB75419F3E3A222AE941DE3007F2882@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsiWp5ENQ0BeBjMn@smile.fi.intel.com>
 <OS8PR06MB7541A23130F469357B7FE5F4F28B2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsxbDK25mJ0sjcQy@smile.fi.intel.com>
 <OS8PR06MB75416ED990B2A32F98266A1DF2952@OS8PR06MB7541.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS8PR06MB75416ED990B2A32F98266A1DF2952@OS8PR06MB7541.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 28, 2024 at 02:34:43AM +0000, Ryan Chen wrote:
> > On Mon, Aug 26, 2024 at 07:50:24AM +0000, Ryan Chen wrote:
> > > > On Fri, Aug 23, 2024 at 06:23:54AM +0000, Ryan Chen wrote:
> > > > > > On Thu, Aug 22, 2024 at 02:24:26AM +0000, Ryan Chen wrote:
> > > > > > > > On Wed, Aug 21, 2024 at 06:43:01AM +0000, Ryan Chen wrote:
> > > > > > > > > > On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote:

...

> > > > > > > > > > > +	if (i2c_bus->mode == BUFF_MODE) {
> > > > > > > > > > > +		i2c_bus->buf_base =
> > > > > > > > > > devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> > > > > > > > > > > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > > > > > > > > > +			i2c_bus->buf_size = resource_size(res) / 2;
> > > > > > > > > > > +		else
> > > > > > > > > > > +			i2c_bus->mode = BYTE_MODE;
> > > > > > > > > >
> > > > > > > > > > What's wrong with positive conditional? And is it even
> > > > > > > > > > possible to have NULL here?
> > > > > > > > > >
> > > > > > > > > Yes, if dtsi fill not following yaml example have reg 1,
> > > > > > > > > that will failure at buffer
> > > > > > > > mode.
> > > > > > > > > And I can swith to byte mode.
> > > > > > > > >
> > > > > > > > > reg = <0x80 0x80>, <0xc00 0x20>;
> > > > > > > >
> > > > > > > > I was asking about if (!IS_ERR_OR_NULL(...)) line:
> > > > > > > > 1) Why 'if (!foo) {} else {}' instead of 'if (foo) {} else {}'?
> > > > > > > I will update to following.
> > > > > > > 		if (IS_ERR(i2c_bus->buf_base))
> > > > > > > 			i2c_bus->mode = BYTE_MODE;
> > > > > > > 		else
> > > > > > > 			i2c_bus->buf_size = resource_size(res) / 2;
> > > > > > >
> > > > > > > > 2) Why _NULL?
> > > > > > > 	If dtsi file is claim only 1 reg offset. reg = <0x80 0x80>;
> > > > > > > that will goto byte
> > > > > > mode.
> > > > > > > 	reg = <0x80 0x80>, <0xc00 0x20>; can support buffer mode.
> > > > > > > 	due to 2nd is buffer register offset.
> > > > > >
> > > > > > I have asked why IS_ERR_OR_NULL() and not IS_ERR().
> > > > > >
> > > > > OH, I will doing by this.
> > > > > 		if (IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > >
> > > > The question about _NULL remains unanswered...
> > > Sorry, I may not catch your point.
> > > So, Do you mean I should passive coding by following?
> > 
> > No. I already mentioned that in one of the previous mails.
> > Why do you use IS_ERR_OR_NULL() and not IS_ERR()?
> > 
> > You should understand your code better than me :-)
> Understood, I will change to 

OK!

> 	if (IS_ERR(i2c_bus->buf_base))
> 		i2c_bus->mode = BYTE_MODE;
> 	else
> 		i2c_bus->buf_size = resource_size(res) / 2;
> 
> > > If (i2c_bus->buf_base > 0)
> > > 	i2c_bus->buf_size = resource_size(res) / 2; else
> > >     i2c_bus->mode = BYTE_MODE;
> > >
> > > > > 			i2c_bus->mode = BYTE_MODE;
> > > > > 		else
> > > > > 			i2c_bus->buf_size = resource_size(res) / 2;

-- 
With Best Regards,
Andy Shevchenko



