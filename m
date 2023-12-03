Return-Path: <linux-i2c+bounces-591-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 855F6802687
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 20:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BE191F21177
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 19:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5538179A4;
	Sun,  3 Dec 2023 19:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qNRIXfpX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67930171CE;
	Sun,  3 Dec 2023 19:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6311BC433C7;
	Sun,  3 Dec 2023 19:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701630382;
	bh=r+9689hxvXM2mI23/KLlWD8KQBVbzpUI4REaNKSBVNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qNRIXfpXqOuw3Z1riGp5ch3x9qCgZOvQ2N5TxMXPCFxiLm7AQ+zHp5YacQD/nLce/
	 /goDWhmDUbU+wcn4XWXrMA1b4eArYY02SEki5Lxo6JSTHKNEsPu26jro1cjz27inPO
	 +n0P6liiB1qYZgaPOBsKpxkmq30sepYA5h9nCHm5bwWTStaFZVBqTgXs9eQOCaCE33
	 wgJ3mzLRH97wp1L9/43cW0Rxe1XNnffXFUN456VXJfbYX748/k5RKMOsSrRluIYzMY
	 jRmS6dS6mRxhDz+Doi1DkTLVBBZ7QgR+aylisMwrR5FeHxQlBPXhjWKSgYGWZae+Kj
	 ictRm4489nqRQ==
Date: Sun, 3 Dec 2023 20:06:20 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tim Lunn <tim@feathertop.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	Jagan Teki <jagan@edgeble.ai>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/8] i2c: rk3x: Adjust mask/value offset for i2c2 on
 rv1126
Message-ID: <20231203190620.26of3xrcoosnpicb@zenone.zhora.eu>
References: <20231203124004.2676174-1-tim@feathertop.org>
 <20231203124004.2676174-4-tim@feathertop.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203124004.2676174-4-tim@feathertop.org>

Hi Tim,

On Sun, Dec 03, 2023 at 11:39:59PM +1100, Tim Lunn wrote:
> Rockchip RV1126 is using old style i2c controller, the i2c2
> bus uses a non-sequential offset in the grf register for the
> mask/value bits for this bus.
> 
> This patch fixes i2c2 bus on rv1126 SoCs.
> 
> Signed-off-by: Tim Lunn <tim@feathertop.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

