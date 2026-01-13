Return-Path: <linux-i2c+bounces-15121-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0981FD1A00B
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 16:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8073430C9CD5
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BD63939CE;
	Tue, 13 Jan 2026 15:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jpyHEriD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674AC39341E
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318997; cv=none; b=hKLza5WTs+o2rl1I7Gf0THbson6K8rO70a/2GBy1j3tPYc0YhHLz+YxPIQ7w7z99KuzksEu7o0iFXmtXDvDqi0T+87h34Ad2CBwgVMH4ryyOEyliZxtUcR/SIIcEHBT3k50nKR28rrSS1pucU/fv2mgyDHnzRtNXzeZNho7a6/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318997; c=relaxed/simple;
	bh=trdjpNRuyKh0ijGhouOP8ESYRszym+iNK1WKErLYUac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F80AKOstgRYzTQO0JYITutp8vfzPKn8EMndFG7uScZXoE+/5uW4nt7pTWagslrsM4fauU2DnLOYMToxDSGIy/VFiYT48/emyUnycWauN7iyTS3KJwDVq9LnEZBXaBb5Vma5yPEEx7XbB2R9bWVYnp/gzv9jGwx++aoSUY6c7OAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jpyHEriD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=H4v5
	yccwRnwyIzZU/tOnqVXFj3q694NbnMlwjQYPU+o=; b=jpyHEriDOxxkOWuXWpbW
	IrP0PnzWN3ZKbELaYIvtoeAsRsZj3qdM5nPrjqDPKyutPRMHimEsAGH6+iTcUyN/
	VbAYVbXt/7ZJNKE+v3qOUESwivRmRM6+ZDTuYfPHnBEHEr4lfGaJOApwV4aHRMXT
	ub4ClZPYxsGKRTa5VHIP+q7/qnZjerxMrkK5o5JzRPQm08J3tPvn9xoiLnpfob92
	yR2W7GMV3kZIsQSTqtNlIHG9jyw1IG67ULyDOWhVrEFEoeamk03JwRoKe7kdWXuJ
	SbWqjl7LzBThyJw8MWCg6W3uVIQeQNv2MsRcc7L40ochGYfvkCsigu4HmG6udvP9
	mg==
Received: (qmail 1758506 invoked from network); 13 Jan 2026 16:43:12 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 16:43:12 +0100
X-UD-Smtp-Session: l3s3148p1@24lj2UZIXocujnvx
Date: Tue, 13 Jan 2026 16:43:12 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mt65xx: Add compatible for MT8189
 SoC
Message-ID: <aWZoEIA2shjPDUVz@ninjato>
References: <20251030-mt8189-dt-bindings-i2c-v1-1-5b60914c6453@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-mt8189-dt-bindings-i2c-v1-1-5b60914c6453@collabora.com>

On Thu, Oct 30, 2025 at 08:56:29AM +0100, Louis-Alexis Eyraud wrote:
> Add compatible string for MT8189 SoC.
> Its multiple I2C controller instances are compatible with the ones
> found in the MT8188 SoC.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied to for-next, thanks!


