Return-Path: <linux-i2c+bounces-15140-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DB3D1CDE2
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 08:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDF90308A2B3
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 07:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD12937B3ED;
	Wed, 14 Jan 2026 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPWwJoi8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD69379972;
	Wed, 14 Jan 2026 07:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768376173; cv=none; b=jI5QjKXK0gaPvJfSEED7jgN4mN0FQ0Nd9x+g7LZa8JkEuhOqHwgSLH7V4gdoBlFtq4IlSDs+oAYAIl6IoUCqUXJFnHeRvHVtnuNM/CkT+xz1bxvw92BXJU8Hu/cczaBLeT5/0GaDsRP8MdBWh+jQUbrQet5sc3yqnWrwxjtriNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768376173; c=relaxed/simple;
	bh=219ZNTWKZ6kYNfbXo9YLqM426s7JXbLhIYA12mOsA0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVFXezvaOzzeFsT4/v29iSLV7NTcIRRRfiKt2ZEPYNZEEOy+N5/2fllkPnsi/x7RhT5lzkBoSStLgKGViLNilOoWX7+b9sBgosS1iqs8whdJF1NTlIHy12E71DXLD73mt6YruoTW2I2ZWlNWjmn5Db3qRF4dlQSPSJY3hXCuPHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPWwJoi8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D50C4CEF7;
	Wed, 14 Jan 2026 07:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768376172;
	bh=219ZNTWKZ6kYNfbXo9YLqM426s7JXbLhIYA12mOsA0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPWwJoi85/9G7Kor36Kuo2Ljoq1U8Lu1svFRPTWiDIr7VirV/wSvCD5FgJkp3IoQq
	 Pt2NO0suJtAPSzuCDGwHxEjfA94Gv3gb4+6cTGa1uyoq/roLyF2lAp0qhMbSXI6SC8
	 5v/MMIoUP/5A5o+4sBe5HlWkkRD2ik3fzMw27grfHn6e7C+3i6zJ8o5QZDp3BnZoFL
	 jyGwsBMhVkpSWVQDZj9ImYjPEXHs6xhQ2t6nAPRZdYrN22RSsaCybXTjoRjsxXxmHR
	 Rerd1NgIifYsH/lGQFcXDBmgrclOmIxvQKWNd2i5usZTicWX3746OTqnAKd0/HtDSJ
	 8pIxYxGxQZ8wQ==
Date: Wed, 14 Jan 2026 08:36:09 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi@smida.it>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Qianfeng Rong <rongqianfeng@vivo.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
	Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v1 0/7] i2c: busses: Introduce and use HZ_PER_GHZ
Message-ID: <aWdHRszwPfcniL1q@zenone.zhora.eu>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

> Andy Shevchenko (7):
>   units: Add HZ_PER_GHZ
>   i2c: mlxbf: Use HZ_PER_GHZ constant instead of custom one
>   i2c: mt65xx: Use HZ_PER_GHZ constant instead of plain number
>   i2c: nomadik: Use HZ_PER_GHZ constant instead of plain number
>   i2c: rk3x: Use HZ_PER_GHZ constant instead of plain number
>   i2c: st: Use HZ_PER_GHZ constant instead of plain number
>   i2c: synquacer: Use HZ_PER_GHZ constant instead of plain number

merged to i2c/i2c-host.

Thanks,
Andi

