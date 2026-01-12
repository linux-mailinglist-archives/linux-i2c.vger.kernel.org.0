Return-Path: <linux-i2c+bounces-15075-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93414D13EC9
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 17:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 919A5300AC53
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 16:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF607364E92;
	Mon, 12 Jan 2026 16:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HGZNZGy1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187A229BDA2;
	Mon, 12 Jan 2026 16:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768234537; cv=none; b=P/X7CwMVnswXUGuLX86iRRAAGgj+wxRtCVwtiWXswV4bk+HQrLbYyYP7//va7ZtL+60vfE9+muBc8ATmT+ZS4NnxGlWPdR4yR87Rl+nMPUk9Qr/wLVvNUcNJhnQ9i0CVUtmLI6018K7+v+sApSFb/kS9VNreXFqPX4qdx8zb0QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768234537; c=relaxed/simple;
	bh=bYyVTbzbpIwXM0uPnbgo13phUMak6kBFgj53wnMc9SA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDjmWZ6s88XhSYKTxVB6HI/7ShmBTevzEaVcy1Pow6z2XvohFz8CGwvtJ0zXCe7L/9yh2RtE/BoGbmQyns4w/lQY79+HANw/0COEAYyUWpNhfRD3+HB8U4ShageEvrQhW7KIVXyDqrYWTKKVRO9efPwUYX0KEayJzpAnHq4iABI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HGZNZGy1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768234534;
	bh=bYyVTbzbpIwXM0uPnbgo13phUMak6kBFgj53wnMc9SA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HGZNZGy10HGBzqThshbno0nz2XaqOM/284NDxsBeH8qwpN1V29GLTrTGkqMIaH57Z
	 eCt/UsK1RYFn3JfqeapeRZUjIMwoq6KG0NiZ9fpHfB/wdloU8YJpDsMCTP6TvdXVC+
	 aDIu2tcs1/mTsSu+bTinEBjjRa2IU8uPxtXQrufCRv8oF/Qk+Hy5kuq1aVB6Oy51jI
	 KTcZdVVSMY9UpjkvRi9DErTkvZ1rxDXsxsdPQdRfkVs3zkOMXZxUK+r+uOVoTJxpsi
	 EaQtkD5NkkBrRgpZqrdBaWrC1yaPZGEBIUYW5nLdhc4WL7owtCsnmUhLJ0iWpSGvoW
	 u0Ht4PiYdBn/A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C313E17E0FF0;
	Mon, 12 Jan 2026 17:15:33 +0100 (CET)
Message-ID: <803c76e7-30fc-4a0d-ab30-ea779747300b@collabora.com>
Date: Mon, 12 Jan 2026 17:15:33 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] i2c: busses: Introduce and use HZ_PER_GHZ
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi@smida.it>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
 Andi Shyti <andi.shyti@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij
 <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Ard Biesheuvel <ardb@kernel.org>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 12/01/26 14:46, Andy Shevchenko ha scritto:
> A few drivers for I²C host controllers use HZ_PER_GHZ in numeric form.
> This is less readable and prone to subtle mistakes. Instead, introduce
> a well defined constant and use it in the drivers. No functional change
> implied except one case where 64-bit division replaced with 32-bit one.
> 
> Andy Shevchenko (7):
>    units: Add HZ_PER_GHZ
>    i2c: mlxbf: Use HZ_PER_GHZ constant instead of custom one
>    i2c: mt65xx: Use HZ_PER_GHZ constant instead of plain number
>    i2c: nomadik: Use HZ_PER_GHZ constant instead of plain number
>    i2c: rk3x: Use HZ_PER_GHZ constant instead of plain number
>    i2c: st: Use HZ_PER_GHZ constant instead of plain number
>    i2c: synquacer: Use HZ_PER_GHZ constant instead of plain number
> 
>   drivers/i2c/busses/i2c-mlxbf.c     |  5 ++---
>   drivers/i2c/busses/i2c-mt65xx.c    | 11 ++++++-----
>   drivers/i2c/busses/i2c-nomadik.c   |  7 ++++---
>   drivers/i2c/busses/i2c-rk3x.c      | 12 ++++++------
>   drivers/i2c/busses/i2c-st.c        |  3 ++-
>   drivers/i2c/busses/i2c-synquacer.c |  3 ++-
>   include/linux/units.h              |  3 +++
>   7 files changed, 25 insertions(+), 19 deletions(-)
> 

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


