Return-Path: <linux-i2c+bounces-7992-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 025189C87C1
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 11:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2BA61F226E2
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 10:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C571F9424;
	Thu, 14 Nov 2024 10:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MZ8PMwaU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E121F892C;
	Thu, 14 Nov 2024 10:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731580627; cv=none; b=I+K8IjFozYEQOrHuIGzlmLnwTGuQVeNpMXyHXTg6suYWnCg/vkI1q6WomKUICzE9aWJbbG9f2Vbh6lD3OX2k90NVZrgL8kT4MWMqPIF/nkNMAALpPBNcpk323f7PBnqKuDik7oVHkRUjSgJEPOVbRKjQBM6P/f/3V+C2yVrIJUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731580627; c=relaxed/simple;
	bh=aLsZjA2n5qBFWKwV+QQGM/W8zsubVjefSPXaeUYJ6nE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dZj1IgTMoKRmODI6K/gIjVqKlVwyYLkDnFsAhb8RldI80rl4L4kAQeTuoVvsrl7iOAse2l5bm6fcSTR7foGhk8X8AVLeWBMvD2I3g6j8FvWPFBPoERI3/+6rxwNBwBkMUQJFjrjKJlYsi9WSp9leCyDR1Y2m59KGrB/INlJjFEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MZ8PMwaU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731580624;
	bh=aLsZjA2n5qBFWKwV+QQGM/W8zsubVjefSPXaeUYJ6nE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MZ8PMwaUwWCHjh+bqwUoeNZUvuxw0kYBeT8BG7DuQpIZuQjiPIz04S3Fh9nTmmXoH
	 BA8ZPRin4DJ1gbeQwcH1rBby6MyGZBV8I7J53HSMErzdtQ9D/KXzI6XIp5XPnDkycm
	 qcSLuboGD5XZZlh0zkzvJgkmI6fkyxbNJDB13AamYjOr2wWHiytgkbzQMmsuo9N55A
	 NBJPXx1cg+TN5rB/Q8WzpVr3pfjqcDIGEkq4fxfTcxXd1Y4mj5hMAxykB/vVW5djme
	 l/spAntWdVWmFMMIlVcQIZkDvlRBHK3ykQe6m1WUjEypE7rRUAqEaHVlV5/+ZHDwr3
	 u/nxPsRLwFi0g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 792B317E35FF;
	Thu, 14 Nov 2024 11:37:03 +0100 (CET)
Message-ID: <654b951c-1c69-485a-88dc-0c662172ac74@collabora.com>
Date: Thu, 14 Nov 2024 11:37:03 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/7] of: base: Add
 for_each_child_of_node_with_prefix()
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-i2c@vger.kernel.org, Andrey Skvortsov <andrej.skvortzov@gmail.com>
References: <20241106093335.1582205-1-wenst@chromium.org>
 <20241106093335.1582205-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106093335.1582205-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
> There are cases where drivers would go through child device nodes and
> operate on only the ones whose node name starts with a given prefix.
> 
> Provide a helper for these users. This will mainly be used in a
> subsequent patch that implements a hardware component prober for I2C
> busses.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



