Return-Path: <linux-i2c+bounces-6462-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89499972CDB
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8BD0B26758
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 09:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3CF1531E8;
	Tue, 10 Sep 2024 09:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlrmrS66"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5521779B1
	for <linux-i2c@vger.kernel.org>; Tue, 10 Sep 2024 09:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725959127; cv=none; b=k+DqKqhqdAuxuHvekj4A0Xg/VWe9Jg2PpBn9EBOu8iFdWq4BSGP313bliGRS3wCbmw2sJLz3tYtl5TsVxti4rsY1I4ex0GfmwOyC44XwqbtnCieUCTEatgIPQ8QeU0SUz7Z7TCVOGbCfTo+2WpSzMPno+3OVLlHDH67b9WbftR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725959127; c=relaxed/simple;
	bh=Z3w6HyRgbuw0VyCz6lFqOgWoU2iw7j3D+yu0eW0FK0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eu8YiOI+XcDsAfIeVvnpJDnXKGcUxikfIHkjGKSarzHzFfaQKoumZFlQG25XeGznUWkUNHWPgKW2f+ET6t+EYjeKIU4P1fZ2uCsse/xnnobjdKCqlv9BNvWPaXcZzJMvHImb958mkkmCwlBlt4BQNda/2ZFU8509Ctc1NeRTIF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlrmrS66; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364FEC4CEC3;
	Tue, 10 Sep 2024 09:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725959126;
	bh=Z3w6HyRgbuw0VyCz6lFqOgWoU2iw7j3D+yu0eW0FK0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BlrmrS66u+ii9Zo3zZ4VQ6b2SxU89YHJT8pTCXw2+0zyaWXSuaNx53zfAK81YQzxO
	 DUgKdM39Kkaafn+r/nqpqsh2nj6JSIk0NdrKGOYLXQVpOxut/ZIKmrEt3S9AtGB331
	 LPe/293kcv/ksF4x5/F1F5HKAaEqGvD1xpFdyo/rd4XIS+1dygFOk5e1QPMtMzzKY8
	 SUjCqoAeQ2avgzPrOhzOF58pKutACfNRQuWw8weJ3m+Rhk9FRJAjaCcHXdJ/HEfdBy
	 eRsarggLxus6m9YjOW8BGfdkQVGKPj4cVREkkBErqeLJY5kB3WVFpmEKilGMdr6aw1
	 hHadwV+dM2hsA==
Date: Tue, 10 Sep 2024 11:05:22 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 0/1] I2C controller support for KEBA PLCs
Message-ID: <grxj3pxc7wgi2ar5ot6c24wwyskad7pt6l4wt7y5kwrqfirwo3@bc2mag5ju4eu>
References: <20240809052303.4933-1-gerhard@engleder-embedded.com>
 <d2fa7404-1269-4281-9e78-f8b780f0129f@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2fa7404-1269-4281-9e78-f8b780f0129f@engleder-embedded.com>

Hi Gerhard,

On Tue, Aug 27, 2024 at 08:15:04PM GMT, Gerhard Engleder wrote:
> On 09.08.24 07:23, Gerhard Engleder wrote:

...

> > Gerhard Engleder (1):
> >    i2c: keba: Add KEBA I2C controller support
> > 
> >   drivers/i2c/busses/Kconfig    |  11 +
> >   drivers/i2c/busses/Makefile   |   1 +
> >   drivers/i2c/busses/i2c-keba.c | 598 ++++++++++++++++++++++++++++++++++
> >   3 files changed, 610 insertions(+)
> >   create mode 100644 drivers/i2c/busses/i2c-keba.c
> > 
> 
> Hello Andi,
> 
> are there any reasons why this patch does not make any progress?
> Did I miss something? Or is it hanging just because of holiday season?

Sorry for having taken so long, now it's merged to i2c/i2c-host.

I took the liberty of changing only 'slave' to 'target' in one
comment to align with the new inclusive I2C naming convention.

Thanks,
Andi

