Return-Path: <linux-i2c+bounces-13964-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 533CEC358D4
	for <lists+linux-i2c@lfdr.de>; Wed, 05 Nov 2025 13:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99235561BC8
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Nov 2025 12:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B0230276A;
	Wed,  5 Nov 2025 12:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dc+xUQe6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9734831283E
	for <linux-i2c@vger.kernel.org>; Wed,  5 Nov 2025 12:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762344183; cv=none; b=CsN9dGQgYyB8pMHOyM8PRFhhdJjX28vzHEDaMblqIXr5Msaqs9SZ5hNPigBG1aoCkV1UzeebFcom0ePokusmWV37gq53qQVaSDUcFlpN7Q5er2iGzxYTy8fCV6QL5+Qrjv3l1pdRCPiMZDiMN3K63jUHHx1h6oT8dvzILAYSnD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762344183; c=relaxed/simple;
	bh=VH8kFpYQXA1fGs+8Mo/2XoNZGmo3cXN3/bCZcEbEn70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LLcXEJeRaIk1l8O3p0HvRtsWbLW60p88Rz7387e3Hhg8wFN/31tfqsFbam/E2MlLA9Uio2yVoEr/xOYlKuMvUX5fMx86dL05+1nBexOIezGz9cY6JvXecVMYecedEjycWLx9j8ge3UTTsf0vCThc4/AK3UNC/sVkj7zGKMGWYOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dc+xUQe6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762344179;
	bh=VH8kFpYQXA1fGs+8Mo/2XoNZGmo3cXN3/bCZcEbEn70=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dc+xUQe662d/9bzPFMsoLPnBDXpEk42TFjAFfwGLuAGlI3WdMbvacN2RBIeut5Hp2
	 LQ5klxK3tm9O1mGc0Un6cPrikB1tj13pS8xG5j/csZhedUAh18oH6B8Xh4yyzK4wfx
	 Ggdu0ewKxhaCWKleULH3Hz1kRtrjPoyMPFrpz9NIQvCHaWvko8iC2jadr7Y3+K3S8w
	 kETRevfiMg7f6MPFB69XJiwC1Lr7XJggher5O1tMEMC8nhf3+vSXsgtrCdNTHaESoY
	 SGKJ2TfngCPIIFTcaYv0F2qbBjdrNFlkc34EclWbMdrri3C5Oyc0kP3mq5Y955L1Gj
	 ffpFNZ4Z/Y6dQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 72A9717E013C;
	Wed,  5 Nov 2025 13:02:59 +0100 (CET)
Message-ID: <493c50d5-7f6b-4013-91dc-83481f9fbdba@collabora.com>
Date: Wed, 5 Nov 2025 13:02:59 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c issues in 6.18 on R4, but not r4pro (both mt7988 with i2c-mux
 on i2c2)
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "Frank Wunderlich (linux)" <linux@fw-web.de>
Cc: matthias.bgg@kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Qii Wang <qii.wang@mediatek.com>, Wojciech Siudy <wojciech.siudy@nokia.com>,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 daniel@makrotopia.org
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
 <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de> <aQdSVcazPQl-shR6@shikoro>
 <1144f62ad9886fed60620bce0bbed7ee@fw-web.de> <aQfgEuelvU-8_2rh@shikoro>
 <aQs6O75BqOERMzPJ@ninjato>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aQs6O75BqOERMzPJ@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 05/11/25 12:51, Wolfram Sang ha scritto:
> 
>>> Maybe this option should be enabled by default or when the i2c-mux is
>>> selected?
>>
>> That's what we were discussing. At least a warning will now get printed
>> to the logs when booting suggesting the above solution.
> 
> FYI, all the commits leading to this breakage are reverted now. Sorry
> for your troubles!
> 


Wow I replied to a very old email in the topic; Good (but not great) to know that
the issue was not in MediaTek specific drivers and nice to see that it's all been
resolved.

Cheers,
Angelo

