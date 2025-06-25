Return-Path: <linux-i2c+bounces-11590-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 014F2AE8F43
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 22:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70A7B7B1014
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 20:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7648D2DCBE0;
	Wed, 25 Jun 2025 20:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMWvYaVQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ABB2D4B47;
	Wed, 25 Jun 2025 20:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882413; cv=none; b=Ghs1IbStvIqGBBkJYJXCpv4IpuziF+Ocjn+ru0GYOUW7JEiNywIsePlCxu4vfinbn8Z1nHxy4kjtJelYBg1jI/2Yfogml6FTWYi8BtU1Yi+s4mOxbnfruoH3adLHFFoQkZSgVCOzS9S5IWtp279Ez1rOzB+6arf+An/LUoPGHpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882413; c=relaxed/simple;
	bh=vTsBed0/2n4hgLLsMZJbBT7tPunlaecDCOUWKSB9iKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvwcLaN6F8xPhuCDs7mKpriSTflg59Uyqk5Rv7huNR9FjqdFRXOLyGW9V4WOYJfI6PoMhcPoGuwQ1gke7rPhfzBKVnt7nTemgghA/Fj0rGOwwWukn/UeTu0RE3N8cDEZWxZuN7hTFb00j8X0e0QqINB7egedM56M+GN9ZGHMO60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMWvYaVQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973C9C4CEEA;
	Wed, 25 Jun 2025 20:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750882412;
	bh=vTsBed0/2n4hgLLsMZJbBT7tPunlaecDCOUWKSB9iKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMWvYaVQPQyDYChTBCCtpkl2eJ1Y0z1/MwmTrHjVb4rGwihuNQoL74YUppu391Gxa
	 NYHED/Whl6jW+MdrNSkfFrN7M+k0swslAPnJzGPQKYsopX3SDhOBqEXJXqOJ4nptuh
	 GdZu5s/sefBWOZo1oYBlmzB6K1Ye9veNHSIJJzhsXyRG2cGTk45obyrvLL8Vqls+XT
	 siiXLstk1eP6kYUk9t1EFs+z1yNAkL/6mFncVYrzACwMO+nwqvDhpb9D5eed6O+t0g
	 3IVPM18af1RzFtGWr3jMUncGIneZ3CRsTVYxGIKZH9/OLppVixB74ZiOjvMCx42NSB
	 hwt1vQ1+WB79w==
Date: Wed, 25 Jun 2025 15:13:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org,
	matthias.bgg@gmail.com, daniel.lezcano@linaro.org,
	linux-mediatek@lists.infradead.org, qii.wang@mediatek.com,
	kernel@collabora.com, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jirislaby@kernel.org, gregkh@linuxfoundation.org,
	andi.shyti@kernel.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de
Subject: Re: [PATCH 2/3] dt-bindings: serial: mediatek,uart: Add compatible
 for MT8196
Message-ID: <175088241131.2135556.8017034319394467736.robh@kernel.org>
References: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
 <20250611110800.458164-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611110800.458164-3-angelogioacchino.delregno@collabora.com>


On Wed, 11 Jun 2025 13:07:59 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek MT8196 Chromebook SoC,
> which UART IPs are fully compatible with MT6577.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


