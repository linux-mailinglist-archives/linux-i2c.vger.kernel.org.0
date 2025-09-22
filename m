Return-Path: <linux-i2c+bounces-13077-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 698B9B8F5DA
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 09:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69AE77AECAB
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 07:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8932FC887;
	Mon, 22 Sep 2025 07:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bbYUroKu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B744F2F7AA4;
	Mon, 22 Sep 2025 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758527740; cv=none; b=Q9Y9V4w3osAr4bVW5tNMKgJzl3NvNzun4xi/DfhQq4oI6TaOsVuIvZoYGIg2rpkC26MNTfjBkQruLTY/2kKzQ4BrZ9uW0/OCR8sUWFhWuMpyWtMWggdTKgDgpsIgbQxHrPd6Dft+pcA2Za0yToGPtE9YfwbnlbMctvluTvhkN8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758527740; c=relaxed/simple;
	bh=mqGkL35d2nAV740tOqCB7tTDbkawSkgqIN7WEgn3v2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aL+T549hhv7SUgCj6VH0pIaFCRxzVBRLUEeS3WrZVyvrw1Geo23u2++Q8frBVjV9h6mVm69/SF7CSfJBgyYY++Y17c+fHbRdaRPRB4SmE0h8Kw9RHafVnzBQVUOKE82k6/bRMt5oqeoAMRO9/p4+XW2CyYSYwI8wHAeuc0fhNb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bbYUroKu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758527736;
	bh=mqGkL35d2nAV740tOqCB7tTDbkawSkgqIN7WEgn3v2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bbYUroKuQyvxF+EmcZlnhWeQZvg1VPp6HPukgoFZkoU3yvga/+FKPVtepmRphsj1C
	 A4/kOlnaXC6FzfT2i1qsM4yMxNIWDpZHWSHpylFkNL8Bjuyh9oJPvmIbZBsPWBcBat
	 ULBvUZXv33vT4YAweBRSpRxjOsCpv3Qa5VKdBCeqeiniTtLpscWrpybXtzVsAnpsNq
	 4xhshjEqRZxmWWZMCj2Mhe5CLcmHTKlvFxP501lxQ7+5Cv1Iz69ntCl95zQs9G0qlo
	 x+OsoGwHb/xaWl+p1IEU6r3w1cGCoI0m0F9fr4qvOPrDzWjoebqSjFexsLuUTcq8tR
	 2xe4MQ/MNtGVg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65ACB17E10B7;
	Mon, 22 Sep 2025 09:55:36 +0200 (CEST)
Message-ID: <53d152b7-7e72-4189-adbe-6045418541a4@collabora.com>
Date: Mon, 22 Sep 2025 09:55:35 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: Document MediaTek
 MT6878 I2C
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
 <20250920-mt6878-i2c-bringup-v1-1-d1527ffd3cd7@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250920-mt6878-i2c-bringup-v1-1-d1527ffd3cd7@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/09/25 17:31, Igor Belwon ha scritto:
> Document the I2C controllers found in the MediaTek MT6878 SoC, by adding
> a new compatible string for the controllers.
> 

Sorry but this is not right :-)

compatible = "mediatek,mt6878-i2c", "mediatek,mt8188-i2c"

That's what you need.

Cheers,
Angelo

> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>   Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> index 23fe8ff76645e440c19469999ae9a86b7fdabe68..b0d7dd0dd8fdd7b0dba14d11f75c8f0b7ac15f58 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -22,6 +22,7 @@ properties:
>         - const: mediatek,mt2712-i2c
>         - const: mediatek,mt6577-i2c
>         - const: mediatek,mt6589-i2c
> +      - const: mediatek,mt6878-i2c
>         - const: mediatek,mt7622-i2c
>         - const: mediatek,mt7981-i2c
>         - const: mediatek,mt7986-i2c
> 



