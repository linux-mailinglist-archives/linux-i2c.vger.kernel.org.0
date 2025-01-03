Return-Path: <linux-i2c+bounces-8906-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF57A010DF
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 00:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A14F160FC0
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 23:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D15D1BEF96;
	Fri,  3 Jan 2025 23:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcjIpJmw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589721AD3E5;
	Fri,  3 Jan 2025 23:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735946337; cv=none; b=VWvfyQVoRkqXv44ISLbnL84wk6TFCep2WRsDWE5d01PX31yCGEwbSSpp6bXtleXJQLj5xJAkCM91IWZuZVvR7v1uZBsWqUDPo8W7w0PNFUGG+WaJfn+Rtfpn3YC+mp2NJERkgPgdSiajOkShkQoF/5GdWsjwUrcww3nm9s1P1j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735946337; c=relaxed/simple;
	bh=WvIFY8TioJWNnV4BIy/98ALNpIGTvn+FcjVZzmcy/do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1FnJw9CT7AwxDrqJLq/m1yLohFzjxb9+tqCSx+imiKN4eTFcY11GkyUOx0h1y6EaCE5hABWjWDo7J2dsYNC6E1Y8iQcw6YzttkPQeuzq20k8o9Ckv+c268upF7G6fZmTAsddg+lLjzPDJGYkAlF1t+rF7oy/nEp6hOn4kHcC9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcjIpJmw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470B4C4CEDD;
	Fri,  3 Jan 2025 23:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735946336;
	bh=WvIFY8TioJWNnV4BIy/98ALNpIGTvn+FcjVZzmcy/do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lcjIpJmwPeTw61L9L9/z8t2ebmPk3x3CZt6DCmhvDGsdPGKSGOjCQTupfqopXshuU
	 AN6IZf3vB4MqHydj831aKaB3ytBl062+V8aIgpccUmxsa0gpIfgJBl2nSbgAAKwujp
	 niKwkd6nUCBtQwUDea2S24JUYT5Gf6KbyYjEc7qwIju1zaOZ4a3CliTBXDqKHmoYBY
	 tghBxDQMm/1qpJRR2ok7uX6+9Rr22H9b+qlntXevEfqz/YhzrmvFnsiMILDsE5TTUF
	 25CpIVQM3EHIORn8liaY1VgdH/dleSsyI6t9zjlQpbfMFAWAZJktuizvz1EsTbqcHI
	 e4sZhvR4A7hpA==
Date: Sat, 4 Jan 2025 00:18:52 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Jean Delvare <jdelvare@suse.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: amd756: Fix endianness handling for word data
Message-ID: <qj3ymbntblc26wnezki2pn2g26z5poc5njhsfbxzam3mpjy52p@px44dxiqhedt>
References: <20250101103422.30523-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250101103422.30523-1-evepolonium@gmail.com>

On Wed, Jan 01, 2025 at 04:04:22PM +0530, Atharva Tiwari wrote:
> Ensure correct handling of "endianness"
> for word-sized data in amd756_access
> 
>  - Convert word data into little-endian using cpu_to_le16
>  - Convert word data from little-endian
>    to cpu native format using le16_to_cpu
> 
> This fixes poteential issues on big-endian systems and
> ensure proper byte ordering for SMBus word transacitions
> 
> and you would be thinking why did i resend the patch
> it is because kernel test robot
> noticed a few warning so i fixed them

first of all, thanks for your patch. I was aware that this issue 
had been reported by the LKP, but I initially decided to keep it 
as it was and queue it in i2c/i2c-host since I didn't consider it 
a serious issue.

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412311145.AKMzVNw4-lkp@intel.com/

Now, you're treating it as a fix, which is perfectly fine. For
me, it's a 50-50 case.

I'll reward your second version by moving this patch to the fixes 
branch. However, for the next time, please:

 - Be transparent about your intentions: you knew I had already 
   merged it, and you should have discussed this with me before 
   sending a new version.
 - Number your patches as [PATCH v2] using 'git format-patch -v 2...'.
 - Avoid leaving blank spaces in the tag section: for example,
   there is a blank line between 'Closes:' and 'Signed-off-by:'.
 - Add a changelog to highlight what has changed.
 - Include the 'Fixes:' tag[1] (wow, this dates back to the
   origins of git!).
 - Cc the stable mailing list[2] to ensure proper visibility.

In any case, don't worry—I’ll take care of this, and there's no
need for you to resend it.

Thanks,  
Andi  

[1] Fixes: 1da177e4c3f4 ('Linux-2.6.12-rc2')  
[2] Cc: <stable@vger.kernel.org> # v2.6.12+  

