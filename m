Return-Path: <linux-i2c+bounces-434-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E787F6D0B
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 08:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA8411C20E28
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 07:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DCC7465;
	Fri, 24 Nov 2023 07:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aZfn3DXE"
X-Original-To: linux-i2c@vger.kernel.org
X-Greylist: delayed 337 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 23 Nov 2023 23:43:34 PST
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [IPv6:2001:41d0:203:375::af])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9D010C2
	for <linux-i2c@vger.kernel.org>; Thu, 23 Nov 2023 23:43:33 -0800 (PST)
Message-ID: <a2a9b649-04fc-4e75-94b0-d5df137a833a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1700811473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VjMI1MPtpwadsFtx6psItLhcfNdYPfIwh32yRRxk1iA=;
	b=aZfn3DXEU/+dBvXPclrLyl6Hx8KjxjmSAFh8Y3ztc1cJZArVhIbvUeG8i/ul499cTF2lhc
	g8mZK19ZZlXa1FUkB35IVN794seOOPWr/j+CWkRaHBkJ6sbKJeH7ruG8GJqPt6r95+PYdM
	vZjKD1ktjKkWyCLe1my5XGaEg6dC5nA=
Date: Fri, 24 Nov 2023 15:37:45 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 08/20] drivers/gpu/drm/loongson/lsdc_i2c.c: remove
 I2C_CLASS_DDC support
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-i2c@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20231123094040.592-1-hkallweit1@gmail.com>
 <20231123094040.592-9-hkallweit1@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231123094040.592-9-hkallweit1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2023/11/23 17:40, Heiner Kallweit wrote:
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
>
> Preferably this series should be applied via the i2c tree.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

Thanks.


