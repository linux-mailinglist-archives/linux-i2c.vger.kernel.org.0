Return-Path: <linux-i2c+bounces-7760-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA329BB809
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 15:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DF891C24180
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 14:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479911B4F0B;
	Mon,  4 Nov 2024 14:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="K+f7yHOq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAEC1B0F2D
	for <linux-i2c@vger.kernel.org>; Mon,  4 Nov 2024 14:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730731151; cv=none; b=uC7HUDO4Gt2KiZ+kTwj/PUN3qdvyD9NLQE1Mh2g74WxZGvhSoVZgTx7UlugkKjQNqsIcEYSZA4Dk4km2kEhUvffSQcRRWTOAtnlf4euXFpWHm+EcSbba8akO2lZgwGKChYBIU9+dRoWF256Cm924J53EQMxpK9gW7Otq7QPzhTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730731151; c=relaxed/simple;
	bh=N9mNTgS7KydKjujfpo8o+RMYb3M2ubWeqVEZYIZNbvY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hl7n/rEaiw5SOEoR07K+J2aJcuOIEQ0uTztvql2fFSgCZGy6CYGqMpQTwZs19jYxnvN6F5k3Vbuk5ISgjAWgcr/MLZ9siuh6Xa3X4OozTeVJv1Qusu4821gbXOYq2b27eaCV8MZwPbNtqZxSgKAlgKDLAvaEKULlDjqwCt8YvX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=K+f7yHOq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315baec69eso37138805e9.2
        for <linux-i2c@vger.kernel.org>; Mon, 04 Nov 2024 06:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730731147; x=1731335947; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V1xpNFk8hvdBrc0E2hQPlR3zKBSGiQuhict/6bGeGu0=;
        b=K+f7yHOq5S1lh7AD2ez4PM4me8oYXnj5UNBnNruXUhJAPHo4e73cIN0RGxX1f03Xqb
         ElACQYVew7z5byW2nH1Gd4c206wTqPvjvXXy5HHQ4BbmddfBYiWltjkvRfMzIwQNcJ3F
         2189AQfn84FG2NvnBmWXPILW1rGvtL67Er/Ub/oawIXnBH7Ng/gys7iAtplvqHeDQWOF
         2GwOClTK+pr97pzJcze3dXTYg8mxi/xj8A/rJ/5FQLF70y5CmzLx+6H+Ic/pNlndrDLG
         c+Ys2MqHOW+ADAK0rexJK7BydnB3OdVCEQoO7vmEK4h9bAZO1X5rM9wXAFIYOWOLkKAc
         zjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730731147; x=1731335947;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1xpNFk8hvdBrc0E2hQPlR3zKBSGiQuhict/6bGeGu0=;
        b=PbgeLPpgl/G5e1up3YMIBp0gx9LuDZAPJ0ODWPIOhmCemFAY51WvNfL8E4cUo5LbWv
         KKXA6Mkg2rXwcNrgNoAxKu1+QeLwvW6h5VE1dl5eN7tUrDIIRfzULhbi11jk5larJzFy
         syB0pP+um32M3OEZAIVGkttQtw1ntU7l+K+6z38kBye8Elkp2Dhiif0LoiUN3dP9yVHl
         QLAKeyLcyQ1l+X8jvkhjUwjb+o3lYxOnuxr/y5Ka0Ji5e57ruYdo0krqvQNXCkRUy5rc
         89A9hwBBFXXvRfUxli4DXSpqgpBKc69VCKgHwa266bwKG+oYnwWlw2HfQfWpnCXi3dKM
         arAA==
X-Forwarded-Encrypted: i=1; AJvYcCWDlx9BeqprUWGgr5RH7DOOkNaW6wmTHto37DRAVJji+Nc+n98a5rq7w/3QU25Hu2Yy3TS1jCcozCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/fRj63WGGgElaejhk4knxZ7bzHtbHTBMCM5Q4xxxgVq9nUPM/
	2ffhl0186T90IQ0kw3veYBGCFMa3TtegIy2+Ai8A3sNrWrvnQ9TnQuDyO/3GUyE=
