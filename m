Return-Path: <linux-i2c+bounces-9853-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79464A64666
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 09:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BADE117083A
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 08:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02913221710;
	Mon, 17 Mar 2025 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKkRhJUP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0A71B412B;
	Mon, 17 Mar 2025 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742201886; cv=none; b=eS9Q7FkL/cvTDUSTzEYuQBCW0NOQ9V1mSf567aJIWDHLOgWniw6iGTfQbRm154r4WziP4K9vAeMLQhbbFiKEiO4f3c9zS5J+m+xREgE7RFZbvh192sijV88U6ksS+I5IdlSdxa+zfhUWQasBHet2nkZ+3+yeRWMe7u+Tyt0bdrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742201886; c=relaxed/simple;
	bh=asAG8ifzS5TnfNYFFs+T/MgOzmKtZDts70S39RMV0cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PjzJoWI9UzJuFG6h1N1XzLn3j8wigmT/vqs2oAlerABLL3Kavq3xPWaeyJSXwbEyOFgzRcJkmTbKZ3FiLIxTm9ZCpVB6CVUKX1tUUz80k3sCgqcAP9h/XBUxV4WsHaTMsu+oxEgBDGxRx/JXysR0zglBwlz+pPDgwla53NPcsLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKkRhJUP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0826C4CEE3;
	Mon, 17 Mar 2025 08:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742201885;
	bh=asAG8ifzS5TnfNYFFs+T/MgOzmKtZDts70S39RMV0cA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MKkRhJUPmchxA6hSveaUHu6pkQzR3C5mkEqIr1ZmoljpP4zv/kDgmJQvK08zMcVuZ
	 VTS/mzi97Kd/e1CUXX08vwh98V54+omgy8vll9vNytEZkTDPFJlfVIDtYbqS3zcATr
	 1h2j7lCWc0JqWkKme5W8a0DRQUeQ3jqpM0lqkteY9Zec2BKVJg8QRCZMO52smCewUB
	 aL1TkOfIEyeDIf2m9rW2P8EqahhSjPmc+ssV5k5WUjY4yLZ7cZ+10OaiTnRzmrb9L+
	 /C4vrKAfZZQ0IwJ5UZEODGTPxbg3a52baXI8FTSaEYp7MvyT4Wecmq85rOdHRcGGJv
	 sCKW18R2qviFQ==
Message-ID: <e0d80130-ab5e-4e0b-8d74-ccc94d084192@kernel.org>
Date: Mon, 17 Mar 2025 09:57:57 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
References: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
 <202502280902.U0gLDhve-lkp@intel.com> <Z8GuOT5bJL7CdXX6@smile.fi.intel.com>
 <fec0a1c8-251b-491e-893d-11a8186a2128@kernel.org>
 <Z9fWhGDrUbAmGRl0@smile.fi.intel.com>
 <OS8PR06MB7541B15342ED1C92579AE18DF2DF2@OS8PR06MB7541.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <OS8PR06MB7541B15342ED1C92579AE18DF2DF2@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/03/2025 09:51, Ryan Chen wrote:
>> Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
>> mode driver
>>
>> On Mon, Mar 17, 2025 at 08:48:03AM +0100, Krzysztof Kozlowski wrote:
>>> On 28/02/2025 13:38, Andy Shevchenko wrote:
>>>> On Fri, Feb 28, 2025 at 09:28:59AM +0800, kernel test robot wrote:
>>>>> Hi Ryan,
>>>>>
>>>>> kernel test robot noticed the following build warnings:
>>>>>
>>>>> [auto build test WARNING on andi-shyti/i2c/i2c-host] [also build
>>>>> test WARNING on linus/master v6.14-rc4 next-20250227] [If your
>>>>> patch is applied to the wrong git tree, kindly drop us a note.
>>>>> And when submitting patch, we suggest to use '--base' as documented
>>>>> in
>>>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>>>
>>>>> url:
>> https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-asp
>> eed-support-for-AST2600-i2cv2/20250224-140221
>>>>> base:
>> https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
>>>>> patch link:
>> https://lore.kernel.org/r/20250224055936.1804279-3-ryan_chen%40aspeedtec
>> h.com
>>>>> patch subject: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new
>>>>> register mode driver
>>>>> config: mips-allyesconfig
>>>>> (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gL
>>>>> Dhve-lkp@intel.com/config)
>>>>> compiler: mips-linux-gcc (GCC) 14.2.0 reproduce (this is a W=1
>>>>> build):
>>>>> (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gL
>>>>> Dhve-lkp@intel.com/reproduce)
>>>>>
>>>>> If you fix the issue in a separate patch/commit (i.e. not just a
>>>>> new version of the same patch/commit), kindly add following tags
>>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>>> | Closes:
>>>>> | https://lore.kernel.org/oe-kbuild-all/202502280902.U0gLDhve-lkp@i
>>>>> | ntel.com/
>>>>>
>>>>> All warnings (new ones prefixed by >>):
>>>>
>>>> My gosh, this is valid report. But it looks like a preexisted issue.
>>>> Can somebody fix this, please?
>>>
>>>
>>> That was three weeks ago and still no responses from Aspeed or
>>> contributors from here.
>>>
>>> I think this tells a lot about aspeedtech.com patchsets on the list.
>>
> Sorry, I don't aware this is my patches issue, could you tell me what build instruction can reproduce this?

Everything is explained in the email. You do not need two people
explaining the report, just read the report.

Best regards,
Krzysztof

