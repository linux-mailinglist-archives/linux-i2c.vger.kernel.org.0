Return-Path: <linux-i2c+bounces-4247-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C52091344E
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 15:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E20F01F235AD
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 13:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8251514DE;
	Sat, 22 Jun 2024 13:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nu2qdadx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42DD16F0F9
	for <linux-i2c@vger.kernel.org>; Sat, 22 Jun 2024 13:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719064752; cv=none; b=S6WCvRzz1zdbPK6fp5uucRc1y29u78Of1FpdGJosIHphjbpdkFWuSjK8vUu3MYdkHsBLd+xoqrSC1Tm7Uo7kux4mFyrmxeraCAST9xY+msT3KV8yBE79mP+E66xIc74ofchfgIw4rN9purGuuVbjw2cUEqkDeeNpdkR13WYTL8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719064752; c=relaxed/simple;
	bh=Hlncw3D0np0NO7WdEKuXDozD6V+UiHGgPNvAKMVaGUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yap6Gd//zw35DM5mLoifsF3J7hTqVOOwYK0HdEXuKWBJGg8wZCcwnZosYcLMggGk+mGBYg8zifPmBo5AD6f9NJ4zYLzzZaVUkbPX7+vOH7KCynHcQxbZNBup6u6NntEsz5Ts2KIgmcaDPx1w/q1b5Deuk+sfQu0QMQuazD6LsOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nu2qdadx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719064749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gPYbXApe3OM15mkD3VSRDUdygVNd6ij8zbxEegihFXY=;
	b=Nu2qdadxg2IBeuBXrVhssq3mNAff2B5E3cQcgN9+b8ZIGSzQcsB/mLQBrCK9v4k5FYMMFg
	z1h56td3sn1Ee/dL2y9tndwTDYivJ6aOzczVpr4GKgM7iu1hAsHC1k7vWABntyXuK2u8bS
	7FdenEh72WUNB2/716GbPwAsr9lIoHA=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-zycQg_c-NgyyJDTiVbZ7-w-1; Sat, 22 Jun 2024 09:59:08 -0400
X-MC-Unique: zycQg_c-NgyyJDTiVbZ7-w-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2eaec29f8e3so21174691fa.1
        for <linux-i2c@vger.kernel.org>; Sat, 22 Jun 2024 06:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719064746; x=1719669546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPYbXApe3OM15mkD3VSRDUdygVNd6ij8zbxEegihFXY=;
        b=wKkFoGyEK0LOhsz5zLgceGpQ/HHygqwYKU3v7XnPn/QLoATPTrvKdR6xCQHoNb26An
         Js6yvTmFw8uetv/7vdQTj8ogMIzI3VRIQv7dV7RG/KG+q/o4uokmysh0hqNmmC0ZsIPP
         jC8jRWVSQJ+N2++y3dOj+1z1KKp4GRkhNDlyaNX342a3bqbVJfe8WMX1u9p5HLwmtXRg
         gwuf9QYdtk4ydaB4haz7s0TCarpey7j4yocGFiGoa9h8/JcKz4Vsj30RR3FYpZI6M5Jx
         /2TQZTFr1SMHIBhY3L2CJXIx3jvlRWmLytKcXm2UQ5RfN+3vB+FZMoxQfX+bC1iziW5w
         m9+g==
X-Forwarded-Encrypted: i=1; AJvYcCVpgjw2mNIuCowo/05HoVuCGLBLadp6u8ssJWjg6sEC61k0EaQaIWqQC7RYaeKM0JjzEEvxwV/lZwLeEeIC9hnBDAGk/Zyq2msM
X-Gm-Message-State: AOJu0YwGDgBWuw19pAudlQm9J6bqelQewB20fw/0hN0eTsP1VFImc2aA
	o7kuDyyWbiiHgjsFbh8AyDMWGm5vHzmXVVqbjepkd51gPDmjIpaHwJAFnK6rAVk6YWTQYh9eMnF
	PlHaNw36532A6YmrDthHQPipzMd2mz+G2CxHDlV+9AY/mCogJK9nRRzn5xX7rGmXqLw==
X-Received: by 2002:a2e:998c:0:b0:2ec:543e:909e with SMTP id 38308e7fff4ca-2ec543e92cfmr11253011fa.15.1719064746651;
        Sat, 22 Jun 2024 06:59:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq/Q0IipgcOSifv55wfdDD3wsLG6VhYCQeFdZ+AzWYdUNiSgyfCDKx7GXFE+bjm/sgw+qAKw==
X-Received: by 2002:a2e:998c:0:b0:2ec:543e:909e with SMTP id 38308e7fff4ca-2ec543e92cfmr11252871fa.15.1719064746216;
        Sat, 22 Jun 2024 06:59:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3041208esm2373429a12.30.2024.06.22.06.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 06:59:05 -0700 (PDT)
Message-ID: <178ccb23-36cb-4f83-8cd5-caa35c37de63@redhat.com>
Date: Sat, 22 Jun 2024 15:59:05 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-4-hdegoede@redhat.com>
 <CAHp75VewivTXEfzdH=cE-HUtDq9RdpzVkBsUqQPTTksF9fJDDg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VewivTXEfzdH=cE-HUtDq9RdpzVkBsUqQPTTksF9fJDDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 6/21/24 5:24 PM, Andy Shevchenko wrote:
> On Fri, Jun 21, 2024 at 2:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> It is not necessary to handle the Dell specific instantiation of
>> i2c_client-s for SMO88xx ACPI devices without an ACPI I2cResource
>> inside the generic i801 I2C adapter driver.
>>
>> The kernel already instantiates platform_device-s for these ACPI devices
>> and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
>> platform drivers.
>>
>> Move the i2c_client instantiation from the generic i2c-i801 driver to
>> the SMO88xx specific dell-smo8800 driver.
>>
>> Moving the i2c_client instantiation here has the following advantages:
>>
>> 1. This moves the SMO88xx ACPI device quirk handling away from the generic
>> i2c-i801 module which is loaded on all Intel x86 machines to the SMO88xx
>> specific dell-smo8800 module where it belongs.
>>
>> 2. This removes the duplication of the SMO88xx ACPI Hardware ID (HID) table
>> between the i2c-i801 and dell-smo8800 drivers.
>>
>> 3. This allows extending the quirk handling by adding new code and related
>> module parameters to the dell-smo8800 driver, without needing to modify
>> the i2c-i801 code.
> 
> ...
> 
> 
>> +static int smo8800_find_i801(struct device *dev, void *data)
>> +{
>> +       struct i2c_adapter *adap, **adap_ret = data;
>> +
>> +       adap = i2c_verify_adapter(dev);
>> +       if (!adap)
>> +               return 0;
>> +
>> +       if (!strstarts(adap->name, "SMBus I801 adapter"))
> 
> With the comment on the previous patch I'm wondering if it makes sense
> to have this to be as simple as strstr("I801") or strstr("I801 IDF")?

We want the non IDF one, strstr("I801") would match both and
strstr("I801 IDF") would match the one we don't want.

> 
>> +               return 0;
>> +
>> +       *adap_ret = i2c_get_adapter(adap->nr);
>> +       return 1;
>> +}
> 
> ...
> 
>> +       info.addr = (long)lis3lv02d_dmi_id->driver_data;
> 
> Hmm... Usually we use uintptr_t, but okay.
> 
> ...
> 
>> +               if (strstarts(adap->name, "SMBus I801 adapter"))
> 
> A dup? Is there a possibility it may go desynchronized?

That is a good point I'll add a small i2c_adapter_is_main_i801(adap)
helper for this for the next version.

Regards,

Hans