X-Google-Smtp-Source: AGHT+IEkd7fCxmipKdK/jhPqqpXWWRduRKJdf1Fys48euGtYO2BQbNuoCcaPoeGNZkFLXLCk4YE8xA==
X-Received: by 2002:a5d:5847:0:b0:37d:4d3f:51e9 with SMTP id ffacd0b85a97d-381c7aa451dmr10370065f8f.40.1730731147068;
        Mon, 04 Nov 2024 06:39:07 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:4393:a9f:472d:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abf3sm13387483f8f.101.2024.11.04.06.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 06:39:06 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,  Jonathan Corbet <corbet@lwn.net>,
  Patrick Rudolph <patrick.rudolph@9elements.com>,  Naresh Solanki
 <naresh.solanki@9elements.com>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
  linux-hwmon@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/6] hwmon: (pmbus/core) add wp module param
In-Reply-To: <fa79de78-aed9-4cd3-bff9-310f2b4a32c9@roeck-us.net> (Guenter
	Roeck's message of "Mon, 4 Nov 2024 06:18:27 -0800")
References: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
	<20241024-tps25990-v3-3-b6a6e9d4b506@baylibre.com>
	<47164712-876e-4bb8-a4fa-4b3d91f2554b@roeck-us.net>
	<1jjzdj5qyy.fsf@starbuckisacylon.baylibre.com>
	<fa79de78-aed9-4cd3-bff9-310f2b4a32c9@roeck-us.net>
Date: Mon, 04 Nov 2024 15:39:05 +0100
Message-ID: <1jfro783na.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 04 Nov 2024 at 06:18, Guenter Roeck <linux@roeck-us.net> wrote:

> On 11/4/24 00:43, Jerome Brunet wrote:
>
>>>> +/*
>>>> + * PMBus write protect forced mode:
>>>> + * PMBus may come up with a variety of write protection configuration.
>>>> + * 'pmbus_wp' may be used if a particular write protection is necessary.
>>>> + * The ability to actually alter the protection may also depend on the chip
>>>> + * so the actual runtime write protection configuration may differ from
>>>> + * the requested one. pmbus_core currently support the following value:
>>>> + * - 0: write protection removed
>>>> + * - 1: write protection fully enabled, including OPERATION and VOUT_COMMAND
>>>> + *      registers. Chips essentially become read-only with this.
>>>
>>> Would it be desirable to also suppport the ability to set the output voltage
>>> but not limits (PB_WP_VOUT) ?
>> I was starting simple, it is doable sure.
>> It is not something I will be able to test on actual since does not
>> support that.
>> Do you want me to add "2: write protection enable execpt for
>> VOUT_COMMAND." ?
>> 
>
> Please add it. I have a number of PMBus test boards and will be able to test it.
>
> Thee are three options, though. Per specification:

Any preference for the value mapped to each mode ? Using the one from
the spec does not seem practical (32768, 16384, 8192).

The bit number, maybe (7, 6, 5) ?

or just by order strongest locking ?

>
> 1000 0000 Disable all writes except to the WRITE_PROTECT command

3

> 0100 0000 Disable all writes except to the WRITE_PROTECT, OPERATION and
>           PAGE commands

2

> 0010 0000 Disable all writes except to the WRITE_PROTECT, OPERATION,
>           PAGE, ON_OFF_CONFIG and VOUT_COMMAND commands

1 ?

>
> The driver uses OPERATION and VOUT_COMMAND, so we should have options
> to disable them separately. It may be desirable, for example, to be able
> to turn on a regulator but not to change the voltages. Also, since
> full write protection also disables writes to the page register,
> the impact of full write protection on multi-page chips needs to be
> documented.

Noted. I'll update the documentation.

>
> Thanks,
> Guenter

-- 
Jerome

