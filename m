Return-Path: <linux-i2c+bounces-7446-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6809A1E41
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 11:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C910E1C26DD0
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 09:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111091D958E;
	Thu, 17 Oct 2024 09:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUtzLwAa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED861D6DB6;
	Thu, 17 Oct 2024 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157187; cv=none; b=ozbfsLr8A7eirQg5xB4LWGP+kTW79J9DdgizGUfxowKn3R9E1FPPuzHzsacZRESIh31MCFfDpin/phYRHTYdf9fs57NwfDiO2Nod5fVlWr1VQBe9106RWx0K7LSncOVoWv3IUjGoSusmW8GmM4bAnV0qG5Qk9D5ovZJVo3J8s24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157187; c=relaxed/simple;
	bh=i/ffviO7W8leGXGgrXNxf9k3L3x8y4ClbupGs16ztO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JbnhP5q6Qci7qJhY8ogi2OcrJwSYKBfUyn/LUIvkuiiL9N8ox/Pj3l6DjGndzKmu+cYIYlPY/GvBl8S5onCmlPtK8v9+V182TYSYGwcjanhY/fLb5HUaE+vinfFmtdn5VD98KzkJqw5I2p1FA5za0STy/hW4DmqbuyYrNE+u2nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUtzLwAa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729157184; x=1760693184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i/ffviO7W8leGXGgrXNxf9k3L3x8y4ClbupGs16ztO8=;
  b=PUtzLwAa5aLvntApHkACTUPzs7fJZUF4FiZwr2J9j4ykG1kdvKIGinAz
   XCQi1XkBtIWL0HVnSIO5Mq6L7tK8nVeFniTNFTK4dSYP3nycYow/hCYzt
   2JnW5iXZlidPjjQ8KCPu2hdfwUTQm/2G/MNvlSIbvL+FYIwDn/8nSonKS
   wZWtXrRfGDkjRr49KvYsk1TqM0zoKEUNBcpFZB/+9T0dl51tXAxAu0k8A
   cG9Hz9yrAhBDQUwvfI6R+XeDEVVUOfQ3byLeroLbdXmsmZu+5G7PoMHQR
   uUHs1J+nUxrfpe2IqEaZTdBprR4Nv6cLMzPe1NhJZeynVvzPv9b2vgMkQ
   Q==;
X-CSE-ConnectionGUID: x/e8r/DoQTuerx18r+OB4Q==
X-CSE-MsgGUID: xMoG75oaSBmcoKUOfcRKvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="28766604"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="28766604"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 02:26:23 -0700
X-CSE-ConnectionGUID: 53/tnFdwQxmkNhY2IfqlsQ==
X-CSE-MsgGUID: SRls1vKkSyi+f7gLHIoewQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="83046634"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 02:26:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t1Mlu-0000000441r-2eU3;
	Thu, 17 Oct 2024 12:26:18 +0300
Date: Thu, 17 Oct 2024 12:26:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	"hunter.yu" <hunter.yu@hj-micro.com>, jarkko.nikula@linux.intel.com,
	lenb@kernel.org, jsd@semihalf.com, linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org, andy.xu@hj-micro.com,
	peter.du@hj-micro.com
Subject: Re: [PATCH v2 1/2] ACPI: APD: Add clock frequency for HJMC01 I2C
 controller
Message-ID: <ZxDYOrAJEddtPrWv@smile.fi.intel.com>
References: <20240926024026.2539-1-hunter.yu@hj-micro.com>
 <20240926024026.2539-2-hunter.yu@hj-micro.com>
 <pmbvhdaz4qt57gxemuxoyb6xjrcmvusm2jzl5ps3o5ga52edo5@qabu6rcbdipp>
 <CAJZ5v0gSyMYerPqH9LOA77EWdBEOL7kHrc1+P1R=8Epn77gfNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0gSyMYerPqH9LOA77EWdBEOL7kHrc1+P1R=8Epn77gfNw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 16, 2024 at 10:45:26PM +0200, Rafael J. Wysocki wrote:
> On Thu, Oct 3, 2024 at 12:13 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > On Thu, Sep 26, 2024 at 10:40:05AM GMT, hunter.yu wrote:
> > > I2C clock frequency for HJMC01 is 200M, define a new ACPI
> > > HID for it.
> > >
> > > Signed-off-by: hunter.yu <hunter.yu@hj-micro.com>
> >
> > Do you want your name to be hunter.yu or Hunter Yu? I prefer the
> > second and if you browse the git log, you can see that everyone
> > uses Name Surname.
> 
> It must be a real name as per submitting-patches.rst

Hasn't this been relaxed last year by the d4563201f33a ("Documentation:
simplify and clarify DCO contribution example language")?

> The S-o-b is meaningless otherwise.

-- 
With Best Regards,
Andy Shevchenko



