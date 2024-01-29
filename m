Return-Path: <linux-i2c+bounces-1509-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE80E840A7F
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 16:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4627E1F23E95
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 15:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECC8155307;
	Mon, 29 Jan 2024 15:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNv7zTGZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12C155303;
	Mon, 29 Jan 2024 15:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706543375; cv=none; b=X61STPVfiHoaxyLnvJTck6RZ0XIScovfJLyl6T6hjh4lvH+sZAIOC3nEuKm9rtMawOnDhOZkJYEZaakmgC5zI9GbWBJnsOBS5iHjNtp82Zo/QFAR2aIfNekjO0ODtW9q232haJvWKHP0oq5mRPhhRnrOcAnbxdu90oKjH9iYiT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706543375; c=relaxed/simple;
	bh=Zx20aw8bxqZbzVA6EGvzAj5iiiWHikZt6nCgLe2ot7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9OQ5DXNM36aoIoGbl/iXvwFO0ugbK5AOQf8DXe83EgWGxKtvFTVO9Sjj4BFKp1Rpx+YR2VsAEmQ3IBM61hQZOqj0/ksaR3ZQMLfsv1turU1YFag1MdLkpAW6TNWYfJIc8BRz027Asjn8oTj5JsbUkJL2hGrpV/dEuhgYUGTNBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNv7zTGZ; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7d5bbbe57f7so369310241.3;
        Mon, 29 Jan 2024 07:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706543372; x=1707148172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dMnJOTdzG7a16ZkGN1wYLd1rwYgOffQVSBuPgavSzTo=;
        b=hNv7zTGZ0/WmvU8ZfKYpv7eON+jmY5GxHKbT/pHHWtiKv8a4oqdWLBIRajT1io8dSb
         KyzspREYvcS7sYcgjzwJf1Rwt/rrfm/ZF9FiQ+ePS2g4/50srZ3O1fOJGtoRdj8ny592
         Zzj51DChL3eckAocF3IF2VP7HlEhfT4L/5v9J3ywjK8Z/51zj0kSEKmNPQu6ID66T1ls
         J381UojoJ/SVlygEjk5ASt9TrUgZh3xhJO2GAPEKuT+ooTWkY3dg+dPJTzjZ127KWuFp
         5Ghv7JDPUGMXtR/gZWQmsS2MfJI2BYW1J1EdLJvCH0gia4Jo+CciIUfO37ZKGh1D7hhp
         pipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706543372; x=1707148172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMnJOTdzG7a16ZkGN1wYLd1rwYgOffQVSBuPgavSzTo=;
        b=tdETCAQQpNVHx2PRN8+G4QbJnI1I6iIw09mxMo+HhmsNTctKDsuTKR6O0B6qH9DIQU
         Evb704Amf7hJNGViRNnZkuUc2c8gxb0B81dydbPcYndf8V/cvqJPvh/rycW9WVis2pKg
         D4U0cjCQb8iQE/rtBWDR2cPBEsazr8VNTdxKy1GwYh5asWj4/HaGzcBOuVodjSIl39RX
         sqmdXqEA7pEDNg8N9DCqG7PKxxgtNos4NqU+RN9bf0QXQcUw8XAzg2o5PBY2cWIThGDW
         w3/w4b3JQ28WDq6Yt2gwgTt32dkENWFK2Ox6Ieq5PHxRkSyZ9athPJh83mOea0zSgPbD
         cIgQ==
X-Gm-Message-State: AOJu0YyNJkW79OY9n+w3nlxIsXPc43dUfwODQ/3rsUCe3C2mS3mMILrm
	exOw/l1Oukcdc/WNJgWXINSUjoXS8LlMqLdMw4JEl4FW6Th75suq
X-Google-Smtp-Source: AGHT+IGhsxjQLqHkE1o7cWurr5eI5xqNVuLZjma4JBD35E+SfC/Kts1hY2CFfTrZ8DIivGO+RTVkdQ==
X-Received: by 2002:a67:e9d2:0:b0:469:b18f:b86d with SMTP id q18-20020a67e9d2000000b00469b18fb86dmr2166466vso.33.1706543372040;
        Mon, 29 Jan 2024 07:49:32 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d16-20020ac86690000000b0042a6e6792basm2794881qtp.69.2024.01.29.07.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 07:49:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d18763ea-bd8a-40a0-8072-c9a87120c0e1@roeck-us.net>
Date: Mon, 29 Jan 2024 07:49:28 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: Add driver for MPS MPQ8785 Synchronous
 Step-Down Converter
Content-Language: en-US
To: Charles Hsu <ythsu0511@gmail.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jdelvare@suse.com,
 corbet@lwn.net, Delphine_CC_Chiu@Wiwynn.com, naresh.solanki@9elements.com,
 peteryin.openbmc@gmail.com, patrick.rudolph@9elements.com,
 alexander.stein@ew.tq-group.com, lakshmiy@us.ibm.com, bhelgaas@google.com,
 michal.simek@amd.com, lukas@wunner.de, festevam@denx.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org, ytshu0511@gmail.com
References: <20240129083115.2107466-1-ythsu0511@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240129083115.2107466-1-ythsu0511@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/29/24 00:31, Charles Hsu wrote:
> Add support for mpq8785 device from Monolithic Power Systems, Inc.
> (MPS) vendor. This is synchronous step-down controller.
> 
> Signed-off-by: Charles Hsu <ythsu0511@gmail.com>

I hope you are somehow getting this.

I got:

Address not found
Your message wasn't delivered to ytshu0511@gmail.com because the address couldn't be found, or is unable to receive mail.

and:

550 5.1.1 The email account that you tried to reach does not exist.
Please try double-checking the recipient's email address for typos or unnecessary spaces.
For more information, go to https://support.google.com/mail/?p=NoSuchUser eo9-20020a056830720900b006e11433d3c1sor1010792otb.11 - gsmtp

Maybe your address got banned from gmail for sending patches to too many
recipients (that happened to me before, so it would not be surprising).
Unfortunately, I can only accept patches from valid e-mail addresses,
so I hope you can get this resolved.

Thanks,
Guenter


