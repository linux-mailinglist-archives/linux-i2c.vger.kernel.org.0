Return-Path: <linux-i2c+bounces-12421-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAA0B345E1
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 17:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E5702A2288
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 15:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4832FDC42;
	Mon, 25 Aug 2025 15:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZUWUDfk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFC02FD1C5;
	Mon, 25 Aug 2025 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756136098; cv=none; b=Ndph17qRehGOx/3eKl+LJhfhJ2VLzsXjCyGz/pdWz1gcPPXcTwLkc9OwD9WvXwJGS7KhItckbsBSKUk0ayrH+5FDgYDJ/gOekiD1ajw4ACP12kNchnQWAZek0roZP3zr6itIB/IUhpRf/1vesSC6ZVZdfbaizz/CCpfz+89J1yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756136098; c=relaxed/simple;
	bh=92FvKfWnhbgX/oEXcYLlIFBi8KWdGOA8VnyRR7wf9Hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BAhpKJzO8lonWnAtIYnOifoSZqzxqjiZtP+++CvOZKoL6vErdh3qyxXUia0KOllGheSlUtkZw5HyXTbf+AgjS8BRggc35AJ6tdYILaZHJNGVfiQffN9SPhwsbLMQBgtBe6qkO7YEwfqLDxBvU4JkEYJk0RxxygJG8y78YN7Ah+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZUWUDfk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756136096; x=1787672096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=92FvKfWnhbgX/oEXcYLlIFBi8KWdGOA8VnyRR7wf9Hc=;
  b=kZUWUDfkWYOIMb5AEvoRF06C9cj5G6nEZtQXHI/z8RFF4rJ2epThynAM
   o3Tc4R9tPJ1+eAOf8Jc1k0MU8FTTnA47ybHEFXOwZxU0F8UCemAeK3Jln
   Phyl2Te9kO9288RhUt5SfCRJKf+R0aW06/EX1/O/X4O7kgZkvP2NvhZIi
   9RoydN7HGowHAMkhUloIPkuJD4NDvG9jOwN2luIHzwDZmFgXOWmI7TLi/
   l9LD6Mk73R0dmxWy5HXZ9yK2VOZ6VT1l1tiKfMQ6Yz7nJQd5Lui9zESBk
   1IxKeu+re1z4S2JClFeajynFj32Qaw9T7hn06KE977KdM5V4zCjAmKRl+
   g==;
X-CSE-ConnectionGUID: KLKT5Dg1SbSv2VHAnf1FWA==
X-CSE-MsgGUID: tcJhG1fmS3uhZxw0GP9IGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="75951669"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="75951669"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 08:34:54 -0700
X-CSE-ConnectionGUID: PNS3coS5SjCQJuHiK1Gh4g==
X-CSE-MsgGUID: avPdlaS8SRu9E4evfbts1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="200215687"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 08:34:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uqZDc-00000008Y0G-020s;
	Mon, 25 Aug 2025 18:34:48 +0300
Date: Mon, 25 Aug 2025 18:34:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Askar Safin <safinaskar@zohomail.com>,
	Linux i2c <linux-i2c@vger.kernel.org>,
	linux-acpi <linux-acpi@vger.kernel.org>,
	regressions <regressions@lists.linux.dev>,
	DellClientKernel <Dell.Client.Kernel@dell.com>,
	linux-gpio <linux-gpio@vger.kernel.org>,
	Raul E Rangel <rrangel@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
Message-ID: <aKyCl_ly_LhtEOpc@smile.fi.intel.com>
References: <197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com>
 <5d7ee2bc-6595-46f1-8c8f-0c439f033407@kernel.org>
 <197af82e9e7.10ca643e5467232.6943045931834955890@zohomail.com>
 <6f42c722-cfa5-416d-8b63-730ad88e6b9d@kernel.org>
 <197bfafc23e.e6344936595425.1881540896161671378@zohomail.com>
 <9eac81e6-b4ee-4210-84ac-cbf7bf811130@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9eac81e6-b4ee-4210-84ac-cbf7bf811130@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 30, 2025 at 02:40:28PM -0400, Mario Limonciello wrote:
> On 6/30/2025 3:14 AM, Askar Safin wrote:
> >   ---- On Fri, 27 Jun 2025 07:58:15 +0400  Mario Limonciello <superm1@kernel.org> wrote ---
> >   > That's odd.  It should be made when the PMC core driver binds.  Maybe
> >   > others will know what's missing here.
> > 
> > Command "grep -r -E -I last_hw_sleep ." in culpit kernel (1796f808e4bb2c074824d)
> > shows nothing. (This is somewhere around 6.1).
> > 
> > So, culpit commit is too old.
> > 
> > If you want, I can retest this thing on current master and on current master with
> > revert 1796f808e4bb2c074824d.
> > 
> >   > I see in your bad config interrupt 14 is waking the system.  In the good
> >   > config interrupt 8 is waking it.
> >   >
> >   > What is in /proc/interrupts?
> > 
> > /proc/interrupts from culpit kernel: https://paste.debian.net/1382819/
> > 
> > --
> > Askar Safin
> > https://types.pl/@safinaskar
> > 
> 
> Looks like your interrupt 14 is ACPI device INTC1085:00.
> 
> Some quick searches this seems to be an Intel GPIO controller.
> 
> Andy,
> 
> Any ideas how to debug next?

I believe it's related to the touchpad (can you check that wake happens due to
actually IRQ on pin 355 of the GPIO controller?


-- 
With Best Regards,
Andy Shevchenko



