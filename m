Return-Path: <linux-i2c+bounces-1855-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9BB859B7F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 06:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AD1EB21A7E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 05:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DAC91CD2A;
	Mon, 19 Feb 2024 05:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dw7TTuXW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7113A1CD07
	for <linux-i2c@vger.kernel.org>; Mon, 19 Feb 2024 05:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708319046; cv=none; b=FCdjpN3CBD3RwklXYED1Wyca7r4Ar4zHRo8mkvcE300GgaO/nBj/k7QcwuUFBzIveOpjn/jeJP0LyblNl4H7K7BcIVs4Q+xbErIomNH1YKE7FFTbJwcgEGbDnQJU1z+fo1q5XiDEMAjWBz19CIiCPeBUItA0geNYfbt+zAPNenM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708319046; c=relaxed/simple;
	bh=OQUbTWpsyfJky7G4Vw2b1kIc+3UWUfWO20ZLbqaRsk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Foa97pgs63pT7pQE+yKC7RhvatAbrA0432v2oKpfVaV4+ePJ3Fh6T+zumaMUM2Kj0VtcZoEQfnSwvtzEQgsfgsQNAj45rxcCI4pzfkM4ujM54YsS7POrzZH67FRJDQ73a6pzXTtoxTjR533+MNGhQPJyyuk+oAXRKbfe4SFapbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dw7TTuXW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d944e8f367so32580855ad.0
        for <linux-i2c@vger.kernel.org>; Sun, 18 Feb 2024 21:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708319045; x=1708923845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sy2YaU44Xzss5zx7kgvslISkld6TxisI9EFhWrYVrgI=;
        b=Dw7TTuXWF+/wl9rqabZuURAUNeki90Dhb7wJXffD/tgbaaapIupaPElsWdK/QJkj8e
         tV+wwlRXeSPzy9YIuFQP6+6/APiJxRHFPZDMlFXoywJ15OBCsAwjnOXZl7ZIHZHUKAjO
         OfV1QwZ365h8YtfbdIENCdmi+6vRaxcuP8mKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708319045; x=1708923845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy2YaU44Xzss5zx7kgvslISkld6TxisI9EFhWrYVrgI=;
        b=EZD3TO5Q/zzqDN8sPtSdJCN/NlOz6R5CF5fvx8X/BfTcalgJdNg5NoCOjlMpCrUEwE
         E8iFHteWGHaVtOyFGsXiSwqelLMtSnwUEA1YAP8zSV6r4RUKcFh5V3Bdu5p7zCIt2pX3
         sL+iIGoGO98D80/s7EMNBogHMYQkZ2xA4ii8R0UayjnacJ0t8tjupZBWug6WSHeC0wDK
         Iy1+Htg+RPldfraq+fLubSO51y5tbtBeQgPSN670NBrvAWS94inGO+frNxYGkAKFSV3D
         dirNJmFuUzruizm4hbV4231VRH9cIexmY4ic/z4ccfEe9lHBPFETQaJ5dd/RiXE4iXKM
         LSiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+/Juxot+1Wk3xBU2lJ9Qwhs28l7BB8399m1idH7gKtY8/FHGHQuttdlliqsmg3PcODQZ50brDoZ8/V/JS3AiGprDn53yCsZDE
X-Gm-Message-State: AOJu0YzixpRcFCQweQuB1gXDcPbFGGtHywaBqKrmR0RQCCf898RwDH+K
	qvleCUW4uZ5HcLILF1q33nbfmd6rvN3G7OtLAcPdP1hadz41OatFPhsS+1a2WQ==
X-Google-Smtp-Source: AGHT+IERCSPk3qDCxDTUOnKHeleegt5yUUSTiYJf6qBv69aCgnYIJ7j9dioWkmCbv0bHPswdvR4mXA==
X-Received: by 2002:a17:903:1c6:b0:1db:d7a8:850b with SMTP id e6-20020a17090301c600b001dbd7a8850bmr3434760plh.25.1708319044686;
        Sun, 18 Feb 2024 21:04:04 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t12-20020a1709028c8c00b001d9773a198esm3420532plo.201.2024.02.18.21.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 21:04:03 -0800 (PST)
Date: Sun, 18 Feb 2024 21:04:03 -0800
From: Kees Cook <keescook@chromium.org>
To: Jesse Brandeburg <jesse.brandeburg@intel.com>
Cc: Jacob Keller <jacob.e.keller@intel.com>, Peter Rosin <peda@axentia.se>,
	gustavoars@kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH -next] mux: convert mux_chip->mux to flexible array
Message-ID: <202402182100.1D5BBE45@keescook>
References: <20230223014221.1710307-1-jacob.e.keller@intel.com>
 <e8782296-49bc-33a2-47b3-45c204551806@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8782296-49bc-33a2-47b3-45c204551806@intel.com>

On Mon, Feb 27, 2023 at 12:28:43PM -0800, Jesse Brandeburg wrote:
> On 2/22/2023 5:42 PM, Jacob Keller wrote:
> > The mux_chip structure size is over allocated to additionally include both
> > the array of mux controllers as well as a device specific private area.
> > The controllers array is then pointed to by assigning mux_chip->mux to the
> > first block of extra memory, while the private area is extracted via
> > mux_chip_priv() and points to the area just after the controllers.
> > 
> > The size of the mux_chip allocation uses direct multiplication and addition
> > rather than the <linux/overflow.h> helpers. In addition, the mux_chip->mux
> > struct member wastes space by having to store the pointer as part of the
> > structures.
> > 
> > Convert struct mux_chip to use a flexible array member for the mux
> > controller array. Use struct_size() and size_add() to compute the size of
> > the structure while protecting against overflow.
> > 
> > After converting the mux pointer, notice that two 4-byte holes remain in
> > the structure layout due to the alignment requirements for the dev
> > sub-structure and the ops pointer.
> > 
> > These can be easily fixed through re-ordering the id field to the 4-byte
> > hole just after the controllers member.
> 
> Looks good to me (just a driver dev, not a mux dev!). Also added
> linux-i2c mailing list and a couple others for more review.
> 
> Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
> 
> related thread (cocci script) at [1]
> 
> [1]
> https://lore.kernel.org/all/20230227202428.3657443-1-jacob.e.keller@intel.com/

*thread necromancy*

Can we land this? It's the last struct_size() instance that the above
Coccinelle script flags.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

