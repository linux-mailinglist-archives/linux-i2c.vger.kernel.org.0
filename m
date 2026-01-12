Return-Path: <linux-i2c+bounces-15080-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A20D14394
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 18:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E155A30285F5
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 16:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40ADB2EBDE9;
	Mon, 12 Jan 2026 16:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0LAdumC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5737D374163
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768237063; cv=none; b=as2oMSYfgD76FDqI844y0wlk8GW3x3d8TSMow42SQKPGJNfDB7eQNN/jbUGXOOHWLUSyaW1TA4Ho8gBkgiWcSb2dja9m5DM9Zni9yXAE5VvtlISS7/NK4KVrdaN2OVla8xdyPuYhXLl6M8T3tKRlM9qAqVUMTtBcPBssY9RAYQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768237063; c=relaxed/simple;
	bh=kNppd47ObN/Y9YUccsPV+vgYLfG0z/UDbQLhf6oX0Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncx34thYn940xh+yBpY5lfYwCMEYkNXP9GHMas0do66Gba4ZSE8hFARWgnh7OHhmy9E6hSwegP01WrT+KO9HK3qPdEWH+Ax1Tg2bN3c7xJ7tqewtKpBftn7zv0bhchsC6zKmBp/cRwWOK7TH/5UsprL6kA5+C/+1W18Lyb2yEOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0LAdumC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768237061; x=1799773061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kNppd47ObN/Y9YUccsPV+vgYLfG0z/UDbQLhf6oX0Bo=;
  b=X0LAdumCNNl/BE7veM7t40uaeBIrzP1MsB2pYKnaURMxVY0LE7tIcvQG
   pjImtbdg5DSVaJxc0PiBEvT+uxJTpBKs3QeLIP/4UlU+qQAMuPSxkTI4K
   /NmxO3CWlnJjxEPZNf6IU6HZJ/Mb4hQ6dLC2P6z56dHKDFK4eDTws+k4X
   lI+4NfH57637RM6UXk56qPHCS8X1VN209EummMkOWDRh4MioL1CW2b2qe
   O3MuSQ/KF0clqD0OyGKrtS/soOZmPYd7w0uGthIFmdncjgEjq30zTsRZI
   ikj9npQsxG4gt/yRN0DF2BT01yFHNkiZDF8Z98pZFm0AKAWnpr/6GlUA8
   A==;
X-CSE-ConnectionGUID: Tn/DKe4ZRR65Enh05TipgA==
X-CSE-MsgGUID: i3mQ0toMQdSQ8fsv5WkQug==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68719690"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="68719690"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 08:57:40 -0800
X-CSE-ConnectionGUID: M0LdXGh/Qf69W4gfoabciA==
X-CSE-MsgGUID: gRae6VGURUC/qG97OJ9Pdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="204149300"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.37])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 08:57:32 -0800
Date: Mon, 12 Jan 2026 18:57:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alex Ivy <whu2gh@gmail.com>
Cc: jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
	wsa@kernel.org, jsd@semihalf.com, p.zabel@pengutronix.de,
	linux-i2c@vger.kernel.org
Subject: Re: [QUESTION] i2c: designware: Why use GPIOD_OUT_HIGH instead of
 OPEN_DRAIN for recovery?
Message-ID: <aWUn-m56_SUw9nei@smile.fi.intel.com>
References: <CAN8T_P09Qe4091eq+YXnqzCtSxLQgxcw=jH2bH7uw20N4_DsbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN8T_P09Qe4091eq+YXnqzCtSxLQgxcw=jH2bH7uw20N4_DsbQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jan 12, 2026 at 10:10:02PM +0800, Alex Ivy wrote:

> I am currently looking at the bus recovery implementation in
> drivers/i2c/busses/i2c-designware-master.c. I noticed that
> i2c_dw_init_recovery_info() seems to manually reimplement much of the logic
> already present in the I2C core's i2c_gpio_init_generic_recovery().
> 
> However, there are two key differences that caught my attention:
> 
> GPIO Flags: The I2C core uses GPIOD_OUT_HIGH_OPEN_DRAIN, while
> i2c-designware uses GPIOD_OUT_HIGH. Is this specifically intended to
> support SoC GPIO controllers that do not implement the OPEN_DRAIN flag,
> which would otherwise cause devm_gpiod_get() to fail in the core's generic
> helper?
> 
> Initialization Flow: The core's helper performs a pinctrl state toggle
> (GPIO -> Default) during initialization, whereas i2c-designware only looks
> up the states and defers the actual switching to prepare_recovery.

This might affect the workflow. Note, in the past one of such conversion was
presumably done without real testing and brought a regression (I'm talking
about PXA version).

> My question is: Would it be possible (or welcomed) to refactor this to use
> the core's generic helper, or is the current manual initialization required
> to maintain compatibility with specific DesignWare-integrated SoCs (like
> certain Intel or ARM platforms) that have restrictive GPIO/Pinctrl
> requirements?
> 
> I would appreciate your insights on the historical background of these
> choices.

Do you have an access to real HW?

-- 
With Best Regards,
Andy Shevchenko



