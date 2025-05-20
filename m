Return-Path: <linux-i2c+bounces-11088-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDD6ABE693
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 23:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1E987B2FF5
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 21:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E14256C9D;
	Tue, 20 May 2025 21:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RB/SZUt/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1592C1D5151;
	Tue, 20 May 2025 21:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778242; cv=none; b=bap9x2omxU4/3l5iaUI/xJEdMLFjBN8OerSsU7UOs2TVxQYMxAeBU3Z1PlO1pAPwwXKHbvZyfIy9hZOHEnAv66UHfSg34R/YHitRvS8/R6m/rts7jUz5zQTeI2nSGFBzLlXlSybY7fwKAoTSI8HZW/Cl6GpURbM3PxRPWGoXXlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778242; c=relaxed/simple;
	bh=YM7zg5B1XkibEJYwUKSvC0tGcTbyjppvYX0Ml+H0CKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=px4vmRsGFKdnzhgq5ERgCzOXBQaRC5ftHru/eb2OcT9z4NOXDtNmLHvJYyOIul51V1vztaCNgZexxWiTILLVmY4hwm0cFnrjV0tgf0dsS2Ae6hwBhP1UkTSiCn/enfZxESSKauBQ7tdfObi3zwdqKyb/mf+8LXNuhXDfro+ch7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RB/SZUt/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F82C4CEE9;
	Tue, 20 May 2025 21:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747778238;
	bh=YM7zg5B1XkibEJYwUKSvC0tGcTbyjppvYX0Ml+H0CKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RB/SZUt/mF4diWCFB2CONiTeGaJGaG/Tewd3Hm+t/tVETrZ/cfFnYjPnG+a3RqNM+
	 q85efoYCQdlQXMNFcTMMpCombnOF3xkCHIOFWua7WUUDzwZF0y3a4LdktflgCYhYKv
	 pv56BHQDF8DzlkB07j55tUH1jIZCGWj/AB3b6xDOLV2hQMhloCKYCdcadZZAMcFsxq
	 Us118u19BIYcpOqrSS9q31afRLwRtFojgJRiHdH1ONm04lAiID9ND1Ser/q9G0kXtd
	 4dBgXM5BOEqTiQEpE7bGag9D5CRM2R0nW0EEeTlgfejrNFNIkBU3Guv0mAs9ztM0M+
	 +1BV3o478amTA==
Date: Tue, 20 May 2025 23:57:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mlxbf: avoid 64-bit division
Message-ID: <amrhua2siuph5y3hsxe7domnypcdjfjah5zkmrzcxig5dbmquv@lghx7oo33bo3>
References: <20250520152600.1975628-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520152600.1975628-1-arnd@kernel.org>

Hi Arnd,

On Tue, May 20, 2025 at 05:25:45PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The 64-bit division in mlxbf_i2c_get_ticks() causes link failures
> when compile-testing on 32-bit machines:
> 
> ERROR: modpost: "__udivdi3" [drivers/i2c/busses/i2c-mlxbf.ko] undefined!
> 
> Change this to a div_u64(), which should replace the constant division
> with a a multiply/shift combination in the mlxbf_i2c_get_ticks().
> 
> The frequency calculation functions require a slow library call but
> should be used much rarer.
> 
> Fixes: 9c6c6fa671f9 ("i2c: mlxbf: Allow build with COMPILE_TEST")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

merged to i2c/i2c-host.

Thanks,
Andi

