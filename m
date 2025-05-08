Return-Path: <linux-i2c+bounces-10894-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0485AAF7F5
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 12:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4811617F472
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 10:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360662248B9;
	Thu,  8 May 2025 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCwyYXHl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD649223DE2;
	Thu,  8 May 2025 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700435; cv=none; b=eqEnxJg3fqZk8TW6Yxls9KDMQKzt3xMtgNz7gmN7ZGKBOpB2/8FkTS3rJkHFWusKh0p46sgqn3IR4/B9hpHwh6Od0gROHSJ4/uGOp2n09v7b+5QPP43Ck81EBFRDOuzP4jY1pTTrN+XEdIS0vYaY6yKJp8sjXET2mx/JgSun3/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700435; c=relaxed/simple;
	bh=CZ7td0/Fr6bU85rEwgoFj3o8YB/0cKAKtAH49ZkzBKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoZmB7XMed0295fOlku048s0fNgn1CbhBZay+Gey06Wq5Qlk5Hvwseg41t05roGNfmu+LCtVjCQ4U60C5+ssUyhA0f2OV9KlkrjAov51nWt4XM2h+0Hp7JohQfZEwMCl2ynHWrK+sEUZK28irSuS7+/XoktqiSyE0q2nWbrGyHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCwyYXHl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E29FC4CEEF;
	Thu,  8 May 2025 10:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746700434;
	bh=CZ7td0/Fr6bU85rEwgoFj3o8YB/0cKAKtAH49ZkzBKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCwyYXHlVRKxxFAV0v5Ae6qQSnCyGnN8uDyGlFf5wbIzkMhH0k5wAdXO4lPaKzkHj
	 WIyDAMYF3OlcDPbZPsRCVWM2w4Zqlspd3FaykQuwJnwbURmEd8cXTr6ENe2aLxGVRe
	 YdNDSv4xCkPpIuwPLJGCUWQ3s+3b3nkN9uE0AE1+QziRG7sjpvFqmAHE4Ufo6MrA+E
	 RXoQIiMgX4D+0IUQM4cWOq8J2snKf0bVSMTrl+oinC2YAPY9eZIo8BYkzuaqIMtNTz
	 3R9RlrwR4BVTEuEI8Muvz344Ahf2N4K15GMIKfSWKwricU8nw2oyZed0uBzNYInFat
	 IHU7hfVj5w9jg==
Date: Thu, 8 May 2025 12:33:50 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Guenter Roeck <linux@roeck-us.net>, 
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: i801: don't instantiate spd5118 under SPD
 Write Disable
Message-ID: <p7y5i2zzwnej4znzly7h42r4p7f3xkhbe2pamkfktu2j5jts3o@sm75wirr4tkq>
References: <20250430-for-upstream-i801-spd5118-no-instantiate-v2-0-2f54d91ae2c7@canonical.com>
 <20250430-for-upstream-i801-spd5118-no-instantiate-v2-2-2f54d91ae2c7@canonical.com>
 <nfxz37zk2nnqmjwaychfvpl5y5f2stkean2oyxxbk3gzduqvcz@ons6jtbtotuf>
 <CABscksNgEnEQx_BGR6A2xWw5Suv8ud1StnnXxjB5qBJd8FogBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABscksNgEnEQx_BGR6A2xWw5Suv8ud1StnnXxjB5qBJd8FogBA@mail.gmail.com>

Hi Yo-Jung,

On Wed, May 07, 2025 at 10:50:10AM +0200, Yo-Jung (Leo) Lin wrote:
> On Tue, May 6, 2025 at 1:53 PM Andi Shyti <andi.shyti@kernel.org> wrote:
> 
>     ...
> 
>     > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/
>     i2c-i801.c
>     > index a7f89946dad4..88474409e82d 100644
>     > --- a/drivers/i2c/busses/i2c-i801.c
>     > +++ b/drivers/i2c/busses/i2c-i801.c
>     > @@ -1177,10 +1177,12 @@ static void i801_probe_optional_targets(struct
>     i801_priv *priv)
>     >               dmi_walk(dmi_check_onboard_devices, &priv->adapter);
>     > 
>     >       /* Instantiate SPD EEPROMs unless the SMBus is multiplexed */
>     > -#ifdef CONFIG_I2C_I801_MUX
>     > -     if (!priv->mux_pdev)
>     > -#endif
>     > -             i2c_register_spd_write_enable(&priv->adapter);
>     > +     if (!IS_ENABLED(CONFIG_I2C_I801_MUX) || !priv->mux_pdev) {
> 
>     this if is not really working and it has been reported the
>     following compile error:
> 
>     drivers/i2c/busses/i2c-i801.c: In function 'i801_probe_optional_targets':
>     drivers/i2c/busses/i2c-i801.c:1180:54: error: 'struct i801_priv' has no
>     member named 'mux_pdev'
>      1180 |         if (!IS_ENABLED(CONFIG_I2C_I801_MUX) || !priv->mux_pdev) {
>           |
> 
>     Therefore I'm going to revert just this patch 2/2. Please do
>     resubmit it and please test it properly with the
>     CONFIG_I2C_I801_MUX enabled and disabled.
> 
> 
> Sorry for all the troubles. Will try to propose another patch that takes this
> into consideration. 

don't worry, it happens, that's why we test at different levels ;-)

Andi

