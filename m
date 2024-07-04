Return-Path: <linux-i2c+bounces-4650-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB946927F0E
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 00:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48063B22DE5
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 22:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A061448EE;
	Thu,  4 Jul 2024 22:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtwqkiWL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F048B1448D3;
	Thu,  4 Jul 2024 22:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720132384; cv=none; b=p3K82c/jgqQPxLnr2ESqVpUvgzx1bMjG2+Wp8Shc7pEazqSA3jay/YsknhamLC/WEckebeCzyB353rSSr/oX5e7loAlVPPRfxU4B6K+DxBA7hnfw2gg8jEjmyXsvFWI+T2Rb3oDpggaaVMhD/pKM1SOoBFQRWsBrR1Zds0AhybA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720132384; c=relaxed/simple;
	bh=jEnx2QvhI62AOjeBOmKeY/w2PWw7i4YuSSRt5qPjbaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdNmQFeATsmMs4kUsYl7WgvbfEAuFUDhHVrp43/HWS6c3DEBstz/Lq/6/2TaIUe5HblhXsooKAllHqAYwiHzrBrYhjzOVqcWvKrm72hbztLf+3ivtdk5YCYz5JZ8w/Gd3DEdjxhVjlDevn4n1HZd0vF2rEwDQjDY127QGiMXbCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtwqkiWL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65311C3277B;
	Thu,  4 Jul 2024 22:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720132383;
	bh=jEnx2QvhI62AOjeBOmKeY/w2PWw7i4YuSSRt5qPjbaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtwqkiWL1IRJZHbKQXyZdnUkTYKtE2YK/AY6q26cFjUCWJyiIfOwkn1CocM+0seDz
	 EoQgrvXv9Zr7Z4zF9RUgt478fxQppoOUZfn31pZL6FUFAthJ5oPZMll7AqmIjRAce+
	 37GWLn9kGf0aCfmuxvwnsm5DdyI/SYrrMtlSElqlFsS35oD6gbXliB4EeksdArNVGv
	 zL+cjH+SF8/UhEL5CRTrlvX1KFY9WS2pRkgeQceL11XpmkfSFTFfJPjcxdToN0BA5i
	 lt4JiXE9ePJj9856Pr5fbEn3AgKpeHhwUcAU1YC/wT73eNB5TDhQrpSQ/tKx4igJxH
	 TtRJjWjfnvj6g==
Date: Fri, 5 Jul 2024 00:32:59 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 03/12] i2c: riic: Call pm_runtime_get_sync() when need
 to access registers
Message-ID: <lrqrxfrhp75ddwuqeh2yjh3syy5t4gq4t6bp67wfgpaxyuiv7v@lhyjnkzicvqj>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-4-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625121358.590547-4-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

On Tue, Jun 25, 2024 at 03:13:49PM GMT, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> There is no need to runtime resume the device as long as the IP registers
> are not accessed. Calling pm_runtime_get_sync() at the register access
> time leads to a simpler error path.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

