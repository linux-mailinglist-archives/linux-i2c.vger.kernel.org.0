Return-Path: <linux-i2c+bounces-12621-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F18EB43AD2
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 13:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38D92189BE40
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 11:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E6F2FCC01;
	Thu,  4 Sep 2025 11:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hen1FQZt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75C32EF662;
	Thu,  4 Sep 2025 11:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986889; cv=none; b=uW1aPrViwyWas1CZuhgFtJXWr5vhJy3p4ydIZ5kpQo5r5qrcpqFYn9i27+951OjPkii0Idww3awlxY26qzlNCh5ZokrIAaV1alZZrrhGs7bR3evgsqFVKSMJCWdcyxa7tZwuMdXMXDHpqIRbZO7eVn/9ZnuxHChMZRYsnUoCjDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986889; c=relaxed/simple;
	bh=l3py9YPTKRQS/cZmg2aexCRlRPz1o0wbHx14pbR+PH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M708JemgBnINpRSGn9zBA/V14kI9gt0ZKRll8fl0UNX2LklxIIUt7z4UpgwWuSIMveMzgT3Tvz0KNXZDC08Fuli+p+/OVANs0zSVAejWIiVNzBMsrybvCWMb4/Ss9jSqdByGAqzrxMFQc3DsdQXKN96gQvRgh9vPohicuk0/ONg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hen1FQZt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756986888; x=1788522888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l3py9YPTKRQS/cZmg2aexCRlRPz1o0wbHx14pbR+PH8=;
  b=hen1FQZtkOHnx6WTLi4u49c7wD5suRxPvCKYNOXVKRU22ogj32Xdu88u
   ekDgrHpvg05w3+AuMmlb1zEXd52ChUNfVC5Tstph8gQXLRRReazJWGKFO
   rWlTzdPybcHjfF0174LN12ivpMfyZPZ6SIhemIfw88cMFc7jPPO9t7RvS
   zYPcrmfSDQ2T5agEcTqHESIDwCiTSY1BB2bfDimEFdCIAt5+VbSeh+sSj
   vjmK9NtCoYizdpN7g8JEChRzDNZw0ZLvEVLWP45OxHzTC7ro2kLgxwj4M
   hTKmpcUT41sm74bvM0jZJoEnGklImZ5lJ3ryfQ+QP4hY8G3o2utYLXSsn
   w==;
X-CSE-ConnectionGUID: glavPp48Q56UfkdDtuh5fA==
X-CSE-MsgGUID: BepvPCJHRFWcPkGl6npaKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81911343"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81911343"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 04:54:47 -0700
X-CSE-ConnectionGUID: lWKhMKd/Q+GdvO1bRC1qXg==
X-CSE-MsgGUID: hGDdvKm7Q4+we7IUuRSHyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="175989015"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.92])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 04:54:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DB5101201E5;
	Thu, 04 Sep 2025 14:54:40 +0300 (EEST)
Date: Thu, 4 Sep 2025 14:54:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 1/2] device property: Add scoped fwnode child node
 iterators
Message-ID: <aLl-ABtFi2R9Wc1a@kekkonen.localdomain>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <20250902190443.3252-2-jefflessard3@gmail.com>
 <aLhAKJBUNQVH1Vmf@kekkonen.localdomain>
 <DCJC7Q9MZEM3.34FU7BXXZ7UGF@kernel.org>
 <aLkqE9c9w9m4Axsp@kekkonen.localdomain>
 <DCJTOIQ4Q0Z5.Q2UE5AQU1X35@kernel.org>
 <aLlDJETaWTjiSP0L@kekkonen.localdomain>
 <DCJVYUINZ7KM.7RCV9P9KHTVM@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCJVYUINZ7KM.7RCV9P9KHTVM@kernel.org>

Hi Danilo,

