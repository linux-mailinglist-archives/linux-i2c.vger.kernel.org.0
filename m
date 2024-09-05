Return-Path: <linux-i2c+bounces-6258-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4660496DDCF
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 17:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 067992850F2
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 15:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C028E19EED3;
	Thu,  5 Sep 2024 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+4CwHgi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB5319EEC4;
	Thu,  5 Sep 2024 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725549540; cv=none; b=foDnxnCgAdvBdSMvZVNn7MBoaUNMEHnJE7iLSlDyHsz855mSjtC7r5sTjVuH/FXySrGEBls3ylH+24IfdvGc7llJdQIgfJoeCtvJ31Z1NxidyBMt5E4jbP/j6X/VDwV+6bLbEO2PRUdlMPOR6uMWcGSASpjuiEVk7+e/aafVmWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725549540; c=relaxed/simple;
	bh=XftvF4IiPjK2WwE+rVSEl29oebRKcCfXKwCyxOExXDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sPQQnO8oGrbbsod9oVa4fqgyfjR7QwuBnv/buIq37bJGZlJ6iZufkNoReVQhse5CIGR7eXE0gi/ww05UURJIt/ZSRAPAzpNhWumq0zFwHyxYgL6aF0R1QJ4+3Tx9+ElaxMat0RSvF1L4fN8yCwtzG6etUonsz0O2Pa+F9D0NBeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+4CwHgi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7899C4CED0;
	Thu,  5 Sep 2024 15:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725549539;
	bh=XftvF4IiPjK2WwE+rVSEl29oebRKcCfXKwCyxOExXDE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=M+4CwHgivT2DGW0zGErVoUTMT6xLwgrwYCsr1fgQXJWPFxJrI57GFup7JhHHVbYuS
	 cOIaeQUpVtpOA+Q94d2dhAOQHDgIFDjGN6u4njtwk5X8bW1cSbvB6M2T0tcZd++b/n
	 Gmzi73N4DJ/GdFYxjYR+VdsvHCmsNo5xPOqLhYxx9sq4VI0qHN4jrMOoTCKHOOoznx
	 NmJ4rBdQDZpvmUzcVmrOASU+YYxanTYe0PyIhG/5V4R0S9oUBzWvcmVVafa8f+UW0L
	 Wv8dqNpSKcRa/GS7adLGSMFwHUkdZyoX5M7SDoxqSPX6Fw7QhDbRv7hSSWajF0F+ky
	 cfPBsRm3S8EWw==
Message-ID: <4fda9455-36ce-4260-a32d-56c14dec816e@kernel.org>
Date: Thu, 5 Sep 2024 17:18:52 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] i2c: qcom-cci: Stop complaining about DT set clock
 rate
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <20240904020448.52035-12-mailingradian@gmail.com>
 <917917cc-3e78-4ab6-8fa4-82d9a6fe3fdd@kernel.org>
 <c494152d-d4d1-45db-941a-df99b0f11e77@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <c494152d-d4d1-45db-941a-df99b0f11e77@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5.09.2024 4:18 PM, Vladimir Zapolskiy wrote:
> Hi Konrad,
> 
> On 9/5/24 16:57, Konrad Dybcio wrote:
>> On 4.09.2024 4:04 AM, Richard Acayan wrote:
>>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>
>>> It is common practice in the downstream and upstream CCI dt to set CCI
>>> clock rates to 19.2 MHz. It appears to be fairly common for initial code to
>>> set the CCI clock rate to 37.5 MHz.
>>>
>>> Applying the widely used CCI clock rates from downstream ought not to cause
>>> warning messages in the upstream kernel where our general policy is to
>>> usually copy downstream hardware clock rates across the range of Qualcomm
>>> drivers.
>>>
>>> Drop the warning it is pervasive across CAMSS users but doesn't add any
>>> information or warrant any changes to the DT to align the DT clock rate to
>>> the bootloader clock rate.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> Link: https://lore.kernel.org/linux-arm-msm/20240824115900.40702-1-bryan.odonoghue@linaro.org
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---
>>
>> I.. am not sure this is really a problem? On some platforms the core
>> clock is only 19.2 Mhz, but e.g. on sdm845 we have:
>>
>> static const struct freq_tbl ftbl_cam_cc_cci_clk_src[] = {
>>          F(19200000, P_BI_TCXO, 1, 0, 0),
>>          F(37500000, P_CAM_CC_PLL0_OUT_EVEN, 16, 0, 0),
>>          F(50000000, P_CAM_CC_PLL0_OUT_EVEN, 12, 0, 0),
>>          F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
>>          { }
>> };
>>
>> Shouldn't this be somehow dynamically calculated?
>>
> 
> I believe the problem fixed by the change is an unnecessary dev_warn(), in
> addition it's unclear why the CCI clock rate shall be strictly 37500000 for
> all "CCI v2" platforms.
> 
> If the latter is a necessity, then it would be better to set the rate
> explicitly, however since it's not done for any such platforms, I would say
> that it is not needed.
> 
> And if it is not needed, or a default and universal 19.2MHz rate is good
> enough, then I would suggest to remove everything 'cci_clk_rate' related
> from the driver, and this makes the change incomplete...

Downstream seems to set 37500000 for all SoCs with Titan.. but I can't
find a good reason for this.. I'll try to get some answers.

Konrad

