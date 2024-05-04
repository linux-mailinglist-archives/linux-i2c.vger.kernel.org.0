Return-Path: <linux-i2c+bounces-3416-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F578BBAFC
	for <lists+linux-i2c@lfdr.de>; Sat,  4 May 2024 13:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C09FD28273C
	for <lists+linux-i2c@lfdr.de>; Sat,  4 May 2024 11:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBDA208C4;
	Sat,  4 May 2024 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZBqNNX1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA36200DE;
	Sat,  4 May 2024 11:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714823727; cv=none; b=I2QaVrQLq5fG/rq7rz79tuacjc9zon76mjILS1czio5Ju5TVzmbghicwR+0Fs8/MPe3ZuMFPhyxrowJqyXAovnJ0svpEQQ21OUAa4vNCojdqk3779Xy/jjsEUY3VlT81EjlJ+N3B8CcT9Wrr760FlWPJMggT7v/2LrW6rW/Bj70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714823727; c=relaxed/simple;
	bh=NPoACW8DYNp6GZJ3amyL+KgYI51JmnSB/XDaYx9gg5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTbXinBCGZaDEYhuhj/NlmxX/TrI4/egrl/TrqmE4NovpFluK4J/lxilXPZ5UBQnT4Bh/OnUgrWLH03+O3RPwGJS5LuvAUfI5ZUAwhY4iuojbJlJ4B8Iy0doQsSvEZtFvcsTYDFnFQTpABTumBXADxpceE44DPCihpc4GHLF/rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZBqNNX1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F025C072AA;
	Sat,  4 May 2024 11:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714823727;
	bh=NPoACW8DYNp6GZJ3amyL+KgYI51JmnSB/XDaYx9gg5o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IZBqNNX18019PLh58E5UQmu+DFS4t0PboI5OlUpdtWCksRYRebFFM2a9M+cXc5v6W
	 OAT1e5IBN45IrNU0hpsICzg2P3xmh9V/y8WhSxD76pqKuaRU7zGF7/UTBfkbSSd8yY
	 a3DLCUDbAeptggnZnzkqgJDdbPyB+zPOmS9UnCLl1gZMEZDNIQswk8d5/Ol4L3LRyI
	 2bzd/q0E90cZhdJ+U/DVrfUnTtRal8ElT34cMJaVTXiDJOdl+Fky7M+pnXCSFSAJ/E
	 mksHd3LW/kHPjtx7lh0N8Iabced5M4D0izfo9YRd7tIrVB1j5AQple5uuOcYOUXiL4
	 TSnVxJie/eing==
Message-ID: <0a43b522-7c07-43a0-b4b0-155c3cf94177@kernel.org>
Date: Sat, 4 May 2024 13:55:21 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/17] dt-bindings: fsi: ast2600-fsi-master: Convert to
 json-schema
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, andi.shyti@kernel.org
References: <20240429210131.373487-1-eajames@linux.ibm.com>
 <20240429210131.373487-9-eajames@linux.ibm.com>
 <af51132f-e4a3-4f45-b066-24b8c348eb28@kernel.org>
 <a7ca71c0-971c-49ab-b9f3-f6e6b32e9567@linux.ibm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <a7ca71c0-971c-49ab-b9f3-f6e6b32e9567@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/05/2024 18:12, Eddie James wrote:
> 
> On 4/30/24 02:04, Krzysztof Kozlowski wrote:
>> On 29/04/2024 23:01, Eddie James wrote:
>>> Convert to json-schema for the AST2600 FSI master documentation.
>> Please mention all the changes from pure conversion.
> 
> 
> Sure.
> 
> 
>>
>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>> ---
>>> Changes since v3:
>>>   - Remove quotes around compatible strings
>>>   - Re-order allOf to below required
>>>   - Add child node in the example
>>>   - Change commit message to match similar commits
>>>
>>>   .../fsi/aspeed,ast2600-fsi-master.yaml        | 81 +++++++++++++++++++
>>>   .../bindings/fsi/fsi-master-aspeed.txt        | 36 ---------
>>>   2 files changed, 81 insertions(+), 36 deletions(-)
>>>   create mode 100644 Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
>>>   delete mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
>>> new file mode 100644
>>> index 000000000000..fcf7c4b93b78
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
>>> @@ -0,0 +1,81 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Aspeed FSI master
>>> +
>>> +maintainers:
>>> +  - Eddie James <eajames@linux.ibm.com>
>>> +
>>> +description:
>>> +  The AST2600 and later contain two identical FSI masters. They share a
>>> +  clock and have a separate interrupt line and output pins.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - aspeed,ast2600-fsi-master
>>> +      - aspeed,ast2700-fsi-master
>> There was no such compatible before.
>>
>> How does this even validate? Where is fsi-master? You dropped a
>> compatible without any explanation.
> 
> 
> I can make it a separate change to add ast2700.
> 
> 
> I suppose I don't understand having two compatibles... Aspeed master 
> shouldn't use "fsi-master" as that is too generic, right? Why wouldn't 

Not necessarily, depends. Dropping it silently is confusing. What about
other users? firmware, bootloaders, out-of-tree, other OS? Did you
investigate all of them?

> it validate? Devicetrees using "fsi-master" also use 
> "aspeed,ast2600-fsi-master" so they should be OK...

No, because the compatibles do not match. Run validation and you will
see the errors.

I am fine with dropping such compatible, which is not used by current
kernel ABI, but first DTS must be fixed and second some explanation and
justification is needed.

Best regards,
Krzysztof


