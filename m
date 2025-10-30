Return-Path: <linux-i2c+bounces-13901-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CB3C1F62C
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 10:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 94CFD34DA3A
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 09:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF7130E0EF;
	Thu, 30 Oct 2025 09:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NeG8swoh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D879032B9AB;
	Thu, 30 Oct 2025 09:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761817772; cv=none; b=JqBpXJfQONaqKwbEnbWeLLVJy8UECaR6wXYg6x/JhWx6OQ+gYmSXPUj5Mxj58fPp2iTYg545iufdfcu8g2NTHTA7wUUJwlz7mPsbjrGfgAAguXHxgDPlhKQ/9rhktLviQ1XwhltusdekPRX3B2wAo+Ka7I2Q2KEQrpT7yftWMa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761817772; c=relaxed/simple;
	bh=V5ZhmCAm/cdZVibF7PIYmLYjZQBg5RjTckmSZwa+atQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MwjSXQGrQceAxlZpTm05sPJ3N7yxn6VebEWzcouJQJFIS8ACLRsPhQBQUhRaSYt3zGpuLkBhQdjMSp+8zpWIM5a2C3X9AxDT4TEHNra7hv4KJtTOnU8CoyiYD6pdzhx8GwTO6QvVJ0LfQj0qCwv8JQyP85lMOJesTpXQPWnwxd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NeG8swoh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761817768;
	bh=V5ZhmCAm/cdZVibF7PIYmLYjZQBg5RjTckmSZwa+atQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NeG8swohnFlfiGgInFLvqViaV9n6mdCKVCy7FqA0Byk+V6riFCrCzIjik6HY4QAi7
	 K+Pwk+d2Mt7praO4+N2hf8CNB8Ldyd4yFFFaudG/X1bbxxyqe2L6o4aCFYAkAb614M
	 LBoTRN4LWl8FcZTTZBBIA20yBr3BW6MkgfXlx9mNQnukvY4Uy80ZigCaex4oidhh1d
	 Ec+h2w4GgMom6sjmjUp/kHvhEPpMRjzmnUPES1zLsoKbFHQJu8f8BrHRia09RDgkUG
	 dZIXKNSYFbj5PfpSktZRurBHwSE6S/Z7SdzakxhcAvGtF/JLmXuURczGx8kIZY3FGe
	 YJEPkjzE+QYAg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9990717E009B;
	Thu, 30 Oct 2025 10:49:27 +0100 (CET)
Message-ID: <f4c3d7e6-22a8-4ef9-8d2b-a40637bc0626@collabora.com>
Date: Thu, 30 Oct 2025 10:49:27 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mt65xx: Add compatible for MT8189
 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251030-mt8189-dt-bindings-i2c-v1-1-5b60914c6453@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251030-mt8189-dt-bindings-i2c-v1-1-5b60914c6453@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 30/10/25 08:56, Louis-Alexis Eyraud ha scritto:
> Add compatible string for MT8189 SoC.
> Its multiple I2C controller instances are compatible with the ones
> found in the MT8188 SoC.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



