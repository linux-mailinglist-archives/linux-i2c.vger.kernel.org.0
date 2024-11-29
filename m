Return-Path: <linux-i2c+bounces-8265-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE309DE796
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 14:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88732162E69
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 13:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4343F19D091;
	Fri, 29 Nov 2024 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fWkG0sDs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5EA1990C1;
	Fri, 29 Nov 2024 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732887113; cv=none; b=nEjLLF0phva2X77LSAk0kFZdN72IIAxN5Z/CKkcsy2P/y3kd4YUm3Ple/KCwOZWrTJEvYUzZjuVgcpBD0FELZKj3Ny3pIBcHZHuVDy2G6DgbcbF5noLQWE4IhO6S+OSudn0t3q7Xjj1/Ia5ucVIxOEMVKM03LLZ3TUtBDi9GGuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732887113; c=relaxed/simple;
	bh=JnVN1d46Q2opgrUSG2bYuGlVZ2ouDyhLcx1XouPKqns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7Brxqb99Cn0byTfcWbcGGrNf/L8o75AO4ABVWKnL83bAsYwyLv20Es4QbguVRt9eueeHahjxtT1XqTEIWWVMaJBtYOT6/LqSQu9z2e/jfk76VnLNplp9OBysTgYK2pnjbKTqT5oUsN/jzss24CEHjg5YqV/8QzQ0jo58TcQfXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fWkG0sDs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50A60A8F;
	Fri, 29 Nov 2024 14:31:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732887084;
	bh=JnVN1d46Q2opgrUSG2bYuGlVZ2ouDyhLcx1XouPKqns=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fWkG0sDsSVt5MoLUf0AKZ4l4BBpemzopB08fOzw6TZk7kaLnSCFMXEftMW4pRzomj
	 r5snHtOCTtebOJaSSsedj17o2xPJVRkSRjsmHsm4czGOYITxMrhNlu4g5SGP8JWP94
	 onBA7sACmCKvxDMZ0cBAGV9peeeNBDMkaAGHLalE=
Message-ID: <9bae963f-037a-46e1-abf6-f2ec464c4cf8@ideasonboard.com>
Date: Fri, 29 Nov 2024 15:31:45 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] i2c: atr: Allow unmapped addresses from nested
 ATRs
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
 <20241122-i2c-atr-fixes-v2-2-0acd325b6916@ideasonboard.com>
 <20241126091610.05e2d7c7@booty>
 <b954c7b7-1094-48f9-afd9-00e386cd2443@ideasonboard.com>
 <20241127131931.19af84c2@booty>
 <30732dbb-21e6-4075-84b1-544fc6e6abce@ideasonboard.com>
 <20241129125340.0e2c57d9@booty>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20241129125340.0e2c57d9@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/11/2024 13:53, Luca Ceresoli wrote:

>> So strictly speaking it's not an ATR, but this achieves the same.
> 
> Thanks for the extensive and very useful explanation. I had completely
> missed the GMSL serder and their different I2C handling, apologies.
> 
> So, the "parent ATR" is the GMSL deser, which is not an ATR but
> implementing it using i2c-atr makes the implementation cleaner. That
> makes sense.

Right.

But, honestly, I can't make my mind if I like the use of ATR here or not =).

So it's not an ATR, but I'm not quite sure what it is. It's not just 
that we need to change the addresses of the serializers, we need to do 
that in particular way, enabling one port at a time to do the change.

If we forget about the init time hurdles, and consider the situation 
after the serializers are been set up and all ports have been enabled, 
we have:

There's the main i2c bus, on which we have the deserializer. The 
deserializer acts as a i2c repeater (for any transaction that's not 
directed to the deser), sending the messages to all serializers. The 
serializers catch transactions directed at the ser, and everything else 
goes through ATR and to the remote bus.

Do we have something that represents such a "i2c repeater"? I guess we 
could just have an i2c bus, created by the deser, and all the sers would 
be on that bus. So we'd somehow do the initial address change first, 
then set up the i2c bus, and the serializer i2c clients would be added 
to that bus.

  Tomi


