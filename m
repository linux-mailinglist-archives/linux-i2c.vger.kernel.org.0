Return-Path: <linux-i2c+bounces-7512-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6EB9AD818
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 00:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4FBA1F25B52
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Oct 2024 22:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F87F1DED61;
	Wed, 23 Oct 2024 22:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwSCbqHX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3DC4D599
	for <linux-i2c@vger.kernel.org>; Wed, 23 Oct 2024 22:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723848; cv=none; b=ocsIetVUgzAxGKpl6HOz5c4sOvClpSlycpWaXag+Hl3a7YxcqirRMVsrLSF6tyznCT4HlRCCRfr1UeWCpQokgjdO791vVPq/s5TzMrjlLgjCFThuqqIlOa/X9fsiUor5mJGoGZxh1gE+kbrwKAiO+TkCck47niBf/BEkSIytIL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723848; c=relaxed/simple;
	bh=tC1CuWiI64bfBMeGvc76FvCl5GrttWTm2xfiPoALSU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jw4sT6mq2LD17EdkIaFIyQGo/n0Xw8wwi/d7XEyUdjjD//5YX11Vi++t28x6pjMFdXqbhMM6PcrvfuJ+tOP6DQbNOzZW9cwjvDeMObo/W4aAejWlz2ynFeg6pWKcDILFsXzoBPnSJrIcwpktshucQ1wWnR2c19qBWo0qiOWdw0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwSCbqHX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6540C4CEC6;
	Wed, 23 Oct 2024 22:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729723847;
	bh=tC1CuWiI64bfBMeGvc76FvCl5GrttWTm2xfiPoALSU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fwSCbqHXYaXHKRBJr7oV5FRt0GaP6Yp4iNJDo9XHAqYdgfJNMmwdS+/hFg66L4kOq
	 YWWT2nG09Wj2OMZhfZrtsYHJhTsZDu6Uzli2xn1x6OpCaOtViZOnKrkuxDKdeZMu68
	 D+o4v5rJ815XBzhMQyu0qjVzzGjp3VKcwn3m422mLHpsU9M7HXzFTA/uPYcWfE4lyp
	 0GCVErYyaZSeDCM7x94wlotsd38eUeyt0U7ljedojDSTIcV3B/GAecZxPJmYw9gndN
	 pKoZwoffwGRVT+DcE+7dYgyTWDQoi1Qpt3rpYu0/ui2tG3cKzLsHAhe4AW96N9lxLq
	 BsKsiI1EQSiWQ==
Date: Thu, 24 Oct 2024 00:50:43 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux I2C <linux-i2c@vger.kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v3] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <dltdlktw6bwy2d674vwpbof6jvsm4x2ikeimxxb6n4mazhxijl@4fk5nucyic5e>
References: <20241022120027.01bb4df8@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022120027.01bb4df8@endymion.delvare>

Hi Jean,

On Tue, Oct 22, 2024 at 12:00:27PM +0200, Jean Delvare wrote:
> The i2c-amd756-s4882 and i2c-nforce2-s4985 muxing pseudo-drivers were
> written at a time when the i2c core did not support muxing. They are
> essentially board-specific hacks. If we had to add support for these
> boards today, we would implement it in a completely different way.
> 
> These Tyan server boards are 19 years old by now, so I very much doubt
> any of these is still running today. So let's just drop this clumsy
> code. If anyone really still needs this support and complains, I'll
> rewrite it in a proper way on top of i2c-mux.
> 
> This also fixes the following warnings:
> drivers/i2c/busses/i2c-amd756.c:286:20: warning: symbol 'amd756_smbus' was not declared. Should it be static?
> drivers/i2c/busses/i2c-nforce2.c:123:20: warning: symbol 'nforce2_smbus' was not declared. Should it be static?
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>

Merged to i2c/i2c-host.

Thanks,
Andi

