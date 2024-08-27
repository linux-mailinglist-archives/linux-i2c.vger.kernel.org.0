Return-Path: <linux-i2c+bounces-5829-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E11960BFF
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 15:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E292E1F2551F
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 13:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242EE1C579A;
	Tue, 27 Aug 2024 13:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Udj1fjaq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670F91C4EC6
	for <linux-i2c@vger.kernel.org>; Tue, 27 Aug 2024 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724765086; cv=none; b=FKW3KT8G0Llt+so9PANrD7m/i0UlEDmeQI6LRsZGVZqfWU8kX1MXGoXtvIhsEvY9ueLmbQUS277FED4FUvyyO4YABBVLgw9hEfBmq7tGcDaqKM4jtQ+OW+kkKtBYpuWSvSDXLJNjvEO/lnUPniA2q+WryJPTj1EpDTvVdLLb2o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724765086; c=relaxed/simple;
	bh=C1Psij49NxzQQVs/fLfKOjdWLfmrzStbUTmG4qlgoDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LGY+MnFDUa2dvID/lvFSK4KehVpPQrYWQuo7z70iJsBsAt8m4j5shqJY2QN8VMiEkz1Tm6Q8zRATgxZXzP7vS1TyOmHHeJaR93l5zjK9qDPQLcQr9BLVNFv8DuWD7j0F1539K2hBxK65uF7EjgP1UEbDxrlVvHzUQFJpBFjI1YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Udj1fjaq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724765084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ca7L2Ypf1IuSrNf2s487D4RaOYQ0VQUUHqLQBFjj34U=;
	b=Udj1fjaqf9+otj6J/nodPA7HFRGwEtwLXLfuY0Q7u2WtX9KaCf55fNWJ2Wvb6kF8PuMvxW
	6wD25uKuoOm5hhweg+wHNt7fJtZXwlfd7M1y9/Jr0cJxv4RGb+zhvWDOPkI0U1PkdAulBm
	IR14/h2USuLSHPPCpPyUSjY99gtDKrM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-_OD_7FyjMJGHwyr-_pfsGQ-1; Tue, 27 Aug 2024 09:24:43 -0400
X-MC-Unique: _OD_7FyjMJGHwyr-_pfsGQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-428fb72245bso28767095e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 27 Aug 2024 06:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724765082; x=1725369882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ca7L2Ypf1IuSrNf2s487D4RaOYQ0VQUUHqLQBFjj34U=;
        b=ZVV4hQEPG+PBJZilK8k5B8hq24I1s7Fw/zXUa36U8opYn27Xv8PiuS7pbA3rhL8Nkv
         T6wRIIb6UGsAP8A+ihNzKng5CY7UJ+ccGv/NsK61Ao+OceoKAsCyms0E8EjbGUlRAy1z
         dl0Rk0JPWjclcRtJx2PDqxfM2+TCN6d9nAk2f8YMfpGqJ+68ENdwvW3/YB3Whz3DzPAa
         o57Wh2kBf11XZW6izy7PMlLhJKX6N2kKZFn5qBYpgU4QILmPjAIIGJObp+MdeAQp+qMd
         H0GGwdqR45Y2zRhlN4Rkhjmtma1nc3dtMZH9L5bUyA77DKcbRGDYMzY96Klgsa9RayN/
         phAA==
X-Forwarded-Encrypted: i=1; AJvYcCVuvYTOu/Dkwjm5rxWKaqUA4mfgNty3JEJFbnbhjKxDngrEUlk5aU60eLaDrrAvbYOAMN0OVKJUqlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJfdBSXXbZjVbdlG689WuKdqGgevIObid7oEcdafHitZPYNNOs
	ks5Wju44P1FnYmckavy1ZSGDNQHeoefNB2EIGlU1gJnG5w8KavahCPJDGwhg4c5GsRN0sO9ov+v
	eMIRzwP+u0QEkbwyYXHrtiC2m91yJjMCqmK15DeTOywZuVhuOFi4mx8WRHQ==
X-Received: by 2002:a05:600c:4f01:b0:424:8dbe:817d with SMTP id 5b1f17b1804b1-42b9a46d558mr18972085e9.10.1724765081986;
        Tue, 27 Aug 2024 06:24:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7rF2xZXsNit3rnRpHiOnC7cRxUpFHU0F4taw8YckE22isH+1s8w1ewwo4oiz7G7HWJwsUVA==
X-Received: by 2002:a05:600c:4f01:b0:424:8dbe:817d with SMTP id 5b1f17b1804b1-42b9a46d558mr18971815e9.10.1724765081469;
        Tue, 27 Aug 2024 06:24:41 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1b67:7410:c8c6:fe2f:6a21:6a5a? ([2a0d:3344:1b67:7410:c8c6:fe2f:6a21:6a5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac51622b6sm184917205e9.22.2024.08.27.06.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 06:24:41 -0700 (PDT)
Message-ID: <43c572e1-11bd-4fb6-8463-7940f57b8c7d@redhat.com>
Date: Tue, 27 Aug 2024 15:24:39 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/3] i2c: designware: add device private data passing
 to lock functions
To: Jiawen Wu <jiawenwu@trustnetic.com>, andi.shyti@kernel.org,
 jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 mika.westerberg@linux.intel.com, jsd@semihalf.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, rmk+kernel@armlinux.org.uk,
 piotr.raczynski@intel.com, andrew@lunn.ch, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org
Cc: mengyuanlou@net-swift.com, duanqiangwen@net-swift.com,
 stable@vger.kernel.org
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com>
 <20240823030242.3083528-3-jiawenwu@trustnetic.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20240823030242.3083528-3-jiawenwu@trustnetic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/23/24 05:02, Jiawen Wu wrote:
> In order to add the hardware lock for Wangxun devices with minimal
> modification, pass struct dw_i2c_dev to the acquire and release lock
> functions.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2f8d1ed79345 ("i2c: designware: Add driver support for Wangxun 10Gb NIC")
> Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
> ---
>   drivers/i2c/busses/i2c-designware-amdpsp.c   |  4 ++--
>   drivers/i2c/busses/i2c-designware-baytrail.c | 14 ++++++++++++--
>   drivers/i2c/busses/i2c-designware-common.c   |  4 ++--
>   drivers/i2c/busses/i2c-designware-core.h     |  4 ++--
>   4 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
> index 63454b06e5da..ee7cc4b33f4b 100644
> --- a/drivers/i2c/busses/i2c-designware-amdpsp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -167,7 +167,7 @@ static void psp_release_i2c_bus_deferred(struct work_struct *work)
>   }
>   static DECLARE_DELAYED_WORK(release_queue, psp_release_i2c_bus_deferred);
>   
> -static int psp_acquire_i2c_bus(void)
> +static int psp_acquire_i2c_bus(struct dw_i2c_dev *dev)
>   {
>   	int status;
>   

This function is used in a few other places in this compilation unit. 
You need to update all the users accordingly.

> @@ -206,7 +206,7 @@ static int psp_acquire_i2c_bus(void)
>   	return 0;
>   }
>   
> -static void psp_release_i2c_bus(void)
> +static void psp_release_i2c_bus(struct dw_i2c_dev *dev)
>   {
>   	mutex_lock(&psp_i2c_access_mutex);
>   

The same here.

Cheers,

Paolo


