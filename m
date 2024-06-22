Return-Path: <linux-i2c+bounces-4265-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6359136A6
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 00:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 867EE1C20A6A
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 22:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E314E6F2F0;
	Sat, 22 Jun 2024 22:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTedPcH9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AE157CBC;
	Sat, 22 Jun 2024 22:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719095828; cv=none; b=cCkWkkY3NpBLMXJYc7dwihF5eOcQE1dZW4aQ4ONBA+lwMzuTTDACZ5qNyB7Qy02G1kexwwWfKZAt8TaMPSVDsFTcDxDJMmqDOldltcYH7Yqbz/CKRxoTv8jTNe4peNM1b5cr1qBPb1rdovrtf71xHsDCkJlXQOPHLVOADmNdmd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719095828; c=relaxed/simple;
	bh=ce6G9ST8XvsjRaNKDDXEG2QEjKS/tA2ym8qEw/IRo7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOGG9EFs7EpYIPqwZ0RsbHRObMMbaA9Gdd+TvtvckjIwsrXsuzvHW9XjO4IXhDhI19TTSbUanxdVCxxJJyAheGM8g4dsYj5eGaept9ZL1XrhaCK5qhYlRVfJcjzBmIuPP82ghkRItsh0PTZir0M4yDP2Ra0MWkJtL2+YAKsRybQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTedPcH9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-364ff42999eso2340576f8f.3;
        Sat, 22 Jun 2024 15:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719095825; x=1719700625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ce6G9ST8XvsjRaNKDDXEG2QEjKS/tA2ym8qEw/IRo7w=;
        b=NTedPcH9kYJ3MYedWCJDqjCcJY2BDmpDpHUFLbesjDyCVfCZbCx3ctYlI1/V1CdFmZ
         qwsSiNYCPmhwKYzF34H8D15it1VDnSS/y3E3bEUdDZmgIRHyTHO547+73nJ2N6V1ybju
         JPs5EC5i7M64zO2hDtAZn2WWmSe1MJEOrwoZscvnMxXyNMJ4dYyCwdafgPWhPWNpHLzC
         qUDjs4aTwNvzXUdqKbZmwNJaJei0ceEwcT9ocfChQ1f3LkBqZalgvuFZFHQUbHIP0ULG
         h+9Jnj8/n67S4o/xwBkW2IyRM4hEDrC+Y3rFTfYpCsvZNdlXblAykZuOnJ9jSy5bfLvP
         D7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719095825; x=1719700625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ce6G9ST8XvsjRaNKDDXEG2QEjKS/tA2ym8qEw/IRo7w=;
        b=iGFN/aNu4CkwGOM/Q6eML+iFqsFQih+TTbDyw82qrk8pQ2MrVk98TJ93xT6QUJ+Kll
         CO5tTYomv6OrJD25zeBUgyjPRIOUJ4sGf6fafadc9wOvbyMKL4OCAT1+E4LqOTkNd3bz
         P5qI+eRNX3VgiSpdE7sesZYfY0WZSXrhsYfIFJbMPm1qZDGgLNT6Y4o0fSZ+LCZNYbgs
         fSXr/iE4/H5rTLG0LBDQnD8Jy8sdvSkjxSGrJVzxX+6TUYWq3KpuC29XpWgKj0BF8okR
         qT9Z1HfQ/wVAE+zg6pOVtU3rDjQVSfz3rkY1NTPDJR0iupaE6fEhxIaSdIppOFVJN6YD
         j2wg==
X-Forwarded-Encrypted: i=1; AJvYcCXyZa4y8z3ylOvEKI/y7gRFtyzxwNFNFMaImHCCdmogZAMcOfcYcRyJGDntXzdeLhpJCj7/CGB+fKU6EPufEIWPacwbZ6HRFf5w2M4MY0nt4CU5X2En3HjUVWZLJ5GxbqBIOEhXImcycb3BvjNdzg==
X-Gm-Message-State: AOJu0Yy/UYdWCuEKeOndBf1rOCkki1ubfudCEc9TgMKeJgIDIxhBoEsX
	o8ee7mlfuv5X97PCLiXyGqnuk9A+n2DM+etZIvwNaV1eC24xFLSqWkxzWldJILYyCrulk1t3Gs5
	JbR+WhqNTKLuIlG0LRAv3o4t3XNc=
X-Google-Smtp-Source: AGHT+IGB0D/soSHa8tPII/mIzmOtP7ZZQplJVaJuE+m4AzbKZd7NinuCQJeKIDr/bu+DmJcLh6I0oQe4nv3pRFqdlYs=
X-Received: by 2002:a05:6000:2ab:b0:366:eb00:9ddf with SMTP id
 ffacd0b85a97d-366eb009e92mr240537f8f.3.1719095825272; Sat, 22 Jun 2024
 15:37:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621122503.10034-1-hdegoede@redhat.com> <20240621122503.10034-4-hdegoede@redhat.com>
 <20240622131650.qxoxtp6aaitpar6a@pali> <ffbb42d9-f6c6-456e-8427-0c75c2a2e90d@redhat.com>
 <20240622142015.7cfl2onabpr6kl6r@pali> <b76dc029-ded0-4911-92ee-ab46351105cc@redhat.com>
In-Reply-To: <b76dc029-ded0-4911-92ee-ab46351105cc@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 23 Jun 2024 00:36:28 +0200
Message-ID: <CAHp75VfC-TBScyvB8uWiu2GqD2xCpNxBgavprZmv9OXPBCPPZQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>, 
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>, 
	Dell.Client.Kernel@dell.com, Kai Heng Feng <kai.heng.feng@canonical.com>, 
	platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 4:26=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 6/22/24 4:20 PM, Pali Roh=C3=A1r wrote:


> This is code for special handling required for SMO88xx ACPI devices,
> dell-smo8800 is *the* driver for those ACPI devices. So this code clearly
> belongs here.
>
> According to diffstat this adds about 400 lines of code that is really no=
t
> that big, so I see no urgent reason to introduce weird tricks instead of
> standard driver binding for this.

This discussion may make me wonder why we don't use
MODULE_DEVICE_TABLE() for this strings, because it's a big advantage
as well of using standard kernel data types and APIs.

--=20
With Best Regards,
Andy Shevchenko

