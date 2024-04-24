Return-Path: <linux-i2c+bounces-3102-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D43D8B09D3
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 14:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 123C41F25648
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 12:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2481422AF;
	Wed, 24 Apr 2024 12:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRhW5Erz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3B61DFF8;
	Wed, 24 Apr 2024 12:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713962290; cv=none; b=SXovJrhVb/c8IAl7n/N8VDbG9DCLf8d9TiPm21NbgA0gfGVzTowtVYzZiXJfzZzPKbBLK74v/RD1WGpWVps1wWV4f4hau4Q3Xzf+lZNMJvCwPfuBYit8YRmTxwmIsao3ME2632T4fVEeBl/hehWkbLioKli15vfEzzWoVmFCvRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713962290; c=relaxed/simple;
	bh=xsF+vnHa/8cFh6oxrPVKsyuMm7DOJ2XE9MKSOl0XahM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UeU4K8g2YObWF3YHFkaex1EbRCaOAqPMu71+6+LaTyh7GUVVFBvhCEm7RZlzcSw+KxFm7ij+dJFAPQkLvvxEt42ddOAHuPKdv229wljy1bFGrAWvhDdyv2HT0xbnS1XgwQrxu3GtqvFUyp2WU42dK7kpdZYSyZEl5nGVJ8SW/tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRhW5Erz; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a557044f2ddso758299466b.2;
        Wed, 24 Apr 2024 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713962287; x=1714567087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsF+vnHa/8cFh6oxrPVKsyuMm7DOJ2XE9MKSOl0XahM=;
        b=kRhW5ErzlOzHVchYEduLow7OecPtFYE/3uCpsEVZ0un/anOjyzhN/3z7n+MebyEfo1
         yTlOcatGD5HOMEvNdvMmY8eDboJJy9Jm8Q+H6FVliG6GOrFBLzJq2RPZuW9nJ4Yg/Vp4
         qiQLAi5niBq84rgIPLyMS8WPc379b37TeFpXkt6DQQgnBwp6nEwW+icwGztmHVbHFaOi
         PWjUKKzxPYIihfm1NzETD0I3RF4Uq661msu9lwfPfcHvWfFt/5kHRqZWpEqqIABM1BaM
         LIwcJ0dNKK9ArJitiXb9IyuA83LMHg8f/FsvIOoae3CRPT1cAgE1hReSkVACCDneJUvf
         iFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713962287; x=1714567087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsF+vnHa/8cFh6oxrPVKsyuMm7DOJ2XE9MKSOl0XahM=;
        b=j3otTVLV4EMvpIvISj546TTusm1JzE7DKuM0LU8BTW74N0Wc0xUSIJf4hRFwLwAriO
         nc1meRiLuIHiw5IlSYnTgzzNyAB4J0u/zTts+2yt5sWV5/F4n+1vAgEba9tydbdVXBcA
         PpbX53vNQ0fszHm6R6KtlRtV/pJPPXrCZs6LzqYBOnFSOrPlfc52UGjIctcnYq13VpQj
         Fto3pEW3Z07a3FYqH8HlGpVJY68QCUA2/8EPJrLcIrsSPyO8AyDOBE1sudWezYckNYga
         362FMd1NNOQ2u5sFjxrWDNyLo/Pp+u/l9o2g2pdA5U2bZjbInVfC0qwaaAov5Yry+VNq
         OMeg==
X-Forwarded-Encrypted: i=1; AJvYcCUHjWyRuyqyxy/Z8obYnqtnMOrIvKwDthUtcTlDsO3xOJvU1klP/TglhBqMbMWWOruRTjbRoW7frtQ8yLp8+SVPUSHMWvE1l7F2KPHklHWWmVhWJ5RqpKNDlydxTzWRKplH
X-Gm-Message-State: AOJu0YyMGG2zDlMwOITbQPyd+AvAYZ1hes98BmAzgVZVSOPafjL1p+yf
	vHenW0FVx1/WFoqbLfYeNPV6qK85kOieJdO8I4echqhbaqqdJUOuFCAKL9pUKlrIq9PvwoBaP/+
	hz/ve9bDsHYPNtmZveYcISWx3wls=
X-Google-Smtp-Source: AGHT+IENBsAzpRXCrswRvPnYEQLcwbTwqFx6nVVRn5B1UENgzLCMNp7sa7D7MHL8LGRrRd4nkKjWRecasIEpwSpRQgU=
X-Received: by 2002:a17:906:3759:b0:a58:9b82:93bf with SMTP id
 e25-20020a170906375900b00a589b8293bfmr808296ejc.61.1713962287334; Wed, 24 Apr
 2024 05:38:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
 <20240423233622.1494708-4-florian.fainelli@broadcom.com> <ZihL1mb1OzwdLSvN@surfacebook.localdomain>
 <95ed17d4-06e5-4ed2-add1-a2bf14e29dd0@broadcom.com>
In-Reply-To: <95ed17d4-06e5-4ed2-add1-a2bf14e29dd0@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Apr 2024 15:37:30 +0300
Message-ID: <CAHp75VdaYOy0uuLuNCVKY4Y_fxx5_+xCEFGSR3dCKxkkDfGxBQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] mfd: intel_quark_i2c_gpio: Utilize i2c-designware.h
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Duanqiang Wen <duanqiangwen@net-swift.com>, 
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>, 
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 4:28=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> On 4/23/2024 5:01 PM, Andy Shevchenko wrote:
> > Tue, Apr 23, 2024 at 04:36:21PM -0700, Florian Fainelli kirjoitti:
> >> Rather than open code the i2c_designware string, utilize the newly
> >> defined constant in i2c-designware.h.

...

> >> -#define INTEL_QUARK_I2C_CONTROLLER_CLK "i2c_designware.0"
> >> +#define INTEL_QUARK_I2C_CONTROLLER_CLK I2C_DESIGNWARE_NAME ".0"
> >
> > So, if you build a module separately for older version of the kernel (a=
ssuming
> > it allows you to modprobe), this won't work anymore.
>
> Sorry not following, was that comment supposed to be for patch #1 where
> I changed the i2c-designware-pci to i2c_designware-pci? modprobe
> recognizes both - and _ as interchangeable BTW.

I'm talking about something different. Let's assume you have a running
kernel (w.o. signature or version requirement for the modules), then
you have a new patch on top of it and then for an unknown reason you
changed. e.g., designware to DW in that definition. The newly built
module may not be loaded on the running kernel. Also note, here is the
instance name and not an ID in use. The replacement is wrong
semantically.

--=20
With Best Regards,
Andy Shevchenko

