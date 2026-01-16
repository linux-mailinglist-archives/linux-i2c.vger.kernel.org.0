Return-Path: <linux-i2c+bounces-15212-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57540D2E73D
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 10:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3C0230012E8
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 09:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29279316199;
	Fri, 16 Jan 2026 09:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1ukEwj6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E134F315D46;
	Fri, 16 Jan 2026 09:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554263; cv=none; b=eEo8a6QZs2r3yul3L73yE5ee4ETvN8YKHZzSaY+iAGa4N5DZSy37IeIM+XB0QTiUlwHtU+ikKjsNmkp7zs6KE1rppXGcNmQ1jCTVxobZAPHrzDW+GGM5c1gqwuHU4zBz+njgAIBefe8Q9cqK5GEfuLFUXrFR/ClvDkHT9ZVRWgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554263; c=relaxed/simple;
	bh=HT99RDnsAdtgg40C0GtFkwYbV1IGpMHujfc61OQJFTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1W5pfJebH9IRH5uVzbvtiCT7+8cQ6fJKwRyLWbFrZe+LF/On5ik/V/3HlRaVQU6PnSOdhTCnG+M1wgKQV5VqoiyCd8SpLEiDCsptCATi6YH715DgbhmjP3TIMtNlX6cJG9n35Go7bUrIbS5rVsyBoVV51Arz6QevpjNmndLpPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1ukEwj6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A062C116C6;
	Fri, 16 Jan 2026 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554262;
	bh=HT99RDnsAdtgg40C0GtFkwYbV1IGpMHujfc61OQJFTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1ukEwj6rU6aYcK/5mcIRY8dE6H97GFXMXGf++eBtehIY6prTLEm6tBAFPg7JP1V9
	 48KTMlgRWYOtCE9bGIRkYlI7udd++X668cIG2hjQQ1p4nknsOK27OwIpng2hSvF9jY
	 hNuwuSsuAQFGFQJgw51nKuLmRos3oav3SyrL+rAK+aEqbHwKg/axfSifYYp4bEOM/w
	 DtFL2TtfSq3u7oUCeW8ZMSxVWSTlzmP7Om83etZeJDmtn92O1vjt2xupsn8hGTtEXg
	 4KPhxtn8cUNG2wajth0xd3yhOfFp9VxOXDva4kNwDXBPbPzfnBPAvTpT2axa+f5a5T
	 zusO1a6DqCUTg==
Date: Fri, 16 Jan 2026 10:04:19 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: designware: Replace magic numbers with named
 constants
Message-ID: <aWn-97LpG7sdgQTW@zenone.zhora.eu>
References: <20251211122947.1469666-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211122947.1469666-1-a.shimko.dev@gmail.com>

Hi Artem,

On Thu, Dec 11, 2025 at 03:29:47PM +0300, Artem Shimko wrote:
> Replace various magic numbers with properly named constants to improve
> code readability and maintainability. This includes constants for
> register access, timing adjustments, timeouts, FIFO parameters,
> and default values.
> 
> This makes the code more self-documenting without altering any
> functionality.
> 
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Merged to i2c/i2c-host.

Thanks,
Andi

