Return-Path: <linux-i2c+bounces-13078-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 768C6B8F607
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 09:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38D0D1610B6
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 07:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118362F8BDC;
	Mon, 22 Sep 2025 07:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b5d7EVlU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C4A26AEC;
	Mon, 22 Sep 2025 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758527912; cv=none; b=P/MhdEQueR78rTATzZ7Zuxajgb11WEk7jfsqBIpyqxUjC1v2rzAnnwqaNTib5ub17PsP65FIdhdQZ9ZnY1tRV2IFzZg/5bedX6DPz6uZOBE9QEv2rP0OUbxLP43wavX/n9ojK90IHY+FViTwIlQysc9L8EuT1V6Lawa7punmVPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758527912; c=relaxed/simple;
	bh=8prAEjWiaIxuhpvbka12E01qTmGrcc+1Ik4AmS/ME0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dRgCz2dp0DB4aYbAUffFzaHy36vF0HJ4Tf8Hf6AZY0vOAWbejoFYthI7u+lEJxlCtmnw8Kk24+hoSznDESoNVcdt3gtzDR2gsYoACkLwaVejpxYHmmI99uhtuxShnPGtM6ua8v/X6Wmo20ZZmBt41whLSHC3VZuE5SUwZgTmc0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b5d7EVlU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758527909;
	bh=8prAEjWiaIxuhpvbka12E01qTmGrcc+1Ik4AmS/ME0Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b5d7EVlUHQdN2AF0SXwMm4ZQ8Cu4k5AEEp0o7tYGfyA2lZ+UnVAFjn4gyXQmzr29L
	 G7tazT37GcCi+JWj6chdYu54wRR7iNjrf2ESHQAL3gpxgTlHLDQeZrcfJ1b7U9Z3Pk
	 WSQW5DT5I4n3Y2KLN2SzIqrT+LGizeLnQCgzRFvHQdregu7OmRbK5bWggbFR1dNpW9
	 7548ERovKVc+HmAnNz0Nrzff2QCNFkUKRvHW14vA9pD4WExqrWXVrH6i0tTkWDlcwt
	 GfN/Y0X+7ppGbk1xC03+k271jPVvKoX22lStPWe3wuigMlIQ4+wlIDRQW13QolOn7a
	 hTr/RLOGFbwkQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BEB8E17E00A3;
	Mon, 22 Sep 2025 09:58:28 +0200 (CEST)
Message-ID: <0e45f5bc-837c-448c-952e-6fbd16c738ed@collabora.com>
Date: Mon, 22 Sep 2025 09:58:28 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: i2c: i2c-mt65xx: Document MediaTek MT6878
 I2C
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250920-mt6878-i2c-bringup-v2-1-70a951f10be9@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250920-mt6878-i2c-bringup-v2-1-70a951f10be9@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/09/25 19:22, Igor Belwon ha scritto:
> Document the I2C controllers found in the MediaTek MT6878 SoC, by adding
> a new compatible string for the controllers. Their design is compatible
> with the design from the MediaTek MT8188 SoC.
> 

Heh, I have seen that one just after reviewing the first version.

Happy to see that you already pushed a fix for whatever I would be complaining
about :))))

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



