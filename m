Return-Path: <linux-i2c+bounces-7197-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3769198E890
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 04:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F903B214B4
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 02:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF46E199B9;
	Thu,  3 Oct 2024 02:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOhZuiKR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A03D17C9B;
	Thu,  3 Oct 2024 02:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727924319; cv=none; b=QtjrVxpz/QV/FqGgZst4EEakyrZOPfVOGLe1OUK/EZqGgoNTLz6/LPnfKstiy3S5MLwyJe9ndELboNgmxyXiIzd9gFGSag5NaTAz7hSb4Kjuo0BHORZgkOW9tStyUluuOMqU/cUUjJcUtP6QmKWDJCaM0BHd5pYARDwq7i1Uml4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727924319; c=relaxed/simple;
	bh=I3aSZcyp7no/dM2l37kssSMZlBSFsveKJJcOZS38XCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpqKQihAaW0DCZ1cs2qdS5herFhd0zaixSnNvfkhAjDsSVejp68ndO6TjMxO+Jg4wtuSuptGbUAxI3oSVxxtrz87mg/dNzCKEbiKSQH0DAJ+wCn1HCnrAjPV9eyui35XByxIlMups3n/v9qaiHWk/0dquIZgfckPc+HkKHv0E5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eOhZuiKR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727924317; x=1759460317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I3aSZcyp7no/dM2l37kssSMZlBSFsveKJJcOZS38XCE=;
  b=eOhZuiKR/B0+xC/JMHehNWmDZSRu7CMWfPILrn3nZv6R4+hGzk7VW4vh
   nRzJEoZBli0oK4cSlY8WEBIgOS3nfTjKJZYhlvKTHI9O/tZF6O7l3MRN1
   IuZN13Wb7HbyBAm+BOCTVTYLb3n9OlWTLGHNIQrLCoRw1SrDZv/wUHcYt
   TG49pY+y6rqtOOnZ7eBtF9xG1AjCPPzJhSNKTmAnaShvP5PCGuT9C4TtZ
   ne2PkvugocCo4z5+N+qCxlW1MSnlPAgpANfiRpfTwuG7xJpX/upNKTCqj
   fD8EVQ/4uBjfjLkZ1+CWD4uSdTz9712Rlm99tYRhmf+MvE8Sbr3jRQobu
   A==;
X-CSE-ConnectionGUID: 70xWYwa4SKyymkhVOAKmWw==
X-CSE-MsgGUID: xldh317+SviZ7QD17JrryQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="37774878"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="37774878"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 19:58:36 -0700
X-CSE-ConnectionGUID: ArzwMTu0RomOSZbBNsQvew==
X-CSE-MsgGUID: JZZLzfAORAiRhif/Pmgp/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="79057195"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 19:58:35 -0700
Date: Thu, 3 Oct 2024 05:58:31 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com, jsd@semihalf.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] i2c: designware: constify abort_sources
Message-ID: <Zv4IVy0AwopigElv@black.fi.intel.com>
References: <20240122033108.31053-1-raag.jadav@intel.com>
 <lny2lybbplbu6mugnldj7do2q3yazvr6l2tm4zxmck6vd2sofg@q536n225ap22>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lny2lybbplbu6mugnldj7do2q3yazvr6l2tm4zxmck6vd2sofg@q536n225ap22>

On Wed, Oct 02, 2024 at 11:18:34AM +0200, Andi Shyti wrote:
> Hi Raag,
> 
> On Mon, Jan 22, 2024 at 09:01:07AM GMT, Raag Jadav wrote:
> > We never modify abort_sources, mark it as const.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> we meet in a different context :-)

Small world :)

> Sorry I have missed this patch. I applied it to i2c/i2c-host. The
> second patch was already sent here 21ac0359f72a90.

Awesome.

Raag

