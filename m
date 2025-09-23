Return-Path: <linux-i2c+bounces-13106-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48104B93BEC
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 02:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AED014804FE
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 00:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4231169AD2;
	Tue, 23 Sep 2025 00:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="s0Chkpwc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032C01922F5;
	Tue, 23 Sep 2025 00:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758588501; cv=none; b=ONcenGK6PKAS2nGGPoWNG5m6GQKrhnFXBy4ElymBbbzBLMXJUU2gvrbfKejjCnX7K6BAEcYjZiQ4Fz2yYTc1RmOTm6izRnwx26R+S8+RzF8su2xCtfEsCePjNuVXzwjNE1qPr5hUWn6RKjj0YbVwddh94q9BQK/KteQ096y9Emg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758588501; c=relaxed/simple;
	bh=3qP24nziISwt/VMWR/56OQvzxWDyNd28Cj+VH3asln0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXUHNP+MTAn3OjccjmM/XEHKm7/TrSLzxD9Jippr/ditZmeAonCjdint1UECo3OtqXRACcP9X7IvRzrBOSyz+86VAwUctxn+a39awzdLceFQtVRzWl2vsR9cHnquP0Ar6lncY4NkbVA1fxYVpyty5rqpO+f0cdN4acHqgNXeQYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=s0Chkpwc; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758588429;
	bh=xopCxW8t1zBW6/HQ6IJ5noM3gFQ+1+pZ3gW2SFPiifM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=s0ChkpwcsSK2P7MZqwPTiJNP3HyXLnfhxrpqM6V0TDSRqQ8O2jkTfwJilIvlgpQPH
	 O55G6VLQMMgddRL9t3aYJCFdDI9sLfdSXUfpRzLNx4pOKnhryQso/JM7aDvoOOtnz7
	 NxvPh0hg3OPRI8b2GFWGHlGHSJbbSiySn7Fc5NlQ=
X-QQ-mid: esmtpgz16t1758588423tdee7036d
X-QQ-Originating-IP: gbwnxMZe9hFGpOZhigdxuB2zr1wbTcYBJC+vkRRZDww=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Sep 2025 08:47:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8933899601725810788
EX-QQ-RecipientCnt: 9
Date: Tue, 23 Sep 2025 08:47:01 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 4/6] i2c: spacemit: check SDA instead of SCL after bus
 reset
Message-ID: <E0A67745AA4B2621+aNHuBTk9aK3AnZjR@LT-Guozexi>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-4-e59bea02d680@linux.spacemit.com>
 <aNG35Dwg7wWivSHJ@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNG35Dwg7wWivSHJ@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Ocx62dM7vaMVzX3fzuIb0L1F35xFrH55HAYaXJaWutu7nwzBqRvfrVz8
	K/NyvCwgMMv+vK0mzu5WPaM8/Iv4vZQrNbnLIn5aetXp/OziZ/mvrAEhABcOnd8eOK1nXuS
	wESoaQyrYAmbESb9LrW32b1B40DkOiVWR98lKFkQDYADwMdINqkJeAPRG7EADr1ogViSY/l
	yvXem4+rO8HZOxRJgqsSn/XJxLFEdHaHtNnkdpPK/4itas9He7xmowWyHvqDZxWSe2kccSs
	o9NZkiUTtHmB/jL1um+KvccbflKnKOFED79K1QTlVsSm6Ei7Ugmx58cAc8DjuHLQmBBf1a7
	CLDV5oOJnrp6AQ8cO+DIKIrgjpGKysPbBF1ruxe+QJArECa+w7gxP7YSQofEPb+e/X/74MR
	vMjGC5tF/sUPJqD/LMtcl7zeybkpogiWjAkp3q6fZKGsC6yQXpJxBFejfB1PWVMwLTwG7mp
	N+grhpdAfMtY18TySvxUcF2dQ4kWQDAiM/AYmVWxPVrsNnbGPITe9Tu/Fo4Eywr7eLB5JLi
	SDhpiVr6zGYfTfkYboFJ5x4Am2BGmCmylzgC/CVMexnSEbEKfxKogcgnvhRGfD7Y7ky6wvk
	TEKCo49+F1pkxS5Zab8d2FbhT7diouYYIR3q2srUOA3E8Q+igmi38LejnaKVIz1PSA8F0Go
	/4d0z2GD5LEeImhHUWKNytSDZbYJZh1c+3QBnbad/7aDER6LEtZCA04Bf7o8tXP6ccw6yY5
	j7kfXoXPhjCcuCM/gE7o+oBKbHCnCPLPiy5xYvpB8SNbUQDcx8+/LrAdDgX4lRmFqGGhv4a
	Ry5RaQVhJlTaHQCtBtTCjFBPnWcOf86MCISL+SQfGNiSYHCpCfrltAuGJbJERNMKkqnyvdu
	VYEo8LtmyDrtDWy3ImcF350yE50JLbQ0ZCIWzs/6VgB6L9jdav0IX3WzbpcuoC1tc7UE5na
	hX6avmJwxW7arV4RcBHOnQucHHVyxRny71wm7z54BvdmSTxPSIHcafHfwJPmcidROxI37J1
	ldeSLankDY3co72JVqBOXx2RqNhtQzEp3v0DnkY+yf6qa86GKp2pf8m1hp2SMgihXGp+cv8
	NziDh/ffipR9OGWfhbDoBY=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On Mon, Sep 22, 2025 at 10:56:04PM +0200, Aurelien Jarno wrote:
> On 2025-08-27 15:39, Troy Mitchell wrote:
> > After calling spacemit_i2c_conditionally_reset_bus(),
> > the controller should ensure that the SDA line is release
> > before proceeding.
> > 
> > Previously, the driver checked the SCL line instead,
> > which does not guarantee that the bus is truly idle.
> > 
> > This patch changes the check to verify SDA. This ensures
> > proper bus recovery and avoids potential communication errors
> > after a conditional reset.
> > 
> > Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  drivers/i2c/busses/i2c-k1.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index c1656b78f1681729ccc2ebca6e290259d14889d9..4d78ee7b6929ee43771e500d4f85d9e55e68b221 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> > @@ -172,9 +172,9 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
> >  	spacemit_i2c_reset(i2c);
> >  	usleep_range(10, 20);
> >  
> > -	/* check scl status again */
> > +	/* check sda again here */
> >  	status = readl(i2c->base + SPACEMIT_IBMR);
> > -	if (!(status & SPACEMIT_BMR_SCL))
> > +	if (!(status & SPACEMIT_BMR_SDA))
> >  		dev_warn_ratelimited(i2c->dev, "unit reset failed\n");
> >  }
> 
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Thanks for the RB!
                - Troy
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

