Return-Path: <linux-i2c+bounces-10361-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF89A8A50E
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 19:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 926AE1902281
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 17:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147462192EA;
	Tue, 15 Apr 2025 17:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="qn8lLfmO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07A2163;
	Tue, 15 Apr 2025 17:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737075; cv=none; b=BspiaK4nuqZwY4A0GIY3QyjsQpuGzKagCBcbKkmp8cvHe+sIVV8kbtaJdH6cV//V7/I6Tb4qQxd6AtKhrfE/GFkiJRr2Tf53mxdqMV3em8nQMnNCTeRODTiuqf8UT6NKaBGBggb8fGd1P9294uITnvRXJCZisuvnRIEcC4Yjl20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737075; c=relaxed/simple;
	bh=LYLIJcMqInFRg6WXH/HXyRjfAlexJrfgIYXYUwBCcFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueE5RWcg3eQgt0DrryC+JhotW4ecDriLvrOb4yAX4iug68PkM3W8nJbpPrmpkOpg061uVEr053U8LWlazJXtEvuEqxQH7lV8lEB4SnfMXhR3luwWqOffybP+P2/uAas5sPgItqj0c0DH8v+7tdkbUKB8FRyvtUNOwcw+Oarl+s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=qn8lLfmO; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Date: Tue, 15 Apr 2025 13:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744737071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OlbC+gGsedKsWiYVjB0QYl928YSZP6eIRB7xhX10ooY=;
	b=qn8lLfmOPA7UysVojoh0ZBXNQwgh4LGjjIaUhyWv9CJXRLvzsQWvTkJqxUZlKSPYfV9aMR
	X3L01sNDyguc/1kxeqojPT7rWxmMRe8erNDB9NLvpyMVJ3PiVvq8C2AfrpD2WagnrXAIOK
	eL6qf3/bDPVGncEVhbZdD8egszCaJyx6PiCp6k/R8rCCldUYBX9iIgdM1MQ2YOh0tMB+JY
	5OnLRhFz5CINve5TWHFfHHyyU3F25J9MJDHxrqgmUdGs4CfhPhPmZC9NU9RivSY2NSfORQ
	qUSYyCLKqqgjFw8z2nb3YU02YYCY6a9PjZAbO2CfoMZEbhwiXKOkz3vAQtbcgQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] i2c: pasemi: Sort includes alphabetically
Message-ID: <Z_6TK0WKxIK6_9-n@blossom>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-2-c543bf53151a@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250415-pasemi-fixes-v2-2-c543bf53151a@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Tue , Apr 15, 2025 at 03:36:56PM +0000, Sven Peter via B4 Relay a écrit :
> From: Sven Peter <sven@svenpeter.dev>
> 
> No functional changes.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/i2c/busses/i2c-pasemi-core.c | 10 +++++-----
>  drivers/i2c/busses/i2c-pasemi-pci.c  | 10 +++++-----
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
> index 71cc8cfc7c5cbf3924269f6217712d42008c03ff..df1b0087dcacb0a3b94196368137d5e20b0e6d7e 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -6,15 +6,15 @@
>   */
>  
>  #include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> -#include <linux/kernel.h>
> -#include <linux/stddef.h>
>  #include <linux/sched.h>
> -#include <linux/i2c.h>
> -#include <linux/delay.h>
>  #include <linux/slab.h>
> -#include <linux/io.h>
> +#include <linux/stddef.h>
>  
>  #include "i2c-pasemi-core.h"
>  
> diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
> index 77f90c7436eda2df16afd7f1cac79355fb005bfd..b9ccb54ec77e22bb1b77848c858e2e0cc51db7e3 100644
> --- a/drivers/i2c/busses/i2c-pasemi-pci.c
> +++ b/drivers/i2c/busses/i2c-pasemi-pci.c
> @@ -5,15 +5,15 @@
>   * SMBus host driver for PA Semi PWRficient
>   */
>  
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> -#include <linux/kernel.h>
> -#include <linux/stddef.h>
>  #include <linux/sched.h>
> -#include <linux/i2c.h>
> -#include <linux/delay.h>
>  #include <linux/slab.h>
> -#include <linux/io.h>
> +#include <linux/stddef.h>
>  
>  #include "i2c-pasemi-core.h"
>  
> 
> -- 
> 2.34.1
> 
> 

