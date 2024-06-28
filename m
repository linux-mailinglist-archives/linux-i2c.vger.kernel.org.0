Return-Path: <linux-i2c+bounces-4490-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C406891C976
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 01:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E66F61C22A36
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 23:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EEF8121F;
	Fri, 28 Jun 2024 23:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eigCCS1z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A5C78C8B;
	Fri, 28 Jun 2024 23:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719616155; cv=none; b=XcVuS23iyJ57Q3YLG9Cxgu/sNHF4FnUcCU46WXR1i2tDSKtd5MNgXDEMXvHQlYhTUZlcBkG0FTFtzAZeX6B7JPAn5iI2yd+PDVmhfvDPeI0tQy7fDPJ033VVAAEUr2G5EsP+jACQQNCQtBtSgHLA+MEQ7OyN6IV4wAV7GtvEr/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719616155; c=relaxed/simple;
	bh=z7JoLm3IXpavqAJHJCUvHP2e2QGFZ2aV/bO4oxR/MLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZr/BJF0mGI7anOPdOTbCxFaQ4+AlBvmUrujZGkrj3ywidnJ5JTLtutBPzAxVi249Yw3LEke02eFUupnzlunBNBG2BfR66oU1KHIe8+VHvmxAyiKTJqt9ShRQXeslrpOhC3T++1/EK3Fs1DASlsd3jStS9QY2NpnZ0bclvewKRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eigCCS1z; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-701fa273824so648699a34.2;
        Fri, 28 Jun 2024 16:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719616152; x=1720220952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AB5VXkhFLy7bVZlsjKePD5M7nT8UqPknmWbvDbQuVy8=;
        b=eigCCS1zZScFSFF8SKogJJiRIBCHpMsEXgxFqYqVYsFjxaulSZFOEWM2Am3ZhJVhTD
         +uZj31yyAykRkz1A+jIZ7LC+/T2UvPfOngzA/5mt/oPzLKtrNMpYhJRy6VWhYI2e3ISO
         3keiRy0ZPLFiw6NfO2mDQsFF+ulxL6wEJ8Ex5/U8TbAd/g/LOWT+DX4YOhc8XbD2xyrK
         A+bqHfM0v94t8fRg0OVNk+MfhQukduyhO8KLTjYmcmHJBF8/0/Z45EnCq8wScRWSFJKO
         dcP92TQROFe8mmkFIkBe31T5AgJAWhz0PM8ANy8SB6b9xB9yEr9jc+Mfa930q5/Jqh7B
         eu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719616152; x=1720220952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AB5VXkhFLy7bVZlsjKePD5M7nT8UqPknmWbvDbQuVy8=;
        b=AQvGQvzjlO3c9Ej8bjB7dEdBFRgDIEq9JSGW8SRomHdfJAEuMt+mZigQMMx865Jk4B
         QjDdu4ZUXTr2+8SK3wUwmSHeoJlWivHXr1tA/zH+i2LAzehma5x9NcTqoRu0xTPVbZ/Y
         r+fLgH4k7y7rVK1xF2NbfmIpKrI7QE5l4D45Z50elTXD9EZcWoIF84Vqm5uLfSLb3gfv
         KuVvVPIuwCsGVO48vNo9Lbtzfkck+7kbRSE8sJU0LH0cUWFL2ivP/WHXnsjIzy2uHXxn
         XOWUZXQPRlvPvmWyoYWb4aaMB6YLkTsp7HD+8sEH7wEXiFxxjQmty+8dZax6/lGOQKrD
         /ohA==
X-Forwarded-Encrypted: i=1; AJvYcCVRkLiw7ft5QLbnp6BLol/vOBmz1el7Pb9l6SRlWayEtRNcsSi+OsS+7Bb9KJT3kSG0SeLRTNqdG1TmmOOKgdPqPtpD62QTTqDHN7F8
X-Gm-Message-State: AOJu0Ywn/eD103x2Pysf5wjmhiGTXTlwfZBIxqpys1ktn7MTKcohfdiL
	1eHD9KW6KrT6dzHXYY4wJV7pbn0lD/IDnuPxkwFGWunyE506F9Bl
X-Google-Smtp-Source: AGHT+IGkRtyP/TvqQ2OIjsu7j55ykZfful5elMmYNHfS/vzIUWYSM+oiXDywUwMFd1wu9klkLBDcdg==
X-Received: by 2002:a05:6808:144a:b0:3d6:3217:3775 with SMTP id 5614622812f47-3d632173a27mr3659638b6e.44.1719616152465;
        Fri, 28 Jun 2024 16:09:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecfc61sm2165966b3a.132.2024.06.28.16.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 16:09:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2bbdb1bd-ea4d-4c14-9ea7-9fce09ac76b7@roeck-us.net>
Date: Fri, 28 Jun 2024 16:09:09 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] i2c: piix4: Register SPDs
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
References: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
 <20240627-piix4-spd-v2-4-617ce47b8ff4@weissschuh.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240627-piix4-spd-v2-4-617ce47b8ff4@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/27/24 10:48, Thomas Weißschuh wrote:
> The piix4 I2C bus can carry SPDs, register them if present.
> Only look on bus 0, as this is where the SPDs seem to be located.
> 
> Only the first 8 slots are supported. If the system has more,
> then these will not be visible.
> 
> The AUX bus can not be probed as on some platforms it reports all
> devices present and all reads return "0".
> This would allow the ee1004 to be probed incorrectly.

Was this reported somewhere ? I don't see it happen on any of my systems
(of course that doesn't really mean anything).

> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Reviewed-and-tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter


