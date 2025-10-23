Return-Path: <linux-i2c+bounces-13763-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A019C02788
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 18:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 238051A62384
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 16:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782913148C7;
	Thu, 23 Oct 2025 16:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBHR4u5E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F093318146;
	Thu, 23 Oct 2025 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761237437; cv=none; b=kT0Gg2WfYySe8Q/KYoStV4kBcltnKvs50mC7F0iWQ8oDFTlMhDSdBZGb+/UNMfbuVprpA8+d1kPh6SYjpEUxetPS/VWzx2LPQrrgC8xnDNPoPXWKTXNFEIlTMjhxQ1k64s+J7VLN47X/VOW9Vsc4g2gY+UpdBDRXBSS+Fdx4xsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761237437; c=relaxed/simple;
	bh=fPR0A01Xt9xlltL6y+4pP219bRRj+j6TLOgZvaLWer0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbbwksZ9oHIxgZyAgCch9tmNULOFStD325gLLq6JgMppN6akrt242bPi8HF37xQHmjBmJ5zAJ8DUQXMEyttS5rhlNWK7zkJryql48pZNvsKMr/vtBGKxByLs1nn9lvqSnlSmKnG8P9Rnz6U8pDc+fOSV+Wg4tU4T8fdRR5az0Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBHR4u5E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB70C4CEE7;
	Thu, 23 Oct 2025 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761237436;
	bh=fPR0A01Xt9xlltL6y+4pP219bRRj+j6TLOgZvaLWer0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZBHR4u5EeKjLUjrJVTn5NHF9cn8ehBUTAAnZaYi38EcdmbeDVwmnYEqRcif0ALu++
	 DIrylP8E4XhlNUyOJRUhk03dkabN5SBCjAsU+/p+mMQFza2LEF0WM9QnLfYuSXNal0
	 FxTjY63y+oGGScHjwA0n/LghHiTVcmB58z1BYSRtnaLuE/ZG26rUWqSEKNo7OdoCkk
	 oNUNt80IqAMemEKTb22NwzWjAtC06Shg5m3LBGZaFfhZTYhgL4sHqI426BCKYf5uiq
	 sdJM2uhZst/kwff5JiAxIP3NXsJocR8DCdJWcGZ1pXVfDks6rjAW7qvdfRpuo3eW/z
	 cI3Qw4b/b9h8g==
Date: Thu, 23 Oct 2025 18:37:11 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] i2c: designware: Remove i2c_dw_remove_lock_support()
Message-ID: <20251023163711.GA2090923@ax162>
References: <20251013-dw_i2c_plat_remove-avoid-objtool-no-cfi-warning-v1-1-8cc4842967bf@kernel.org>
 <aPnLLjv1cIOQdozV@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPnLLjv1cIOQdozV@smile.fi.intel.com>

On Thu, Oct 23, 2025 at 09:29:02AM +0300, Andy Shevchenko wrote:
> Have you seen this attempt to refactor a bit that code?
> 
> https://lore.kernel.org/linux-i2c/20231207141653.2785124-7-andriy.shevchenko@linux.intel.com/

No, I did not. I did not look at historical attempts to fix this issue
since it was still present in -next.

Cheers,
Nathan

