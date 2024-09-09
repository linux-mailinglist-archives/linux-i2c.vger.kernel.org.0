Return-Path: <linux-i2c+bounces-6429-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 645C8972131
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 19:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 902911C23AD2
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 17:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03C318A6C9;
	Mon,  9 Sep 2024 17:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPg0Shhu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB3C18A6A8;
	Mon,  9 Sep 2024 17:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725903460; cv=none; b=ZE+Mtqs8zdez/Z8UtBOq09yrFkHHjxes6yJkKz5tV0txyF8Jp2JJqiw6woH8p/ZXLfDWGv3bD1V/M14e/fz47iSrDWFK7b0EA8mq7wHK3kXncz1DI4R9j89afbIQKURlq9oMpVHuJxSQNs0HiSz3+F9Sr+TTmS/QRI8jWHA5obI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725903460; c=relaxed/simple;
	bh=YPaBOaoHW7KOB1MZJqdURAD7a4kOQcgC1ixtQHF2cNg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iily4rz10Tl0JmP9b5Su5iU17MlXG//2Gc306ctKf0oRebpjg/24UCwXDhJ5QmuNaQmahMUnXeoVVRCZs8rW8OoTDyoXkkGXdh1WpvZ9fw2mskqb6Yx2O7iJ6ULO2OolNhLcsuq705fSoqbFI/KqftRfOPCh5Gx6wqcV1okfmqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPg0Shhu; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8d43657255so229343666b.0;
        Mon, 09 Sep 2024 10:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725903457; x=1726508257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=byJIU7+VKXcDGbAliIIaSqjlb89vjX6kzrYSVpRo834=;
        b=EPg0Shhu9oe5dScnSv+Zz89IkZq9ex5k5/TPEGpAVv119kg3nnzD6CVC3Qjmhixdoz
         2zfu4M2RVS2WQSJNExuciWdwTFOxybg+ZWnRe2BubqMuXb6w/gTpFW1OSC0rY0WeEAC0
         OHmEHzaaXGL+6WTt1UtayspqQp6IoK1GLZf6FKUeoANn8gxMY2GR0zsJZGWldDvqIs/j
         rc8reum/VG8+TnxfQbL8KzhdmjhVPwt5OywlwSwmhxoCYkcMCXri6cGomLsKewv2CTTj
         TnZ40Z73neUruyUM/856nJN/5q9JwP1uh3yaBtskj9Vho+mbtRN+8Vg8P4xUYkMFp4cz
         9uNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725903457; x=1726508257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=byJIU7+VKXcDGbAliIIaSqjlb89vjX6kzrYSVpRo834=;
        b=VHYIHbe1Pc1Wm8cXw2kDQDY7pYaKNqSUpLxLgRkHO8qh+CVlC3J34Y6HMcHo8rXTI0
         VrmAtTXX2MDeVC3TVvdnZwqEW5BeIaDyr7IfyMDHBurrsuo/qksgK0+hElOytdceWK9b
         ud5JSRLxei67pURzMpgsixctTAQGlYOdo5cVtYQBL9agm1c/N9pZo0PWixkCejwfFiNm
         gZXh38zBWaJ96GeV4VTk0zlwtXa+6LauW3cU9133WZ09iaXoQPgZmauCDxeaGb5qT8TI
         LvJtMEIHFvrLAOQ56xp+yQXd8RfYi4rA5Bpur3FVmihzv2kK6JpbH0jT7Mf8qZtSyBQQ
         /fYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAEYzfno6jdR1azL0a2hp8PkYMUPO4aYtMNsKU/l7gBrPd1C2RXt5e5/uxg5Uzk1Q8DiBKbQUcGkZTaRw=@vger.kernel.org, AJvYcCXSKjs7/FZ+1NXvFgjcuinXhJh5cowY3bF2T3i/IiISKL89UsF9AuADmsM+qdCD4Lf7zrO2xX38mfYw@vger.kernel.org, AJvYcCXUsyz0Fh9l1PjRGtGpqAqwaeX+/riA6vYL+5Fz8A8msm23reoWQ6plFbev3muImuBnpjC/H8OcDBC1WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynHuZzEKkHK84JK9O6AR7ECgQAaleIiUoaHAs+4DDD2XJ/+vLV
	w9nnrggFS8csME7417yb5nraHl2iY8+Tmezsh9WHbnMfRRgDFI9z
X-Google-Smtp-Source: AGHT+IHwqbS/nBYkCy7ui4hB5FULSU35X9hDvMxTsscNxcJhuxLZKMoDaL4sHm6IwfRe9K/P17rP3g==
X-Received: by 2002:a17:907:d2c5:b0:a86:95ff:f3a0 with SMTP id a640c23a62f3a-a8d245139admr564103766b.3.1725903456974;
        Mon, 09 Sep 2024 10:37:36 -0700 (PDT)
Received: from [192.168.0.17] (cable-178-148-235-7.dynamic.sbb.rs. [178.148.235.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25952632sm371894566b.60.2024.09.09.10.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 10:37:36 -0700 (PDT)
Message-ID: <626299f5-7aea-4055-ba37-b0dff4c457ca@gmail.com>
Date: Mon, 9 Sep 2024 19:37:35 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: savicaleksa83@gmail.com, linux-input@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org, bentiss@kernel.org,
 michael.zaidman@gmail.com, gupt21@gmail.com, djogorchock@gmail.com,
 roderick.colenbrander@sony.com, me@jackdoan.com, jdelvare@suse.com,
 mail@mariuszachmann.de, wilken.gottwalt@posteo.net, jonas@protocubo.io,
 mezin.alexander@gmail.com, jikos@kernel.org, linux@roeck-us.net
Subject: Re: [PATCH -next v2 12/15] hwmon: (gigabyte_waterforce) Use
 devm_hid_hw_start_and_open in waterforce_probe()
To: Li Zetao <lizetao1@huawei.com>
References: <20240909012313.500341-1-lizetao1@huawei.com>
 <20240909012313.500341-13-lizetao1@huawei.com>
Content-Language: en-US
From: Aleksa Savic <savicaleksa83@gmail.com>
In-Reply-To: <20240909012313.500341-13-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-09-09 03:23:10 GMT+02:00, Li Zetao wrote:
> Currently, the waterforce module needs to maintain hid resources
> by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
> resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the fail_and_close and fail_and_stop
> lables, and directly return the error code when an error occurs.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>


