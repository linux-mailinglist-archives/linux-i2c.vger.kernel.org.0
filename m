Return-Path: <linux-i2c+bounces-3390-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F608BAF16
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 16:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9217FB20C00
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 14:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F47079F3;
	Fri,  3 May 2024 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYrdmvdn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7F457CB7
	for <linux-i2c@vger.kernel.org>; Fri,  3 May 2024 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714747183; cv=none; b=t5nULz3vyyquKu+t8EPIgtwpN35MTgaQDT1RGJVASQBueryYFZqf6Yg/LC5LthttHMbet6Afbg48fgrCxAt+dF6S6I7Q+c0MmAq+QGYOImFZlF+EjxbYgfe1Y26azBB7y+yf8dEpa2Q/s4GEvZvM/Dt/lh+t7ltWQhDpAT5pGn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714747183; c=relaxed/simple;
	bh=DD1BgOmjp/pHSbBdUDxJt/By4YTr6sGizOVyZLMj/UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aASROlGD+15hkMG5Qy115WVmbL2nPde6trkx8PQOrY9Add+Is9EAG8Jo6lBDRQj7Z45RmxO5wIhJ2uJ6ehHL0RL7ROq11pni9iIWgilYDdymYilH5dWPDRgzyY9xZs+MXJrAbIk2IqUeEBgkL2256hsJbZ/eEKh70tox4W2LbxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYrdmvdn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF49C2BBFC;
	Fri,  3 May 2024 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714747182;
	bh=DD1BgOmjp/pHSbBdUDxJt/By4YTr6sGizOVyZLMj/UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYrdmvdnT21N2rxnptUDzmiVljeJrTMZBcfsHEDqv8M1I0PEdzYr0QXYqxYqH4W98
	 lpHQx/5IN/7YgN9JFTFHDVu0Q4H7Nym0/IjMQN1tMQtT7JiIrcowNZQbhxFRMdgWrY
	 IxppLRIBIJveDx5tjrY23+RMxMdwk8audGXAnQcCH9L+piK7QOScLtc/Dm18oInatI
	 KbjoxwHf+NHxkhRQZhTCUtWEClzKlnp/JmpGpn8nX62Tiq449aOIHVvUd5pFgf4iq8
	 vG8x6yj5MUK/CJgpZrVZBpWt5Km/sTdUi5j6Zauwr5J7+vzfKq8OAqJGtIfALMdvc4
	 0ZLTuMAWfwYLA==
Received: by pali.im (Postfix)
	id D941288C; Fri,  3 May 2024 16:39:39 +0200 (CEST)
Date: Fri, 3 May 2024 16:39:39 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@the-dreams.de>,
	Patrick =?utf-8?B?SMO2aG4=?= <hoehnp@gmx.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH RFT] i2c: i801: Scan for Dell accelerometer i2c address
Message-ID: <20240503143939.xfsxwrcmiflty5fl@pali>
References: <cb2e65f8-066a-41ea-ae3b-03950714f33c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb2e65f8-066a-41ea-ae3b-03950714f33c@gmail.com>
User-Agent: NeoMutt/20180716

On Friday 03 May 2024 16:09:03 Heiner Kallweit wrote:
> So far each new Dell device with an accelerometer requires a patch.
> All devices, with one older system as an exception, use address 0x29.
> So I think we can safely scan for the correct address

This is too risky. Poking random smbus address can lead to the lockup or
crash of the whole system. I really dislike such change which is going
to unconditionally on every system to scan or access fixed smbus address.
Crashing kernel on some new model in future or on some older models is
the worst user experience which can happen.

The hardcoded table with model name and address is the safest option to
prevent crashes or other unexpected behavior.

Instead, I would suggest to contact Dell if they can provide a way to
read accelerometer's i2c/smbus address from ACPI/WMI/DMI. And if there
is not any way right now then ask Dell to include it for new products.
So we can avoid having hardcoded table for new products released in
future.

