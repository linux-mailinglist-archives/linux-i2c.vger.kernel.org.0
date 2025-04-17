Return-Path: <linux-i2c+bounces-10453-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D404A91B5F
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 14:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B023188A208
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 12:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A215241674;
	Thu, 17 Apr 2025 12:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPBi0v+a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FF1241661;
	Thu, 17 Apr 2025 12:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891277; cv=none; b=lNfDsGGhsi0DtGWjAr5zepiZ65fOB7HSyfALEOH38kOvNELv+1zqGoxAHI9hjV965FjRNS+lD/A4TxCqE9WUk380oju8l+mSg3o5kbziKif42B4qPqcNLQ+U/egVthdCCxsdIGRI7PNkx11MVxKqBmZqIDyVTjnbGGE7y2juM9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891277; c=relaxed/simple;
	bh=CO8F47rGNl3PWbXw49kLHaTU5iubCOOjCAsO/q5Aftw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYT58KM3UaU5lfHjRJS6tWtfJWJ4mFqLdkyBRNAATFvjEYUHCK8NLmyO7ZgLtbqBN1bU9potTF96lhvjfU2jJYV+t9DxHj4rkl2qzooLJGzmizoT2Ue9qAADS99es+NZxFE9SbDh0Wf6EpSuxXS0HtoSo4cqvu62jf/j3HN4Zzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPBi0v+a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFDEC4CEE4;
	Thu, 17 Apr 2025 12:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744891275;
	bh=CO8F47rGNl3PWbXw49kLHaTU5iubCOOjCAsO/q5Aftw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vPBi0v+avBPa7cYmDLqcqb5YbV19zgYIxMTyC3Mo/a9vczIgMhVcog3T+VSRQii7S
	 +EvebDHOkpy1E+14rMgx0v7wL1OUVtn1wEnrY4Qno0tSdW3+T1hN3M6TaTzUQGm5IV
	 t5brc9Ock1t9deL6fbP7R1PejNJx6TIUMM9R/yGtWX6idWBxzWvfwuVjexP9KKnewl
	 xsOefcdr74WPHUF+NW1QLAhe9eTNyggCVy3LotavZaejQ9+3m06ekIBUKbN5si0BEs
	 TMvOGXb7oZJiHXCOiXPRjXN6sMMpkdqT+peSh1W56yjbZlyRQAQy8r8O/kputoWyKx
	 N22Yki7DBbMrA==
Date: Thu, 17 Apr 2025 14:01:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 1/1] i2c: designware: Use better constants from units.h
Message-ID: <loylm2prv5znosp3oede64refq2elkngnd56rcz4ooc4slx44s@x5aawxkmw2ek>
References: <20250416101702.2128740-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416101702.2128740-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Wed, Apr 16, 2025 at 01:17:02PM +0300, Andy Shevchenko wrote:
> When we use constants in a time or frequency related contexts,
> it's better to utilise the respective definitions that have
> encoded units in them. This will make code better to read and
> understand.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

merged to i2c/i2c-host.

Thanks,
Andi

