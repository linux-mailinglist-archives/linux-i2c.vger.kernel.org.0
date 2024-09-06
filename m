Return-Path: <linux-i2c+bounces-6295-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE80B96EAF9
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 08:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C2F5285CC2
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 06:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44D213D243;
	Fri,  6 Sep 2024 06:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ieZ3sIBa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03C6487A5;
	Fri,  6 Sep 2024 06:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725605378; cv=none; b=LXJq/TBmOP0e0WFEEJ6hLgHVTg6dEJsO92+ZrmJXUoeOczc4oCT76lNZArFu5oFANh5XsS3yhNEuVB+EMqyTZke6FvKMKW3h8FKtk3iwY+1PFKYd1zIdbjg64WaFDSXu6jtxCCFoBmrAQ6xo9hi1DmCGBqXIcPABiaESoqQfrhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725605378; c=relaxed/simple;
	bh=wVe2H+YZx1oFFNE2aps61z6iCEsuBfKsWQT7fmZvhQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EY9jrNvGIFMVNU4ntya9RbiuTDR61pB2+2bxspe9SFsF7K06OKXKsLV4g3LFShKjtxT+9CL14IP/tDWkDOAdcFl1YpbhaW6V63Wtp5c4Y2am0E7h7EDZ6GA7WX6BHpQaNVvWPZ6jCoAnM9tAJ8LsaHJ6UQVsV+gPuikRafgcKCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ieZ3sIBa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA78C4CEC4;
	Fri,  6 Sep 2024 06:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725605378;
	bh=wVe2H+YZx1oFFNE2aps61z6iCEsuBfKsWQT7fmZvhQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ieZ3sIBaP6W6HdLd9cuQnJLtVztyD5rfZ7EfodpDe7swaP+aHwSUbq6XnCfXuj49p
	 9TBF+ww51mTKGrizE2EE6kv9yUpnj1ev/zaJfoIAlBPA/vIDRbX5C5kBE7v8Iq/f8S
	 v0Ho0J2PnuoiZ/r5Q2Xj/U9E00S1YYKgJFj5c2HYV7PCYu9RCI/vaAzd7SF8GNeYaK
	 e2eGx0jZ6nM+T4ir3zT74sqJZG15hCS82qyp+lwu9ANKfOyLVE4uEID+W9B3Cy5WNl
	 dbksTA+23TiJolQjKMh2Lpjy05isspdtxUnpLa/wCRc3t2ZragUwO5kfrZBVoElkMv
	 PUmastBT8allw==
Date: Fri, 6 Sep 2024 08:49:34 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
Message-ID: <ej6aqrruosoxx4a4cfic4ml7hngbxdy4ba65vwtardmwrkraro@elpng6eotflg>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-2-kfting@nuvoton.com>
 <xdaufg4bju3iq5fqeo2gdej3yaxyufhuaiuyixnla234l2ej3r@fmvann767tib>
 <CACD3sJYt12H3DNqRwOU0ULDwJj2TbqUR5NhYWxBgvFggqKVyGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACD3sJYt12H3DNqRwOU0ULDwJj2TbqUR5NhYWxBgvFggqKVyGw@mail.gmail.com>

Hi Tyrone,

On Fri, Sep 06, 2024 at 10:28:30AM GMT, Tyrone Ting wrote:
> Hi Andy:
> 
> Thank you for your comments.
> 
> Andi Shyti <andi.shyti@kernel.org> 於 2024年9月6日 週五 上午5:36寫道：
> >
> > Hi Tyrone,
> >
> > On Fri, Aug 30, 2024 at 11:46:34AM GMT, Tyrone Ting wrote:
> > > The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <= 9".
> > > The original design supports 10 slave addresses although only 2
> > > addresses are required for current implementation.
> > >
> > > Restore the npcm_i2caddr array length to fix the smatch warning.
> > >
> > > Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")
> > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
> > > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> >
> > your email used in From: is different that your e-mail used the
> > SoB. Is this done in purpose? If so I will keep it as it is, no
> > problem for me, otherwise I can fix it while applying it.
> >
> 
> I'll add the option "--from kfting@nuvoton.com", same as the patch
> author's email while using the tool "git send-email"
> in the next patch set.

don't worry, I will apply this patch number '1' because it's
independent from the rest of the series. I will do all the
changes you agreed with me.

When you resend this series you don't need to include this patch,
just rebase on top of i2c/i2c-hostp[*].

Thanks,
Andi

[*] git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

> > Andi
> 
> Have a nice day.
> 
> Thank you.
> 
> Regards,
> Tyrone

