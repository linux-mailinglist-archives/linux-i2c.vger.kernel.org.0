Return-Path: <linux-i2c+bounces-1163-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEC5825A4C
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 19:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21067B214AD
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 18:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008A835EE5;
	Fri,  5 Jan 2024 18:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4ekh2Up"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849B235882;
	Fri,  5 Jan 2024 18:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-68083a0889dso8698066d6.2;
        Fri, 05 Jan 2024 10:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704479899; x=1705084699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXhQvvAGIlBzXAM7PmkHnuKSBIHllRsmCHzNMoYEgX0=;
        b=j4ekh2UpmzbIeOt/0eTWyN7yLFjk5N9GiSqizgCeeGVDJ+WdT2WmQomauoIyctXc4j
         mYZCPiVu4cwvIdOnPq8MQhBT7G6J43IxsLGDTj3yGwnqNLn6P3Kwh67iJPSoZuhBKCBh
         OHv/pwxYqHHxkvE3nvhZJfZz+5gVSUDjrAvhgLi52PHq7Oh2A66zTj9Plo5pHZgPwvMd
         qEvoTB2jc+Y5NrgaEdnPwV8B1P1yLL9OI3C56aST0yo6U64emuoO7eSkw//ZP0PjxEXN
         pFAalRBen9ATV7ZMcdWFBqmJk88qzLt7KhY/sThA0Rlsls6x81U+cTMDtnXkeqmX9iwB
         /vGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704479899; x=1705084699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXhQvvAGIlBzXAM7PmkHnuKSBIHllRsmCHzNMoYEgX0=;
        b=NZGvpK7ROQoQAKoK3QBVVIcgx494zCbmZMPogvIhkJAVV+RNNn7y+ybVadulehIJEa
         AOGbBIOtZpVKodTaDW6tnT3X6yUqfMqv5YIQ+J74qZNVuHuo0TyZgZIj+vJkbSgIGfxJ
         bre9vgTdx+nl4fHeBtev9/HcNGoeMSKdJYJlK/QADx4fHBUBvFJJ+2CivIeaQA88Mv/Z
         vnuxViMeBPWIlpi/lpt06Q4bPyIPrYtClD9tWrDdW7t63zXMMhnoXbNk+sr2Iw2I19p2
         4sYpzJD9pRHVCXkKojWr+oAT/GhXWNxLFtFTW5TOHyxvxHhWqH354nrQgikB+k3GS7Rj
         8urw==
X-Gm-Message-State: AOJu0YwFJk2DqsZv32dXUpYX4jSTJSCZKgmOcbp7oPCBTod9+ZSxz3uX
	xZdTcQJXFw5zzqjd99FA/ulvub4I580ITCJ/W70=
X-Google-Smtp-Source: AGHT+IH9acnv7Z8bh/LaHOiTxCE98XDlYg1uhfFMU2KqJBTuTUWkerkD9wi4DWoJrazZIEVQW4RpFqXABiAIZRpjcDA=
X-Received: by 2002:a05:6214:23c5:b0:67f:74c8:70d4 with SMTP id
 hr5-20020a05621423c500b0067f74c870d4mr2511706qvb.41.1704479899261; Fri, 05
 Jan 2024 10:38:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231224213629.395741-1-hdegoede@redhat.com> <20231224213629.395741-6-hdegoede@redhat.com>
 <20231224220321.vqzb4q3ut3dz3rl2@pali> <c3d903e8-6611-43e9-ab31-44e92371b0c3@redhat.com>
In-Reply-To: <c3d903e8-6611-43e9-ab31-44e92371b0c3@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Jan 2024 20:37:42 +0200
Message-ID: <CAHp75VdoSaVMkyzFdKJYu17=YZNVFubUdWAC6tm5TqN3Ccvj3A@mail.gmail.com>
Subject: Re: [PATCH 5/6] platform/x86: dell-smo8800: Instantiate an i2c_client
 for the IIO st_accel driver
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Eric Piel <eric.piel@tremplin-utc.net>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com, 
	Marius Hoch <mail@mariushoch.de>, Kai Heng Feng <kai.heng.feng@canonical.com>, 
	Wolfram Sang <wsa@kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 5, 2024 at 6:34=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 12/24/23 23:03, Pali Roh=C3=A1r wrote:
> > On Sunday 24 December 2023 22:36:21 Hans de Goede wrote:

...

> But AFAIK / AFAICT there are no actual userspace consumers of
> /dev/freefall so removing it should not be an issue.

IIRC/AFAIK there is at least one (simple) computer game using it as a joyst=
ick.

--=20
With Best Regards,
Andy Shevchenko

