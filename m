Return-Path: <linux-i2c+bounces-7993-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2924C9C87C6
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 11:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8BDC1F2300B
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 10:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D131F9ECC;
	Thu, 14 Nov 2024 10:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="f50kCmH4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3FB1F9A8D;
	Thu, 14 Nov 2024 10:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731580629; cv=none; b=MtIMd04+a6VwDk7Fdu6mEePpynYQcWa3SYEdyn95BKHDGsaENOoXgOzh10DtjV7NyQEjE0idfBu9t/omjV5fs/Q1DqE30sfzNyP7F2toOGd+F/VN7eYgw93ml6l0eTIlmLrianaETcgClh6DESSRiX2SP4NZOkxvMJniPhEP9KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731580629; c=relaxed/simple;
	bh=7z7DS9Ubxs1hLpEVtRZIePudtqICDZaRxk+SoI9jC08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSt3deFWw2FHTDSyTmX/fnbfKnuSW7GyOTYpUXudW10s43G+gmBNNtoJhG0cl+bwmrhuvUHrmCNnKtCFxK2X8MsJkjOlwOVYNeM/wLyT8z3mwzkXUPhUFXHvrGHbXevu/t/OTd/HsfZFxrkkDITz/9bG59ZHpi9qGA/zpyakZsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=f50kCmH4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731580626;
	bh=7z7DS9Ubxs1hLpEVtRZIePudtqICDZaRxk+SoI9jC08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f50kCmH46IKuu7T6njlBeu25xb7nVvZOhSuqs7pdQWqbyVAbg4mBC31HldF37Hx0i
	 iT71kExscNycwFwduSWzVli9UGV1w17KLLmrZHxDXGrx0xb4ORhH4mSzeDJ0ozoh8J
	 sYc7T5xG34QNwTaYHIr1Ph1f6pcANgEPJDMfvvpSTk9MI14iwwwQQ7RHUek1ivnnxw
	 AgqpViiKZPWUKgxmacI5opFIEgoytWlCh5m23VTFPLy2chSndbaYncp/S+Mrhv0nvZ
	 kKBk2wscAqKV4c0IuuR48uj00e6CIU+h4JiaMLzuljnkoYcljdt2gGPh+C7VwISQin
	 PSv6i3KBTVkaA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AEA817E35E9;
	Thu, 14 Nov 2024 11:37:05 +0100 (CET)
Message-ID: <bbbf291f-7a6f-4fab-9ff2-fe221460d18a@collabora.com>
Date: Thu, 14 Nov 2024 11:37:05 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/7] of: dynamic: Add of_changeset_update_prop_string
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
 <20241106093335.1582205-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106093335.1582205-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
> Add a helper function to add string property updates to an OF changeset.
> This is similar to of_changeset_add_prop_string(), but instead of adding
> the property (and failing if it exists), it will update the property.
> 
> This shall be used later in the DT hardware prober.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