On Thu, Sep 04, 2025 at 10:51:15AM +0200, Danilo Krummrich wrote:
> On Thu Sep 4, 2025 at 9:43 AM CEST, Sakari Ailus wrote:
> > Hi Danilo,
> >
> > On Thu, Sep 04, 2025 at 09:03:44AM +0200, Danilo Krummrich wrote:
> >> On Thu Sep 4, 2025 at 7:56 AM CEST, Sakari Ailus wrote:
> >> > Hi Danilo,
> >> >
> >> > On Wed, Sep 03, 2025 at 07:22:29PM +0200, Danilo Krummrich wrote:
> >> >> (Cc: Javier)
> >> >> 
> >> >> On Wed Sep 3, 2025 at 3:18 PM CEST, Sakari Ailus wrote:
> >> >> > Do we really need the available variant?
> >> >> >
> >> >> > Please see
> >> >> > <URL:https://lore.kernel.org/linux-acpi/Zwj12J5bTNUEnxA0@kekkonen.localdomain/>.
> >> >> >
> >> >> > I'll post a patch to remove fwnode_get_next_available_child_node(), too.
> >> >> 
> >> >> Either I'm missing something substantial or the link does indeed not provide an
> >> >> obvious justification of why you want to send a patch to remove
> >> >> fwnode_get_next_available_child_node().
> >> >> 
> >> >> Do you mean to say that all fwnode backends always return true for
> >> >> device_is_available() and hence the fwnode API should not make this distinction?
> >> >> 
> >> >> I.e. are you referring to the fact that of_fwnode_get_next_child_node() always
> >> >> calls of_get_next_available_child() and swnode has no device_is_available()
> >> >> callback and hence is always available? What about ACPI?
> >> >
> >> > On ACPI there's no such concept on ACPI data nodes so all data nodes are
> >> > considered to be available. So effectively the fwnode_*available*() is
> >> > always the same as the variant without _available().
> >> 
> >> What about acpi_fwnode_device_is_available()? Is it guaranteed to always
> >> evaluate to true?
> >
> > acpi_fwnode_device_is_available() is different as it works on ACPI device
> > nodes having availability information.
> 
> Well, it works on both data and device nodes, so considering data nodes only
> isn't enough, no?
> 
> So, we can't just say fwnode_get_next_available_child_node() and
> fwnode_get_next_child_node() can be used interchangeably.
> 
> >> If so, to you plan to remove device_is_available() from struct
> >> fwnode_operations and fixup all users of fwnode_get_next_available_child_node()
> >> and fwnode_for_each_available_child_node() as well?
> >
> > The device_is_available() callback needs to stay; it has valid uses
> > elsewhere.
> >
> > Technically it is possible that fwnode_*child_node() functions could return
> > device nodes that aren't available, but it is unlikely any caller would
> > want to enumerate device nodes this way. Even so, I think it'd be the best
> > to add an explicit availability check on ACPI side as well so only
> > available nodes would be returned.
> 
> Fair enough, but that's an entirely different rationale than the one you gave
> above. I.e. "all iterators should only ever provide available ones" vs. the
> "they're all available anyways" argument above.
> 
> (Quote: "So effectively the fwnode_*available*() is always the same as the
>  variant without _available().")

This was perhaps a simplification. The word "effectively" is crucial here.

> 
> I see quite some drivers using fwnode_for_each_child_node() without any
> availability check. However, they may just rely on implementation details, such
> as knowing it's an OF node or ACPI data node, etc.
> 
> So, before you remove fwnode_get_next_available_child_node(), do you plan to
> change the semantics of the get_next_child_node() callback accordingly,
> including adding the availability check on the ACPI side?
> 
> How do we ensure there are no existing drivers relying on iterating also
> unavailble nodes? Above you say it's unlikely anyone actually wants this, but
> are we sure?

If you're concerned of the use on ACPI platforms, none of the drivers using
the two available variants list any ACPI IDs, signifying they're not used
on ACPI systems -- I don't think they ever have been.

I noticed there's also no availability check for the OF graph nodes. That's
likely an accidental omission.

-- 
Kind regards,

Sakari Ailus

