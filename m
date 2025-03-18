Return-Path: <linux-i2c+bounces-9889-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 693A5A67F98
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 23:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0C7B4216F1
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 22:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B006DDC5;
	Tue, 18 Mar 2025 22:18:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE777155753
	for <linux-i2c@vger.kernel.org>; Tue, 18 Mar 2025 22:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742336338; cv=none; b=qfyITxLo/Lxr8pgM2g/obF6lJGX0UeXju1OdYAyvSWvIhSYa1hrOxEUR1O1efjXEQExRPVSV7DrSe9fetv/LRRDG3x4VHA3xJZLxzU3VOc4QxU0hFR1bj7LLk5rzMrulyVEuqEgC9rghueVffI5ZmC4d2K/IwS38inBMimH01yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742336338; c=relaxed/simple;
	bh=rVeaJBe7WqFbXzYBBR3S2IYaepxun2g/kjo9vJGgPuw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfnD7HvU6xmMNatbPwqJnevcd8oS/RKR/5+7s+EbXHZzxO1O/unSb/5DcoZkMpeFz2VcGzkh1bol4xwVVXTlTCBpQpL2exVFmSWO5gfoSPyLH/QPLlX/dqsbYHrQxbIrtSUhkPBv/YMXa3T14xT8xMf7DJ5tfqjeQc2Nchr+rsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id f675a8e2-0446-11f0-ab85-005056bd6ce9;
	Wed, 19 Mar 2025 00:18:47 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Mar 2025 00:18:47 +0200
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: i801: Switch to iomapped register access
Message-ID: <Z9nxRwoeLEriKP84@surfacebook.localdomain>
References: <28ad9377-6d8a-4259-8cd4-7edaa00e26d7@gmail.com>
 <67535b17-c3fb-4507-b083-9c1884b4dd7d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67535b17-c3fb-4507-b083-9c1884b4dd7d@gmail.com>

Wed, Mar 12, 2025 at 08:07:23PM +0100, Heiner Kallweit kirjoitti:
> Switch to iomapped register access as a prerequisite for adding
> support for MMIO register access.

I believe that I at least discussed the similar change a few years ago or even
proposed a one. The problem here is that *_p() variants of IO port accessors
are not the same as non-_p ones. And commit message is kept silent about
possible consequences of this change.

So, at bare minumum it would be good to test for some period of time before
going for it.

-- 
With Best Regards,
Andy Shevchenko



