Return-Path: <linux-i2c+bounces-13550-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 813C9BE0AF5
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 22:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E845C1893674
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 20:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D9D2C0F95;
	Wed, 15 Oct 2025 20:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFUTF4zb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D982046BA;
	Wed, 15 Oct 2025 20:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760561231; cv=none; b=plmvrCT49k+uEdXnOIerHieER9OiDYHXH3KXtDcOzti3+gKBxjf6JnF1kJOtODgLBGKoDEjINlX+I3AUYwUtfcPbugiQ90KeSyJy8mKNhV0hCFeC3TPE3lzJtMu50sMIVTuACMoOeRQNvp1Xozrkg5DhK1OijNZRkbRXc2uviD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760561231; c=relaxed/simple;
	bh=tBJBI3gaEC0acal0pfusljT6lkhp0cPv2Uh1pwrgniM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnZpToT59UQlF8gR8oxhadNXXboiO5JOhPPVx5BMqZyDh2Oj0Wk0aEUgUUO43ZKL1TsDGzss+OuNQKknnv9S5571CfJpBtEDON4NBSYJxO8tsoOprOsT085nnMPkOSza38Zg8TLej1ezx3mqimTPC1lF22P7Ik39L3/2eY2szzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFUTF4zb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5146C4CEF8;
	Wed, 15 Oct 2025 20:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760561230;
	bh=tBJBI3gaEC0acal0pfusljT6lkhp0cPv2Uh1pwrgniM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kFUTF4zb0ixKawU/IlJE5CjYalYJOhgWSGK5rN91ZE4f3i4GNRyKUQJbL8xA6oYKz
	 4LYRCgTSZu/aTzFD01EyxRYh1q6JucmNXz4G9oQNdgNX7aPRwwdsOLYNz8l4UfE4iX
	 LojtKB+8ffcY+ey/L68tUwOycSXKGwI4lRJrIX22gQI/HqqDmCJySBrCdX2jqRkntw
	 zcgs7Eheg7713Ef1fnt6Vk7UqGpG70VHKfT0Yr3AlXID5EYwXphnUCt3U6s0IHSUX7
	 MkDAU1Q4btIkxXWWDtUDuNIS2q2HLAwWQqPROX1i1VSldg7rFf2unnvRqriGFb0jyS
	 5f9ER6i+rGQzQ==
Date: Wed, 15 Oct 2025 22:47:06 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH] i2c: designware: Remove i2c_dw_remove_lock_support()
Message-ID: <io3jagoj2ejqbo76oild7b4x3hquw4qsbi6eourp3qgypb6jpu@ttwl4qk54pt7>
References: <20251013-dw_i2c_plat_remove-avoid-objtool-no-cfi-warning-v1-1-8cc4842967bf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-dw_i2c_plat_remove-avoid-objtool-no-cfi-warning-v1-1-8cc4842967bf@kernel.org>

Hi Nathan,

On Mon, Oct 13, 2025 at 06:05:03PM -0700, Nathan Chancellor wrote:
> When building certain configurations with CONFIG_FINEIBT=y after
> commit 894af4a1cde6 ("objtool: Validate kCFI calls"), there is a
> warning due to an indirect call in dw_i2c_plat_remove():

...

> Closes: https://github.com/ClangBuiltLinux/linux/issues/2133
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

I'm OK with the "lengthy" (i.e. clear) message and I understood
that no r-b is binding. Applied to i2c/i2c-host.

Thanks,
Andi

