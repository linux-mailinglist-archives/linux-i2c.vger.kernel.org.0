Return-Path: <linux-i2c+bounces-7031-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ED89874C2
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 15:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E6E7B26140
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 13:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE90130AC8;
	Thu, 26 Sep 2024 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mg9Pd+we"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C13055896;
	Thu, 26 Sep 2024 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727358612; cv=none; b=HKOW2ycOZ2HmnLN+R6ymoGVnGfvub2VAv+BojWvMv2rf2d9L2/7XpmwLOlSlKKABAVKlVBsD/j3YM5sp9wM3U2kPz5MxdFjr6FWLPO2BxHYrA+gQ7jNrjZhPKO19toD1e3GqxQlSjW+24gM1RefFO3+1+hG9kldb2FScPS19GCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727358612; c=relaxed/simple;
	bh=+y2sG9MD4eBDu2i93LTYciIQrY6phRu0PEv2rKRT8TI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vo/drjm5EzqI34e75OdeFeS1EhPOeLE/EQCxg4zn0N08FJk7Ukzdndc0oOrZ5hXE+qccLyUrVG7aAlG6aBDvtcXpJAMXsO/g4MUcTGguosl3P3t3BmXO2NMeN34PWCNafrnYqTnX0CSgvBM9MRWnhywiNWM3J+AmOFchnkVbbho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mg9Pd+we; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF641C4CEC5;
	Thu, 26 Sep 2024 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727358611;
	bh=+y2sG9MD4eBDu2i93LTYciIQrY6phRu0PEv2rKRT8TI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mg9Pd+weEoJzAMxod/QKgBxSC5w5B91hJ96x7ziCzqaaqK6W2K1Y032aI6f6PiF6+
	 eCa/gq6m3ljcnijjmQq358MKe5hcZifXc8ATug9QD6JhxmqF+QwbNiJxVL/ZOExPSI
	 bqzh5E7MuasHYDZ0jmve60PDLBWxj39LE8rpCbGDNd4i2GMzV6kM9qj/hPLQt5DPgf
	 ucFgqcvnOBPNiN9e/o3ZZ7LYLOY128UwN8+DLZYctICR6A+IPn2Smo3iHG2XxtwdJ/
	 qtMgQGyqDSRJLkYcSOOg5/eCN2IGCGAW2nA+YyMtSfQZ0VXIRsgNxKXCwNh4/5pdiG
	 Rwnx86lWPyk+g==
Message-ID: <ecfb3621-fb8e-4452-a83f-bfe5f0b03398@kernel.org>
Date: Thu, 26 Sep 2024 15:50:07 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: designware: determine HS tHIGH and tLOW based on
 HW paramters
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Wu <Michael.Wu@kneron.us>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, morgan chang <morgan.chang@kneron.us>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240925080432.186408-1-michael.wu@kneron.us>
 <20240925080432.186408-2-michael.wu@kneron.us>
 <ZvPU2ZEG_8UV3FzF@smile.fi.intel.com> <ZvPWEFWk_MG5SsCg@smile.fi.intel.com>
 <IA1PR14MB6224EAAD5566CC5288CDC0838A6A2@IA1PR14MB6224.namprd14.prod.outlook.com>
 <ZvVREcwQSKZb5IU2@smile.fi.intel.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ZvVREcwQSKZb5IU2@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/09/2024 14:18, Andy Shevchenko wrote:
> On Thu, Sep 26, 2024 at 08:45:47AM +0000, Michael Wu wrote:
>>> On Wed, Sep 25, 2024 at 12:16:10PM +0300, Andy Shevchenko wrote:
>>>> On Wed, Sep 25, 2024 at 04:04:30PM +0800, Michael Wu wrote:
> 
> ...
> 
>>>>> + * @bus_loading: for high speed mode, the bus loading affects the high
>>> and low
>>>>> + *	pulse width of SCL
>>>>
>>>> This is bad naming, better is bus_capacitance.
>>>
>>> Even more specific bus_capacitance_pf as we usually add physical units to the
>>> variable names, so we immediately understand from the code the order of
>>> numbers and their physical meanings. 
>>
>> Sounds good. However, I think the length of "bus_capacitance_pf" is a bit
>> long, we may often encounter the limit of more than 80 characters in a
>> line when coding. I'll rename it to "bus_cap_pf".
> 
> Limit had been relaxed to 100. I still think we may use temporary variables,

Just to be clear, because you encourage reformatting it to 100:

You mix coding style with checkpatch. Checkpatch does not define coding
style. Coding style doc defines it. Limit is 80, unless growing to 100
improves readability.

> if needed, in order to make code neater. That said, I slightly prefer
> bus_capacitance_pf over the shortened variant.
> 

Best regards,
Krzysztof


