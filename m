Return-Path: <linux-i2c+bounces-5585-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0D5958380
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 12:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 379571F2553E
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 10:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C8718A957;
	Tue, 20 Aug 2024 10:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqoG66h2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECC218E37C;
	Tue, 20 Aug 2024 10:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724148123; cv=none; b=YIXT89kPeClkrvCzFHzM3uPcOuB80hFQvqGJFHhAiL6Eh0xrTJOFTvR4Bv86D7hZX6wXEixCLsRMLGEjnxCaPosS75ZIywonKpWG1YPd4Eab2D3iQiEj+MZyV6YqmoL2tmhU3j8PM2/vFgAyvRujTXry4t0VhOPjEAbIHH9xYvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724148123; c=relaxed/simple;
	bh=SPdFDbDd+Nv846EY7wkG6UtHA7zhvRTxYRxFLHapcfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=toROi4/g6gz7Mj7p8bER9hjP58F5O52dtRmc+qCimp0is0jW/4R9zzhKRvbq9uOF5wL7tnZ6+8HZx4KSYS/3TIdjCaQ/u72owFk7x40kxZO1WQ2ZDv51jDT4WW9NJz1sSTcF/5uJOUthk93JQofQhdY8DBEvbVYfhQMJYPoJ4dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqoG66h2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926BFC4AF09;
	Tue, 20 Aug 2024 10:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724148122;
	bh=SPdFDbDd+Nv846EY7wkG6UtHA7zhvRTxYRxFLHapcfs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=DqoG66h2GZIoVTFq6lPo9gE8QO5HbOuKrde+8T9at0xbpFk3HHvhOh84US8KMFe+L
	 50CUalXZCm/O2gqNpl89punLwJIUe8oztTcISMAwCZeo3y4XoUGB18wt/34LR8b18M
	 LCPmf0bsLbhqjDkaLJReS9XZI6NezojSgQ0Nwwmfr0g20fvmY6lzaIRNLW4HV4vXaP
	 JepMn1RvpR+G2Z8YC0EytpU1UJxVO0pCnP8gHWoR4p1w7HlKqEVCgUUjclpOJLvMh4
	 FRDv/bk9P1tpc3DazZe6DJ92FTOzSFdaBbbdwZ2Olz4yiEkiHckTyOeGfbhRVIPmQE
	 NIYt7EAP29vwQ==
Message-ID: <266f4b55-bddb-4c44-9eb5-3eef35757714@kernel.org>
Date: Tue, 20 Aug 2024 12:01:55 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-2-ryan_chen@aspeedtech.com>
 <7237aa34-9821-4ba7-a45b-3b1d598bc282@kernel.org>
 <OS8PR06MB75418A2ACA6693A8163F19E8F28D2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <46a9280d-f4ef-4cfb-83a3-3744e04721f3@kernel.org>
 <OS8PR06MB7541A25AC3A11C51DD57E1B4F28D2@OS8PR06MB7541.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <OS8PR06MB7541A25AC3A11C51DD57E1B4F28D2@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/08/2024 08:50, Ryan Chen wrote:
>>>> Subject: Re: [PATCH v13 1/3] dt-bindings: i2c: aspeed: support for
>>>> AST2600-i2cv2
>>>>
>>>> On 19/08/2024 11:28, Ryan Chen wrote:
>>>>> Add ast2600-i2cv2 compatible and aspeed,global-regs,
>>>>> aspeed,enable-dma and description for ast2600-i2cv2.
>>>>>
>>>>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>>
>>>> ?!?
>>>>
>>>> What happened here? Why are you amending tags?!? That's not allowed.
>>>> You cannot change received tags, change people names or their data!
>>>> And how is it even possible, srsly, how do you even work with git?
>>>> Git would never do it, so you had to do it on purpose via some weird
>> workflow.
>>>>
>>> Sorry, I don't know Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> is
>> you or not.
>>> Or should I still keep Krzysztof Kozlowski <krzk+dt@kernel.org>?
>>>
>>> https://patches.linaro.org/project/linux-i2c/patch/20230415012848.1777
>>> 768-2-ryan_chen@aspeedtech.com/
>>
>> Here is the tag you received. You added it in v12.
>>
>> Why did you change the tag suddenly to something else?
>>
>> Do you understand that you are not allowed to change people tags? I have
>> doubts if you ask about people's identities, which is entirely irrelevant.
>>
> Sorry, I am not understood.

I don't know how to say this simpler that you are not allowed to change
tags.

You receive tag, use b4 to apply it or add it manually. Do not alter it.
Do not change it. Do not add things there. Do not remove parts of it.

Tag is as is. You only copy and paste.

Is this understood now?



> https://patches.linaro.org/project/linux-i2c/patch/20230415012848.1777768-2-ryan_chen@aspeedtech.com/
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> at v10
> So, what should I do now at v13?? 

Fix your workflow and go back to previous version which had correct tag.
And answer - why did you decide to change it?

Best regards,
Krzysztof


