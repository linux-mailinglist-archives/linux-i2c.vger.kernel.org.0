Return-Path: <linux-i2c+bounces-3144-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 558B38B22EA
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 15:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D18481F2109E
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 13:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7484A149C6D;
	Thu, 25 Apr 2024 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4oWV0uG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45B3149C41;
	Thu, 25 Apr 2024 13:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714052100; cv=none; b=cR9BsHWHzrd0kVuUsw5jmsYSLsJyU6W6yEhpbTRFlRveyHXu7YowPlGDsaOv32DzCWIA79UODxir+Y3zXDe1Kx9rC7aKWg3rck3552jBr+GZ8ihU1KNI9vbMkin9YM2w3XJJguyU1ElHCFjvlMQs4y8Bptf6XGPDIJVOhkrQxsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714052100; c=relaxed/simple;
	bh=CXlvvOw7amn/D3LVjeiitwj3gydb2VmKSTC9JVNzWYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z+RGGcpIncUeS8cj/0AwGDL/hVE2BF7Y2WD8kGTspXmMhYgUXIaPLMoRqNZgBmeelH6YKe0fA+jYHLkYpBsPdzQpq3OIr9xI8mh/UyMlmHJk5xDgGpQfmgAb940Oi7IYyYjnUezMfHm5BWulpvQlPwlPVaSHuLy2VVWv9PTHzg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4oWV0uG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e3ff14f249so7701675ad.1;
        Thu, 25 Apr 2024 06:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714052098; x=1714656898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=etQpEKERbtpehlxdQfBjUCZvNiR8yxK2s8OXbhNfsN8=;
        b=i4oWV0uG8WRK48dY8/cgAMRDNplFUWFkk64B/q9ZFUFLiYYZNc7cZTIb4CJhb7RgBA
         1CloLWLGDeBWe1f0njVnu3PsOobrUysG99cy7ahhuYvBJPaXmp80GqZkxcfu5s+Jmp6z
         VlvDY7fKuROgo3ZtMKSdhKgBpbOtgzji2JiHnEvriEquJXAuvBHt+FmVrXGsl5At6GUb
         /dclwfqpuUHR08zPLbKHCOKtwDXnwzYCCKj08MZ6AFntTcDWXScnBLto3QBsFk/71/k6
         1QX9y5Zbd2eW/q2B6PG+3j2Lmk9BOONp7PYCsUFwtQtz1w/f6W7nujfcTfHNJj5Te5/2
         wFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714052098; x=1714656898;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etQpEKERbtpehlxdQfBjUCZvNiR8yxK2s8OXbhNfsN8=;
        b=wfZh/3lG8GnunazCspj630AQJnBG2pEX6vSLu/PsJ4tHhohh82mcAbSZtZDPLehPtY
         nCRQYVmJhRkDsACVvI2KJ8T9Vf4zYDztgz1YTzX8s+Y9XinpUmQIbVtKIHJVYmiyAf5X
         xmv5XTMw6OzQP5xX2HrAcQuuU8T0gtsgql9LUGjzA9eYg7f54L7LggjkSAVl99hX6ZCb
         wG7ucsGBX9MKzYlNNBHKlqfQROA758IKMlX2pucuOhB3YdjPKeKty+gwyPFoqEhxNJMU
         kqc1XD9pabDsHwRe18WIvULAaDbdaLBdh1pZSQTz42rBYJ8nlYkyQeyDnm+14MSwDRwY
         soQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb8Ln3bMr/k5JWxpTZq4PPHkSytxMsneXJNYnDk19A0dN1Q2MXx1VrP5ygk0rS512SfCD5PaEwATkN8PQzGw6F6tjbuxEnyQc6UJQ4tMipTkrKYw8HMfx+XxI49/pU2kb3rUnCgR42Mdof8Tnkg/p320vn6KwUCMXUO8Jd0UKfvYDztH7UBpgAAp/9Sfhkj8K5+l+8N+0OdI9IoT1VTw==
X-Gm-Message-State: AOJu0YxdcsNcjtYDeRXnEbua6PRpPK9DIBFg0SbT2oXu83tozeYO2d5B
	CqYH/zTuqxBbmcMGy4IrHk4brqw40UwhLc9vMauIEbIk3rIlX0At
X-Google-Smtp-Source: AGHT+IGAGqjOdRbWxSZRzy/APPArvW2TkewoiDKGh4aC1poGNHEUg4f/AScUJv/vthv/M+u2oP0kmQ==
X-Received: by 2002:a17:902:dac3:b0:1e4:61b:98c6 with SMTP id q3-20020a170902dac300b001e4061b98c6mr4504376plx.4.1714052097949;
        Thu, 25 Apr 2024 06:34:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id mq7-20020a170902fd4700b001e8415d303fsm13820762plb.257.2024.04.25.06.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 06:34:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <489ccbfd-ccf5-43fa-92a1-3accff9b7c17@roeck-us.net>
Date: Thu, 25 Apr 2024 06:34:54 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: adm1275: add adm1281
To: Conor Dooley <conor.dooley@microchip.com>,
 Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
References: <20240425070948.25788-1-jose.sanbuenaventura@analog.com>
 <20240425070948.25788-2-jose.sanbuenaventura@analog.com>
 <20240425-jurist-unpadded-b3cccfc23862@wendy>
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
In-Reply-To: <20240425-jurist-unpadded-b3cccfc23862@wendy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/25/24 00:19, Conor Dooley wrote:
> On Thu, Apr 25, 2024 at 03:09:47PM +0800, Jose Ramon San Buenaventura wrote:
>> Add support for the adm1281 Hot-Swap Controller and Digital Power
>> and Energy Monitor
>>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
> 
> I acked this, but I'm having second thoughts. The 1281 follows the same
> codepaths in the driver as the 1278, why is the 1278 not used as a
> fallback compatible here?
> 

That is rare for those devices es but true in this case. Technically possible,
though it would result in a "Device mismatch" notification by the driver
since it compares the configured vs. actual device IDs. I would prefer to
avoid that, if for nothing else to avoid having to deal with concerned users.

Thanks,
Guenter


