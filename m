Return-Path: <linux-i2c+bounces-10963-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DC5AB5B1E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 19:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 790C14667C2
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 17:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A672215B54C;
	Tue, 13 May 2025 17:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="REjfedeQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020BEDF42;
	Tue, 13 May 2025 17:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157114; cv=none; b=tbOF9QHhS/PJ8Jv2I34pkru4MsarJo64vSe3NN0z+gRvWFMm68a50znDP/3eQ/30t+wcW1K5D3+cGHIPIdasQgtAYz52YvkvUM8Hz49oJSJtnu4KUoTG5cTSf2PUwQMTe+uQyFdsovX1a6Gd/DsqoRkU0cJuTbkDdXtmY0TReUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157114; c=relaxed/simple;
	bh=IFGesWu8EPkRFamvLT8Ku7fGJSEuc1LYK5DITrBQpQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mm7rIep1vatp8Pi3pzIHhZr9CVcJi2W8Mr05UsCs7KoFIqYby8A37nuj++7cqwtsL/F7J+xEhU6yhV4MLAqmKl3nWuuAaD5vwyt0NhrtbQhxSGwFgOuvckrtODYD7dXgbJMjUH907AI0CJiWyCx0wLUhMFlMp0KJ+xAr/3xJ8o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=REjfedeQ; arc=none smtp.client-ip=80.12.242.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id EtMDu3N4Z5ZigEtMDu4cj2; Tue, 13 May 2025 19:23:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1747157038;
	bh=JxrYbBfhgO630RmLTb4Fo45Q/Dzy/Nis+MpX2vxscwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=REjfedeQT6+WYDVQklmIm5CtTtskRglDj1hFS7VCHj0ymXHMturEjJ2LFcc77Eivu
	 +JZIVwXzw2IUFjFHQNLHdCu6wV55tecrtf9l1HBbsCL5aOgtjq+yyWiQ8wS7Bju9Rg
	 etVviCAWVHzaNKKkIqiQ0kumzcFk6SSadeZ89M+doid4bf6wQQDw4/wLAqSOUTeO3m
	 6au2xacazT2bSgtNdYn90F7/UtATC5nF1wmXZTWHhpix8lel9SyV4oNWIacbzdYxsS
	 yyUTu1AgEJsG7ubdAW5GhHRAFjXkj68siKhxtxKPySZukDhpR4WAltBcJmxnSe10FC
	 TOYe2wnOb3p4Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 13 May 2025 19:23:58 +0200
X-ME-IP: 90.11.132.44
Message-ID: <b0fd1c29-4f5b-41e0-a113-2b24527e5e73@wanadoo.fr>
Date: Tue, 13 May 2025 19:23:56 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: amd-isp: Add ISP i2c-designware driver
To: "Nirujogi, Pratap" <pnirujog@amd.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org,
 mlimonci@amd.com, krzk@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com,
 Venkata Narendra Kumar Gutta <vengutta@amd.com>
References: <20250424184952.1290019-1-pratap.nirujogi@amd.com>
 <fc126869-15f4-48f1-a44c-30c45f8dd2ec@wanadoo.fr>
 <b7a5e00a-a744-4824-bfac-fd9caed1726b@amd.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <b7a5e00a-a744-4824-bfac-fd9caed1726b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 13/05/2025 à 00:24, Nirujogi, Pratap a écrit :
> Hi CJ,
> 
> On 5/9/2025 3:11 AM, Christophe JAILLET wrote:
>>
>> Le 24/04/2025 à 20:49, Pratap Nirujogi a écrit :
>>> The camera sensor is connected via ISP I2C bus in AMD SOC
>>> architectures. Add new I2C designware driver to support
>>> new camera sensors on AMD HW.

...

>>> +static void amd_isp_dw_i2c_plat_remove(struct platform_device *pdev)
>>> +{
>>> +     struct dw_i2c_dev *isp_i2c_dev = platform_get_drvdata(pdev);
>>> +
>>> +     pm_runtime_get_sync(&pdev->dev);
>>> +
>>> +     i2c_del_adapter(&isp_i2c_dev->adapter);
>>
>> Usually, this match a corresponding i2c_add_adapter().
>>
>> For my own understaning, in which function/calls path is it hidden?
>> Is it needed here?
>>
>> CJ
>>
> i2c_add_adapter() in this case gets called in probe. Please refer the 
> below call sequence for details.
> 
> amd_isp_dw_i2c_plat_probe()-> i2c_dw_probe()-> i2c_dw_probe_master()-> 
> i2c_add_numbered_adapter()-> i2c_add_adapter()
> 
> Thanks,
> Pratap
> 

Thanks for your feed-back.

Maybe having a i2c_dw_remove() which undoes i2c_dw_probe() could help?

or, if feasable, having i2c_del_adapter() be called by a 
devm_add_action_or_reset()? (note that i2c_dw_probe_master() already 
uses a devm_ function)

CJ


