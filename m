Return-Path: <linux-i2c+bounces-9379-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3BEA32579
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 12:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B16197A2495
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 11:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E12320B7EB;
	Wed, 12 Feb 2025 11:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSgO0K2M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A91B20B215;
	Wed, 12 Feb 2025 11:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739361411; cv=none; b=Xmc4gf9KdkfITWJV2sYreVwwUiuuJh519zGiRBwzYqHqeZjzihfHrD6NPpicxS5OxSQcgZNpl3975lVeiLRdaFV5pPC1QOYsfjXSq21N35OTck9eFlxLRjilmHYtxtyjUiRRDXjqRt7gZ73qJIak9pDhzrt6Ji9CvD366NsmCUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739361411; c=relaxed/simple;
	bh=ZJYwPXafbLpbFXpYyXSp4HpahkqjCUYTvqjzYBuK0TA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L8yQX4fPQNdm4uYHAng9C3FyfidxX9OHh/rARsDtnDJXmnLa/3kWWhO1pJdVJ93fTJG7tG+LtUVt/cTyNjcgyLkGxoLc07PMF/43iYab0mmrKbrwg/UlwCL4zFS35TOZHwW62KN/Tx+UaXXx57NNJxXn3AdY3V34J3Ly4KUkxCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSgO0K2M; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4bbc406499fso960715137.1;
        Wed, 12 Feb 2025 03:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739361408; x=1739966208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnPxrNDZfuhRPVwBg98GQ1UnTL3W5SgzFezNNJHUBMo=;
        b=nSgO0K2M5GyyBSvQ1sgswk3Lt5YN2FO5klCLLbDNUA1llxarUp2ncir6efCUwp+EcM
         06Yj2ijeiaHFs6oYjlOGp81jmqCBXkzYI9ekZA8vx7oQeoLBO/A8ljIxkMT4wfg7UFSW
         kEeOpc9IzG3H1MI0Qxb6AD5j97ZeU9oecUvc0lMENMxpN1cFH68q64Zz/bBR4k2RW+Yp
         udSCf26dyDdhO8qKlzeLKMDB9G9NwhKdDW90r19Zt0b6GdpfJXx/vrM5zGebORRysFtz
         t0WF3Pbnt0Sw8srmhfcONGGRXo7unt4MQINbpUYklXjtB20KCQ0Wjfgo7WQP7us68sKe
         ysqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739361408; x=1739966208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnPxrNDZfuhRPVwBg98GQ1UnTL3W5SgzFezNNJHUBMo=;
        b=hqGEwv0crhkleHC58eXKXbYf90AoflaNDrxEp53gTxrIhRvAxXei3cnB3Ade0yGcjc
         YjbRvYsa4VlDp8pEIsI7sGnmKP+m83S7NJhMrgrC8kVgeP4PAEz1g65a81GBPnrdLRq6
         rSBTg303jcbH8D+Re/4+km+b8fUarfugA+lZplGHZ8MD4QBrogbsM8ePRELwkdL/1EET
         L9I+XfUl8ftfT6j8diJ0OPVIC2eSPi0GQljaukAb2gRZfpgePJkq7JHQgJLdR2Jlmfsv
         2HPDg9t/lMX14I3MoGHdmvTdJEv/XxrvpM9AtDjq+IHOg9TZTahDAIuFvh9zOsh5/rUc
         zi4w==
X-Forwarded-Encrypted: i=1; AJvYcCUNyQV1p3qCDfvaG8gFy4eFu17n2GCsJ7h569x7pnW8++Bv1i89ePIJitymbhhdbVED4+UGHFjCtPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/UJ75tayWTG4I1mfDEgHcmfqhH21+lKWub1LGVJLOcjOQ2yH7
	CqUsqg/+xlqEMJGfTecSqED9257VZqr/hk9nDY7rw/t0fLkucNgxMFwRpoQGsVg3i5Z94cU3J5L
	t49vF3MXoncOKRXzMT0mJzhO3juwKlvkL
X-Gm-Gg: ASbGncvJPWqiMe8xFnD6uhLo3mV4gwrimK+xTeFOVZYp9vqmm389q6R4SFoLokW9jkE
	UEYcGUNjrEIDinN9Qx3Y1/TuBoeBCBiGgdqtaMQY/0LiLhKBBVscirMPWnbGTE4zRZnHybOxm
X-Google-Smtp-Source: AGHT+IHARbS5j3F8q43YFTk/X9B7HK7J9Piiwy2nOONe7bpzQsFTh4x0EpuDjW+Q3Tqz9L9RwEhdq4q35yt74XFlvHU=
X-Received: by 2002:a05:6102:3750:b0:4bb:c490:7d6c with SMTP id
 ada2fe7eead31-4bbf54e6a15mr1089419137.9.1739361408367; Wed, 12 Feb 2025
 03:56:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACSj6VVNFZWJZVk4k98QYGdCQ=u5TzyfRE9NC_3xAKMRoPGzJA@mail.gmail.com>
 <Z6yBGoUeoNQGZHVn@smile.fi.intel.com>
In-Reply-To: <Z6yBGoUeoNQGZHVn@smile.fi.intel.com>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Wed, 12 Feb 2025 15:06:37 +0300
X-Gm-Features: AWEUYZna42qbt_yIyz3uGw1HeA0MBjw8gXO_ftC1A3jfTE_pnyzBWODyWrTxbJM
Message-ID: <CACSj6VWkDnQj2=tOPMsbTo0uerNSR6sGSMO9c1FxWbEfYFz7Lg@mail.gmail.com>
Subject: Re: Assigning fixed numbers to i2c buses via ACPI code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm running OpenBmc project on the x86 host. One of the applications
from the OpenBmc ecosystem tries to find IPMI FRU devices on all
available I2C buses. For that it would perform some transactions for
every possible I2C device on every I2C bus to understand if it is an
EEPROM or not.
If the user doesn't want to scan some buses it can provide
blocklist.json with addresses of the buses which shouldn't be scanned
for FRU. But this blocklist operates with absolute addresses, which is
why I want to be sure that my I2C buses would have fixed numbers on
all systems.
Also it can be the case when the user wants to make sure that buses
behind different I2C muxes are numbered in a particular way.
Shortly speaking, existing OpenBmc software relies on this alias
functionality in a couple of different scenarios. There are many
examples of its usage in the BMC DTS code for different machines.
Therefore I wonder if it is possible to do the same with x86 via ACPI
tables to support existing OpenBmc applications.

Best regards,
Konstantin Aladyshev

On Wed, Feb 12, 2025 at 2:08=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Feb 12, 2025 at 11:18:44AM +0300, Konstantin Aladyshev wrote:
> > Hello!
> >
> > Is it possible to assign fixed numbers to i2c buses via ACPI code?
> >
> > In DTS code it is done via aliases
> > (https://docs.kernel.org/i2c/i2c-sysfs.html#caveat).
> >
> > For example:
> > ```
> > aliases {
> >     i2c20 =3D &imux20;
> > }
> >
> > &i2c1 {
> > status =3D "okay";
> >
> >   i2c-mux@77 {
> >      ...
> >      imux20: i2c@0 {
> >         ...
> >      }
> >      ...
> >   }
> > }
> > ```
> >
> > Is it possible to do something like that in ACPI code?
>
> Why? What the problem do you actually have?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

