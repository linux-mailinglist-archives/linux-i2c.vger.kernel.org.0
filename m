Return-Path: <linux-i2c+bounces-306-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2F07F1503
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 14:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA450282483
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 13:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FB91BDC5;
	Mon, 20 Nov 2023 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="c9pGTjRp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB644EE;
	Mon, 20 Nov 2023 05:56:05 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DAD116600367;
	Mon, 20 Nov 2023 13:56:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700488564;
	bh=LRGku4mgI3CyWNGC5qdMEGicvWEaOWczf1gTa2doZpI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c9pGTjRpycIcF0pdwS4h+ZJFwwEsCe6B92BIOnLdsALi4qQ634vUfl9h82aIRi6aL
	 Xb/GnBNmauxMVgbNA8CPIfzzoGbHXhEs2HmNzrjVG6/cMUJ4r42k6Fc80/IexCWs0q
	 HMvRUHL57K0xfvASYsEazM8Z7f6YFqvHggz1ySIo2qiSjvh4fPN42V+CG8sibmfN6z
	 lnl+V1jRvkkY7DTs2f6kir6cQb2vSLB0PDU+yesdf0s26ZDgtbGvTm77lawNlaenLA
	 qG7cwXYQPYGv29BIGNbVDOjwhlKa46K8xBLHrbbj8GiNOt1eEvulQOksZxXgXCv0rY
	 55NaZJWd6S60Q==
Message-ID: <17be794c-1e75-4843-8dda-63ca7b879c5d@collabora.com>
Date: Mon, 20 Nov 2023 14:56:01 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove
 I2C_CLASS_DDC support
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-i2c@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231119112826.5115-1-hkallweit1@gmail.com>
 <20231119112826.5115-13-hkallweit1@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231119112826.5115-13-hkallweit1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 19/11/23 12:28, Heiner Kallweit ha scritto:
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
> 
> Preferably this series should be applied via the i2c tree.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



