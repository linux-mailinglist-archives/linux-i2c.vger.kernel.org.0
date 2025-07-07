Return-Path: <linux-i2c+bounces-11852-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA15AFADE1
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 09:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34208188816E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 07:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C9D279DD7;
	Mon,  7 Jul 2025 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="R83mDWxd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449EB19B3EC;
	Mon,  7 Jul 2025 07:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875167; cv=none; b=AWhHIqcEuRn6dnd5HGjpcpRoMD/ID9nIZpBMuVBY3XVTZx83dkgUmLuKaDBp55k3NYNC8eKphndA0Kvko434YkfiuXcVb1ehRiZeh8MI0fu6PfwfEp2ObRghtlDoQWwgENmaLlln9hlTd+Z0d0GdNElm2yxMIvYObUbwCgnW0yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875167; c=relaxed/simple;
	bh=z1aw+j5vhtSH5hM2pv6uTLlW1Ip05M+wekbXCATVdro=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LjuEEBvj6uxRTDpI2dI/Oh2+mRL7nP+f/dXVAwlIah09WaklzDSjfBd9IPM9GhBL5AKUPpD7pUGQNDCkrR5J55bae8k3kq4Py0pct1J3C76du9/G0M1trF0MDRJO2QbnSVSH2sBqb+cg9KOJGW8jv+BBsVDBJQl58Rwhh59TGiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=R83mDWxd; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 39B99A052C;
	Mon,  7 Jul 2025 09:59:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=z8xdzKW5rNMmIpxVldjp
	zEbs1g+0AxJYKg5PiusbGL8=; b=R83mDWxdCRvxyEooSaTLrR1SaRLQIjEBSws5
	Ffnj70xK1TqrExqtHqrC6+POUYpkzajjww4psJmL8JG20jw9+RkeG6LD1eq7ayrr
	agS8/17xD19AHPw4l5KxPM6vZmpmYKuFkJgKk2UfvPmqpdq7Jt0EiS3EboCOqjw4
	PYuKMtHEdW99qSIdS+z3CKemb5FAS8OPLBfnUuKnmQXEn9f38ti97KEsw7wShp8C
	tF8k43GqFinf58W93a0xTPMK+DG5xvtMevswupjWyprbYn33HFBNH9ZeNgbKJw/8
	96AYDgCfb0FFmzvK+eRWSVcgP/vdgfbKeSb1bekzh0m4AsS6xSKVELLAIVrR8ezi
	nC1aQ+5YWGjllAD20jkJX413u1PUJSwyAoCpt33+M2ZhR6+/ZgaJaY2mfspP63g+
	osK4c443D7YRGoZLhoOzjVCzIX4VREWHY2veV1YUdfhNEyQY09trj5P1Xj3g1ds+
	Su01mIM4+n4dEpY5P0DoTVU4NZmh9Yc5QEF6eUUCZvIuttNq4GbUZzXA08jEUMC8
	Bs7hkNmR03qmkTIGRa6RwRS2JxjAXGRnBOD/Trx7/1zYRG7Od6UN/uK4EeNgtdqF
	w/hTx7MXFzmgMpN1mXMqSPtfv96o1aSQ2kcpOyMCiwDQEhw7JPPFIqVbIK6J2Osj
	j1iGiBk=
Message-ID: <86ccaef5-e55c-4c97-b7c2-6c65d4f6dcda@prolan.hu>
Date: Mon, 7 Jul 2025 09:59:14 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: qcom-geni: Add support for GPI DMA
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul
	<vkoul@kernel.org>
CC: Wolfram Sang <wsa@kernel.org>, <linux-arm-msm@vger.kernel.org>, Andy Gross
	<agross@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Douglas Anderson
	<dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20211019060158.1482722-1-vkoul@kernel.org>
 <YYAUfy2ary7ZJfK+@ripper>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <YYAUfy2ary7ZJfK+@ripper>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E65746A

Hi,

On 2021. 11. 01. 17:23, Bjorn Andersson wrote:
>> +	if (ret < 0)
>> +		goto err_tx;
>> +
>> +	gi2c->rx_c = dma_request_chan(gi2c->se.dev, "rx");
>> +	ret = dev_err_probe(gi2c->se.dev, IS_ERR(gi2c->rx_c), "Failed to get rx DMA ch\n");
>> +	if (ret < 0)
>> +		goto err_rx;
>> +
>> +	dev_dbg(gi2c->se.dev, "Grabbed GPI dma channels\n");
>> +	return 0;
>> +
>> +err_rx:
>> +	dma_release_channel(gi2c->tx_c);
> 
> Is there a reason why there's no devm_dma_request_chan()?

Just a heads-up: now there is, in dma/next! It was added in commit 
08bf1663c21a.

Bence


