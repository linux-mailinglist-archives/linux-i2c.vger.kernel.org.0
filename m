Return-Path: <linux-i2c+bounces-11068-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E806ABD75F
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 13:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 476947AF841
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 11:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6394427BF83;
	Tue, 20 May 2025 11:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzoxQKyT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1737A219A8A;
	Tue, 20 May 2025 11:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747741901; cv=none; b=hTPMl3U6QjsU+GRltkUtDUXssBaWhNzgmFwif0twSW3YxcP7K8J7YISIiEiQVbbrLynHa+pXvYTZBw/y9Xv23q2N6dcJ2RqrFfsXSKAZ244xxFy6ug9aHCxycbAYrbD4xF1QjHgYe7FTU8Ol2pkLGRfIEZtRTdGz4mTi93NpY7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747741901; c=relaxed/simple;
	bh=n8d75Ug7ysY4z81dfYm2kCWqg7JynZz03oOVkZ/Grto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQgyaa09AAjeUcKqpoHFucdPZZunIKcbsZt5HAWCBhsFFP1MgVpvyDESzLlpczeZbZ7xUBor88o35+4+4k1k2lfa/AyPEpY9uBNTvfSHRsBqscHG+DhbR0l8dPIMuBUYPTFg5f1fC1jg3yz37UHh1RilQZwpOA4uWhytJbzYj4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzoxQKyT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24603C4CEED;
	Tue, 20 May 2025 11:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747741899;
	bh=n8d75Ug7ysY4z81dfYm2kCWqg7JynZz03oOVkZ/Grto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hzoxQKyTYARMfL34PU8F04/Qxv9ZoV4GDpb6hqwUVkW8weZZLoBVh/GVk4hiUbwHl
	 etLDIu2BqWaCGolZKugIXfS+vETyiBz5BBeC63xX/8EUcs1V6wYBPo1xEkjaHbmOyx
	 l0zlO6qpNirbIlkLzqlwIbRtQA8SQ7u/CPSgquK70XqbJ1IkGamQio0nFqT9fnc2Fs
	 07IEOgDWmCQ3Fn7APmq6ZAtU/qljDWmqNMOVto7Nt8u04sTiCIQaMvem1+7MfRnKMO
	 vjEfyLOzKBRtalCe5EibjG+CN2BWQfiqyiiQ4xaGAyCfM57Adstx+qdfwUMTJh1u2p
	 Y9VSP6DnooG4A==
Date: Tue, 20 May 2025 13:51:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] i2c: qup: Add error handling in qup_i2c_xfer_v2()
Message-ID: <mibpejiq6cu7ehhitvksmdwdnmx76dce24ngybccpvlb5x6v7q@wgdlvcmg7uxa>
References: <20250519141918.2522-1-vulab@iscas.ac.cn>
 <a2ff429f-cc49-403f-9f2d-6a6b6361044d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2ff429f-cc49-403f-9f2d-6a6b6361044d@quicinc.com>

Hi Mukesh,

...

> > @@ -1588,7 +1588,9 @@ static int qup_i2c_xfer_v2(struct i2c_adapter *adap,
> >   		ret = qup_i2c_bus_active(qup, ONE_BYTE);
> >   	if (!ret)
> > -		qup_i2c_change_state(qup, QUP_RESET_STATE);
> > +		err = qup_i2c_change_state(qup, QUP_RESET_STATE);
> > +	if (err)
> > +		return err;
> Is there an error seen around this ? Expecting this to work as is.
> After an error, what next ? Just return back to framework ?

thanks for chiming in. qup_i2c_change_state() can fail, why
shouldn't we consider the possibility to fail?

Thanks,
Andi

