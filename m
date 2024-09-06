Return-Path: <linux-i2c+bounces-6297-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7655596EB86
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 09:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04942B241B6
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 07:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6D514BFA2;
	Fri,  6 Sep 2024 07:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r1MoESgT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835C414B959;
	Fri,  6 Sep 2024 07:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606356; cv=none; b=jRq5+ID/TqPds62pGEnj0cnThcJ2S1kVe9vkO0Yk6dvK00YQfCuL1Vr0g8Sw9jCml9V0qTd7rCdcTVy1+AvfdUCXc7oZEb3f0kWZa4oKzTaRKOzzKo8/RxNi5mjIL88U/Q04/Z6+xlhVsbJq57YnlZsKk1WDIVO18EYC2T8LSOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606356; c=relaxed/simple;
	bh=oDrorMdX9k1okUgl5LsV5arhu2DByaxXuJRBbgjF4V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojdbw8Na3prNL+DnKz0BdDZ3zxO+0noZCbbirS443Z2Efe6FZ+h88FYQlj8M0Kw1N9Z/4v8ROCm0hpm7V2BQVYkFZT4uLTMg/tuQRSTn6haHUYuR5Nzsxsbuq/QUDaYQxcrKFQVEVSTSIIOg6urxSY6jZY+a4iI/oZto6EwJAsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r1MoESgT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC54C4CEC8;
	Fri,  6 Sep 2024 07:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725606356;
	bh=oDrorMdX9k1okUgl5LsV5arhu2DByaxXuJRBbgjF4V0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r1MoESgT7X9hOR2b1uyfvxtTsVwxVl9+WbJPHieq3wIpfPEERTrJ2iUmOMV4jx0Qe
	 bIZe+an+cFqgiK3EBynDn82selrAcef9P8eqxbQmLGCYQin4wv/WHpk+V+y4U/nhN1
	 tEya3A/eUG/sWJb/M1sLDnYHhG1xuqaypPGcgH1IjydV4Yw3LRD9kFLdQlkfAGeZw1
	 fZ9WF+Iso2mfObfFCmlKtcYhVdt3mpIPt1jcbFcXvPGaW2l81++OMWsYmSLbYxqm2Y
	 bNMOaXdUlWR+OCjkoP/Ymfu2dRVPOb2jEp27lZAkeCeDQu9qagsaqSoM82GnNZUHqn
	 //NneqgHK5DEA==
Date: Fri, 6 Sep 2024 09:05:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
Message-ID: <6tyecc6mf6fnfhwydac2e6ncme52qtj6pyhqhcbbo654xgtibq@txvlihb52dxn>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-2-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-2-kfting@nuvoton.com>

Hi Tyrone,

On Fri, Aug 30, 2024 at 11:46:34AM GMT, Tyrone Ting wrote:
> The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <= 9".
> The original design supports 10 slave addresses although only 2
> addresses are required for current implementation.
> 
> Restore the npcm_i2caddr array length to fix the smatch warning.
> 
> Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

with the changes we agreed, I merged just this first patch in
i2c/i2c-host.

Thanks,
Andi

