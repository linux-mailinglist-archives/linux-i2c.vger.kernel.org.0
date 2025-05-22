Return-Path: <linux-i2c+bounces-11110-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E7BAC08BA
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 11:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54BFE1BA827D
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 09:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2F8268C55;
	Thu, 22 May 2025 09:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7FcfkXe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CB2267F5D;
	Thu, 22 May 2025 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747906284; cv=none; b=tgLA+VqmFpPeJ7rKdftQatdWPPsof/7H9FFp74JVGbPBVQE3QlF9/HMZ/olPASN/zeQzXch3Rnk2N2ccyUwvQMjyniC33qaa93xS2gloBqtjYLeIC91zMExKJ2QngE+Hru2tURc6UigC1P28aaTzIuXpDl42hJ/kg5F4gWQf/gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747906284; c=relaxed/simple;
	bh=okF8eloeLFd1bFYhuUEEsGhYaohgBX6WS8P1YZ34JCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CctcvXzEdOwa79lG3pFEbLO9PRDYha8ZGsR9mwBPSYsHnES1X4aiKNXkUDiSkfqf12jDpWMMiNf9Xz4KIiYAc2La5Ul2HFJQ54ju3TXOIJzpKSqd6j81PF9PvW1jjJ+YLvfbH48WPWhjtGm60uYjp8LNaLwiFBECHH97cXGlpfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7FcfkXe; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad5273c1fd7so1305967366b.1;
        Thu, 22 May 2025 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747906281; x=1748511081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Msz1IKR3lqodHeTxu3YAVwhDtWS68xerTrTCn/LhVYU=;
        b=V7FcfkXeSW+Pr1C8jqO/aWnpiEr01uNkAzG6TrA5YtxADyVtB0SvDSxTcDlUJ110Oi
         Rq6T/hNuy2hgZqNsBwyVptJc6Gmqmeria3C24WoGNY75NdvZYN6Fn8HkA9WbR5iT9MmW
         gwgAgPmlccZlCjxP74LpU3s7U2d8jQhczXxT+TliaIP6bZ5wluutqdFY3II3dk0fLBCa
         bVdTwVwsD0DfICABwJVEj8+rq/8K2Lx5eNkbcKUqGpepmGqu17zxxZ7tjQwVqGN8USkX
         GPjP8Q2ta8wPnx08ZNPAIGLlbPhAVwy4PyWmkGpZJUgvCF9nVcdiB0BWVLDnexUg+kWG
         sxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747906281; x=1748511081;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Msz1IKR3lqodHeTxu3YAVwhDtWS68xerTrTCn/LhVYU=;
        b=m8X30jtBKYFqcJ4Q53kyAeODcHf7aPEOnpy/uqdmAqTURzEvNNS1GdogdsEYCuF818
         7Q0dFyL6s2dy/gzHI9OygHJleQO9AJbUx30/ErdbpAM5TOHCsQZEQ4rawuXxZiQdn5pg
         NgbW3mmKUpGdGhb9Syb5evv2Jd3iLwEb9PqjEHwYwxxynPJ5KbSfaaR7rgZjvcZEkVQq
         zpNiahEsIZmW9V6jO1QMbL9ullJ/6KYh3SE5PorCW0yHV0OwZ75DC7bbRHUEFRav2Cwh
         0oD7FYQ8FAZRBl7SFc/w+41sBJp1B594b14/so0fpLN76AumH6c7DDPL5Wp1KNOl3BFq
         qCKg==
X-Forwarded-Encrypted: i=1; AJvYcCWPztuTaHnQAuK60uEkMv7CPIp/proRsbLYvJMa2NynScYmyAkNlyMyPkSoYO/FGr57dVTKwz/KPmY1N3E=@vger.kernel.org, AJvYcCWve0iWarFJI7lfzLhgJN6BT7AjE4s0boCGcfbA4SFqRpR+SXlJ25V2Q30l6Goqq0QkmZ7dfP7ptDI=@vger.kernel.org, AJvYcCXQpu5jYxNB+jWhoVUJqEbnq1vE/09NBilVh25sOdC1sHHpog9hiAXQuwtViBb7zx53ypdfJdDSpPUxVIBr@vger.kernel.org
X-Gm-Message-State: AOJu0YxKV/lEDBOEUhnenToMZQQeZHK97Ud5OWCferIRhEmz8f1F13m6
	ec6xo0NTTofBlcmgHm9FQK8a7gcAfSgNzQGUfLo4IIx1irHhqGNzagoUxIwsqA==
X-Gm-Gg: ASbGncuuVruICZPG52joU8q+lE7RqUu5cz3dkVFa6e/0zLVJ9gOSW9N4A5PAO9b6znk
	BPdDe+MFAGgrRZvTDUbXlaJcbfQL6earmniWg8X9m+2UmcdsHWTsuRTnCOh5xGCiv2tbM9FZHo+
	2A+PjO09ICiGPSXqceXECL9FZ84bQ9Oi5Lr0x13T4Sc2wZsu27pXHA7Ex9Wel7pq+hZ6s9nPC/6
	8+VFWO9LDT3wAJtclSDuFaezfvKEQCQpElQOuSP7M03QxrE50ck722gA5MWxVYb9L4GbjY3F/Gt
	J80dhTlGVJpWbRYlOHvPcr1bsZ5+omuPnQyIzPs7yPugW0zRWea0g/y7gOk=
X-Google-Smtp-Source: AGHT+IGh3Hx+XYmsGbpx6CTFfH5NBsd1tODfW2p2cobFZzc43u/RkbEH8UQPNQ4GEXxvgxMcqiKoHA==
X-Received: by 2002:a17:907:97cd:b0:ad5:bbcb:e3f2 with SMTP id a640c23a62f3a-ad5bbcbe62fmr362866566b.39.1747906280873;
        Thu, 22 May 2025 02:31:20 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4382ccsm1043253566b.118.2025.05.22.02.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 02:31:20 -0700 (PDT)
Message-ID: <6060a629-0fe5-4d66-8c37-7c9919a5548e@gmail.com>
Date: Thu, 22 May 2025 12:31:12 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] i2c: atr: Fix lockdep for nested ATRs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
References: <20250507121917.2364416-1-demonsingur@gmail.com>
 <20250507121917.2364416-2-demonsingur@gmail.com> <aC7o_obqzBlhW0tE@shikoro>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <aC7o_obqzBlhW0tE@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/22/25 12:06 PM, Wolfram Sang wrote:
> On Wed, May 07, 2025 at 03:19:07PM +0300, Cosmin Tanislav wrote:
>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
>> When we have an ATR, and another ATR as a subdevice of the first ATR,
>> we get lockdep warnings for the i2c_atr.lock and
>> i2c_atr_chan.orig_addrs_lock. This is because lockdep uses a static key
>> for the locks, and doesn't see the locks of the separate ATR instances
>> as separate.
>>
>> Fix this by generating a dynamic lock key per lock instance.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Your SoB is missing. I will add it for you if you confirm here.
> 

My bad.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>


