Return-Path: <linux-i2c+bounces-13487-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6F0BDBAA2
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 00:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 64AEF4F734B
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 22:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405902D12ED;
	Tue, 14 Oct 2025 22:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VeOfEO3z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED00726FA6E;
	Tue, 14 Oct 2025 22:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760481601; cv=none; b=YV+/D6FMGJ1pq/VH+E7pa9gM1efGMCGXX764Li1WhzhxRir7X6dTBro4FT3BvJaAoc2GVhYMGbmpNe35SfZu8GvYvfTx1MobJimlNTLSJYUKiBbH/McH6EULtUvTLoH2XFF87qwL082BwkLt66XmVHLgw+d7QnVFK8vUuQfrz80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760481601; c=relaxed/simple;
	bh=HJV7o9IeEuxcVHIHjK/81wR3IFGTE46/eu2K02OIGzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ax2LS3CNhttuz7dhAdc550Hd+GNRceEQOdcX0x/KxCzdvMpEtj9JTAHP1cqg1NYFfp3pk7aFb4IcOVDO+0uV2JeU4GC2Kq7fjwOYLhizE9iHqTV/cMt8/CXG2jE4fOU2WDaw7pb++23ciNf0UFL2qWN17u/jhUWYdHbENA8rwKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VeOfEO3z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55A6C4CEF1;
	Tue, 14 Oct 2025 22:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760481600;
	bh=HJV7o9IeEuxcVHIHjK/81wR3IFGTE46/eu2K02OIGzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VeOfEO3zkLaE/wbHB0d8eBT8oW+M3Pl40vI0bq0aglmQyS1kYaElZ5Xi+Hj2jwWgR
	 VSkZ9ng+Meczq0a5S/VDZdtTLp7mksu5khgcWjJ8jWA9T9HTTrSFJoErFI6MrUsdCN
	 XRuP2dPH3v/MIus2WAqbfu9ahKbuSiTwzuXpJCV2GyDoGkKqy1YXOiXvgdxv47tJn4
	 kDKN4Jqgn7sK8VnrhqXfS+ycDB5fhSjRNud6QraIipeqYF3FtblfUBleEWuGcAA3yw
	 RMoyhm0mvcnpZ9al1aKiPMQDjF+BQJ9Xayq3QKgcivG1rGUmmZcRCWEs8KwMn8m4Mn
	 BK4W2/yRbiHXQ==
Date: Tue, 14 Oct 2025 15:39:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] i2c: designware: Remove i2c_dw_remove_lock_support()
Message-ID: <20251014223955.GB3575477@ax162>
References: <20251014203305.GA904692@bhelgaas>
 <3f4ee683-4fdb-4183-8f99-f931f853d9ae@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f4ee683-4fdb-4183-8f99-f931f853d9ae@kernel.org>

On Tue, Oct 14, 2025 at 04:58:56PM -0500, Mario Limonciello (AMD) (kernel.org) wrote:
> On 10/14/2025 3:33 PM, Bjorn Helgaas wrote:
> > I'm totally fine with the patch itself, but I think the commit log
> > could be trimmed to something like the following with no loss:
> > 
> >    Remove struct i2c_dw_semaphore_callbacks.remove() and
> >    i2c_dw_remove_lock_support().
> > 
> >    440da737cf8d ("i2c: designware: Use PCI PSP driver for
> >    communication") removed the last place that set
> >    i2c_dw_semaphore_callbacks.remove(), which made
> >    i2c_dw_remove_lock_support() a no-op.
> > 
> >    This has the side effect of avoiding this kCFI warning (see Link):
> > 
> >      dw_i2c_plat_remove+0x3c: no-cfi indirect call!
> > 
> >    Link: https://lore.kernel.org/r/20251013-dw_i2c_plat_remove-avoid-objtool-no-cfi-warning-v1-1-8cc4842967bf@kernel.org
> > 
> > FWIW,
> > Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> I echo Bjorn's comments on the lengthy commit message.
> Code change looks fine.
> 
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

I have no objections to trimming the commit message if so desired but I
think the solution (removing unused code) is more tangential to the
problem (potentially accessing an array out of bounds). I am sometimes
looking at changes from ten years ago where something was done to avoid
a problem but the problem was never mentioned in the message but may
have been elsewhere. Maybe nobody ever needs .remove() again but what if
new IP comes out that necessitates it and they go to revert this change
without avoiding this problem? I could try to make the analysis shorter
if that would help.

Cheers,
Nathan

