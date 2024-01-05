Return-Path: <linux-i2c+bounces-1160-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE67825843
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 17:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D1901F222BC
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 16:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5765D1E50B;
	Fri,  5 Jan 2024 16:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VaaJ+dGS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FCC3173E
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jan 2024 16:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704472568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SkZ2QPW9ttRJ4VgTv2iwIGdCKtuhdtMLRcYjLgb4Dr4=;
	b=VaaJ+dGSHOEfBCjLRsipwdnPhssOU/x30ks7Ej0efuUur4pYMxmtRwvKTO8N724bOou0DQ
	GzDmkJEwMbkVcUhhuWh5Oo9LLT4rhE9/n51JmFn/jhOu1VM6iLucNARIizpOG1AxjNguB/
	BOU4MSEroX1dEhM5fwZ8szxNuPkZwYk=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-ToWOc79ON4ORcA-LW_ltXA-1; Fri, 05 Jan 2024 11:36:06 -0500
X-MC-Unique: ToWOc79ON4ORcA-LW_ltXA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-50e97aa78f7so1516329e87.3
        for <linux-i2c@vger.kernel.org>; Fri, 05 Jan 2024 08:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704472565; x=1705077365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkZ2QPW9ttRJ4VgTv2iwIGdCKtuhdtMLRcYjLgb4Dr4=;
        b=FMQ0AMWWJgEOEtM8roezVrrTFxjUWCXGqOF9AtWamt6s7UWVqNDaX4WJtZmn1ToU6t
         wAeqcncmaWVXz5C5SnCVnoURowWYKZ6C2l5WQPWxVx05RRpTydJRIx6Gd4AWPIr23LIW
         9MOeFw4zzCHZVIxwYMv8u7PwuAK4YJHV6eH3SkMxkW7rRlEh0yjWqPPplm0EGf9X/3IJ
         8fx2f8hu2RDbO3b/FMjEKMrxlDyJpESPwp0E/nefWmWoIQAuUABuOBCZQwwopKIxz7aB
         8+Wi+fBc0ZraKEJmv0E9EdJoH8tKJ2mPjedoLsKf1FL4PTMwVbvn4cQUinhgI+LBzIw7
         WBWw==
X-Gm-Message-State: AOJu0YzNEgVfE/pSoDjIujElHafNG+YjOKZOUDPQAFiHtGQIcTbN+KAx
	wGCjuclyntCUpjTMIOFUu4tJlywStpA9V3RSch9PHU4C5pM/bvsRHMdr/ya8nIbuxu2/sYxd0xB
	kwzo5j4BgqMQ4kNU/7xIHI5DB+haj
X-Received: by 2002:ac2:5e38:0:b0:50e:70b0:6d32 with SMTP id o24-20020ac25e38000000b0050e70b06d32mr1053430lfg.84.1704472565234;
        Fri, 05 Jan 2024 08:36:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOTMp1+rLvImMx/qlokysMUsHTxwXXVgrn5Va9mbKhQhqmt9ouFQpfP8lJ89FY9A09dYlytA==
X-Received: by 2002:ac2:5e38:0:b0:50e:70b0:6d32 with SMTP id o24-20020ac25e38000000b0050e70b06d32mr1053412lfg.84.1704472564894;
        Fri, 05 Jan 2024 08:36:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j7-20020aa7c347000000b00552d45bd8e7sm1122136edr.77.2024.01.05.08.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 08:36:04 -0800 (PST)
Message-ID: <8b3946e0-7eb5-4e1f-9708-1f6cfda95e1a@redhat.com>
Date: Fri, 5 Jan 2024 17:36:03 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] platform/x86: dell-smo8800: Add support for probing
 for the accelerometer i2c address
Content-Language: en-US, nl
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Eric Piel <eric.piel@tremplin-utc.net>, Paul Menzel <pmenzel@molgen.mpg.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
 Marius Hoch <mail@mariushoch.de>, Kai Heng Feng
 <kai.heng.feng@canonical.com>, Wolfram Sang <wsa@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-7-hdegoede@redhat.com>
 <20231224220742.5cv2a7tdd4f2k4mt@pali>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231224220742.5cv2a7tdd4f2k4mt@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pali,

On 12/24/23 23:07, Pali Rohár wrote:
> On Sunday 24 December 2023 22:36:22 Hans de Goede wrote:
>> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
>> of the accelerometer. So a DMI product-name to address mapping table
>> is used.
>>
>> At support to have the kernel probe for the i2c-address for modesl
>> which are not on the list.
>>
>> The new probing code sits behind a new probe_i2c_addr module parameter,
>> which is disabled by default because probing might be dangerous.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> I would really like to hear Dell opinion about this change, and if there
> is really no way to get i2c address. Could you ask Dell people about it?
> Always it is better to use official / vendor provided steps of hardware
> detection, instead of inventing something new / own which would be there
> for a long time...

Unfortunately I no longer have any contacts inside Dell for
this and given Dell's non response in the original thread
which started this I'm not hopefull for help from Dell here.

Also there original reaction indicated that the info is not
available in ACPI, so probing + extending the DMI match
list seems to be the only way.

Regards,

Hans



