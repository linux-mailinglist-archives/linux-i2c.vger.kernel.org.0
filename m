Return-Path: <linux-i2c+bounces-6398-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AFA9716FD
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 13:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 910FC1C227BA
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 11:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4151B533B;
	Mon,  9 Sep 2024 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwN8b1Ck"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4A61AF4F0;
	Mon,  9 Sep 2024 11:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725881720; cv=none; b=KhoRCLn1uuy6wfEti8nGfkYrgr4f4LYfcr9hYdn80xuQjRqQaZ/+KsRyf65MKiVWQ8hyZLsEpsLkli/JKhGJn2FqelWAx5MFH13XA6EAYoxMKJMlfdYyvE2NxStnEfws2IgkjbJWuV8BAEXY6frUIq5qiGJ/vcNKk2cMLvqpTrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725881720; c=relaxed/simple;
	bh=WaxKDSZmCLK6e4990YXcBC73ym+tO6hTNsQxMNIYLOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/5gjxNebmomZurZxiBJwLPUSOOyuSVZovYEJ2gub/1SJCwZZpNTzwARV0sZpTWq7iww+x9hMepHM6lUfo6hqX5T7kH99caFrRyFZShu1yXjQHxiVQjZSpL00p+Wlouilzqtl8UenhPZtzs4E7uU4ROkeE6QiLP8ReXEaUYgTMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qwN8b1Ck; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73353C4CEC6;
	Mon,  9 Sep 2024 11:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725881719;
	bh=WaxKDSZmCLK6e4990YXcBC73ym+tO6hTNsQxMNIYLOw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qwN8b1CkzWVuyTLuL9t45t9B+06xik2a6clb0LwI0H003Gvk13fP8Cg4L1Nl5KPiq
	 AICzY4Hp6IcTB84X9M+TkQERCRJ7uK/MB6y7Hi3f9BHtjQFwk62hHQHTteyTNEm/XC
	 9tZ8zfS6BHm6H2T7CYAXXHtswVj1B8uuM8TyRclXKM78a4O/gq8v0SKa3WYGPCvPRh
	 VsHA/SZqA7MQEZ0Mrczd4pbbEPn7IogkL3AQzffsalnLDXk1cZ003X8tnuf5NedliT
	 dxAHTYdBrqQhDbqiaciyz+sVinMkdT9YWiwTrRdu+rTp4vl0CX4mRovIeXxTaroBo9
	 FrbxHEFwq133g==
Message-ID: <bbdd95e3-9090-4952-beb5-ad52f2a3dcae@kernel.org>
Date: Mon, 9 Sep 2024 13:35:13 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] soc: qcom: geni-se: Export function
 geni_se_clks_off()
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
 vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
 Frank.Li@nxp.com, konradybcio@kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
 <20240906191438.4104329-4-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240906191438.4104329-4-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6.09.2024 9:14 PM, Mukesh Kumar Savaliya wrote:
> Currently the driver provides a function called geni_serial_resources_off()
> to turn off resources like clocks and  pinctrl. We don't have a function to
> control clocks separately hence, export the function geni_se_clks_off() to
> turn off clocks separately without disturbing GPIO.
> 
> Client drivers like I2C require this function for use-cases where the I2C
> SE is shared between two subsystems.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---

Well, i2c is probably not the only type of client you'll want
to share and the current approach requires changes in all protocol
drivers.

How about adding a parameter like `bool shared_se` to
geni_se_resources_off() and changing the pinctrl state conditionally?

Konrad

