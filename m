Return-Path: <linux-i2c+bounces-15194-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0175D25568
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 16:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF8C730B50D6
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 15:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8644C3AA1AE;
	Thu, 15 Jan 2026 15:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gb0uiRRp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF993B8BA8;
	Thu, 15 Jan 2026 15:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768490630; cv=none; b=lOmwsgnYNpwOueOgFOUYe3yRes2wWrwB+mMHyJjhIgDwaN1ZHlSwSo1pAsqMZ+8r5PzGnqKTvnwlCezTywdSTiywg6HeTml9Z9ZxaJFC9BhC97uox3Tv7q1+WDAM9l9/6N2A2TojCqzswvatcXzOYeubJj5Fp7naMs6AOXFvY6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768490630; c=relaxed/simple;
	bh=X4kmc1mIGF7TRTatstkptIgYwOVznVAZAzsOklRiNzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpK4RTWczQ2FpvXJEh76+9Ifou1c/QgYmNEY3s786GikW4rwZGzxyXVlgSNQ6MTUvgNR9o2FER+LAuNJf0viByAhJCDAx82iI/BprAjSo6GvXmCuMysdTFolKiehGxERBelE5rVkYp98bcPOFhkVO8os3C6gIcEY3z2K+rX9vlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gb0uiRRp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE46C116D0;
	Thu, 15 Jan 2026 15:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768490628;
	bh=X4kmc1mIGF7TRTatstkptIgYwOVznVAZAzsOklRiNzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gb0uiRRpbxtiOWrlhk2q1Vlv1oBmwldMe9WsUDPNBuBsfOd92WeH+kGKCKp0CnPUB
	 NxmCsMpYYgAkmfTnMOdsMvUGMHZxVq63+jx6UyhitEiIxL9EtF9DbBrELZqGETOZ4n
	 Qt363AGwGlyeikO+sOcF6H4BN2VJg2F5ZQJhTAh+bsmrDkttXACda55FWX8PL+YTpc
	 zHik8OtOactYKPtmkKf2snS4T1Q6CO+VMcRfBBqpm2GWPU/fOnAP0HiHLcz0fNUbfo
	 KbgeYao5Gq2LNGdJD5tRTKgEa29Y0EY0IbcXm5WgftV/lHBbROfKHahnAMtLxOBJmT
	 lN+jkQvqatEVQ==
Date: Thu, 15 Jan 2026 16:23:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 1/2] i2c: designware: Remove not-going-to-be-supported
 code for Baikal SoC
Message-ID: <aWkGStyupgSXS07Q@zenone.zhora.eu>
References: <20260114081954.252160-1-andriy.shevchenko@linux.intel.com>
 <20260114081954.252160-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114081954.252160-2-andriy.shevchenko@linux.intel.com>

On Wed, Jan 14, 2026 at 09:17:50AM +0100, Andy Shevchenko wrote:
> As noticed in the discussion [1] the Baikal SoC and platforms
> are not going to be finalized, hence remove stale code.
> 
> Link: https://lore.kernel.org/lkml/22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org/ [1]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Until you guys sort things out with patch 2, I'm applying patch 1.

Thanks,
Andi

