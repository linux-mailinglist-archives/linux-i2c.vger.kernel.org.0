Return-Path: <linux-i2c+bounces-9441-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4782A34908
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 17:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C9F03A4B81
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 16:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A701200138;
	Thu, 13 Feb 2025 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NlLiC48/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175BE6F099;
	Thu, 13 Feb 2025 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462507; cv=none; b=pw6wkuA4ZZ2QeP2w4Y5tLYV3NJwlOJh16IwnhclGG7CxSpSrXDtEfh5g4BAXXIi4vCV8J+uNGl/80C7CFoUPte60hWT5dMjXANJ6c8y79XLwp7gx75cxaReH7Ejd0XVkoURyUSbIhh/PWLlKYKWL5ocEgyz514pBCj4xmzr/2hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462507; c=relaxed/simple;
	bh=zd3CJunqywqI5AKyrBsDBDEx1MdJbDKWUbWp/YwdNJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BqVJoZk84z+XRceqpxaeG/cyGrsRL2pZrAE9v5Ej/C6qdnmdgdwfDcolDjY4dk4fXiOq++M3Qwf4s2tZSdu2HLWx0Jlw8i8EwwZqxubh3pu5PhIpjtIf9M+b7zgnmt+dyrI4zY9g+sJNXgvrjsmp7l2gIx0LN9ig3cmnxVkXq9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NlLiC48/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739462504;
	bh=zd3CJunqywqI5AKyrBsDBDEx1MdJbDKWUbWp/YwdNJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NlLiC48/7e309+ZJIZvbvqiem+LAJBnmRmbnLOw8eR3Jdf9KMrZw+BYMIlZljdsiB
	 lmUczCdniZJuyVObJTqbsN0bPzgr1LnLBriGGMej8o3W4Dw+X4MUXZ7oTEncuKXHXe
	 jJIDN07tTeRC8dbMVctjhBuOklt4Q7r53s1/+4i+40d8xcF0DDIf942cejCCk+LSX3
	 kTNUkTZfP9zYp+QwehJg5r2GXdT5DzgFo+9VHQ5LwDcvaAgznCv5Eon4aEtG0lNvdk
	 55gsO1yu5hVsb5Z9ymnuLSvlx1S8REQKJJ8GxmG3OfbIkWCEkVuy1JfENw3Ygbli54
	 u4w+sQO/GDUDg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 85F2517E153C;
	Thu, 13 Feb 2025 17:01:43 +0100 (CET)
Message-ID: <4978f335-38d1-47fe-b029-de6a2f1374c7@collabora.com>
Date: Thu, 13 Feb 2025 17:01:43 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] i2c: Introduce i2c_10bit_addr_*_from_msg()
 helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Kamal Dasu
 <kamal.dasu@broadcom.com>, Stefan Roese <sr@denx.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
 <20250213141045.2716943-2-andriy.shevchenko@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250213141045.2716943-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/02/25 15:07, Andy Shevchenko ha scritto:
> There are already a lot of drivers that have been using
> i2c_8bit_addr_from_msg() for 7-bit addresses, now it's time
> to have the similar for 10-bit addresses.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



