Return-Path: <linux-i2c+bounces-6430-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC35972146
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 19:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AABD51C21B22
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 17:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BFA172BAE;
	Mon,  9 Sep 2024 17:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aE+CBM1U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD0B20B04;
	Mon,  9 Sep 2024 17:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725903871; cv=none; b=VTYzahxf86aeft6r9nX6CnywM2R80S7mr6Wu9717tFGY2EWEF/WsukMIYOYbyfCdVlJacmsK5ZVo5XohhYTt8rjVFilPi42CqUl+bz4NG4mBpoH9oP0wpHKADhfbYFQUq4wrtS4eINI5czBCo2Hyz+iqNmNI55esp9XeWT3Tl6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725903871; c=relaxed/simple;
	bh=7Pqu8tu0rShqOk7OhPgvzVlTuzaicwv7had0l1PT5XI=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tSy2aVSRNg5Zclnfmhfa9OE7IxNGEA820zOEkPbM55odVu18Lf1SatkXGyuJMhqN7kc6hbKQh5FZjYojJ3PvvGw1pP0RzoerWZ2JuOTs4Q9CuzprU6FJCRnREdqp3KugNnAKUiwp7KXXaR7Me+IFCl9RhzhOuSsJ6nLFN2VykKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aE+CBM1U; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5365928acd0so3963670e87.2;
        Mon, 09 Sep 2024 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725903868; x=1726508668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/d3Cz6V8XkCI//hazNFX3PHzxix+VsJPWmdt1izWNzY=;
        b=aE+CBM1UQ7Sr0cE+HUhJyfEaTXm+h9JKs2Wp/rrZkmlEkxTlAueKbX2oGcT+2/62YP
         WYWThP1Agm3GoDQTZL6UcKtQO/YcsNvMpJiszdjcj4DvWlC30adUHcL3mpdv/PxSWJj1
         +VsexdxFvNOV1NPlEUSl+MNP0upTnEALtdzFmKmxI9SWYTK49giUngr5OqU2uEzjxtbP
         dN+mfSdZ2LpUm6KW/reAewPvUFt7rOxhf/MLUxKhYJyFI26sUHWVSn65vKPPAHnWqYkj
         0ZnBDxfQd+Su7yMOizdomW5PGXNXu7M7XBPs2TZUhPtIi5vglZh3k6uFG3bSeMvx6VJr
         12Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725903868; x=1726508668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/d3Cz6V8XkCI//hazNFX3PHzxix+VsJPWmdt1izWNzY=;
        b=gQac59jnAeB3323tnPEpI6zh6CY3AXAz42wUUNH7Z2IVSI/kYaG5l3Z7MFqM/UGfqG
         KPy0kuMjWtRdwCRgZRyxmQSMBQCL/uQR69kVIxmBiZGoG7Sc35O8L94CWbmAkbuyqjVx
         +z0K2ONnf3EuuiVATlAtZNgveDB+chD8lNBDSLLDC7xiWqMyXeMUx50i9sxyEEP41EdU
         uSMJGhGlN6hRkyeAHiNqMhcJMvJOEuaLlkwUXXfQpBBA0Fw8hujWKVaVNMA8cBuXyDX8
         P1RvItUAJ4PRN2CRUVGCyIkp8GASZj7RHVFs98dnnMDPegNv5oyYJlvviXk5ADZY/3ga
         uO2g==
X-Forwarded-Encrypted: i=1; AJvYcCX5XGIGD2lEvxzuJBMVtboLrB/gy/iJQJcTWBOb3ssD3K3rf1iDQw+38s+vyGG4GMPkVDd1tPqXqF5O@vger.kernel.org, AJvYcCX7Wk3vvY4uSNdllsSXJOYVmk5iyIdEXsgkUzo/9uka/Mwhywsc1asWXX6WrWVbOTgmp9IUtC/DGaTqZw==@vger.kernel.org, AJvYcCXb9U8MYPW8eVPUeACw91YmlcAJSodlwIffOlYju9Wb2rCZGwCnS+LwB+f/nsQ5cOyJgGaFM+L+P3VXRL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeeffc/oOvULv5tArE0HUHRNFhnVUu6WrNuSZ9KJkkp5hD19um
	sjQqMVbtBXQHMXnT3PchNRHdw2w8+J17qy+OY7DF3Vajmhkle+2g
X-Google-Smtp-Source: AGHT+IEuYlo847yKUJ+orvScvSnN4edTZBYzezA0ElqoTbathYiiENxwkPXyuLCF8Z4CEQBvbtirUQ==
X-Received: by 2002:a05:6512:2313:b0:533:40dc:8248 with SMTP id 2adb3069b0e04-536587a5453mr8646573e87.11.1725903867653;
        Mon, 09 Sep 2024 10:44:27 -0700 (PDT)
Received: from [192.168.0.17] (cable-178-148-235-7.dynamic.sbb.rs. [178.148.235.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5dc8csm368595366b.206.2024.09.09.10.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 10:44:26 -0700 (PDT)
Message-ID: <98c3aa20-efed-40e3-98f4-59cce92e99b3@gmail.com>
Date: Mon, 9 Sep 2024 19:44:25 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: savicaleksa83@gmail.com, linux-input@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org, jikos@kernel.org,
 bentiss@kernel.org, michael.zaidman@gmail.com, gupt21@gmail.com,
 djogorchock@gmail.com, roderick.colenbrander@sony.com, me@jackdoan.com,
 jdelvare@suse.com, linux@roeck-us.net, mail@mariuszachmann.de,
 wilken.gottwalt@posteo.net, jonas@protocubo.io, mezin.alexander@gmail.com
Subject: Re: [PATCH -next v2 14/15] hwmon: (nzxt-kraken3) Use
 devm_hid_hw_start_and_open in kraken3_probe()
To: Li Zetao <lizetao1@huawei.com>
References: <20240909012313.500341-1-lizetao1@huawei.com>
 <20240909012313.500341-15-lizetao1@huawei.com>
Content-Language: en-US
From: Aleksa Savic <savicaleksa83@gmail.com>
In-Reply-To: <20240909012313.500341-15-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-09-09 03:23:12 GMT+02:00, Li Zetao wrote:
> Currently, the nzxt-kraken2 module needs to maintain hid resources
> by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
> resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the fail_and_close and fail_and_stop
> lables, and directly return the error code when an error occurs.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---

The commit message references the nzxt-kraken2 module, instead
of nzxt-kraken3 which it touches. Other than that,

Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>

