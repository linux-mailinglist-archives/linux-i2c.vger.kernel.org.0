Return-Path: <linux-i2c+bounces-13616-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BACBEBB42
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 22:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 740F34E60EC
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 20:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E3725743D;
	Fri, 17 Oct 2025 20:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyjxt46m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71856354ACA;
	Fri, 17 Oct 2025 20:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760733575; cv=none; b=US8UsybuSreax3WGVFIwozhca/9ujUhaPHuHkzhnbi97G/Y9/TsaPepZE0a+/EJYMtOMnPwQzUCHvCH36fWMv/ZEaOr7zVNr3zOeVZ49r6Cw3pvngCKPFCxzzf4YRTXYNk8pNWgJo6aKH2Dr9UYwxUji0+7UApJ34PDi9e+fv88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760733575; c=relaxed/simple;
	bh=Jv7RcvpMgkLVVym4ySFqR0X+tsnatgRC2rS+YiPrsuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNjM6Emu7Z8zlmuPDQLCtxLN/IxMLUf+Evtoy1+fbFL1CeVWp2uiDECgX4KcXaGQKixnWNgjYRnDyXK87d5o6x69BN0W5jDr3yBszMVfBDpsAm3dQF4w8a6USeYiAzlhtwQT/B7ihsdu+NrMy/RKvObbe6Xh0AHAJTrHbv/G/Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyjxt46m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED68C113D0;
	Fri, 17 Oct 2025 20:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760733575;
	bh=Jv7RcvpMgkLVVym4ySFqR0X+tsnatgRC2rS+YiPrsuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hyjxt46mCMY3uoLo1aH6FH4LHZLPr4fGEkEfr5ijGz4W2bbKQkkm2rHXSi2nRa46O
	 7w3m69IieFkpWLMLn2GCwuiaAgKEu7CuvJXXRiOR1AsypRUDQ/+9M5lkjdiQHcpWIB
	 oOD9NViE15XMUhQlDru2Q6GaCSQ3eIiNuXoOi5OW7SwpRF/RRSev1gMMXSi3+Iot0j
	 M6n4gKpI5tSIGR3SKqg7Bm2ECGieJYvAfB0iU1dPavVXWR5NKyKpDMyozNB1M5it2o
	 kbFW0HbXgf9vRxhEg199z8Yp2aM4qzjnz2DylrpmnVtOrwwuw+Uz1rm6INAUltPPL7
	 WsIOBFOS836gA==
Date: Fri, 17 Oct 2025 22:39:30 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] i2c: pcf8584: Fix errors and warnings reported by
 checkpatch
Message-ID: <joong74bnb7by3ptmynxhbj2vdznp7b5u6ivlnm2tfu4rlplya@vvgfpcmm4f4i>
References: <aNbWejNZLYGuNvCI@ninjato>
 <20250927041400.172949-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927041400.172949-1-chiru.cezar.89@gmail.com>

Hi Cezar,

can you please send your new version series as not
--in-reply-to?

I find it very confusing.

Thanks,
Andi

On Sat, Sep 27, 2025 at 07:13:57AM +0300, Cezar Chiru wrote:
> Hello maintainers,
> 
> This patch series fixes 18 errors and multiple warnings reported by 
> checkpatch.pl on drivers/i2c/algos/i2c-algo-pcf.c file.
> 
> The series PATCH v1 to PATCH v4 is a response to the discussion on the
> mailing list with Markus Elfring who had comments on my earlier 
> submissions. 
> He suggested:
>  -to split my initial submission in a patch series
>  -had some valid points on imperative mood usage in commit messages
>  -wrapping commit message to 75 columns per line
>  -change some of the commit message to point usage of checkpatch.pl
> The series PATCH v4 to PATCH v6 is a response to the discussion on the
> mailing list with I2C SUBSYSTEM maintainer Wolfram Sang who requested
> some changes:
> He requested:
>  - to remove debug macros from i2c-algo-pcf.c as no code change was done
>  for almost 16 years.
>  - remove wrapping paranthesis from value assigned of '(0)''.
>  - resolve conficts caused by debug macros removal.
>  - remove also printk and dev_dbg function calls related to DEB macros.
> 
> Here is a brief summary and order of patches to be applied:
> Patch 1/3: i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
> This patch remove the define of debug macros and also their usage from
> code along with printk and dev_dbg function calls.
> 
> Patch 2/3: i2c: pcf8584: Fix do not use assignment inside if conditional
> This patch takes the assignement from if conditional and moves it by 1 line
> up.
> 
> Patch 3/3: i2c: pcf8584: Fix space(s) required before or after different
>            operators
> This patch adds space(s) around some binary operators.
> 
> Testing:
>    *built kernel and modules with I2C_ALGOPCF=m and my 3 patches applied on
>    top of 6.17.0-rc7.
>    *installed kernel and external modules generated by build on my laptop
>    *rebooted and loaded i2c-algo-pcf.ko without i2c_debug parameter.
>    *when loading the .ko with i2c_debug parameter an error is seen in dmesg
>    and this is expected as the parameter was removed.
>    *No success message related to i2c_algo_pcf was seen in dmesg but also 
>    no failures.
>    *Module loading and unloading successful.
>    *No PCF8584 Hardware was available.
> 
> Cezar Chiru (3):
>   i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
>   i2c: pcf8584: Fix do not use assignment inside if conditional
>   i2c: pcf8584: Fix space(s) required before or after different
>     operators
> 
>  drivers/i2c/algos/i2c-algo-pcf.c | 93 +++++++-------------------------
>  1 file changed, 18 insertions(+), 75 deletions(-)
> 
> -- 
> 2.43.0
> 

