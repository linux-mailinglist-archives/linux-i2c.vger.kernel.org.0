Return-Path: <linux-i2c+bounces-13742-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 006B6C00957
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 12:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B938F1A07FD3
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 10:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FBA30ACF1;
	Thu, 23 Oct 2025 10:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LB1JrjFr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CADA2F0670;
	Thu, 23 Oct 2025 10:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761216814; cv=none; b=dAcHKjHNu+Xwao1QM8Dz4ejoW2Bxl4j+ivPXxizpcxWiJuGW52B04/0H+cZRSfpxCSWurh9HbQlaqPbhaRMjxxVMuiQH2pPNPJRws1ydGy8Y6deMN9KJA0THgveAFtRR9/+Ofqf///uj3ohhiEC3DFnHRfmKtVofL6aHRp8KvaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761216814; c=relaxed/simple;
	bh=GR0KQXu3IcBgttzBFIK3m0UxoJSPmogpHAoOEO22v3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OP+LTCoxgC+c/k4O4VemIYdj0zUDmF9wADbVv8159Eyy0gMQLa/PXfsxntIrFrcDiSrYpyOpmRPHTMFGBDNf21FrMykKRhJDLeomQ0KAYbzI2ng76OQ716HYKGrIbnxf9hsNoQDpQ6WiTq+0qYBdHQ7QAfc0+/qwnFBZiIcwpvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LB1JrjFr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A103C4CEE7;
	Thu, 23 Oct 2025 10:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761216813;
	bh=GR0KQXu3IcBgttzBFIK3m0UxoJSPmogpHAoOEO22v3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LB1JrjFr8IxukftDP18sfUg5iYVH3C+7YIHfBWhUHtXL0cHAaiK/4/xoRE8SWcnae
	 XD0/ycdFYd2Pt3eY8e7fDsHvn4M+6vyr1QDaoicWSkdQswItRyClL8sjFscmz9ECK3
	 LeLSVYmjA85Y51JW/Plss+aBkC7nIGUOP0qwfel69XkBfWV/Ook4UL9SRfGjP6jJST
	 x1ZHN8XrqHtKwoS173YzNVbvz2jvRmT2+Pl9Ca2WpKRYz2qtFl8UL7i80h0a6lZN0h
	 Pv9qLAZb8HmuNMJZUGpj/ExqXQH4JdCww9lQpE/B1B+LRI8A0dSjd4oXIGMXKaC4ZD
	 k2MtPyPkwy8ig==
Date: Thu, 23 Oct 2025 12:53:30 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: pcf8584: Make pcf_doAddress() function void
Message-ID: <6pkzvfpzkg6mriqs7flbs5a2534tc6pk4ujs77h625xwlly5hu@fxxotb4oeh7q>
References: <20251022015405.7082-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022015405.7082-1-chiru.cezar.89@gmail.com>

Hi Cezar,

thanks for taking care of this.

On Wed, Oct 22, 2025 at 04:54:05AM +0300, Cezar Chiru wrote:
> Change pcf_doAddress() function's type from int to void as it is always

The "is" is not needed.

> returns 0. This way there is no need for extra assignment and extra checks
> when the function is called.
> Remove assignment of pcf_doAddress() and replace it with a simple function
> call.
> 
> Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>

It's not that I care much myself, but normally when someone
suggests a change, you should recognize it with "Suggested-by".

Please insert this patch in the same series with your

"[PATCH v8 1/1] i2c: pcf8584: Move 'ret' ... "

patch.

> ---
>  drivers/i2c/algos/i2c-algo-pcf.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
> index d1b0e55fd871..7e4a6d19494b 100644
> --- a/drivers/i2c/algos/i2c-algo-pcf.c
> +++ b/drivers/i2c/algos/i2c-algo-pcf.c
> @@ -253,7 +253,7 @@ static int pcf_readbytes(struct i2c_adapter *i2c_adap, char *buf,
>  }
>  
>  
> -static int pcf_doAddress(struct i2c_algo_pcf_data *adap,
> +static void pcf_doAddress(struct i2c_algo_pcf_data *adap,

while you are at this you can use the chance to rename this
function to a more kernel style naming. E.g.:

	pcf_send_address()

I would accept it in the same patch, but if you prefer you can
send it as a 3/3 patch. Your choice.

In any case, thanks for these cleanups!

Andi

>  			 struct i2c_msg *msg)
>  {

