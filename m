Return-Path: <linux-i2c+bounces-8311-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBCD9E1BA4
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 13:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32C93B291CF
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 10:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D161E230C;
	Tue,  3 Dec 2024 10:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSnf3+yC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242261E2302;
	Tue,  3 Dec 2024 10:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733222131; cv=none; b=c0vlQYSnjy666M0X0ZmFfk9HaYJgdzq6dRx4eryB/I/aKC5SxtaXVDjN41k6jAgU3Qo+uGq2Y40bVMWbSbYjkOfh9eONoMi0HyWA9cL44eCKnSAA3VshCV9Ou+9+MvXzn1ZuxFPZ4COJP/it6abl/Cg13/7cEM1QSVSpCIxnl4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733222131; c=relaxed/simple;
	bh=7MV19QcxUPBz19dSBfflpo7kAUY0uXyoYiCScH9DCEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCM/nuO/J1wvaeLlbFmQN5dLeX2jRAsGN/AmcoYFayxGRkH5XCLpn56AusUOuWlZ4Rvv1wtCwLhXItWk/GF3QJ3yVw2NKNUAUKcsGNuppoqSm7so9b47Rs5HIK/FLmwH/WKXTr2VekaS61bDRzeZXKgjA7/ly2xqChjea8QT+Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSnf3+yC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a7ee3d60so36829595e9.1;
        Tue, 03 Dec 2024 02:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733222128; x=1733826928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qN8Q7NvXYQAc8mMk657N0CT61t/8BxyIg/nmi9JsGbE=;
        b=DSnf3+yCJB0WHNX/g5B9ICpDjD84B0ox3Nz84ImCTAyZJJCnNzB+e3YOs+b+WjuBWW
         FmC8gRI29UXTGe8sZnUfmVENsHAZH1gnY8zlqe2xhVSGwG/Sipa6yBo40UIl/EwZc2r+
         rkj0GMXkY0mME+UkNtdAo8Tj4Q1Sos3dMt2MxWbWuXbbFa70a/l7fkksKF+Agd5H9o68
         Z3SzGhoqSvoB/xtcmJJbrxmrfUYfYnVaEzz6a2GjJs3fqtwiWDWb4JLPk4Lkz6x0MDDR
         oA0Fb7ADik0IURrvhH/5jS+QOvetMqxJe6VpZYvm0iUFFDt5oB23/TzY/fWBLGR7ZHmq
         QHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222128; x=1733826928;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qN8Q7NvXYQAc8mMk657N0CT61t/8BxyIg/nmi9JsGbE=;
        b=EwsDhbiCha0YfIRvvUpWvfBPy32n7TXT07/Myq8vqQqRe2XgMyIeJR48Vc4cdtk5hz
         l8Mfmb6foouryLKimiFXIZ6Wou0owYihKdkuAanrLzdWAGLQ2tX05P7t1pi4aO9UWmfK
         6fVq0B4HWF5Dt08ZNtGSSxmJhNt7NqThrVtyDPeV+QJpx7FiyrnmFXkmDNoO8YW3Fkhz
         mlzqyckINEq51SpaUl+vUjQ6bcMcfYgf7ZOz/Dghc/0b8p0KZZ0SnqlqeIe3HEQMzo5/
         dsT0MUG7z92qKg8S0J+lMO87DlPTKWFcEREKeJSoWKImAyQt9yjeswTRVpjGt/Q9z38X
         8Kow==
X-Forwarded-Encrypted: i=1; AJvYcCV1xLJmCpfzZhAhzxp6/i7A0N/fBSUIKlJ0hI7XtYa4Dlf1K+usDFrLiZvpz5FxXQgiIG5ImISdmz6CwqPD@vger.kernel.org, AJvYcCWniPjExSUIDcTGVYB6+048IJ8qOD3mkkH9P7rKjnnNugLl2sa2wXnEFJiZ1SFR3lTtmuK8LWxHitY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBldiCVL2u9F9JpBcUuGagsDY57DxG7n3IImH/n18Cr0YS93vn
	N5V5d1fb7itzuqzZzqISDCQ4Yh9w8XUZ0Ep+BLSE3JADCI8nX4Kc
X-Gm-Gg: ASbGncsBYY6yrBTcu6RafOlLwxa+Q0TvBdKKV5QSLSYPwyWjBxHalV20dfS8P8xtr0b
	OSIJtJ7+/udj5Fc2pqQULR8l1yZ4zXJxlqeIJXbfckmvNOuRN3ca5Xrhstgo7YQqzDwwkc9MGM6
	zplrKPONpHhSavSez3XxUbfkEmkVuJLdsyIOC4TVUX1oKCZrVQAEgXLZKQSNTSRdT197YJa6pRa
	772QYtbHwBKQwZji/nRx3bDcrpgHZEC19C5kzOl6Ue0X5ZWgcKFAC2K
