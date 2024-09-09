Return-Path: <linux-i2c+bounces-6399-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2DC971739
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 13:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55A721C21CE9
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 11:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F011B5ECA;
	Mon,  9 Sep 2024 11:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUinRO14"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E676A1B5EA4;
	Mon,  9 Sep 2024 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725881829; cv=none; b=qMiwfOIAOQxpFaM++gtG6707FzQrDjjaoQye6YsPLLjafHr0dXLWluyvRHV8SMAl2WcqbCmTTBySdb8xJg2nXoC7s/Vby0pnUKzLD7vphPYgusHEh9QzVzcOI1KKPF/HV/0efMQlC/UdgaWvI8oz9a07y8A3YOsl+k4rJvinMu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725881829; c=relaxed/simple;
	bh=3czTVn6KoEgnQPJMLjyix/3iHm0d8N+yW4Xrv+9GXtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HqpLy0dcChtiPg46PA0xL8mJTo8YmMcYYBPeZ/uveihLVfN00mCwRRiJHiZwGMcWWEiuBPv9CxnD0UPnx+59VrtxpuXYN/tsr/bTzVBUT5E1NyghQLGRZi6GvAXRegRP0DoU6t1f/1EUSbTTZZqnh3vRrX8tC6dNJJZVNVv3ujw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUinRO14; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EC4C4CEC8;
	Mon,  9 Sep 2024 11:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725881828;
	bh=3czTVn6KoEgnQPJMLjyix/3iHm0d8N+yW4Xrv+9GXtA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kUinRO14so4QeA95muzzYb293hGbk4b/wF0Fft2Vg7qqFMKh5hSj2tyKutijcblJ9
	 kNnBZVq630q+1vnawi+OoNRQScZG2WeFhOIr2ztY08aPU40Q9ahJnsuaef+H1EMO3Q
	 X7reKwjThMZpZzfsbXwa72cieXgONu4pjFVpb74SouBJjbgvUbnRhYwPkdu9i12hWn
	 fqxr6bOkkRWgMeeWEc5aO/AiW/77TA54rLUYeGzhskIe/jfKFhpS9Xyqeelbxf8HVe
	 mTXQKmixYXkjcSQ4f4RKJ4clbdOhIx+k3cKRrkA7ltyYT0wigaQsG2SxmPqbu3bYPn
	 AuXoCI9n64WUA==
Message-ID: <3fa58f58-c1d2-41ac-b85b-c86bce5c06b9@kernel.org>
Date: Mon, 9 Sep 2024 13:37:00 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 neil.armstrong@linaro.org, konrad.dybcio@linaro.org, andersson@kernel.org,
 andi.shyti@kernel.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, conor+dt@kernel.org, agross@kernel.org,
 devicetree@vger.kernel.org, vkoul@kernel.org, linux@treblig.org,
 dan.carpenter@linaro.org, Frank.Li@nxp.com, konradybcio@kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
 <20240906191438.4104329-5-quic_msavaliy@quicinc.com>
 <b3a5dd54-90ba-4d75-9650-efbff12cddeb@linaro.org>
 <3bd27b6d-74b8-4f7b-b3eb-64682442bbda@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <3bd27b6d-74b8-4f7b-b3eb-64682442bbda@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9.09.2024 11:18 AM, Mukesh Kumar Savaliya wrote:
> Hi Neil,
> 
> On 9/9/2024 2:24 PM, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 06/09/2024 21:14, Mukesh Kumar Savaliya wrote:
>>> Add support to share I2C SE by two Subsystems in a mutually exclusive way.
>>> Use  "qcom,shared-se" flag in a particular i2c instance node if the
>>> usecase requires i2c controller to be shared.
>>>
>>> I2C driver just need to mark first_msg and last_msg flag to help indicate
>>> GPI driver to  take lock and unlock TRE there by protecting from concurrent
>>> access from other EE or Subsystem.
>>>
>>> gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
>>> Unlock TRE for the respective transfer operations.
>>>
>>> Since the GPIOs are also shared for the i2c bus between two SS, do not
>>> touch GPIO configuration during runtime suspend and only turn off the
>>> clocks. This will allow other SS to continue to transfer the data
>>> without any disturbance over the IO lines.
>>
>> This doesn't answer my question about what would be the behavior if one
>> use uses, for example, GPI DMA, and the Linux kernel FIFO mode or SE DMA ?
>>
> Shared usecase is not supported for non GSI mode (FIFO and DMA), it should be static usecase. Dynamic sharing from two clients of two subsystems is only for GSI mode. Hope this helps ?

This should very much be explained in commit message and perhaps in code

And since it can't work with FIFO mode, there should be checks in code
to disallow such invalid configurations

Konrad

