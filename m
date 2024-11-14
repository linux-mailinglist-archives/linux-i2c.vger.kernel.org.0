Return-Path: <linux-i2c+bounces-7987-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 458B19C87B9
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 11:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F015D1F21290
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 10:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9831F7540;
	Thu, 14 Nov 2024 10:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="P+kTLKbg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F491D95A1;
	Thu, 14 Nov 2024 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731580622; cv=none; b=aLDA2m5EAdtqcMVN0MyZjIsdXOvAkb+Zkp0HOLMFp5WjVGaDQ+aZC2dIYTP2KqP0K1vHBslL8orKmpFyqGe+7+bc236R9s66ccV8ofSXm3/9uLanUHohiXLv1yZHNCtMcytea3AutJ6OJdFHnIxWa9ThrFF9hdf9CF5BUQn60uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731580622; c=relaxed/simple;
	bh=4woJSjD/ZDXAHhgz8oC1hGFxBo/MsEypfEZsBUh6mx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mjCcco5fH638sAfgwqlQM000oNzIab9MhtUCMjygWGHYhSKCCZPoucZXmZ2N+rXlYgO998BdgVECQBW3bCwKCKtUQKVG9BcLCoaXkIzXEHVAqbLx2M77hvunf8clP0OoihpCW137DovmFZ02UjeyQjsnqd9gJ/bAvA9TyxTJqHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=P+kTLKbg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731580619;
	bh=4woJSjD/ZDXAHhgz8oC1hGFxBo/MsEypfEZsBUh6mx0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P+kTLKbg57gyQVaXkta4Dj+WKEOhnH+Jhn9iXfY/zNkla/x8gmn+uHPygWV0009PX
	 OUGe7FevFwQ9rljN6atba5fEscFRs9OBr7ucSebdYrnOvU7I6+TC9DAo65WNF0LNEq
	 pyvXn29QioNxi82F6G8i6AaMnI4YbY0xShr0lzqixIWXZP/UFr6cYm8OikdQ/yNku0
	 Sg+xTnWGN4RmxPq76dvhJgG9BNSilXFTM08jY/GlNTBvYR8ABf9VwKIbiGSJJuwPia
	 hCPIM6+Qt7mMTc56kIhpOGJ6XeTgGAIi2H7tDR3haa5WWKMtbo4S2ssNv+1gLo/5EL
	 lAqb1LvqlZ85Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5419717E35E9;
	Thu, 14 Nov 2024 11:36:58 +0100 (CET)
Message-ID: <1246d672-4370-4db7-b4d0-368524809435@collabora.com>
Date: Thu, 14 Nov 2024 11:36:57 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-i2c@vger.kernel.org, Andrey Skvortsov <andrej.skvortzov@gmail.com>,
 stable+noautosel@kernel.org
References: <20241106093335.1582205-1-wenst@chromium.org>
 <20241106093335.1582205-8-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106093335.1582205-8-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
> Instead of having them all available, mark them all as "fail-needs-probe"
> and have the implementation try to probe which one is present.
> 
> Also remove the shared resource workaround by moving the pinctrl entry
> for the trackpad interrupt line back into the individual trackpad nodes.
> 
> Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to work
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


