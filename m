Return-Path: <linux-i2c+bounces-8732-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D08F19FCF39
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 01:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F06B163777
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 00:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10B0846C;
	Fri, 27 Dec 2024 00:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2bEfUTx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8874D2F28;
	Fri, 27 Dec 2024 00:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735258884; cv=none; b=QMdrErFaxdNBVtvl7VnDPvD1McLCZuq+t6cITOsfnchHilt1h8hHfD6w0zKo+X0Yc09NeU5pYgVX8wSjmJid+ADd5cEyq9XZDZD2rHHbeeDXr2yAvWP9oNOupfbLKOktN2UsVr/OzNk0op6AojwAIur6Bz5VjpV3mGIN5LQhQb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735258884; c=relaxed/simple;
	bh=V+mEXywVZORhR/Oo9rUvOuzREKEsXU0AY7F4F3pTwqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNsbdoeIuzo99jcyzywmpk6H57LKjNf9VJ6FfXnRboLBUM+EChhXf1jEj0fdIOemtMWvmqza8N+HQtbcUv9KWjRmPmBMnfEr8lZXzF6GZk2Ph8X3vD42GJ9JAMOgg1hrNO2hDt4C5lDRMkDNzL9PHbAeYY07oD0bxtWtJJL9a7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2bEfUTx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F8BC4CED1;
	Fri, 27 Dec 2024 00:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735258884;
	bh=V+mEXywVZORhR/Oo9rUvOuzREKEsXU0AY7F4F3pTwqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2bEfUTxtAQs9/IabqOCB/3DdE9qH5kyf8/IxbZrt/wWnsOZRxcr3Gm5bJrdxF+B1
	 4OjADb+vbdD5fQNyKb2pgp0Sfvl5/6rU+Vp3CDHEHfZZkHIBfqZYipKrOJsfvfcWd7
	 qtawQvg+4zSlRyunuJEYwtik4bHNUziSm91mLdEXfmSf7QPeF2ToRLUIQOcsm22fAY
	 zE4iIHpZCcU72hyxTXLiG0X1XZ217TFqaLTyDa5RLxmCmrbFJ+3ut767ksmk/xq17s
	 VL/JN/8rEKIC0aPdKrXm1GIVwzuW+1NbnUJnxhUeN01bprgLYaHPwGd4Yo4D47HJi3
	 o3E2ij1vo4/Cw==
Date: Fri, 27 Dec 2024 01:21:19 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, michal.simek@amd.com, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com, shubhrajyoti.datta@amd.com, 
	manikantaguntupalli09@gmail.com
Subject: Re: [PATCH V2 0/2] Add atomic transfer support to i2c-xiic
Message-ID: <bmgnnolg2nfvidfyccxhvb3lpesopcnsv52kkmyguqk2kaajxd@jdblobvwgl4c>
References: <20241210095242.1982770-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210095242.1982770-1-manikanta.guntupalli@amd.com>

Hi Manikanta,

On Tue, Dec 10, 2024 at 03:22:40PM +0530, Manikanta Guntupalli wrote:
> This patch series adds atomic transfer support to the i2c-xiic
> controller.
> ---
> Changes for V2:
> Remove NULL checks for tx_msg and rx_msg, as __xiic_start_xfer() already
> has checks.
> 
> Manikanta Guntupalli (2):
>   i2c: xiic: Relocate xiic_i2c_runtime_suspend and
>     xiic_i2c_runtime_resume to facilitate atomic mode
>   i2c: xiic: Add atomic transfer support

these look similar to other work you did earlier. Looks fine to
me I'm not delaying any further and I pushed it in i2c/i2c-host.

Thanks Michal for looking into it.

Andi

