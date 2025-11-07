Return-Path: <linux-i2c+bounces-14015-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCF5C3F3B3
	for <lists+linux-i2c@lfdr.de>; Fri, 07 Nov 2025 10:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A0E464EE7E0
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Nov 2025 09:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDB13019D8;
	Fri,  7 Nov 2025 09:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1W3K4zj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BE1302143;
	Fri,  7 Nov 2025 09:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762508569; cv=none; b=T4K2j3z1StL1aTt/9hu1w6ed3eBplX6rCssk919EZLG6JnCgcn6n4Zx4M54uFncHf8v26bRmPv/jCRRWbtEK6whbbbny9E0ojdLOhMSh5CjbL1xY2BbX05RLFYv/k7rWlKL7bkUgoAt4KnblKopz7KSOsYHt2q0RPSRGIuxcz74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762508569; c=relaxed/simple;
	bh=WJXOLztqSo4giTqFOw8G/lBkaE8BpltWb1JC16Iyvfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qg1T9xmJWySa1vhDvtDA8i3UvdGMhJoi6pi0ODy0zrfSZiPJ/DzQb8Sy2q0QS7TT2O3cwggbhN9m1QF8vykb89mV5krxktQ64oYhWzAbeJCHxC21rvdCxf34ldOuakrQuM/92+XT/+EdeWiOsqRzIfjp6o1cq2fswWRRvVDJs5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1W3K4zj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762508568; x=1794044568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WJXOLztqSo4giTqFOw8G/lBkaE8BpltWb1JC16Iyvfc=;
  b=b1W3K4zjOXJUrVFks0odcScGM8Dape/G3yLyyNc06CzWStiNePvlDi36
   tSkwy0g5p4AC6xz4BOdHQssSYZlUUXSmH64psa2kaFgozADHbfz9lvkSV
   SwfMMBbkFZQiLDBx/8FP+LoUM4Mldf6F/DE4POAZD/B2szS7tineInY2i
   Bbe/jq8c/+RcQ/y8CF4ubTRrzFd131MwOqoY77+7NwCniZtndcl2e739d
   xjU3krZSReC4UmLE5pFQy6VkrRYxYyPk0DBQ26He8ecuj/TS3cLXx/1hN
   aSEXxxp9RofsLGbrzYtlv7fGigj1Nl2tuuG5mlTR8xYhhcNaL4RnCdvNm
   Q==;
X-CSE-ConnectionGUID: MaXwSwOIQpm4tP0PJKOtbQ==
X-CSE-MsgGUID: aNu06NvYS8iKx+oYTEJelQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="63668030"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="63668030"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 01:42:47 -0800
X-CSE-ConnectionGUID: oCQK/vHQQpCJVDh93eyUgw==
X-CSE-MsgGUID: jz6q+Cp+QiGNuEuTne9Otg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="187253469"
Received: from vpanait-mobl.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.27])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 01:42:43 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vHIzQ-00000006QDe-05pD;
	Fri, 07 Nov 2025 11:42:40 +0200
Date: Fri, 7 Nov 2025 11:42:39 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v21 3/4] i2c: ast2600: Add controller driver for new
 register layout
Message-ID: <aQ2_D6vs4m1brNk0@smile.fi.intel.com>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
 <20251027061240.3427875-4-ryan_chen@aspeedtech.com>
 <f08b1078-fc8c-4834-984c-813e01291033@kernel.org>
 <TY2PPF5CB9A1BE64FEBCCCDC7631B355135F2C3A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY2PPF5CB9A1BE64FEBCCCDC7631B355135F2C3A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 07, 2025 at 06:26:39AM +0000, Ryan Chen wrote:
> > On 27/10/2025 07:12, Ryan Chen wrote:

...

> Add new file i2c-aspeed-core.c to do legacy probe and i2c-ast2600 probe.
> 
> 	if (of_device_is_compatible(dev_of_node(dev), "aspeed,ast2600-i2c-bus") &&

	if (device_is_compatible(dev, "aspeed,ast2600-i2c-bus") &&

> 	    of_parse_phandle(dev_of_node(dev), "aspeed,global-regs", 0)) {

Not sure why do you need this. Isn't it as simple as

	    device_property_present(dev, "aspeed,global-regs", 0)) {

or something between these lines?

> 		ret = ast2600_i2c_probe(pdev);
> 	} else {
> 		ret = aspeed_i2c_probe(pdev);
> 	}

-- 
With Best Regards,
Andy Shevchenko



