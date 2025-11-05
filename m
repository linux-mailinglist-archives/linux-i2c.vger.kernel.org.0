Return-Path: <linux-i2c+bounces-13966-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B258C35A7C
	for <lists+linux-i2c@lfdr.de>; Wed, 05 Nov 2025 13:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 525A53B6B73
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Nov 2025 12:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A83314D25;
	Wed,  5 Nov 2025 12:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eq5hV6Ga"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748B54774
	for <linux-i2c@vger.kernel.org>; Wed,  5 Nov 2025 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762345833; cv=none; b=OKPUrnAQvQGBepVDOPlWaUhfZIbfc5hJApYN7TPJB3gU8JaZ45Fsekkqiri6mk4MVSB+buQCddxghYrIcknsSMjio2OBipnKRXX9hhsk0d9alyHITGlgNbJYn83PJhBt+FNf/aNhfGPCiZomWfUJzQvmw/hmPFjGIdS0FfgQ1z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762345833; c=relaxed/simple;
	bh=IiK2mpEii/vR3bgxpZg9qwQ/e83frIZinAdetivBfco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRD+pCsQqQfF5OOCwoQW6VhLFOyx9DAAfiZBUmxqm6/odsdi6Memz/pjL6otouMsEAv5h4up85A1JCLYb33wdIldezmNLuL8SmCOOurtr0+c1X2TgSZdb/1J47SQ8lg2Zl7WWTmEzH/5vaskY/pRUQbCk/D6lGXz+ClbaM/WKic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eq5hV6Ga; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762345829;
	bh=IiK2mpEii/vR3bgxpZg9qwQ/e83frIZinAdetivBfco=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eq5hV6GaTEBxYByQcV6bfi1YRReUWlvEOraI6xXzP5Bp//C9TQ0NGKVxlX9Y5gRhU
	 P+o61Hv+Jf434sqMiJWTj2dgzIJ1CbxWr+/9karGQz5e9Z/jg32eveIzEcZz9Qxm08
	 AvXXwVdfXY04raDzUIqCInPfTFHlr9Ve5CY1UywxvSQqfK8AmQKLLMKZ9HF2fMusEs
	 /3Xc2VhXzSPJTVxkYuNWgMm0b+qTcXrJOsjJU8zkDLtNBISVAmj0cg+pw6j1ivoNjj
	 ZJMoqan3hQWz8Pm58rXlaD+eXKvy096NxEIOO4lOZTrt2WzU1i+WlHqQrz7mbHw3D+
	 4lqEYKMJiPujQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E319017E009B;
	Wed,  5 Nov 2025 13:30:28 +0100 (CET)
Message-ID: <2162f8a5-e4ca-46e1-baac-e7eaf3e58c11@collabora.com>
Date: Wed, 5 Nov 2025 13:30:28 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c issues in 6.18 on R4, but not r4pro (both mt7988 with i2c-mux
 on i2c2)
To: Frank Wunderlich <linux@fw-web.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: matthias.bgg@kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Qii Wang <qii.wang@mediatek.com>, Wojciech Siudy <wojciech.siudy@nokia.com>,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 daniel@makrotopia.org
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
 <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de> <aQdSVcazPQl-shR6@shikoro>
 <1144f62ad9886fed60620bce0bbed7ee@fw-web.de> <aQfgEuelvU-8_2rh@shikoro>
 <aQs6O75BqOERMzPJ@ninjato> <9B073F04-0CE1-4870-88B7-9510B3EA5D6F@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <9B073F04-0CE1-4870-88B7-9510B3EA5D6F@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 05/11/25 13:08, Frank Wunderlich ha scritto:
> Am 5. November 2025 12:51:23 MEZ schrieb Wolfram Sang <wsa+renesas@sang-engineering.com>:
>>
>>>> Maybe this option should be enabled by default or when the i2c-mux is
>>>> selected?
>>>
>>> That's what we were discussing. At least a warning will now get printed
>>> to the logs when booting suggesting the above solution.
>>
>> FYI, all the commits leading to this breakage are reverted now. Sorry
>> for your troubles!
> 
> Why? My issue was solved by adding GPIO_RESET... So it was fault on my side,sorry for bothering.
> 
> @angelo
> yes it is a final board BPI-R4 v1.1.
> 
> Why sometimes it works i guess it is because uboot may previously initialize the device (and without reset working it may be stuck in wrong state).

Heh, this is something that happens frequently.

> I'm not sure if my current flashed version had the i2c and i2cmux support,but i got it working on that board because of the connected eeprom (read mac address via tlv_eeprom as macs do not have fixed macs via efuse afaik).
> 
> Thanks for help so far.
> 

No worries, my pleasure (but I didn't do all that much anyway :P :P :P)

Cheers,
Angelo

> regards Frank



