Return-Path: <linux-i2c+bounces-8195-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7C49D82E5
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 10:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FA8F287FFA
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 09:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E95A191F9E;
	Mon, 25 Nov 2024 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qP6Pk+LC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91DF190067;
	Mon, 25 Nov 2024 09:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732528362; cv=none; b=PrteTH6mgebDC2DTl/75SQ5IfhbRPyNmAnaMAQEZSLSQnxaRqRCxO+9IBL9GNLBWuZs1rvQc2xoXqwURLhSI0Fs89uuTDNOWTMae0XphCkUOXZJBnGwsNZ5W2s5/lGAYrt/g6goeaQ9v8RJw1c6KmJmjYUVkQwAsqMELTHxbzHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732528362; c=relaxed/simple;
	bh=2tS8FIGs5XfE/2qFIHTISjAC2cAm3XxgBs/cPNnw7kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UyxO/VUZRvlg2V+2mpu7Vd/O9mcWY52lOSOE20U4gPHzWAoLGsAeBkkAMc7H9cJ0Bp9kkFkNIOiHY06HOpGbD0ApTbgWNnvzb+Gwp6EanJqIa9Ysf0ncdrmsFuhU/mg1Kam1IhOAo20RQbgN8QISJcqpSFlXLYr5La82hkOsr4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qP6Pk+LC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732528357;
	bh=2tS8FIGs5XfE/2qFIHTISjAC2cAm3XxgBs/cPNnw7kI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qP6Pk+LCYgDMpAulcmdEP+3T1YaUinBnS5Q/YXyUtee5d1kafzYxViIItesWz5ywp
	 Lj5lB9+CLm221BhmLUGC7qAXN1mGMcry8/KkzOHY8fcmD9Z+aOwe/o9RiEdWrpKd8y
	 lf7MubkhsxMmQBb0z/p376R+eZPuEvCihD7+VCsc24fHCywctPYXvykTy7q7jtKQpb
	 cgtHD59rIUdVrLyd53PTEQ/7bB35w3gN11AyAbX5+oYjITIoJ+IXtskiXoBfbfI4Qp
	 A+LFiXEMMzPqTKJod654CsxwgEuVin5Tqovg2VhRLJS7MKC4IZ7pTt+OIfoLGSkN00
	 LHGAZ6qci66Ng==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 79B6A17E14D5;
	Mon, 25 Nov 2024 10:52:37 +0100 (CET)
Message-ID: <dbe132d3-94bf-4801-8d52-167cb2074038@collabora.com>
Date: Mon, 25 Nov 2024 10:52:36 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 linux-i2c@vger.kernel.org, stable+noautosel@kernel.org
References: <20241106093335.1582205-1-wenst@chromium.org>
 <20241106093335.1582205-8-wenst@chromium.org>
 <1246d672-4370-4db7-b4d0-368524809435@collabora.com>
 <CAGXv+5H8YwiTyk1eMSwPLuGw5sQxec4n8OKR-Qa5wz8QGH4h9w@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5H8YwiTyk1eMSwPLuGw5sQxec4n8OKR-Qa5wz8QGH4h9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 25/11/24 09:01, Chen-Yu Tsai ha scritto:
> On Thu, Nov 14, 2024 at 6:36 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
>>> Instead of having them all available, mark them all as "fail-needs-probe"
>>> and have the implementation try to probe which one is present.
>>>
>>> Also remove the shared resource workaround by moving the pinctrl entry
>>> for the trackpad interrupt line back into the individual trackpad nodes.
>>>
>>> Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to work
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Hi Angelo,
> 
> Could Wolfram also take this patch instead of it having to wait another cycle?
> 
> 
> Thanks
> ChenYu


Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Yes

Thanks,
Angelo

