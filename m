Return-Path: <linux-i2c+bounces-11709-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F23E0AEE667
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 20:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D699189EAF1
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 18:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B992E8E11;
	Mon, 30 Jun 2025 18:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJJaKGiJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD1F28DEE5;
	Mon, 30 Jun 2025 18:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306604; cv=none; b=SRqUnhhVW0S5RpqrV+1kSTogAtXs/M1rIPqTpLt744p0MbGRulmq3/z3Saoe5KAeXG9Xo+MvNFrTuy/+nbxSyp4mmZjEqPu6XyztI/qm8l+uVzy/FWgqTlZ59+ySFjfU8uWjKCCjycw2AILxDSdzNovnAR0IEde72zW6vHVKsLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306604; c=relaxed/simple;
	bh=/tazKHCCD0pK0ErLKhXY7nvngzL75A5mH3m2aT62D6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gv3+qQB/9Dc4YK/m/mMte4iXivje9dJgQoxQroBDzFax4I/r3btxO+bATM0ACLDPqJ8VE6Nr1IQCrTqDffN/0bDA3DrrO0m5OW1D1nGm934pojjq7kvIE+no6gFIRw9wqIZLM2CMrLONwqLU/Qu5ykudONypnWB00yANklEfAK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJJaKGiJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40189C4CEEB;
	Mon, 30 Jun 2025 18:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751306603;
	bh=/tazKHCCD0pK0ErLKhXY7nvngzL75A5mH3m2aT62D6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJJaKGiJiT32dqOI6B0ROz60LOzJKijXugoDTZY8axhwnSIhQlMObvQr6tWi3MYJt
	 U47c5QEH705SbXTCZwv692xRozNHLnGlj1BDQ3XRvwhNwuaQEo/EasHWUXgyNIa4Qo
	 IAr0NlkGdyxUiyKyoBcidrH7QJZxtGjqk1SJUKmonCMZNmwl92IXYoC3+aTfd2gZ+e
	 XEGSMVUvtFuFWsqD5J0iPypVpTq5pUdDiqf9uusKMBPvaA9qgQDk8XrWKyOxPDWRHQ
	 zYYtghudJgdlBVCHsR/jfzeVapH4wFO+4Ycfw4DSRN5RB58jKgnSlqx96Rbnqb0gRJ
	 83HeCvo3iDWtg==
Date: Mon, 30 Jun 2025 20:03:19 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: linux-i2c@vger.kernel.org, andriy.shevchenko@intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH] i2c/designware: Fix an initialization issue
Message-ID: <sq3dhxc6eqwxai6eprz5gpjk5bognek5yxgirpi4cknhnguwgf@3obpdfdtsuiv>
References: <20250627143511.489570-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627143511.489570-1-michael.j.ruhl@intel.com>

Hi Michael,

On Fri, Jun 27, 2025 at 10:35:11AM -0400, Michael J. Ruhl wrote:
> The i2c_dw_xfer_init() function requires msgs and msg_write_idx from the
> dev context to be initialized.
> 
> amd_i2c_dw_xfer_quirk() inits msgs and msgs_num, but not msg_write_idx.
> 
> This could allow an out of bounds access (of msgs).
> 
> Initialize msg_write_idx before calling i2c_dw_xfer_init().
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Fixes: 17631e8ca2d3 ("i2c: designware: Add driver support for AMD NAVI GPU")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

merged to i2c/i2c-host-fixes.

Thank you,
Andi

