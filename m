Return-Path: <linux-i2c+bounces-6404-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDB4971A35
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 15:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8569CB234AD
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 13:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2EF1B81C7;
	Mon,  9 Sep 2024 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phi5IflI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE2B1B78F7;
	Mon,  9 Sep 2024 13:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886815; cv=none; b=rPQax95a8jSyi82BieCbDTdDcyLtTnVEW5RTuxZ1UlDBFYlDlUJ3PIHFUQpHgiYc2ArC8TUmU+L5FBByq/q41exVgZpUKBg1888Vro22E7ZVybaUloPR9wxTNAN6k6YmGPg0qmiYHU17VDl1A4mEdPevVH+ZEXFlm1FFoDM1s5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886815; c=relaxed/simple;
	bh=ruHz9KHuDIKm3cQM/2NT6sIheDvmMycaOm0h2WUqGKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiF0Ev290ei8GJDRmAHQy20Sm5Oh88umAkYkBqKe/RHmsru0v92JP5/ygaof+o5o8329FUlZxHAyebNzmT5NIpG39/0rEbH8XUccwz8mk0/6JwvN6Hl2xSHCyImz+3a4pfn0ODxWYDibhELNPm3VZLGbVrwyUDMBRjnGbfMjU+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=phi5IflI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691E6C4CEC5;
	Mon,  9 Sep 2024 13:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725886815;
	bh=ruHz9KHuDIKm3cQM/2NT6sIheDvmMycaOm0h2WUqGKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phi5IflIz+sPJez3pTiHiRXgsY5nGq8Ma8vBQFvAcCj+LdwafZMzpuIILyTSZivgx
	 l74g2su/9m6h3LjLk8Dv1UXO3TYu9DVmj8l20wYIYy0G2xrsCFoMPc5kxSLGpf4zmJ
	 d9p43OXT6MDiKdNupoj4LtXuW6w/rEhT3gmt83azYOthj29IATEtux5QrhImdL1j+Y
	 y4xmYwNi0aPlfGl6e+5IjrQprSiHhkwjAIgOZKUFOvw9UhCmTIW0WLLn49+IPcKRNg
	 HMezMCXocPpuDsMDa9gU3qoOP23ACS+P1Oq5ys3WTT4+KoniPgLM2HzdUWjkNMAPDY
	 5YAgJ2AybwUOw==
Date: Mon, 9 Sep 2024 15:00:11 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] i2c: npcm: Bug fixes read/write operation,
 checkpatch
Message-ID: <qr3q7stbuwl3ylcqnfftg43nvnzi5cz2wcrhinlek6kvzb7wyi@uqgq4z5b6ob5>
References: <20240830034640.7049-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>

Hi,

On Fri, Aug 30, 2024 at 11:46:33AM GMT, Tyrone Ting wrote:
> This patchset includes the following fixes:
> 
> - Restore the npcm_i2caddr array length to fix the smatch warning.
> - Enable the target functionality in the interrupt handling routine 
>   when the i2c transfer is about to finish.
> - Correct the read/write operation procedure.
> - Introduce a software flag to handle the bus error (BER) condition
>   which is not caused by the i2c transfer.
> - Modify timeout calculation.
> - Assign the client address earlier logically.
> - Use an i2c frequency table for the frequency parameters assignment.
> - Coding style fix.
> 
> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

first of all, Thanks Tali for your reviews.

Second, Tyronne, can we please incorporate Tali's comments into
commit messages and improve the code comments so that we don't
leave room for more questions?

Consider that not everyone knows the device and we need good
reasons for accepting the changes.

Thanks,
Andi


> Addressed comments from:
> - kernel test robot : https://lore.kernel.org/oe-kbuild-all/
>   202408080319.de2B6PgU-lkp@intel.com/
> - Dan Carpenter : https://lore.kernel.org/all/202408130818
>   .FgDP5uNm-lkp@intel.com/
> - Andrew Jeffery : https://lore.kernel.org/lkml/
>   20240807100244.16872-7-kfting@nuvoton.com/T/
>   #m3ed3351bf59675bfe0de89c75aae1fb26cad5567
> 
> Changes since version 1:
> - Restore the npcm_i2caddr array length to fix the smatch warning.
> - Remove unused variables.
> - Handle the condition where scl_table_cnt reaches to the maximum value.
> - Fix the checkpatch warning.
> 
> Charles Boyer (1):
>   i2c: npcm: Enable slave in eob interrupt
> 
> Tyrone Ting (6):
>   i2c: npcm: restore slave addresses array length
>   i2c: npcm: correct the read/write operation procedure
>   i2c: npcm: use a software flag to indicate a BER condition
>   i2c: npcm: Modify timeout evaluation mechanism
>   i2c: npcm: Modify the client address assignment
>   i2c: npcm: use i2c frequency table
> 
>  drivers/i2c/busses/i2c-npcm7xx.c | 276 +++++++++++++++++++------------
>  1 file changed, 172 insertions(+), 104 deletions(-)
> 
> 
> base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
> -- 
> 2.34.1
> 

