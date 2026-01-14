Return-Path: <linux-i2c+bounces-15156-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FADD1E9F8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 13:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 956DE30A2782
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 11:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5BB396B7B;
	Wed, 14 Jan 2026 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LyoJ7+YS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCB838944E
	for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768391756; cv=none; b=Yio6wG888VpDacABi8gSAm0jjEsF+/p5iSQEHYiCPEVESj0nZyGns9H5JRVztj4mPRHRC03b9cJ0mlc3L+c2fzJmEq+Ice4xyDAx1VKP3GjAECRpAvesU25wrNeuQKHjWBN9glhe5WFXixvOVw0/2sI+ORMdY8hhc3BdagrPpwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768391756; c=relaxed/simple;
	bh=PcOr2t1ox6rbEJdHdn5bWGNC/mmWtKIdnmbYxYi6+Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIas0fJ68CdcMbv2gUvK7ffgKr09AmAU6C4jQ7wiXKgIGIqQzlIPY494l/8Q+MfMwOPtAOZvFQVTGQ1JVGgWAcPj88HXDbn0ku8lilOla/KfrWa/wZKyw6/ftCNBWlL+9CsvOftRlxOrg74iEBbVRfqhVZbQLLeSn/oUzUxyx88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LyoJ7+YS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Oxa6
	ldmKCg2BCQ9lZEAK2qBD8oHfgFb/Gd5efAyPWOc=; b=LyoJ7+YSg4s0tmJPQ0i6
	mHJAAWYrO34raDwgayGFzNto5jJG5x8opShUbTU42RotjN/c/ORogzf46dno7C4E
	kNzq308ikTGZompmFAaKk2B7ppW3QeDJYynEr95tNMp4NA5rB99bD4H87LGZSz09
	UFBBylkSem99alVI19yKzBCaEjhn+1Adi0uB/AROlwNz/pn0/q3OqQNvYDPCqxfL
	ptF27pzIojsgOII0qnhIH9AVQu7uMZ823bPKQyXKJz6S00/x5ec6NEYAVLo1rouZ
	177+1vHeW8LU3smVDeKybkLRjJ1T1PIBSSwnR2dQyiTI5xiuF0lsIoPS+nbJv9mK
	Xg==
Received: (qmail 2115097 invoked from network); 14 Jan 2026 12:55:51 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2026 12:55:51 +0100
X-UD-Smtp-Session: l3s3148p1@nF0tyldIxtAujnsM
Date: Wed, 14 Jan 2026 12:55:51 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Stephen Horvath <s.horvath@outlook.com.au>,
	Jean Delvare <jdelvare@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Kamil Aronowski <kamil.aronowski@3mdeb.com>
Subject: Re: [PATCH v2 0/6] decode-dimms: Implement DDR5 decoding
Message-ID: <aWeERzS_BqFM4FLp@ninjato>
References: <20251106021356.208986-1-s.horvath@outlook.com.au>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106021356.208986-1-s.horvath@outlook.com.au>

On Thu, Nov 06, 2025 at 02:14:57AM +0000, Stephen Horvath wrote:
> Hi, this series of patches adds DDR5 support to decode-dimms.
> 
> I'm not too experienced with perl or the JEDEC specs, so there's
> probably going to be some questionable choices here, but I'd love to
> hear feedback.

Jean, do you have time for this?


