Return-Path: <linux-i2c+bounces-13488-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EB2BDBB59
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 00:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F6913A9A37
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 22:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFC11A5BA2;
	Tue, 14 Oct 2025 22:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNq9S6NO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E401EA84;
	Tue, 14 Oct 2025 22:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760482389; cv=none; b=a9PFAvrqUESNq5E1QJTc2hbhDbAWuJNrCqpdTFy+hV5Tdgz535uG/zlPB+YilsN0SltIPR0LlduXOW/hLi/uMZAG8FEOgyNPp2/P065pk4uJvoCrmJrV5AmrGp5m2ohZnlievMNU5THWcyJbtE4mSgmvbFB3Ue7mRzltyJGhsyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760482389; c=relaxed/simple;
	bh=gPt5rTiaGMFpVj9ANxudLZMw6vXtx+1SHRAYO7k42iE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DXr/RxM7hFg72y2ShAg35BtA1Q5zWPQExHM1KJeHtUeE0/8nwPN825V1R1YZcApuRNA38gQupWfLacJwncUWX+j8qTn55pUrb6Ry+lfXGIy2Gb5Am1BjgsYYT/dCk1Le1MV33ssrYCw2NZ+wL8L405FKznkY26tjPxlI6gEC9dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNq9S6NO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27913C4CEE7;
	Tue, 14 Oct 2025 22:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760482388;
	bh=gPt5rTiaGMFpVj9ANxudLZMw6vXtx+1SHRAYO7k42iE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iNq9S6NOGkIyDDJ3beLRyihLkUu0bpJNiRc1xAH6wRiB1b0UA6hWL7sS7+JKb0BVv
	 lYpTxM15XBeW8JiVV0SRHIO3ck1ZPwRxWKmp/xarTZY90ZG8EZqWOsAjjD4hr//TuP
	 rv7trcUGbuR5eEXyrGk18hd5MxIdbagq7mkICMXvT3whW+Y403K93pwe/cfsdcxgwK
	 EQHlVLfXeLlVOR0l2LRcbrp30SSkBY+x7nLRPsPkvEQmwRehLA3pvh1vb351LxFpqf
	 KLefi6uN/v/5KCmQlgQLFKeqOpwRcjgyFtR+86DFAbm9vrF/uTD+//wTlQFHM/fcOM
	 rW0fX9DOBw3kA==
Date: Tue, 14 Oct 2025 17:53:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] i2c: designware: Remove i2c_dw_remove_lock_support()
Message-ID: <20251014225306.GA915466@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014223955.GB3575477@ax162>

On Tue, Oct 14, 2025 at 03:39:55PM -0700, Nathan Chancellor wrote:
> On Tue, Oct 14, 2025 at 04:58:56PM -0500, Mario Limonciello (AMD) (kernel.org) wrote:
> > On 10/14/2025 3:33 PM, Bjorn Helgaas wrote:
> > > I'm totally fine with the patch itself, but I think the commit log
> > > could be trimmed to something like the following with no loss:
> > > 
> > >    Remove struct i2c_dw_semaphore_callbacks.remove() and
> > >    i2c_dw_remove_lock_support().
> > > 
> > >    440da737cf8d ("i2c: designware: Use PCI PSP driver for
> > >    communication") removed the last place that set
> > >    i2c_dw_semaphore_callbacks.remove(), which made
> > >    i2c_dw_remove_lock_support() a no-op.
> > > 
> > >    This has the side effect of avoiding this kCFI warning (see Link):
> > > 
> > >      dw_i2c_plat_remove+0x3c: no-cfi indirect call!
> > > 
> > >    Link: https://lore.kernel.org/r/20251013-dw_i2c_plat_remove-avoid-objtool-no-cfi-warning-v1-1-8cc4842967bf@kernel.org
> > > 
> > > FWIW,
> > > Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > I echo Bjorn's comments on the lengthy commit message.
> > Code change looks fine.
> > 
> > Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> 
> I have no objections to trimming the commit message if so desired but I
> think the solution (removing unused code) is more tangential to the
> problem (potentially accessing an array out of bounds). I am sometimes
> looking at changes from ten years ago where something was done to avoid
> a problem but the problem was never mentioned in the message but may
> have been elsewhere. Maybe nobody ever needs .remove() again but what if
> new IP comes out that necessitates it and they go to revert this change
> without avoiding this problem? I could try to make the analysis shorter
> if that would help.

OK, I missed that there was an out-of-bounds array access involved.
Maybe that warrants more details.

Bjorn

