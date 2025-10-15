Return-Path: <linux-i2c+bounces-13551-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 483A0BE0D8A
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 23:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D29D63AE0E8
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 21:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB2F301719;
	Wed, 15 Oct 2025 21:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CNcsUy3O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FF030149C
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 21:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760564613; cv=none; b=tObsMIWoW3LW6rKKjPXeIg+gDCimu/4lqMU75g36xYW4XyLis6k4mbtbNpgfL1Zzfv7KkdULaZ01uBVJ3tjMPrGjp75WsfKVBTXmLIagmW5WpSYk/3OCZHF+BYoZIwSTQEG4mM4kqRj6uZrOMGjHP5ftV8MW2vf09X1fJW16AKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760564613; c=relaxed/simple;
	bh=AoGR0N/WRa1KwSM19W6VN8WXSjWSD6KuRKpcEKai8Iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LpMm/T/NCE3CDVW3niw4EiLA2FjFCe1v6jYl6UMcpvo63d2WlYOQKaKQwOv6/8P/ExYn5UceifwXlZEk51R89PMprEQcvSFRSyK9pcwzLIrjwPcvm6cjoCg2CItQ9tOZww/CW4SJg1HiEueAiabZuNW7+KdsFhKD9l1Qx/6Se3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CNcsUy3O; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-426f1574a14so28563f8f.3
        for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 14:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760564610; x=1761169410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDF8d+4H3i2iv4u1yiFtrqUVQxc1Kn/G01hl0muKOgA=;
        b=CNcsUy3Ol7xzE8L++OkzH05UyK7SGRYPqrU4282wKBhBI2fRgEKGcNutEjSlc91KE6
         Q0uCV9hE6bWYje+NKSLt8Ny6rZDc+Ac4QySGlPCVaW1H4TafOzVzSH7yQIA9jbP3UpkV
         Ufi5NZHL0Xv15ZRW2U8ePR1KPv8NmAuii7OVA9MavsQdRi5WvY0xU2t0dI9w6a4xSac0
         s6NAay1hscAH8ibWpbug2wyG9Ox0EX4Y2+IC6f9n/MKAUWSOqOzjd27vZXnrqGXrmxpD
         lm9IS0ZEYwqVXpqv3LNU0AAsWtfYQwR2yJAz3nVjFbM1i15QRAOUmxDssITWIVR6krEm
         igjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760564610; x=1761169410;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDF8d+4H3i2iv4u1yiFtrqUVQxc1Kn/G01hl0muKOgA=;
        b=OoZjh5pZTFbCpKRnhd9MWMARILgTE3sJr+W7qhhT91BAUVEEVK0psEBidj90QU87cm
         UYp1BqOlYEykLAPTHjqR0qCLqOeS1a49gQoCBlJUcga8F1gckbVPrHx9LbeZrf2+RTvt
         /v3GrWHiKDec4UAE8H4RQBKMhd2/LxH0ksK7NhH1pAmO+pImf5oNy1Uj9fz6rx4gLiks
         Hi1UoOMc3vRWeLh0vN1tCkn7fYv9EbyouXYuZOkyABwpzyK6er7wGMSC56sXyFpzWYNi
         DFysAOWfXMnYu9moMffeVawCbAtYK4GnKDfGT1zslsOER9Ac4C1nkGwviN/fit8Sg4Tv
         JcxQ==
X-Gm-Message-State: AOJu0YzNMuZVTpOKis4t8QPZuxvrqBpblognzHtrtkzy58O0aVeGkBB9
	3ufHjoGkz9ICL5wU4sIRFJxbIo6NZeBpjLlP2gmUQsgUIDWbPw4cDg4CSIO8O9L7VPY=
X-Gm-Gg: ASbGncu2FtSgMaNczGw3NlZiMl4iekFMpzKkkCLjvcGqlnrlQU1hs1pO67Leej/+anF
	MzwKxvfFqPgbHxuZXuxbB8wDC6cBbH7hSRPCCkSCzm/TWYB8ev2/Tk1CtpExwcl4ZbNXrbxaEbY
	iZjnuPT6Dvj7eEydowd0ovXH0NQiwED3pxHBFYtKBJh6F3TU1Fx0q6jAMoczcpM1w9zKJ1r6Koz
	8CRWHyD5cmIZvqB/sPYLj47GqR0o3zldlCdMd75aEjA6ETA6HrvSdITsFTB4zfJcOEJEiLOfA4V
	AjYgplrJuCwkDVJz3NVIhIzwsaOHe+AXS935Y2vB14ehBB1FEmu7uYa/oqOyXBYuukpnZlnqcSH
	qY+VocMeTI+s2Uct/GJuKl4+j5QhrKcqt1Xd7vzJKvY8O7rpaBudke8vtofg4bgD3Z98XXaYYyB
	RjUlpajgQQ8o10A67u83lV3I6OqDBN9m1iYDh+E8PwunUd2hLfX4L4nFAm
X-Google-Smtp-Source: AGHT+IGnQKKNQd7/bwUbO/GQuYepHvtuUzlr5o5rKuZYtYUxhm0e4zkPUt4aDvFWg6NhRrSxe6cX1w==
X-Received: by 2002:a05:6000:310a:b0:414:a552:86b1 with SMTP id ffacd0b85a97d-4266e8e48ccmr20004387f8f.63.1760564610303;
        Wed, 15 Oct 2025 14:43:30 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426fc54b32dsm1314209f8f.30.2025.10.15.14.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 14:43:29 -0700 (PDT)
Message-ID: <0b6c157a-3d8d-4251-a704-31f8369f6a4e@linaro.org>
Date: Wed, 15 Oct 2025 22:43:27 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-2-f5745ba2dff9@oss.qualcomm.com>
 <dce1018c-6165-407c-8f3d-40859cb36b11@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <dce1018c-6165-407c-8f3d-40859cb36b11@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/10/2025 20:45, Vladimir Zapolskiy wrote:
>> +  power-domains:
>> +    items:
>> +      - description:
>> +          TFE0 GDSC - Thin Front End, Global Distributed Switch 
>> Controller.
>> +      - description:
>> +          TFE1 GDSC - Thin Front End, Global Distributed Switch 
>> Controller.
>> +      - description:
>> +          TFE2 GDSC - Thin Front End, Global Distributed Switch 
>> Controller.
>> +      - description:
>> +          Titan GDSC - Titan ISP Block Global Distributed Switch 
>> Controller.
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: tfe0
>> +      - const: tfe1
>> +      - const: tfe2
> 
> Please remove all 'tfeX' power domains, they are not going to be utilized
> any time soon.
> 
> When 'power-domains' list is just a single Titan GDSC, 'power-domain-names'
> property is not needed.

Each one of these TFEs powers an individually power-collapsible TFEs.

This is also so with the other xFE power-domains on previous SoC 
generations.

You'll need the TFEx power-domain to process any data on TFEx with the 
'lite' versions being tied to the TOP GDSC.

So please keep the power-domain list, TOP isn't enough.

---
bod

