Return-Path: <linux-i2c+bounces-10462-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EBAA91D8E
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 15:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6C2F18960E4
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 13:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72EC145B24;
	Thu, 17 Apr 2025 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6ThyFqA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC4EFC0E;
	Thu, 17 Apr 2025 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744895781; cv=none; b=At6n9/WT9NuQX3eV4PVI5YGUwR0E1gUgNv8N+AS9YW6ETMTGVFTFM+QmMahH8doYQNP2+lI2v2keUNBtvZhwWYa6Sciun76abTP9CmeRQqtMCxOSPDbo5nweYpfF9g+/2j1r32R5QvpTHG5qDnNwPqJeha+6jQesn89sJgqPXO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744895781; c=relaxed/simple;
	bh=JOB3Kk/EM3/vcVbO0LHbslX6iAjbGgIXo4UEDu68gq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+AQMygZmZstgWm3k9HslpufywboGV3JW8GRoG+uCBE03D/MEhn83wlBwt9dBb26V3fWWfXrPtGu8hC+ZJC3+Yv9xyc5gn8NL1lBNoenSLEiH20j3c8t/FhKSllr45lchOvr6r3GkxAu8QOwKo4iIq5IpJPFS12rrkgkMo99pmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6ThyFqA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B78C4CEE4;
	Thu, 17 Apr 2025 13:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744895777;
	bh=JOB3Kk/EM3/vcVbO0LHbslX6iAjbGgIXo4UEDu68gq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t6ThyFqA8noKENc0TRm+jM7qkIhPqeNxxbNYDgUD1uF9by0kXywDqsDo5p/U9cuUE
	 YMMXm+EIDwh/MlXQbHRpZ9VAGvonfTIZLAeUM17+YAoAeFQkD0daIYSj0c5M23Y7ac
	 +gDbFX3ebm+od/yhd3ry9t3/q7ZjF0g+wWbfK8kmuIuE/+F9xPKuBJxd4pCCdSB/IH
	 Jep+YB1r1DIuhn2zqURutMz2MEm9klog/jRzeE+UjsmL16RwrkJal5yz131LSvZFiM
	 v+o2Pkyd3L8UbSkMr/tVN2Ctnkunw2kkSI//U6DYbmnbUXcetX6NZJxstjwNAtsdoV
	 knXwfFuq+hi5A==
Date: Thu, 17 Apr 2025 15:16:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 0/6] Apple/PASemi i2c error recovery fixes
Message-ID: <kw3iierscam5stq7igwxpj2std6hwc36y2xbbqliheorbaouxn@zspp5ltjxrus>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>

Hi Sven,

> Hector Martin (3):
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Log bus reset causes
> 
> Sven Peter (3):
>       i2c: pasemi: Use correct bits.h include
>       i2c: pasemi: Sort includes alphabetically

I applied in i2c/i2c-host the two patches above, so that you can
start from patch 3 as there were a few little notes.

I didn't see necessary the Fixes tag in the bits.h patch so that
I removed it.

Thanks,
Andi

