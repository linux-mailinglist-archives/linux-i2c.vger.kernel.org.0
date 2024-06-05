Return-Path: <linux-i2c+bounces-3810-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 597EA8FCEA8
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 15:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD9EE2823EC
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 13:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175191953B9;
	Wed,  5 Jun 2024 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JNBTOBE9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FA719D882;
	Wed,  5 Jun 2024 12:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717590766; cv=none; b=nkjpk1ZyYl+Rc2lRXxthh7ttXg92UBUnB2HkmLi7accXkbbaEcmXMcQ1IhCJSBeLKDNHBZPP3xvXoOmckslYuVvdYrSEH7dXPg2vk6/f8/uoys9KiGKslAt9dpX41JpkiBx7u6nDpHxwGPCamNUf2vP5nHzXqNLfLlI+dihgC/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717590766; c=relaxed/simple;
	bh=PfhQeGJITJTvs+p/Hge5SmZR5Iv7XJjDoRihZXn1CME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTi8NAvxQO432rURWQif52jmqJGjxRI67xjW3OIl7a2jcNTgmF25t4wPIaVYVzeaBRWpOU83YNZ0EsjuF+ffXCVO4fEccaBoXmUwK/G/8eQI2xNmbmoKzD5fxFap1S+YKIMYFhZwXsFPYnEQUZBuyPMNtL72iEGZG7qTLKcRZxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JNBTOBE9; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BC19E0005;
	Wed,  5 Jun 2024 12:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717590756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbnUs0MSq2j9sy1LgeEvLYnILq+qylhWfc/HqlZBIlQ=;
	b=JNBTOBE9C1+Jb/djiD05CcRKaJnyba3X338QbcyFU2V8rwpuVElD+sX3YHbWrh1Lgrrs8v
	ClTridWJQLNPj4OmVMbF9oa+F2RhZdSDVxPOC8W2IGkb8RAKPdR3R6FGo1PzngjQBWURlv
	8BzA+9asD/76DVv/aKBdszkLWnN8f2G2zin/rNNOl2a/diBZ9yguqhlLrmeKEtaidmrJCo
	tLyrXjHT9qjF858YGk5EQR61zoYda/bjhT+/bVBAbii+H4jcsXszoiKjcMm48z8dR1Kfoj
	J7N0fcbLwtyOUPy0NmOI0xeSAbjzTb86ErgD1laih6Ilc10aKUjEckvjh7edOQ==
Message-ID: <26e9970c-7dbf-48ac-9832-58bf2952d350@bootlin.com>
Date: Wed, 5 Jun 2024 14:32:35 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: gpio: Add 'transition-delay-us'
 property
To: Rob Herring <robh@kernel.org>, Peter Rosin <peda@axentia.se>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Korsgaard <peter.korsgaard@barco.com>,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20240529091739.10808-1-bastien.curutchet@bootlin.com>
 <20240529091739.10808-2-bastien.curutchet@bootlin.com>
 <718d86a7-d70a-c38a-089d-5276bcc6e88b@axentia.se>
 <20240603155810.GA509311-robh@kernel.org>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <20240603155810.GA509311-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: bastien.curutchet@bootlin.com

Hi Rob, Hi Peter,

On 6/3/24 17:58, Rob Herring wrote:
> On Wed, May 29, 2024 at 02:13:37PM +0200, Peter Rosin wrote:
>> Hi!
>>
>> 2024-05-29 at 11:17, Bastien Curutchet wrote:
>>> I2C MUXes described by the i2c-gpio-mux sometimes need a significant
>>> amount of time to switch from a bus to another. When a new bus is
>>> selected, the first I2C transfer can fail if it occurs too early. There
>>> is no way to describe this transition delay that has to be waited before
>>> starting the first I2C transfer.
>>>
>>> Add a 'transition-delay-us' property that indicates the delay to be
>>> respected before doing the first i2c transfer.
>>
>> The io-channel-mux has a property with very similar intent named
>> settle-time-us [1]. I think we should use the same name here.
>>
>> [1] Documentation/devicetree/bindings/iio/multiplexer/io-channel-mux.yaml
> 
> Agreed. I knew we had something and went looking... I only checked the
> base mux and i2c mux bindings.
> 

Ok I'll do this in V3, thank you.

Best regards
Bastien

