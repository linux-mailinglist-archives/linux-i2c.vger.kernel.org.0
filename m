Return-Path: <linux-i2c+bounces-11595-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7004DAE9048
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 23:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 521FE1C262F2
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 21:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FEB25393A;
	Wed, 25 Jun 2025 21:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtaxId2P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94905C8EB;
	Wed, 25 Jun 2025 21:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750887814; cv=none; b=NvgWEkqYUBaWiK54+xevpw3kGGRNywBJcrkilFSYljZ/F4O7RCJ11uKMfm4LKbG4nT7ER9xIOefvQZHFgWeQZ2U+j0z9VvR59RIIc2ccY6q3AQmqytghPDUNrLU0LCCCo3WDmjh+5RW9jhK0Gic3liBSWl2oDwMqBfezvanfNqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750887814; c=relaxed/simple;
	bh=acqOVqgS38j/Eu84gwmws25WYtMUHCP1ti+D3iZ62T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4PDrdMGHM8za4B6NPweJnt6La1GJo+OAUo9pOB+Rp+w0QKAunzOQLhI5IiaU0pA8vkAaO3bb4fzZ5LTwri6exIgROXxlGiXO79sGXter372x8zU6LtjSGPdffKP5GK7SZIXu7NHqMooLwJCT4sIGiaT4BrFJI0R/9quIsVhImU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtaxId2P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6BDC4CEEA;
	Wed, 25 Jun 2025 21:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750887814;
	bh=acqOVqgS38j/Eu84gwmws25WYtMUHCP1ti+D3iZ62T8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XtaxId2P29xaxb03HTMt9SrDePyl6Pp0MaUSsglUx9RPOqMysb/TYhNZJ6ypunsb8
	 Upyw0zSmkshwLsLS5KTMyJrqiN6sQnK8UwhPVj8gPOlw15r1VauzCTMdQJuLqCUpp5
	 pgw5CTOiz4nC2xW0f6RTUnbcIN15S0avO0l86kes6W/pXQFOrqAG+KfeaPPjXH0Ayq
	 yZFVA+DkeughNzuPPVhbOQA9z7ghWR717Ebi/LhWUge5p+VSRY4k+4D68DJ0PYKBEZ
	 /SLO7CcUV6DHNgT+ywdVWNM13W232LR+npZ8TmRtEH76UH2w9d4xBiKef1A4vTSQ+x
	 ccXA++SGpC44A==
Date: Wed, 25 Jun 2025 23:43:29 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: ilpo.jarvinen@linux.intel.com, rdunlap@infradead.org, 
	hdegoede@redhat.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, 
	linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com, 
	gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH v4 0/3] Fix build issue when CONFIG_MODULES is not set
Message-ID: <a4aja2xsya3titlnalacf2pfioj5zrddan5a2wazgfl7l4eu46@oe4f27vdmrnf>
References: <20250609155601.1477055-1-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609155601.1477055-1-pratap.nirujogi@amd.com>

Hi Pratap,

> Pratap Nirujogi (3):
>   i2c: designware: Initialize adapter name only when not set
>   i2c: amd-isp: Initialize unique adapter name
>   platform/x86: Use i2c adapter name to fix build errors

I merged this entire series in i2c/i2c-host-fixes. For the last
patch I added the "Requires:" tag in order to include non-Fixes
patches in the fixes pull request.

Thanks,
Andi

