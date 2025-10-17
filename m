Return-Path: <linux-i2c+bounces-13618-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D969ABEBC5C
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 22:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AADE5E0302
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 20:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31573287253;
	Fri, 17 Oct 2025 20:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkSOhZxa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF16C284883;
	Fri, 17 Oct 2025 20:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760734723; cv=none; b=hI3ZUIz1siyQZHto81RYvx+nA02JY1ZZVpGnzSoXzg7uMNPGK9Xoy4FRJtPeCi+ovXSeIR6Zrhd3vs3a6mSgKWOEerJSvkxxyWlVvygjXJmPLgY6sS/Xa0kZktcwYNOVUMei+8Bj5JJU/xhJVF6xXRxg2mRPlBQVbCpqaG6O/Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760734723; c=relaxed/simple;
	bh=F5I24V5pJY5IUKUmWr5aZ/SZAEq1+13ut0S3TcxcD1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYXNTf6KV+7IIyyKIzJ/zXxgt8Kbsjx0+xCpoOA2+37SBmzMIdxtoBgCz4SROnA8wkjnJ5kRvv89n0eqpdwgHyj+Ix9OrCQBHm4EqpUDA3PiI94zIY0VU2sqmzZUHlfgTWNCgNvHj0kxfKCfakIiLZXuty4XlxRrxjMDd0dinss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkSOhZxa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5899C4CEE7;
	Fri, 17 Oct 2025 20:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760734722;
	bh=F5I24V5pJY5IUKUmWr5aZ/SZAEq1+13ut0S3TcxcD1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OkSOhZxaYM9jNBvaT5sEvM4r78Ic1xBIqhsenpnVpmHZgn8MxL9Xxsy/tLlVwa83v
	 xvMMjwitImFV0de4pEHviTtsIDkOYouV33dJps53hku8EDSZ1fZ6TVnyadUjl1YjIm
	 eDtFfKx5WM2H4JOkwtiaSmZLP3CLxMet/pNVy1ZV6zIIQW7WMftIPJpPhqnQ7eaqdg
	 dDtFW7VAxK+g7xwvyNSz5d0+ff7K1NfxdtJ7eDFxjI6AbAUkEEuAVoENHKxiY8uhP3
	 mIeB5eHg/ZkMkpQ8ES9iD5CMmo590hknIeDiduzkhn6A6Eg6F3pfXxgjYFKMHs+9cC
	 RM/L8QSWZKbpg==
Date: Fri, 17 Oct 2025 22:58:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] i2c: pcf8584: Fix space(s) required before or
 after different operators
Message-ID: <sirphxaaxjxhoucjnga25lfmx7qpzt4rlh7zghjemjxxic5cws@hl3vdlhdojmf>
References: <aNbWejNZLYGuNvCI@ninjato>
 <20250927041400.172949-1-chiru.cezar.89@gmail.com>
 <20250927041400.172949-4-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927041400.172949-4-chiru.cezar.89@gmail.com>

Hi Cezar,

...

> @@ -284,7 +284,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
>  		goto out;
>  	}
>  
> -	for (i = 0;ret >= 0 && i < num; i++) {
> +	for (i = 0; ret >= 0 && i < num; i++) {

I think the variable ret can be used a bit better, the way it's
used is a bit confusing. I would remove the initialization above
and the check here.

You can declare "ret" inside the for loop...

>  		pmsg = &msgs[i];
>  
>  		ret = pcf_doAddress(adap, pmsg);

here ret does not have any effect, it will always be '0' and we
don't even check it. We don't need to save the value pf
"pcf_doAddress()" (another patch can be to make it void).

Later in the code you can assign ret depending on 
"if (pmsg->flags ..." and simply check "if (ret < 0) break;"

Andi

> -- 
> 2.43.0
> 

