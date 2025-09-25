Return-Path: <linux-i2c+bounces-13181-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56520BA1754
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 23:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C7B85624EB
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 21:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F992765D3;
	Thu, 25 Sep 2025 21:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZaOfW0Ta"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F08831FEC6
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758834410; cv=none; b=MpbZkxe5JSVcUpV07JuFZz/Qv1Jw6xx3LZ6XijuL6nQW2LhvTw1zLor4juhhwj29LNQrB9uyhhMvo5xFpZbM8vFmFBwFuhxc3x/ubpNUvDksLiLLJrbssetIWEIzCCHA9+rRkz0XE345oH153BlqErD78JdXOIXLU5hWnohtbsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758834410; c=relaxed/simple;
	bh=+xWhWdVvAZoEipNtEoemr66/tT2SxUAtULhyc9gRmFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3U0mBs2Nbwb5NCHUS6k9Uq0ciV9ab47vc3Gmb9aiyl/Qx0u2x6Q1wU/zL6hA6mTvkIi0MM2IRqO5//23SUeHdNP6Kxoaxs4QRfGSECg1OweqUWfdWwcGqzQPCexpBaCH7SesIjG+/Qr1L8B0G3xuafvbPyhFYVV/IhfiSeEl9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZaOfW0Ta; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=xPHMj71ylaA/Pst6CfYJPDLa58yFoMZJIXza1Geua
	0w=; b=ZaOfW0TajNUTRaQQdd2bpuhhw8JNGjznHVqn9Y+v090V/IwPPai/3t4Ej
	tHfhqHd1oCLVIGFkRLX/lMOoAJR0aUtfjeI2Q4kbWgLER/+XB+Vdv2cBtQr3R7m3
	lu88er7bZ1KKVlEq/tIXSBlfLjSMODSYBR2DXxQlDFyB/4lt4CBZhduc+8AshyCM
	gn/+Z7FsTwYQmg4+usYXG2pNJSM/sMNwLbpNHTc1JVhg6UjVSP+rAMqUrZ9BC/PJ
	xJPfEWXnCi2n5aDZQkRuaADDQyHlauOOIvgtV0sNH8Hio2v1GLeQoFV3u61fmdNF
	VtXtIk0gP3BL6v8RnNcy9v5xE7JQw==
Received: (qmail 2015546 invoked from network); 25 Sep 2025 23:06:46 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 23:06:46 +0200
X-UD-Smtp-Session: l3s3148p1@LY3Fi6Y/esgujntx
Date: Thu, 25 Sep 2025 23:06:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Qii Wang <qii.wang@mediatek.com>, Wolfram Sang <wsa@kernel.org>,
	Liguo Zhang <liguo.zhang@mediatek.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2] i2c: mediatek: fix potential incorrect use of
 I2C_MASTER_WRRD
Message-ID: <aNWu4hC2Yer7c2kG@shikoro>
References: <20250906082652.16864-1-leilk.liu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250906082652.16864-1-leilk.liu@mediatek.com>

On Sat, Sep 06, 2025 at 04:24:06PM +0800, Leilk Liu wrote:
> From: "Leilk.Liu" <leilk.liu@mediatek.com>
> 
> The old IC does not support the I2C_MASTER_WRRD (write-then-read)
> function, but the current code’s handling of i2c->auto_restart may
> potentially lead to entering the I2C_MASTER_WRRD software flow,
> resulting in unexpected bugs.
> 
> Instead of repurposing the auto_restart flag, add a separate flag
> to signal I2C_MASTER_WRRD operations.
> 
> Also fix handling of msgs. If the operation (i2c->op) is
> I2C_MASTER_WRRD, then the msgs pointer is incremented by 2.
> For all other operations, msgs is simply incremented by 1.
> 
> Fixes: b2ed11e224a2 ("I2C: mediatek: Add driver for MediaTek MT8173 I2C controller")
> Signed-off-by: Leilk.Liu <leilk.liu@mediatek.com>
> Suggested-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Applied to for-next, thanks!


