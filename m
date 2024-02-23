Return-Path: <linux-i2c+bounces-1954-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1758620D1
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Feb 2024 00:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A49F1F2488D
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 23:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0825E14DFDF;
	Fri, 23 Feb 2024 23:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bFNTDbX4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF18714DFF3
	for <linux-i2c@vger.kernel.org>; Fri, 23 Feb 2024 23:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708732385; cv=none; b=q7a5wsePNMpMy4+GOV2Nsbb11PjoEzwWy0/A2RQQUGujy0mTHjJgQbIPHeB3ed2pV8gMyl0rGZYFxd9qaLTJz2VpkRm62iazu8dNnvCbcV+JdrmP4KWRZ27Vs/Wtv5NvikLHerRIUsnd22GrIKa+DgVpG2L/DLN9mNMQ8Oe8tDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708732385; c=relaxed/simple;
	bh=zg8HqNF7aNa77zuqfRyQfW/fe99lLofctq+gMMs9G44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eimou3HMPMCdO9x2a3Gpw4TaGlStGR0eTb7KJmvibDlX17jRvB4T2NnY0zhDpa0mvkt5X2ve/821ViZd9H+0RJdDJXQPCg310oPud4CD3nvDvPcEpSypAj3TiDiq5b+epz7LOyizY7qmd95f2Ktk5AcMkK6JdrJU2GkfaIxhe+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bFNTDbX4; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5d8b519e438so1293508a12.1
        for <linux-i2c@vger.kernel.org>; Fri, 23 Feb 2024 15:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708732377; x=1709337177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CtZ/gyZzvkeNiWt3oVfT5QTmQaJyVqDv2YJqGRGnkp8=;
        b=bFNTDbX4t/+wJ17uhYeOwK48ligwrudqgUXrs6T66/iR9ztdLkoTEaH5f6krmWc6bN
         HSbqmhjOXmNszglAVWbWLLy91gWIdSDFUzj/6QdyXgzQD0bVKyFBbzCIEk5tcP/Nxr5I
         YIlgaI+ggYj152lj+s8Mf4J3my0SIHzMG+SL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708732377; x=1709337177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtZ/gyZzvkeNiWt3oVfT5QTmQaJyVqDv2YJqGRGnkp8=;
        b=Ii2mCx8Wj4bnhWndxIfDsaWf1G5s7u4V8nkoSdzbmoGZLUEqYUS7CYwUMBgBSws+M9
         xTxmGi63c6EZleK6XqTmonc17D+xOIz3C0KOMd3XafJ7eS3RRHjWqvYW2Bz2eXVj14Fj
         x1lBYCb8JJZqdmuS3HpwXX6cxTt3fhYG2mm/OOUlPwxHN28deS6ODpGFrWlJx2NQhYWv
         wA0OcPl7UF9iAnN0rGPXP3qG7q+YxkD7eEqoFFyDYFSP1APyRJTNqoLHXgADi4FdWOXC
         AqgRp88L9o2/AV0y57o+xM/CsZFpBYM6RZzjU3XDBBgBmSvSd79mzdYcIsZWdI2B52p9
         9ZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ARCM9ZviuACj4IMl9kamGMDO353bD7UWoeKvJTpak3Kw4R5VRVz6cCULR08EsGvSHWlqScYVeg2mvAUghwmZpqEUEJPHzydi
X-Gm-Message-State: AOJu0YxSJOYxLkh3tbfbHI7PL12AcuehnsXCHs5DRpf5xYAT1lUoBsl1
	Zk+QQ5co96PMyEng4EVcKTBV3Qf6RYl5oPQrNqX3pktKIvUCoZy2YPlzf74BTg==
X-Google-Smtp-Source: AGHT+IF2ovpdMncpOoipr11gK3mj2YeoUlDG6r4zkubeInfRKqAiH6Gx3gjs5b2QMNtbTaGPmvGiTg==
X-Received: by 2002:a05:6a20:a49d:b0:19e:a527:96be with SMTP id y29-20020a056a20a49d00b0019ea52796bemr966445pzk.43.1708732377079;
        Fri, 23 Feb 2024 15:52:57 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l64-20020a632543000000b005d3bae243bbsm57028pgl.4.2024.02.23.15.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 15:52:56 -0800 (PST)
Date: Fri, 23 Feb 2024 15:52:56 -0800
From: Kees Cook <keescook@chromium.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Peter Rosin <peda@axentia.se>, gustavoars@kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH -next] mux: convert mux_chip->mux to flexible array
Message-ID: <202402231552.26E774D@keescook>
References: <20230223014221.1710307-1-jacob.e.keller@intel.com>
 <e8782296-49bc-33a2-47b3-45c204551806@intel.com>
 <202402182100.1D5BBE45@keescook>
 <787dcf27-c434-42e0-9c80-35e341aa16c4@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <787dcf27-c434-42e0-9c80-35e341aa16c4@intel.com>

On Tue, Feb 20, 2024 at 01:27:45PM -0800, Jacob Keller wrote:
> 
> 
> On 2/18/2024 9:04 PM, Kees Cook wrote:
> > On Mon, Feb 27, 2023 at 12:28:43PM -0800, Jesse Brandeburg wrote:
> >> On 2/22/2023 5:42 PM, Jacob Keller wrote:
> >>> The mux_chip structure size is over allocated to additionally include both
> >>> the array of mux controllers as well as a device specific private area.
> >>> The controllers array is then pointed to by assigning mux_chip->mux to the
> >>> first block of extra memory, while the private area is extracted via
> >>> mux_chip_priv() and points to the area just after the controllers.
> >>>
> >>> The size of the mux_chip allocation uses direct multiplication and addition
> >>> rather than the <linux/overflow.h> helpers. In addition, the mux_chip->mux
> >>> struct member wastes space by having to store the pointer as part of the
> >>> structures.
> >>>
> >>> Convert struct mux_chip to use a flexible array member for the mux
> >>> controller array. Use struct_size() and size_add() to compute the size of
> >>> the structure while protecting against overflow.
> >>>
> >>> After converting the mux pointer, notice that two 4-byte holes remain in
> >>> the structure layout due to the alignment requirements for the dev
> >>> sub-structure and the ops pointer.
> >>>
> >>> These can be easily fixed through re-ordering the id field to the 4-byte
> >>> hole just after the controllers member.
> >>
> >> Looks good to me (just a driver dev, not a mux dev!). Also added
> >> linux-i2c mailing list and a couple others for more review.
> >>
> >> Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
> >>
> >> related thread (cocci script) at [1]
> >>
> >> [1]
> >> https://lore.kernel.org/all/20230227202428.3657443-1-jacob.e.keller@intel.com/
> > 
> > *thread necromancy*
> > 
> > Can we land this? It's the last struct_size() instance that the above
> > Coccinelle script flags.
> > 
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > 
> 
> I'm happy to send a v2 if we need.

Since it's been a while, yeah, can you send a v2?

Thanks!

-Kees

-- 
Kees Cook

