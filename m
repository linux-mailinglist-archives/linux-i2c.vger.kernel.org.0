Return-Path: <linux-i2c+bounces-7989-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD4C9C87BD
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 11:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0E30285ADF
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 10:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D401F7797;
	Thu, 14 Nov 2024 10:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="j3bOK5V9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9459F1F779B;
	Thu, 14 Nov 2024 10:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731580625; cv=none; b=GR4AQFXhAKRDtH9P1WVBuPhKdDg33wvWe+BCgHYeNZt5v5oj/+gU283nRdVCwVjLKrv97S8CVvKTlZ8P7lH84Bzgi+u/96ve5BEDFgulL3AdrKhjZFal11DZajg9ECgbV/pld7q1asdA1qh4hKy+5Om3KQLCHZDVYiIFTJWkudA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731580625; c=relaxed/simple;
	bh=vdcjX5fDRMTd/FV31avoaAW6wAwBl2Cr+rjm7WpH6Jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BCF9e7Hu0VLdoD3WimnNlvTp0j58wTQsFUcEaOZv+tfvHG76YnuxoK2WA5grpLlRhEVSs7GVhFguVqzTKN00XiHf1oKmwIc1Hsi6YFjZ53cx5K5Hbj9FH8R/0EYhrw3yxqEuhR/8Dut4/lMbHH+952tah40Yr+u2WQZK4Lh8mS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=j3bOK5V9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731580621;
	bh=vdcjX5fDRMTd/FV31avoaAW6wAwBl2Cr+rjm7WpH6Jk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j3bOK5V99lCM1rcj6Qfp1JPTdBJChP+0o5R7aiQNeICN4e8JYWhhtuWVgqIEmgIis
	 Ff88QFmjFvPIHG4fvIDtX+CefMVJvHHkvoZBvaiVzepIry+mOmEOCe9ShPluApwJlZ
	 WN/P4FYJB1ZlwbiRCqyLZIng9tQvWLANgxb/emIY4LDWJnRaaJVnFNX67ILYkkP5jC
	 QKn6yQccLcJBrUCtU905WuNfeqhTpG471tgLwDuRmOHpxBSUQPdEjq6jCBpj2AgM8g
	 QFq2UN2Iy1HYvttFVcNsJ+fr0V48rDVRIoWWZWgB6C4rRJCp/sDvtucXT+RzY7q93j
	 6SI3h/q+C6uCQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 318D117E35FA;
	Thu, 14 Nov 2024 11:37:01 +0100 (CET)
Message-ID: <a01c0703-5bdb-491e-b4fe-6374dfc1f49b@collabora.com>
Date: Thu, 14 Nov 2024 11:37:01 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] i2c: of-prober: Add simple helpers for regulator
 support
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
 <20241106093335.1582205-5-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106093335.1582205-5-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
> Add helpers to do regulator management for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> GPIOs will be handled in the next patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This set of helpers supports at most one regulator supply. The user
> must specify the node from which the supply is retrieved. The supply
> name and the amount of time to wait after the supply is enabled are
> also given by the user.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



