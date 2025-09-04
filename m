Return-Path: <linux-i2c+bounces-12618-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA669B438EE
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 12:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2936A16DFBE
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 10:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2DD2F8BF5;
	Thu,  4 Sep 2025 10:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4cUqCzI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D29A2EC0A5;
	Thu,  4 Sep 2025 10:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756982293; cv=none; b=NCi82z11a0qBZA5Wo51NkpFQB4/zJrL47EznQqdX7IyUUpb6Y/VtVI0X8j9WuHVfPVt5gdCL6MRZy7pmU+x2MoJtvRXNAfjP3IXXCJ61M3d36DyCOTaA0PZFwasEM00Qkkibp1OCNds252pFy70FXEa3txosDflquc+89rUo20o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756982293; c=relaxed/simple;
	bh=hbR0wEYWqKtbDdPg7UhqpitNbfCEpvynd8wZStnxc/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNpamZtqdxsAGgzetItiAv100aQdcNoTz0GdacgnfXKk0zEH1D7UNopIJPlFsnhQY+goEGCknT85cYvRrmX/WYKkjXP3sK5LdrVn3FmUkqMeq9ipVXsEmuSHYbTmRoKd4gensT3+4ZWYZcv08Y2/EuliIMZRr47scz6g68YFPlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4cUqCzI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756982292; x=1788518292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hbR0wEYWqKtbDdPg7UhqpitNbfCEpvynd8wZStnxc/w=;
  b=X4cUqCzIOxtb3mRvF5xQTzLPxUtRdBsWO6p9kjCKcdOdHVNUFiis/zCU
   xdt8qWbImmsYSJi50/nKBdLpxi28L4/BoSSMIsTnQUH6lPo6sYSomKSjh
   Bhf0NCG0W84Kr+dvU+kmc3xD0UOBsw03VDw9vz2R3CxzVoX+YgP5TCYK7
   /Zo4EzIM+yjJivVonUzczfiYExc1a4eV8FsPTAAZMSzY7H13iWXwf9LVj
   U1+dvY1lOOS4MKHvrKzFBKU4hTA+dFhRPaPd4MZDYsqqXDG7m7LNhKnOd
   h7mH6ZFJNgJ3HeYTf2LYl414mqlnc2b4pyjbAZ+h4t6hCa1XuZHmFgTdF
   A==;
X-CSE-ConnectionGUID: 5B2SuVqxRwuBzyZbKkqVJQ==
X-CSE-MsgGUID: f8OI8b9MTCeWfxsDFnn8zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76918202"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="76918202"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 03:38:11 -0700
X-CSE-ConnectionGUID: Uy3ajEFrSwqANOQewh/dNg==
X-CSE-MsgGUID: H5emK1dER1OBz9xVq4Wz8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="209039630"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.92])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 03:38:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 011FE11FCCF;
	Thu, 04 Sep 2025 13:38:05 +0300 (EEST)
Date: Thu, 4 Sep 2025 13:38:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 0/2] device property: Add scoped fwnode child node
 iterators
Message-ID: <aLlsDZrark6u7Eq7@kekkonen.localdomain>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <aLgY1z-MvQbDBx2_@smile.fi.intel.com>
 <aLlgpUlHp7t8P4dQ@shikoro>
 <aLljGIcjAjQhC2uS@smile.fi.intel.com>
 <DCJXQ4CUQ88U.ZEEGKWZRCGL6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCJXQ4CUQ88U.ZEEGKWZRCGL6@kernel.org>

Hi Danilo, others,

On Thu, Sep 04, 2025 at 12:13:53PM +0200, Danilo Krummrich wrote:
> On Thu Sep 4, 2025 at 11:59 AM CEST, Andy Shevchenko wrote:
> > On Thu, Sep 04, 2025 at 11:49:25AM +0200, Wolfram Sang wrote:
> >> 
> >> > It might be good to have an immutable branch for me from i2c core.
> >> > Wolfram, can you provide a such if no objections?
> >> 
> >> Sure thing, I can do that. But there is still discussion on patch 1, so
> >> I will wait for an outcome there.
> >
> > But it seems that the discussion can be implemented in a followup?
> 
> If Sakari attempts the rework, and we can prove this doesn't regress existing
> users, removing fwnode_for_each_available_child_node_scoped() in the context
> of the rework again should be trivial.

It would perhaps be trivial but in this case I really wouldn't add it in
the first place: it's unused. Either way, feel free to add:

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> 
> Given that, I don't see a reason to stall people working with the existing
> semantics of the API in the meantime.

-- 
Regards,

Sakari Ailus

