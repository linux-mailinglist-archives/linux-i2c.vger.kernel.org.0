Return-Path: <linux-i2c+bounces-15112-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C384D19ECE
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 16:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 140FF30F0936
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAFB1392C4A;
	Tue, 13 Jan 2026 15:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cNc169Ko"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABBB392B64
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318088; cv=none; b=TMhSl1fe+8WU7lxV14PJ5VOjWa5nYrLg53hqlIvV7oXL9RSbL35KCeZDXUrUyNHKGY6Jp9vlez1pEUu77++Q3cEp+xNzye4ToBSX70z7L1BjqAw4rsN+4pl6aF1v2bwM+NDhRiJ4zN5KnXeWhyske4ZHi/x2PlCCPJGs1pB8cdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318088; c=relaxed/simple;
	bh=aep4eZJE1FFlMMjZHeBTJ8LG9qdPNI5gNiZr2IxXLe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPOSuybeag6VCKQsFG8b9lZ3uAPKTfM/ZwtCrf/v6vjRP4Ddk0J9B5sL0DRMN5wcMj0wMRbOs7Dafqi50/e3t/AOnf9Fv8ZPNRcTX/UOcMT2kqrGtaeNfj1u6tXOVikyuqqRRdzYHIxJc1M02Wr4g0+I8SwQfR6dhQAI8NjiiE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cNc169Ko; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=SgI6znnKNqjv67rui8uZ8o9dmxfy1sWpcCUyA+Jcz
	kk=; b=cNc169Korl/6TxVMCh5WZOsk774hbswKmcJ5vJBx1lq9fE5e7edW5HPz1
	qguCmN+Afd81EJRCJRF9ihKxps8C1gR/gg7FqPT+HX8LKkG7J2GovSzLpdTOmyxl
	I27CnY0pfJb9kOXGJDYyQESV27HScSyQtq6NWVm+WZuuMByS3dQgK6TLgnb/KnrE
	IP4FiC3dFPqTCe7YMJrVF8zRXjqijVFySYRDTvUYUcE3VQqVsaFZ+TfBcLI76Z7W
	njdsTbkGqHsijVfSIn5mh161Vnj85Hp7iCLiDfigYy8qMesOSRqQigGs4I73vFBK
	U70kO6uFMY2sYsCrXEgQvaumu5NXw==
Received: (qmail 1751517 invoked from network); 13 Jan 2026 16:28:03 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 16:28:03 +0100
X-UD-Smtp-Session: l3s3148p1@VJwxo0ZIgpgujnvx
Date: Tue, 13 Jan 2026 16:28:01 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi@smida.it>, Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Andi Shyti <andi.shyti@kernel.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v1 0/7] i2c: busses: Introduce and use HZ_PER_GHZ
Message-ID: <aWZkgeWwjkcWXPcT@ninjato>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>

On Mon, Jan 12, 2026 at 02:46:08PM +0100, Andy Shevchenko wrote:
> A few drivers for I²C host controllers use HZ_PER_GHZ in numeric form.
> This is less readable and prone to subtle mistakes. Instead, introduce
> a well defined constant and use it in the drivers. No functional change
> implied except one case where 64-bit division replaced with 32-bit one.
> 
> Andy Shevchenko (7):
>   units: Add HZ_PER_GHZ
>   i2c: mlxbf: Use HZ_PER_GHZ constant instead of custom one
>   i2c: mt65xx: Use HZ_PER_GHZ constant instead of plain number
>   i2c: nomadik: Use HZ_PER_GHZ constant instead of plain number
>   i2c: rk3x: Use HZ_PER_GHZ constant instead of plain number
>   i2c: st: Use HZ_PER_GHZ constant instead of plain number
>   i2c: synquacer: Use HZ_PER_GHZ constant instead of plain number
> 

Fine with me:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


