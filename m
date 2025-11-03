Return-Path: <linux-i2c+bounces-13950-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A91C2C0FE
	for <lists+linux-i2c@lfdr.de>; Mon, 03 Nov 2025 14:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BDADA4F2523
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Nov 2025 13:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4F8243958;
	Mon,  3 Nov 2025 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/gC9tRV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D1323EAB7;
	Mon,  3 Nov 2025 13:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762176065; cv=none; b=Com/qNFr3wdxCf/HYGKHGDOwavIELbI2blial1LvP77Bz41gGJ5BW6+RR4JV2GmYoTKUAX2Iv+cC2z/iHwIhUe+l7mNS9sdY0J7EtBG2r/tT0yTp/bdBv7ns175LXAMqKMBAufmJVcOtiA08JfjYjiNj9OrPRbfblfEYrErDgkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762176065; c=relaxed/simple;
	bh=sRRgSfVb4QIf574NrhWX8DYiPXNTYRXkxo0qK3N9Hmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8ZV3LfVbE7d/0Z3zAdzBy/DM2tnkm2UQ8ogCkivJeQbwsxIliG2yAZWrEuJem4u4R9aqhafGS3WCZQi3CGaTAxdw4sRHvbL5Ves/IMyvnVjd78c8PCtg21OFXjsyFWy3luT6fbGtMbNlSW1/n545fRAJ4QgSjTqBRjXO3vyD/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/gC9tRV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762176064; x=1793712064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sRRgSfVb4QIf574NrhWX8DYiPXNTYRXkxo0qK3N9Hmc=;
  b=f/gC9tRVdUKfszLY0Im0U3bk7vyqYPlein3UCnMMiR8j9yGK1pKW3Gir
   A55nv0V8BPT9mj60GDa0cLf5X8BzBT/DknOmWpfmM75XDvyc24lMC3ro3
   1k0eNzWo4/JgE+xak3LxQeoS/iMRsIYhK3CXMzNbyhnlySMjpHpOYly6r
   FmEQQ7FBfWwZLIW+aNU0vcf2jaRX2ZxoYNl+vtJ4E90TSugNAd5DDZ0Ux
   VqwMHmglaQW5kVG3HYgL56dIiyu0s92iFu1OWFqmrd8kh/jbIuUflTH6f
   Lhn3xKyxs5vh2yHozPbBVssJfVb+zQd/XG2TccKY1d2KVNq/ZmZSbzueP
   A==;
X-CSE-ConnectionGUID: rH018+7OTguKTrGCpLdUTA==
X-CSE-MsgGUID: JneMCaYJTumn3dQJlg32RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="74926503"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="74926503"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 05:21:03 -0800
X-CSE-ConnectionGUID: Ve8s6nGrRYWIFeU9REdqkQ==
X-CSE-MsgGUID: N1Bj9SScSDCyG6WvWEaihA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="187322237"
Received: from smoehrl-linux.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.216])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 05:20:58 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vFuUP-000000059gw-0Jrh;
	Mon, 03 Nov 2025 15:20:53 +0200
Date: Mon, 3 Nov 2025 15:20:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Dmitry Guzman <dmitry.guzman@mobileye.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 5/5] i2c: designware: Support of controller with
 IC_EMPTYFIFO_HOLD_MASTER disabled
Message-ID: <aQisNF9Fk-FODLFB@smile.fi.intel.com>
References: <20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com>
 <20251031-i2c-dw-v2-5-90416874fcc0@bootlin.com>
 <20251103104330.GG2912318@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251103104330.GG2912318@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 03, 2025 at 11:43:30AM +0100, Mika Westerberg wrote:
> On Fri, Oct 31, 2025 at 03:35:43PM +0100, Benoît Monin wrote:

...

> > +	return (msgs[idx - 1].flags & I2C_M_RD) == (msgs[idx].flags & I2C_M_RD);
> 
> You don't need the outer parens.

Priority of == is 10, while & is 11.

-- 
With Best Regards,
Andy Shevchenko



