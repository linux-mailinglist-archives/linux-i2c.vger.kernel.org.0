Return-Path: <linux-i2c+bounces-12304-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E429AB279CC
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 09:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B59E6BA050A
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 07:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A332D0635;
	Fri, 15 Aug 2025 07:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="KpSAij3Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61544299A87;
	Fri, 15 Aug 2025 07:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755241978; cv=none; b=Yq3bM94nQOK4BCfoZzNYU1n2UCKFgO+7PWAYKLQLLAyvZPcVbo4fTaEoXXtg01UKByiLf8cmGM6q156fc/ZztkzWmcxfjg4VrEeeeVyWr2IQGxZMSmOSrbQRd1qCMGctTJ6ZAn2D46NBJ0lgQeCitBAT5LgjqFMNVygOslAwpec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755241978; c=relaxed/simple;
	bh=ItP3ixg7wyy1eeySa6KTxiwdsmmcboYuWfIAZxlgxiM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ZMiNCYMzf/TcB23TJvIJleuVgZzayMqNSVon1Sosyx2PFzdtunywpoxO3raDly/rf0oU7GAbgvfSJ75I6TmGe1xrpyyS6orgazjihOkZSFgLWZspCX95/fGTEdaOU6AViyyRXCMk3pTdzoZs1hr/+7HfHiLZiTu8IY3d++KvDX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=KpSAij3Z; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1755241968; bh=ItP3ixg7wyy1eeySa6KTxiwdsmmcboYuWfIAZxlgxiM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KpSAij3ZjMqIiZ4+mkxGD3Msoe/G8KHbYwBQG0xPhZhqU6sckGNopMbc5tARt50gE
	 +/w6TCliaBL8GgSHgDbZsqee/4aFlW3gl44JierJcFAMXhyXbTmNT3HqneR+Ocbz1x
	 i5i/xkvZMhHfiYAz8pr/ZUX+mdBThbbX8M0KrK/k=
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 15 Aug 2025 09:12:48 +0200
From: Luca Weiss <luca@lucaweiss.eu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] i2c: qcom-cci: Add msm8953 compatible
In-Reply-To: <aJnefpETGJm_cuRY@shikoro>
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-2-e83f104cabfc@lucaweiss.eu>
 <aJnefpETGJm_cuRY@shikoro>
Message-ID: <f956eccec6b8ae2737b1e758b8357051@lucaweiss.eu>
X-Sender: luca@lucaweiss.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Wolfram,

On 2025-08-11 14:13, Wolfram Sang wrote:
> On Sun, Aug 10, 2025 at 05:37:53PM +0200, Luca Weiss wrote:
>> Add a config for the v1.2.5 CCI found on msm8953 which has different
> 
> Given the above version number...
> 
>>  static const struct of_device_id cci_dt_match[] = {
>>  	{ .compatible = "qcom,msm8226-cci", .data = &cci_v1_data},
>> +	{ .compatible = "qcom,msm8953-cci", .data = &cci_msm8953_data},
> 
> ... why don't we use it here to stay consistent? cci_v1_2_5_data?

I don't think the existing 'v2' or 'v1' configs have much to do with the 
actual
HW_VERSION of the IP block. For example on of the newer Qualcomm SoCs 
has HW
version 1.7.0 and is many years newer than the msm8996 which was called 
'v2'.

I'm also not sure what these parameters depend on, if it's CCI HW 
version, or
something else. So naming it after the SoC should be a safer bet. Also 
the
msm8974-cci was only named 'v1.5' because it's an inbetween mix of the 
v1 and
v2 that were already upstream so arguably that one shouldn't have been 
called
v1.5 in the first place either.

Let me know what you think. Maybe also someone from Qualcomm/Linaro can 
jump
in and share their thoughts, if someone knows more what these params 
depend on.

Regards
Luca

> 
>>  	{ .compatible = "qcom,msm8974-cci", .data = &cci_v1_5_data},
>>  	{ .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},

