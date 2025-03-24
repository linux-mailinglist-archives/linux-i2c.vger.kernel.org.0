Return-Path: <linux-i2c+bounces-9993-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90918A6DC4D
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 14:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3213D7A2FCF
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 13:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CDE25F989;
	Mon, 24 Mar 2025 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPQ7wWZz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C8625F97D;
	Mon, 24 Mar 2025 13:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742824699; cv=none; b=Bp6Z3e4g6+9rvGfme6eBOCGIc9yhm+jjpdKo1yD1qanFRlmk5cdxKiv9/BY9Y6ukhQWsr3I2KcirnDXzbDW5W7M1yv0RRtzuLZzW27EA2PUtM0mZYfKWO8kZWVii4/+KB/NKs+p8YBEiFdSqdcsGfU5tYZDSwDbrHeeI7SLIBJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742824699; c=relaxed/simple;
	bh=vvZImpPDSXtjhYYx9VMQXwdHX6YtDsEjrO4u8NsvmqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obmCUi7WB91vDQ6vP1aAgv8E4C+NU/z2jZSMylcOwkL6sErSzfPJ+IkwL3wXYThiGo5UGV0Wmeg2gVhjQAc4rMMc3G86MeO7EBUlJiQTBdinlTQZ3deEjrb8XnGqgdDN5WMNhSozjCb5wYZmHzp+Yk72lrmLEh+McKIINmTcyac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPQ7wWZz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224191d92e4so82040355ad.3;
        Mon, 24 Mar 2025 06:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742824697; x=1743429497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bcExjkUMRFkywZF7IJHsZMCyAGFZolx+FfzPyY4VMWo=;
        b=IPQ7wWZzprwL0pC9JJFUFN8Y7oItNGsRjW6YuBR7NdpiNen914Xz+YcAhFRgf9dKzZ
         Jdv+dVD8Jj8rcfykQU0JohETlPbGhXEKUXzNGTnlASY4kwJC4Hf92UrYxKeTZPx18FUg
         yVSRWlItZ1FrEvi8Ahnvsv71ai6xCoGZ+GVGg7mEJOTxePfeB8CxxQlFNODTSzr2/mm+
         BMbcIVz8p5IuA+wjx5BTvwKfYu4SajdOf9sr+B+8PQibq6085BXjFCpv4kQjJ5fOTXkD
         CAkHZsv8AdqpLUl6k+5uqPciNpBYe1xdoSWraICnx28EaRGaKrDgFyZxVqDJ6UK+HICF
         A15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824697; x=1743429497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcExjkUMRFkywZF7IJHsZMCyAGFZolx+FfzPyY4VMWo=;
        b=gQuDrTuyHvVZiOeEJ39KwovwS4IWWR90ZlhwabIxxKdKmQTQCFhMifzyuArsd77tlO
         rvaV1VGwr5vZYGRsfGs+ZBDRoeU+jjRd2PfesCb6YHZqULsuiB9jkpbMzPu9Y1JClRzN
         xZZhNMvmnnbimCkRFCb7+R2etI2C04qEsG6o59JviO/jZZr86JRvH0J3ecmWRga2G1le
         CHrAzZ9ZKcgACdoVcpPQQ1G2OSjU3+atX85B5nsRGo9Dzj5Bp+/VECQdFD1vvKYzPR9r
         KkCyIGEf6c56Z2Lw9cu3DD5gXOy9r3/HPubnWveztv1jADoSGbdbD3tlDsqrNIxP2P35
         m96A==
X-Forwarded-Encrypted: i=1; AJvYcCUDCs2dVvralevnasYtA/SfnhQM4mhMV6HYFfFAPUAMpMJ5za4FHWe/lYJtXfPCS5l2wh58V/UqxPVh5EY=@vger.kernel.org, AJvYcCVMMN1RwODy4Am+SeruN5lUs30iHzs9T7DZA1dbpQs7IwIZu2DT44+gm72uPjaXjjDGFh1DNIeQ498v@vger.kernel.org, AJvYcCVZOKX3/w9RzAZ1E1EWs09dsMjH7Prp1ODVGy0228DKw3CnowKDhN1neDofFVYS2Iq0SzusZ/pXBa/t@vger.kernel.org, AJvYcCVmDJY4RWkOPtefS4C9gO1r4xG+3MOJQyJZzJuP48++HRH74xnhuKernPg+ziGJDJxZIi7tQprBKdpp2etC@vger.kernel.org, AJvYcCXVz3MjvoaQTofMuaxtuytkppKYh/X4yzygUH8/DhBsh13uEwB3smqUpo6psLg4wMVf3OufregY9AF+@vger.kernel.org
X-Gm-Message-State: AOJu0YxOFavQuLSqrdDbEy4Nv3IXTx4ybiRwSGkVXlC1cc6JfVqQjO87
	Np3D34h32+l6ZiEZLTCpce6AeRPrStBSw4hywIJ4riaaj/sbppTu
