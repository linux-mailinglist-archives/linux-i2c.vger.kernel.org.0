Return-Path: <linux-i2c+bounces-12328-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDA0B2AC3E
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 17:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F32219644E5
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 15:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1BC24BD04;
	Mon, 18 Aug 2025 15:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmNKdESD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423742475D0;
	Mon, 18 Aug 2025 15:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755529809; cv=none; b=iBn0AZVB81YCogetmKe1eMWt/KD1UKkQw85FpDYZbPtiBMrp7BFl8RE/H9DbCwVAOdj26S2usO9EYo6ThxE6SrX0nx4LiRiBj/X3uFha9PF1ymFjg2eBD9YNKCr/ECGuRU/V6YczBX8dQ9FV605aCVGPTmkoiOd9pW8OrK/Y1bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755529809; c=relaxed/simple;
	bh=j6TGC8SpXiPnVAZQJCeh1HoNlvRHangaWw09TjSyzRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O02cHqKcTeNHxxgLSP9Wht5/kdtH+RAux5hJMcXNYlD6jd2/z8AEhQjG3YkThtH8oBJ8cU0fUr1bp2wjSft7h2unK1CgdwfYy2COk461rY3RAn+1djQgK50YAcG7TudQWc0FAX/fKT9uoH0ZEehtnJeBBLDz0+Bx3CmXwZHHAmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmNKdESD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B81C4CEEB;
	Mon, 18 Aug 2025 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755529808;
	bh=j6TGC8SpXiPnVAZQJCeh1HoNlvRHangaWw09TjSyzRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LmNKdESDCxmdzrqrYo/RqgMXGiGfQ5UQRrMpc+I6a3yAnXSnpu6WMsiNw2sVLAp0h
	 shTSXTEdzk+eIm69UEN/mJMSiar7d5SBBMprt9J3Xx+zG32yZcizWLZ4qdonZT64/Z
	 TQbjl+5SwCYy7p3cTw4G1L0BZ/3xNx6MKLQKb2KyXMPcjQURs3SIXXM0iHBR5Qw5xX
	 JEIOdKqCzxTI9gVPjartXJ1oAeWElGN7fq52JoDdXu7VQq0ZTg0FxLCT0lBp/ELyF0
	 zxEtwi/XD3hEIWuxT0QvPEzrDpHqAFp8pBMIO0dVm/EPI+vlHCJE9D5Qn34wL4l833
	 C8+/EWki1oi+A==
Date: Mon, 18 Aug 2025 10:10:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 03/11] dt-bindings: i2c: realtek,rtl9301-i2c: fix
 wording and typos
Message-ID: <175552980735.1233596.4473003798882823110.robh@kernel.org>
References: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
 <20250809220713.1038947-4-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809220713.1038947-4-jelonek.jonas@gmail.com>


On Sat, 09 Aug 2025 22:07:04 +0000, Jonas Jelonek wrote:
> Fix wording of binding description to use plural because there is not
> only a single RTL9300 SoC. RTL9300 describes a whole family of Realtek
> SoCs.
> 
> Add missing word 'of' in description of reg property.
> 
> Change 'SDA pin' to 'SDA line number' because the property must contain
> the SDA (channel) number ranging from 0-7 instead of a real pin number.
> 
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> ---
>  .../devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml        | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


