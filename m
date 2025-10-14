Return-Path: <linux-i2c+bounces-13485-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A3FBDB5CD
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 23:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BDB364F2C8F
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 21:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3D430CD9A;
	Tue, 14 Oct 2025 21:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYzCypEk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42E930CD88;
	Tue, 14 Oct 2025 21:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476201; cv=none; b=rx6hLFfz4kzDQr4AqUZKRzGADz3o98XWKqrGKWI8TdfoPbdv9xu8xqWzpGeKPiuPqh2RTF6zGab8ojjs2ujPtpUqjN1jn59zzKHgdyB9dLVbETORs2xRd7AxKIZ0NsxDup95dHJZdhHJFJU6+Kv7jwauHCMDZgMl/ljXvSWBhuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476201; c=relaxed/simple;
	bh=cqPtAAZAPBuPXF5nN7OGnM4hehYv2tOI2Btj32ANV2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zfpa051emBJn0/Tj0cZzj0Mkbwy2CoHz0v+4VNfrw68EfitAK0idPkHh57wRr6mqA94NXE7ECCrCDiAaiKADk4Pk2dD/xD8Dhe2sU5SILVsf/8AiG1byajHju+jI/0Y6dnoBSOMftjeu942oWqlFhg123B0JvASOGAa5+jbKYRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYzCypEk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80A6C4CEE7;
	Tue, 14 Oct 2025 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760476200;
	bh=cqPtAAZAPBuPXF5nN7OGnM4hehYv2tOI2Btj32ANV2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYzCypEkMZ2YercGJEmTYdy/Yo9s/zJaLYsQaI+Y4yEWWMlo5zvyg5PkBUmexWMNG
	 naAfCvGoyZAnX3lgNFxqoyaBH3kafFIhBkMKDEkhv3YCPcEbPH75JdBdNGbmA2enqn
	 1sqNTiJiJHpw2DuNr6+kGXL2R6yHKPmZJyxNj6HMwM/EP8CRGRq2qKMh5j9cFRwIKM
	 Lr8DgHfzz677oeQCYkzlFjfqHJyKXqgzmp5A52tOyjvB4Wvjuu58lIMrNQ624wcheW
	 uAmvgV/deaeqbyRShRP0777d2R8DRndHbWrdViDRB3/sMreO21wue848GzqMkrwf3s
	 ghV2jFecHhwnQ==
Date: Tue, 14 Oct 2025 14:10:00 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Sami Tolvanen <samitolvanen@google.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] i2c: designware: Remove i2c_dw_remove_lock_support()
Message-ID: <202510141409.B33E2667@keescook>
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

On Mon, Oct 13, 2025 at 06:05:03PM -0700, Nathan Chancellor wrote:
> When building certain configurations with CONFIG_FINEIBT=y after
> commit 894af4a1cde6 ("objtool: Validate kCFI calls"), there is a
> warning due to an indirect call in dw_i2c_plat_remove():
> 
>   $ cat allno.config
>   CONFIG_ACPI=y
>   CONFIG_CFI=y
>   CONFIG_COMMON_CLK=y
>   CONFIG_CPU_MITIGATIONS=y
>   CONFIG_I2C=y
>   CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
>   CONFIG_I2C_DESIGNWARE_CORE=y
>   CONFIG_I2C_DESIGNWARE_PLATFORM=y
>   CONFIG_IOSF_MBI=y
>   CONFIG_MITIGATION_RETPOLINE=y
>   CONFIG_MODULES=y
>   CONFIG_PCI=y
>   CONFIG_X86_KERNEL_IBT=y
> 
>   $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 clean allnoconfig vmlinux
>   vmlinux.o: warning: objtool: dw_i2c_plat_remove+0x3c: no-cfi indirect call!
> 
> With this configuration, i2c_dw_semaphore_cb_table has the BAYTRAIL
> member and the sentinel (i.e., 2 members), both of which have an
> implicit
> 
>   .remove = NULL,
> 
> so Clang effectively turns i2c_dw_remove_lock_support(), which is later
> inlined into dw_i2c_plat_remove(), into:
> 
>   static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
>   {
>       if (dev->semaphore_idx > 2)
>           (*NULL)(dev):
>   }
> 
> which is not necessarily problematic from a logic perspective (as the
> code was not bounds checking semaphore_idx so an out of bounds index
> could already crash) but objtool's new __nocfi indirect call checking
> trips over Clang dropping the kCFI setup from a known NULL indirect
> call.
> 
> While it would be possible to fix this by transforming the initial check
> into
> 
>   if (dev->semaphore_idx < 0 || dev->semaphore_idx >= ARRAY_SIZE(i2c_dw_semaphore_cb_table))
> 
> the remove member is unused after commit 440da737cf8d ("i2c: designware:
> Use PCI PSP driver for communication"), so i2c_dw_remove_lock_support()
> can be removed altogether, as it will never actually do anything.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2133
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the analysis!

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