X-Gm-Gg: ASbGncuCk3TJpQ7HqOrS3NMQCqXS2k5DaRfSZTRtRmPNFMKhUXN9v1Q5BrNDvjDEYsP
	QbUWllm0OTpcDxJ4xfk6fZ7VRL47JTQLNtCjVFSsLtMTmN/hkLkp03LawHv3qTDcyngcAUaBgY2
	IuCbFrWOiXAIevxjQeQJYxhf50A0GWXJ/Z7MAqDwm20ufvRkfDHS9QQxCUYBi5e1HI29wrty56T
	6LDFDefGi54rNqXst9jk0B9uN+nLEBWEv5ezk0Yd4v5/4ci78TbO+5vqYpcsbvs4c8y4XL+SHfN
	4Fmd3V1y1MDLMC4Kb2Jy21hiOdqPTjgZKl8vNzy2BKOe/dnB/vjmkNT2gvtFrfy+rGdlFp1QlBn
	m9jrpSELLfyJoD9TBvw==
X-Google-Smtp-Source: AGHT+IGp8O7cq1uK0v/iuDHoZYPSWwvPQS5uZ3OszuIq7sJCR2hCvwPSIjpvwwmvt/SXqYre34xjPw==
X-Received: by 2002:a05:6a20:ad0c:b0:1f5:75a9:5255 with SMTP id adf61e73a8af0-1fe43477ca6mr21749487637.39.1742824697005;
        Mon, 24 Mar 2025 06:58:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a27dea45sm7136663a12.11.2025.03.24.06.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:58:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <190c4a14-167a-4f72-8aed-477d4a401d20@roeck-us.net>
Date: Mon, 24 Mar 2025 06:58:15 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
 <20250225-upstream-lt3074-v2-1-18ad10ba542e@analog.com>
 <20250226-gentle-spicy-jacamar-2dd36a@krzk-bin>
 <20250226145931.GA2314060-robh@kernel.org>
 <3f7b031d-7b83-4a00-996d-aabb26278b67@roeck-us.net>
 <20250227-sceptical-phenomenal-wolverine-56e3cf@krzk-bin>
 <dbd9cc84-a0b6-4323-b343-6e80aaaf2d14@roeck-us.net>
 <PH0PR03MB69385BEFFD04ECF850311E988EDE2@PH0PR03MB6938.namprd03.prod.outlook.com>
 <15ce883f-444c-4b27-a48d-b17e3df5895d@roeck-us.net>
 <PH0PR03MB693831397416C4247F8BA58D8ED92@PH0PR03MB6938.namprd03.prod.outlook.com>
 <PH0PR03MB6938087B8F2EDB9899DD0F1D8EDB2@PH0PR03MB6938.namprd03.prod.outlook.com>
 <ab329813-2903-4bd1-8734-ab36466650c2@roeck-us.net>
 <16b6b98e-711e-40d5-970e-af1feb46ce91@roeck-us.net>
 <7c3f107e-2732-4d6e-a9e4-652ae18c16c5@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <7c3f107e-2732-4d6e-a9e4-652ae18c16c5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/25 00:16, Krzysztof Kozlowski wrote:
> On 21/03/2025 18:24, Guenter Roeck wrote:
>>>
>>> Figured. As it turns out, there is also a patch series pending which tries
>>> to fix the problem for ir38060 by changing its bindings.
>>>
>>> I'll dig up my patch series to add a new macro and send it out as RFT.
>>>
>>
>> Question for DT maintainers:
>>
>> Existing bindings, such as
>> 	Documentation/devicetree/bindings/regulator/mps,mpq2286.yaml
>> expect a nested regulators node even though there is only a single
>> regulator. What is the correct approach: Keep the nesting requirement
>> for those regulators as is (even if there are no in-tree bindings
>> using them), or update the code and the bindings to drop the nesting ?
>>
> I would recommend keep the nesting, so don't touch it. There might be
> external users, other projects relying on this. You can however
> deprecate old node (nesting), if the driver can support both. Not sure
> if it is worth the effort.
> 
That is not in driver control: If regulators_node is set by the driver,
the regulator subsystem mandates the sub-node.

Thanks,
Guenter


