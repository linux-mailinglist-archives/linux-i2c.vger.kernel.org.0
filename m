Return-Path: <linux-i2c+bounces-10438-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89994A90DFC
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 23:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21A8D1905F06
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 21:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE4922AE7F;
	Wed, 16 Apr 2025 21:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdpSlWcO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9091DA634
	for <linux-i2c@vger.kernel.org>; Wed, 16 Apr 2025 21:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840161; cv=none; b=Tq4JLlNkMYzwyFqRtyD82pAANcO6FX4MYbKJr2jjASrzRuqEBLV2w0v+d/g3BLsOZ7Eg2UmxHR+d/VDKJk/GZ5nLnYQTvbk3Ox8Jjxi7rojtnent6WdcuWtKiPFINF28PzHOXRTkEkkaY3BAb4I7f9QBLdzYq8JJrQ8TOLmx6eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840161; c=relaxed/simple;
	bh=2GWlyX8AkWQPOJemZSkW21mVn9HEIpn4CXNML2fGSdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLNjGSoL4B5Hao4VU/zjSypUXf7qCkQlADLzsJ7kxn1RU27HSPz8492J9vmOxg3btmibvz07bwuFkHTMmzNZh6TJm4lI25LxS6WfNJox+UV7jocaO7g172qpXZEcBigmhFHjoU8thp9AgEBmmw3H+TZDGmC/iXFlOEFnLi/PO68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdpSlWcO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643D7C4CEE2;
	Wed, 16 Apr 2025 21:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744840161;
	bh=2GWlyX8AkWQPOJemZSkW21mVn9HEIpn4CXNML2fGSdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KdpSlWcO5AqYHxcje9dJ9+ogKGK8+SVU2W9MmvSym8hPMRURdAt0clICt/wWVN4c/
	 J78KWSIg104j8UJK3qDuGRBzeq6H1gtf/JxWU4zzk8XRBlLcUaNQrrK810+AiMV5mI
	 wewZKvEPQBaN26ilTGFQPdumhVZ9/Fq6D15crzEvS7zSKfxRgy1DGLYb/5kvSJfWoe
	 u2w1QP20PjH5Nob1AeLEnYp48EV4bp1v3hUUpZ7S7xvYoMtLl95QANMnbMBVrxTKT9
	 SKG11apUpOlJXSRXh2qjn0Fdt/aZzpEsxP9XekVXMbDMVib54NC4IYqDIHT/alLCwG
	 sPSdpkMMe1GMg==
Date: Wed, 16 Apr 2025 23:49:16 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Enrico Zanda <e.zanda1@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH 00/10] i2c: Replace dev_err() with dev_err_probe()
Message-ID: <u6qtceh5khhjanllmfnnptbskcuuhfo62gj56bjy6bbkuvtc6y@neiethy2fkcz>
References: <20250415183447.396277-1-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415183447.396277-1-e.zanda1@gmail.com>

Hi Enrico,

thanks a lot for this cleanup and welcome to the commnuity!

On Tue, Apr 15, 2025 at 08:34:37PM +0200, Enrico Zanda wrote:
> This patch series replaces dev_err() with dev_err_probe() in the probe() 
> functions of each module.
> This simplifies the code and improves logs.

I merged your patches into i2c/i2c-host with some exceptions:

> Enrico Zanda (10):
>   i2c: uniphier(-f): Replace dev_err() with dev_err_probe() in probe
>     function
>   i2c: uniphier: Replace dev_err() with dev_err_probe() in probe
>     function
>   i2c: via: Replace dev_err() with dev_err_probe() in probe function

I removed the "i2c-via:" string

>   i2c: viai2c-wmt: Replace dev_err() with dev_err_probe() in probe
>     function

Please resend a v2 of this patch.

>   i2c: viapro: Replace dev_err() with dev_err_probe() in probe function
>   i2c: viperboard: Replace dev_err() with dev_err_probe() in probe
>     function
>   i2c: virtio: Replace dev_err() with dev_err_probe() in probe function
>   i2c: xgene-slimpro: Replace dev_err() with dev_err_probe() in probe
>     function

Please, rebase and send a v2 of this patch.

>   i2c: i2c-xiic: Replace dev_err() with dev_err_probe() in probe
>     function
>   i2c: scx200_acb: Replace dev_err() with dev_err_probe() in probe
>     function

The rest has been already merged.

Thanks,
Andi