X-Google-Smtp-Source: AGHT+IG8p4ci1lfaBMRBtSwSlB063A9XNmV7Sucky0jtbIJ62Cfh0XGQx8pHvylmkl89XPGQg78eNQ==
X-Received: by 2002:a5d:5f84:0:b0:385:ea40:b46b with SMTP id ffacd0b85a97d-385fd964919mr1482945f8f.4.1733222128184;
        Tue, 03 Dec 2024 02:35:28 -0800 (PST)
Received: from [192.168.0.100] ([188.27.128.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e3cbe250sm9563445f8f.94.2024.12.03.02.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 02:35:27 -0800 (PST)
Message-ID: <fba09c57-cf13-4f50-8fb2-874ae6f6d310@gmail.com>
Date: Tue, 3 Dec 2024 12:35:29 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] i2c: atr: Allow unmapped addresses from nested
 ATRs
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
 <20241122-i2c-atr-fixes-v2-2-0acd325b6916@ideasonboard.com>
 <20241126091610.05e2d7c7@booty>
 <b954c7b7-1094-48f9-afd9-00e386cd2443@ideasonboard.com>
 <20241127131931.19af84c2@booty>
 <30732dbb-21e6-4075-84b1-544fc6e6abce@ideasonboard.com>
 <20241129125340.0e2c57d9@booty>
 <9bae963f-037a-46e1-abf6-f2ec464c4cf8@ideasonboard.com>
 <20241203103932.3cd412bc@booty>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <20241203103932.3cd412bc@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/3/24 11:39 AM, Luca Ceresoli wrote:
> Hello Tomi,
> 
> On Fri, 29 Nov 2024 15:31:45 +0200
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> 
>> On 29/11/2024 13:53, Luca Ceresoli wrote:
>>
>>>> So strictly speaking it's not an ATR, but this achieves the same.
>>>
>>> Thanks for the extensive and very useful explanation. I had completely
>>> missed the GMSL serder and their different I2C handling, apologies.
>>>
>>> So, the "parent ATR" is the GMSL deser, which is not an ATR but
>>> implementing it using i2c-atr makes the implementation cleaner. That
>>> makes sense.
>>
>> Right.
>>
>> But, honestly, I can't make my mind if I like the use of ATR here or not =).
> 
> Hehe, indeed, hardware designers use a lot of fantasy in stretching the
> I2C standard to its limits, perhaps more than actually needed.
> 
>> So it's not an ATR, but I'm not quite sure what it is. It's not just
>> that we need to change the addresses of the serializers, we need to do
>> that in particular way, enabling one port at a time to do the change.
>>
>> If we forget about the init time hurdles, and consider the situation
>> after the serializers are been set up and all ports have been enabled,
>> we have:
>>
>> There's the main i2c bus, on which we have the deserializer. The
>> deserializer acts as a i2c repeater (for any transaction that's not
>> directed to the deser), sending the messages to all serializers. The
>> serializers catch transactions directed at the ser, and everything else
>> goes through ATR and to the remote bus.
>>
>> Do we have something that represents such a "i2c repeater"? I guess we
>> could just have an i2c bus, created by the deser, and all the sers would
>> be on that bus. So we'd somehow do the initial address change first,
>> then set up the i2c bus, and the serializer i2c clients would be added
>> to that bus.
> 
> So you think about another thing, like i2c-repeater, in addition to
> i2c-mux and i2c-atr?
> 

Since most of the functionality needed (besides allowing pass-through
transfers for unmapped I2C addresses) can be achieved already using I2C
ATR, I think we should make use of it.

> Well, I think it would make sense, as it would generalize a feature
> that might be used by other chips. However at the moment we do have a
> working driver for the GMSL deser, and so I don't see the benefit of
> extracting the i2c-repeater functionality to a separate file, unless
> there are drivers for other chips being implemented: this would motivate
> extracting common features to a shared file. IOW, I'd not generalize
> something with a single user.
> 

We have GMSL drivers for 6 new chips that make use of the I2C ATR, and
we want to send these upstream. Adding pass-through support for the I2C
ATR is one of the only things keeping us back, and it's the solution
that makes the most sense to me.

Semantically, indeed, our GMSL deserializers don't have an ATR hardware
block. The serializers do, with the particularity that they pass through
all traffic, even if it is for unmapped addresses.

The current GMSL2 deserializer driver doesn't make use of ATR
functionality because it's a single link deserializer, so it doesn't
need to handle multiple serializers with the same I2C address.

The GMSL deserializers we want to add have more than one link (either
2 or 4), and they need the ATR to reassign the serializer I2C addresses
to ones that can be addresses without conflicts. The address changing
is done in the ATR attach_client() callback.

The ATR driver already exists and allows us to implement this, even if
semantically there's no translation block.

> [Interesting side note: the i2c-atr has been implemented with a single
> user, violating the above principle O:-) but I think that was due to the
> similarity with i2c-mux or something like that. Out of luck, another
> ATR user appeared after some time.]
> 
> Luca
> 


