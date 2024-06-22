Return-Path: <linux-i2c+bounces-4269-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 220999136C5
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 00:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC2DB1F2269C
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 22:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF24056458;
	Sat, 22 Jun 2024 22:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeE2p2vK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6414D524;
	Sat, 22 Jun 2024 22:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719096647; cv=none; b=uzZjshx5QYUQHAT9Z0v5Xv+5CroBgY8MYGc6Tib1mmhaJ5jGPAvxzItlsV8sHT2mT8u3pKQdyjU29DplA1jMk+z+/eo7BfiKNm/MGQDOqUecbZsm7ty2aLkpCroV2GbEZVV3n5t8kYbKV4OHQdEOr+ICyDQwVyC0Cmd9VRi6SOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719096647; c=relaxed/simple;
	bh=B2m3LP+Y+ePM15jnmHfY7MEsmC/Z4ycQS/bp52qHAG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvgKeqa8ziG8Evc7g6JDtVujNhxw+OQRaIVC9Qhf4ufsppGGqTMwTYZ+I0ocYzsfDRlBOWE7kcWCHP3c72EpxYC3NNI3UBRlUto6L69BqVlRwPjG2ouORHiJChzmryNeLZsX2vD6wbye58NaOfr52/2UbMQCZBcyL0F8KyFqANU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeE2p2vK; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cdea1387eso782791e87.0;
        Sat, 22 Jun 2024 15:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719096644; x=1719701444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2m3LP+Y+ePM15jnmHfY7MEsmC/Z4ycQS/bp52qHAG4=;
        b=DeE2p2vKCnKGWrY9DXTLXZRo5scCgpP34sSDc3f5DJDJ3xPRRQyj16A8ehWnyRqES4
         3qSGBSIyTVXEfwzl/gLbEnGiG2jnDqZjjq5kFhx75UbpNooQGomiUc2D6Rc8kaY0SDrL
         5Ldf8K1Z6bD4SH1zVvuw3A/4z4ZTNn9Cf9w9iK5ZzRG9AjafhvbnSLFaLnE6vXiIvTab
         irI4/oldb3sSsRGs9GCATUsidATRTpmN8pi6GsgoQ4gNP9ZmwpF/89UQBsOQw5dwtxwV
         KtY8lOXIEDvr34a2hnSG2lVoacM4Z+S00MsCOB37WpXJaDMJHtQiCYKyTN7EgVkUuCEg
         YS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719096644; x=1719701444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2m3LP+Y+ePM15jnmHfY7MEsmC/Z4ycQS/bp52qHAG4=;
        b=Tx7JsFDeE0o70ZMU4OlF7/pVe2jnCGXR1YPc8vTD9t0+fExCJcLWd7VcAtQFWl9kQL
         ONwT+CNOmCSqAJy6dKz9U3RLeq7wIQ/Ly5e9x0KYlZALQ6h4cDZMn3TETmcj0J2cAF0h
         oGrk+Ccezj+feAXcP6Xdtf3B8hEEP12TE8jmq5GgdRCAfXgI25OOMJKvnmzausySq5MI
         7FnvHOGry6kekhZ2qg8cWs8NHmNkP9TCv3nV0HLy1KXDuChxEFpu0Orn0Sqwvip1OY+K
         InxsAQQroQs3dn2KMaIx7um1hZV6NBAxx4PqvkQMf5fAmijLls8PfURLO4l1xHliAMNf
         K4nw==
X-Forwarded-Encrypted: i=1; AJvYcCV1IeP3aH0zbuxyrmcpMxEDMZeVxWvB5Sq7z1qe4DmyN35xnDlBsq+CK5lkXkSSpjjxHGOI/ElXHpVyIqPvQEtQyLG6hS4gwP303pwVwK1EWQEj+h9uOJBF2miswTwdPfBZ5PewJNBzjhzqW7RreA==
X-Gm-Message-State: AOJu0Yzq9D3ffRhXvi18+B9LlR5cOVj2hUnLzqZt+a4dD5MfQCiG/2tS
	8GSm5zXOsokgb8PROIK69DUVOwB5mLiVUDb1UkzJq+xkBZXurf50vFuD9mlx55VwaeB7SOxwEVH
	j2IKwkDNdVf5QHdr0kszGln5bTn8=
X-Google-Smtp-Source: AGHT+IH8JHrvcLY3Aouxs1PuAFreUd25xWPj1iI/ODsj8DEOm7EG4m3q3nJRV+fxIKnQ6iYJYtYJt0wJWqzAilOn+2s=
X-Received: by 2002:a19:435b:0:b0:52c:df8a:df4 with SMTP id
 2adb3069b0e04-52ce1865a2emr341072e87.69.1719096643719; Sat, 22 Jun 2024
 15:50:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621122503.10034-1-hdegoede@redhat.com> <20240621122503.10034-7-hdegoede@redhat.com>
 <20240622133237.b5xsetcxnfu4vu6u@pali> <fbc82ede-f23d-422e-ac76-7363e84764ee@redhat.com>
 <20240622145057.ab7lsp3dtkjge6vd@pali>
In-Reply-To: <20240622145057.ab7lsp3dtkjge6vd@pali>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 23 Jun 2024 00:50:07 +0200
Message-ID: <CAHp75VeRpkgoGEoeK+vskDcsyZ6jSMsnDhU6bwS66TH9-MHy7g@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>, 
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>, 
	Dell.Client.Kernel@dell.com, Kai Heng Feng <kai.heng.feng@canonical.com>, 
	platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 4:51=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> w=
rote:
> On Saturday 22 June 2024 16:21:28 Hans de Goede wrote:
> > On 6/22/24 3:32 PM, Pali Roh=C3=A1r wrote:
> > > On Friday 21 June 2024 14:25:01 Hans de Goede wrote:

...

> > > Have you communicated
> > > with Dell about this problem?
> >
> > Dell is on the Cc of this thread, as well as the previous v2 posting:
> >
> > Cc: Dell.Client.Kernel@dell.com
>
> And what do you think, that if you send tons of long emails with C code
> to lot of recipients and add a carbon copy of all those your emails to
> some corporate group address, that somebody on that group address will
> read every one paragraph of every your email and tries to detect in if
> there is not hidden some question to which you want to know answer?
> No, with this behavior you are going to be put on the corporate
> spam list by automated systems.
>
> This looks like you just wanted to mark your personal checkbox
> "I sent email to some dell address" and let it as is.
>
> In past when I sent private email to dell I normally received responses.
> Also they said to me that group address is (or at that time was)
> monitored.
>
> So it would be nice to start communication with dell and figure out what
> is the current state of smbus address detection via ACPI/WMI/DMI/whatever=
,
> instead of adding this hacks via poking of smbus addresses.
>
> And in case the mentioned group address does not work anymore there are
> still other linux developers from dell who could be able to figure
> something out.

I would put it as "does Dell care about Linux?". If they do, they
should react to the messages in the Cc list. I was trying, for
example, to communicate with Relatek on some ACPI ID matters and
despite having tons of active developers it was no help. They
evidently don't care, so why would I?

--=20
With Best Regards,
Andy Shevchenko

