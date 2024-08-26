Return-Path: <linux-i2c+bounces-5795-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DC795EE92
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 12:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FA491F22B5A
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 10:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2311214A098;
	Mon, 26 Aug 2024 10:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHXHaC6M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8092E414;
	Mon, 26 Aug 2024 10:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724668693; cv=none; b=n5ppe3rtQ4uXLzVR+R1F475pwHyyl8HO66nz07+AS29Y8ukPIZ+1c8kIHb+65gpApIMrk9oCxj3qkoR/sAJ97+oYW1l3VK60cvFKLVZL2MSXJqUhxxvitfGsZ5ZbHLpLYPtr8znRF+6ebzhDIu0P2Co3UjCiC+ZLHjQdtQFfxqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724668693; c=relaxed/simple;
	bh=ERmA+CQJNVBk28DwXjuku6KyoJl+p00nopizk4PpeYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2WRHAmtvFcDMiCl90u+UgcIwGHL7+zvpOjXnm569AJfx021sGfW1eNvUTlIE1SZM9+Cf+1VhRWiLmksh+CVu0Di/bcyx+AXMDWLdL5w2aySaQnd/xLXYbCWJk0lWZu9xMFpD68M21QrFqD/cFfPZDOzvLW686MNTaD5wlpF2E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHXHaC6M; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724668692; x=1756204692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ERmA+CQJNVBk28DwXjuku6KyoJl+p00nopizk4PpeYE=;
  b=dHXHaC6MHE/5P73jawzIC28AWh2WKLqgrHLxOnAvyef5hrQF2VqvJ8iL
   /16Cvxyxn2SDa7KC2fK8vD56KIbv44U8/z6dXgjoqeFjroynSP/b9szts
   rP3yuHw48bk4Un5ZJ9dgGgnNbIV8gKdRLsJv7WjwADI9t/RFPb8wb/jo0
   hglZ82wdE9o8Og6aACLBQJ5lSCHVJmtaYq8iMQgxLhuc9nubOsJ3k3Cip
   6VwQ05fhOkRmlis7bDkmkC0evFWYyC/Iy1wN+NZBfyjVIVi71mm0EGHSL
   6DgywLgJqVA93yO6sLFmJFALET8gID4U+3ct1cHTxTh7c1lo6lj5yRUJf
   g==;
X-CSE-ConnectionGUID: Pql3PzoGTD+wo6orhdHfTw==
X-CSE-MsgGUID: erOMMxKlSgiNLeroYOFTeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="22670088"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="22670088"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:38:11 -0700
X-CSE-ConnectionGUID: xDE6/mNfTlStamQ231jlHw==
X-CSE-MsgGUID: qETryUhjTlmdnzut8dKMMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="66643611"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:38:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1siX6q-00000001pog-41CB;
	Mon, 26 Aug 2024 13:38:04 +0300
Date: Mon, 26 Aug 2024 13:38:04 +0300
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
Message-ID: <ZsxbDK25mJ0sjcQy@smile.fi.intel.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
 <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
 <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsXVU2qy0GIANFrc@smile.fi.intel.com>
 <OS8PR06MB7541945591A62B956DA28AD9F28F2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <Zsc9_UddBybdnM1Z@smile.fi.intel.com>
 <OS8PR06MB75419F3E3A222AE941DE3007F2882@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsiWp5ENQ0BeBjMn@smile.fi.intel.com>
 <OS8PR06MB7541A23130F469357B7FE5F4F28B2@OS8PR06MB7541.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS8PR06MB7541A23130F469357B7FE5F4F28B2@OS8PR06MB7541.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 26, 2024 at 07:50:24AM +0000, Ryan Chen wrote:
> > On Fri, Aug 23, 2024 at 06:23:54AM +0000, Ryan Chen wrote:
> > > > On Thu, Aug 22, 2024 at 02:24:26AM +0000, Ryan Chen wrote:
> > > > > > On Wed, Aug 21, 2024 at 06:43:01AM +0000, Ryan Chen wrote:
> > > > > > > > On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote:

...

> > > > > > > > > +	if (i2c_bus->mode == BUFF_MODE) {
> > > > > > > > > +		i2c_bus->buf_base =
> > > > > > > > devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> > > > > > > > > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > > > > > > > +			i2c_bus->buf_size = resource_size(res) / 2;
> > > > > > > > > +		else
> > > > > > > > > +			i2c_bus->mode = BYTE_MODE;
> > > > > > > >
> > > > > > > > What's wrong with positive conditional? And is it even
> > > > > > > > possible to have NULL here?
> > > > > > > >
> > > > > > > Yes, if dtsi fill not following yaml example have reg 1, that
> > > > > > > will failure at buffer
> > > > > > mode.
> > > > > > > And I can swith to byte mode.
> > > > > > >
> > > > > > > reg = <0x80 0x80>, <0xc00 0x20>;
> > > > > >
> > > > > > I was asking about if (!IS_ERR_OR_NULL(...)) line:
> > > > > > 1) Why 'if (!foo) {} else {}' instead of 'if (foo) {} else {}'?
> > > > > I will update to following.
> > > > > 		if (IS_ERR(i2c_bus->buf_base))
> > > > > 			i2c_bus->mode = BYTE_MODE;
> > > > > 		else
> > > > > 			i2c_bus->buf_size = resource_size(res) / 2;
> > > > >
> > > > > > 2) Why _NULL?
> > > > > 	If dtsi file is claim only 1 reg offset. reg = <0x80 0x80>; that
> > > > > will goto byte
> > > > mode.
> > > > > 	reg = <0x80 0x80>, <0xc00 0x20>; can support buffer mode.
> > > > > 	due to 2nd is buffer register offset.
> > > >
> > > > I have asked why IS_ERR_OR_NULL() and not IS_ERR().
> > > >
> > > OH, I will doing by this.
> > > 		if (IS_ERR_OR_NULL(i2c_bus->buf_base))
> > 
> > The question about _NULL remains unanswered...
> Sorry, I may not catch your point.
> So, Do you mean I should passive coding by following?

No. I already mentioned that in one of the previous mails.
Why do you use IS_ERR_OR_NULL() and not IS_ERR()?

You should understand your code better than me :-)

> If (i2c_bus->buf_base > 0)
> 	i2c_bus->buf_size = resource_size(res) / 2;
> else
>     i2c_bus->mode = BYTE_MODE;
> 
> > > 			i2c_bus->mode = BYTE_MODE;
> > > 		else
> > > 			i2c_bus->buf_size = resource_size(res) / 2;

-- 
With Best Regards,
Andy Shevchenko



