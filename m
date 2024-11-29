Return-Path: <linux-i2c+bounces-8264-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D85EB9DE6A4
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 13:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DFD8281307
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 12:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE6319D06D;
	Fri, 29 Nov 2024 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="etihQ2hZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B49C199934;
	Fri, 29 Nov 2024 12:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732884281; cv=none; b=FxQD0MsmSimXepM3x4mxKrz667BEUNsGfQhOZPUePmBvS5WCHlt6uFSB1OrqSLFxO3sc9N5n2m9GMVGcDVB8Ux6PHmvGjWToF6TwQ9dyEK5Z7226WYWddfqFgFo2QCSvwcbCG74LzW6UXKwGrfus2XFxTVubPGVSTtp1Tm71dn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732884281; c=relaxed/simple;
	bh=+CBAHM6mr8xHf8WEZoE7ttKYOrQDETuiJpZBiiUHjQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRqox56LN8QPNy31pQldNFoTgqQuI+JQ+sdVJWIKdQquzbj0Q4g5EXRfkDV1AZblEcuVOJFpwPMOgZpozbJ2VzyxFSy5g73TzTmevQrwNd0n/YAAh5jHppPa40B14AcrWetglN+2pPqQkkzt+DaWCs/z/sUwfQgRz96bm1dEgpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=etihQ2hZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86C34BDB;
	Fri, 29 Nov 2024 13:44:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732884251;
	bh=+CBAHM6mr8xHf8WEZoE7ttKYOrQDETuiJpZBiiUHjQo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=etihQ2hZWFk5HQuA6zJOHamcFfPiUkwlTZEOW5mkvcwsyW0EAToP+VdMd1ZJEeCuf
	 mIR971EOONAmKfiZaE2Z3SdSM4UOKBXsnsICCSQ5ictBI+dw+2Pm7Triyb5Hij/DmQ
	 X3NlldRcia7wEGisMnrQmnm5SdsWWhgMDzSf8pTA=
Message-ID: <c9f640d9-221c-40d2-b71f-feef7518ab55@ideasonboard.com>
Date: Fri, 29 Nov 2024 14:44:31 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] i2c: atr: Fix client detach
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Gantois <romain.gantois@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 stable@vger.kernel.org
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
 <20241122-i2c-atr-fixes-v2-1-0acd325b6916@ideasonboard.com>
 <20241126091441.345d4493@booty>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20241126091441.345d4493@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Romain,

On 26/11/2024 10:14, Luca Ceresoli wrote:
> Hello Tomi,
> 
> +Cc: Romain who is doing a different kind of sorcery on i2c-atr.c, so
> he is aware of this series.
> 
> On Fri, 22 Nov 2024 14:26:18 +0200
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> 
>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
>> i2c-atr catches the BUS_NOTIFY_DEL_DEVICE event on the bus and removes
>> the translation by calling i2c_atr_detach_client().
>>
>> However, BUS_NOTIFY_DEL_DEVICE happens when the device is about to be
>> removed from this bus, i.e. before removal, and thus before calling
>> .remove() on the driver. If the driver happens to do any i2c
>> transactions in its remove(), they will fail.
>>
>> Fix this by catching BUS_NOTIFY_REMOVED_DEVICE instead, thus removing
>> the translation only after the device is actually removed.
>>
>> Fixes: a076a860acae ("media: i2c: add I2C Address Translator (ATR) support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Looks good:
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

Can you test this one with your setup, and give your Rb/Tb?

I think it's an obvious fix, and could be merged separately from the 
rest, which still need discussion.

  Tomi


