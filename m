Return-Path: <linux-i2c+bounces-15110-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CACE8D19CB9
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 16:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A4A530BC34C
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4761F38759F;
	Tue, 13 Jan 2026 15:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="stjm2QZE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2FB38A9D6;
	Tue, 13 Jan 2026 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768317020; cv=none; b=oj6f0czfRqq1bN2g9wrf/kUJjUyfe0tstG1UT/YEwQDU5u5z8qHP3jObCGdLUFzerPsorA8MeWOMXNaOKYLcBcPas6ZrgHuLr/vC5aLr0HuhdcLtXf6vEHEW7U9RNDGjpode9hIpPw97qAQBviHEZ3rxAPKjsAB4Q76swme7uxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768317020; c=relaxed/simple;
	bh=mnRht3IuRpXB/t6mxr+8aeJFsEXCRTBrHR1LlDQvTzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lkx5UZMvMztQhDAwhd3EeE2NcXNhnIZ+qJXQYOT8SpXFAJLA9xGR5FpiT8tH8+GbHoOY8SgNpooE+2A9DE1zo6nzom9CibQsVUedMGIpz1LEUO7+FgcW9sYxxO2VAHFQeUOJQ8V664HpKxcvFJEvFlVa54/C9fb2w2U5y4PQpCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=stjm2QZE; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=mnRht3IuRpXB/t6mxr+8aeJFsEXCRTBrHR1LlDQvTzs=; b=stjm2QZEah/44e/BsqdHnjJALy
	eo6LraZtdL7QxuywzI8928LeN8eUfJBViod7nDBus3Es9IFwydIZC1WOBEPriPXdliyR0TVyo+1bZ
	LhV1ZCzLT1IHLpkPnBVBtFj7ZnwcJOOyGLqg6n25Y6KFPtWbU4WGS7Unsx/22dBfxYZwn5FVVgoCY
	9GTVYmjAOrXM579C2B87z+0U4OIRiZPy9mypyCzrrJN7hIfHkrTrhN9qjZFw0F0l/v9wtTH6PgBLI
	scQkPYp9rgPKaQ1HG+8D0IZNQCdB4NpZVazl3cyd2b+1UhPbF7Nxiu3Oe2PRBoR8vJgs6o5aT1vY9
	LYylkIMA==;
Received: from i53875b63.versanet.de ([83.135.91.99] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vfg1y-0027pj-EN; Tue, 13 Jan 2026 16:10:03 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andi Shyti <andi@smida.it>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
 Andi Shyti <andi.shyti@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linus Walleij <linusw@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Ard Biesheuvel <ardb@kernel.org>
Subject:
 Re: [PATCH v1 5/7] i2c: rk3x: Use HZ_PER_GHZ constant instead of plain number
Date: Tue, 13 Jan 2026 16:10:01 +0100
Message-ID: <2063916.2IRrRt1zHL@diego>
In-Reply-To: <20260112134900.4142954-6-andriy.shevchenko@linux.intel.com>
References:
 <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
 <20260112134900.4142954-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 12. Januar 2026, 14:46:13 Mitteleurop=C3=A4ische Normalzeit schr=
ieb Andy Shevchenko:
> Use defined constant to avoid the possible mistakes and to provide
> an additional information on the units.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



