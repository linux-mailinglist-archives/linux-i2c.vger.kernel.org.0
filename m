Return-Path: <linux-i2c+bounces-4229-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDFC9129AA
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 17:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73CFA281C31
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 15:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF69502BD;
	Fri, 21 Jun 2024 15:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtU7oA3p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A3ADDC4;
	Fri, 21 Jun 2024 15:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718983856; cv=none; b=O4x8Um57gFf9Wff8E695x01e29zNSEDv8FjbUrNi1Ol1+rWCMaFLE1OFXHGTvHgdsn0IgmUM6Tlm9j0wkHDg1kuTw+Z5pYVe+WE9aw4iXhVwx8n92P0PguTrIRf86BhSpV5OvbQwqgfI3qrgzS1RJygs6NjnopiKZ0w3rYxeduM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718983856; c=relaxed/simple;
	bh=QAop+yWZ9ih1BC2Wd+nUobE15scTsvIQUVbqo+8zDzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PCOpvlJemTZwJdrLRR/ZYY0Q6WL7sL++Nm9k470HcDt7OGfefa+SfZVG5pE54X3KxVjK4khUV1YL79DqGBGG+gId092lNfkiC5l//YA1C8AG1IIFQgqLuGuayS84DU6yThU73NENok1mLHHAKYY86byu+EyijaW5olE+1TZSZzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtU7oA3p; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6f1da33826so275439366b.0;
        Fri, 21 Jun 2024 08:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718983853; x=1719588653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TUdLTfhiAEpx67icpjEWjmON9qGeQJf0uY5rhc4BPE=;
        b=FtU7oA3pTAAlHN72aLOMWLc/cctsW+SLp5fhtnt3lpbDvKcRfCRX8qCnWa/byd2IpI
         x5/nnNePZu0iavu1acgjsFPiB3MayDPLMmiUSWe77bbHfjkR5/SbST9X+4Poo2NX4KVX
         Kd6B+dsf6Htkyy5rQvxmQ/duMIL+Qm+/uFiPtCgLMhIrVQIJRvlMG37VLV4pOJ2tHWCs
         LPjyRWKgQonrqvFg14RJ80yFmQ3c6E+mIDXBOKGLu52JAqtwKMFMs4ozhZR5sKoqfYt7
         3VAk982sgZnOD5/2P/4jmpcVUktAfXpfQ7NrsGG/4BPaqXtTqRzOje2Y19jlk+Oa/CMk
         RKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718983853; x=1719588653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TUdLTfhiAEpx67icpjEWjmON9qGeQJf0uY5rhc4BPE=;
        b=oKDkBPw135y6NyCH+Jx+LHfLehuxnJ1vl6xl+MPsbBR8eaNDl2UE0rJRkl+/Sla3F3
         twhlvKAqwPnFfBii9BZPgqav1mdqneqfsqIjXsumjNOlPWvrQ/tglcdSbv1v1eArkvDA
         n0qD7yQnUAuxUElh6ZruUdv3YG5Tgq3Ze2L5AgTsI4b3S7Yly6MPttnsUrWHAPTPNz0i
         rt7mDt2xJhrCEY5vAR2OUr9BwGCb+kXvZT48X3V8+y3yYedQBNLWfBipQOqyDtsWqkcF
         OftaR3+5or4XG1F9zBQ+O6W5qwXUN81huM5+sxI9wrO0MLvNE/cLxr3RXB93DRDPbye3
         FUrg==
X-Forwarded-Encrypted: i=1; AJvYcCUxBr4VZ6VZh2jeS3il7KLQDxbNjV0ERxqlwS7oyCrrM+6GTblzx2/cwZQZE8o20jV/Ikk/pzbnNZ+4mSQTa+IcSxtEuENeQZkziLioZMu/cA1AKlLLU20TD02DOhdTxflgtZOjgiWpDiGzLUxbaQ==
X-Gm-Message-State: AOJu0Yz5CnCb3AjEKerTidN/qhrEqkyUR7CuW6XCJ/tnvI7cD5qy9O1j
	S5ppW6xNyW1maPaHyFk2BRJJvZ/rpE3+zl67OGnyd3nKYkaYV4btyHlpjWJlKAvZpE2Xci8qyYP
	j4drNJ8iOIx0fCsMNUxiRYMKlpc4=
X-Google-Smtp-Source: AGHT+IEa+5JoGUUSZAjCJbtOHjWTh/lbFKJ07LJOIn9dqocse43j6KG4lPkSFrFDCa+qXMX+6GhAcokyx2b0aBEM9KU=
X-Received: by 2002:a17:906:1650:b0:a6f:21e8:ad06 with SMTP id
 a640c23a62f3a-a6fab62a711mr680352866b.20.1718983852771; Fri, 21 Jun 2024
 08:30:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621122503.10034-1-hdegoede@redhat.com> <20240621122503.10034-5-hdegoede@redhat.com>
In-Reply-To: <20240621122503.10034-5-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 21 Jun 2024 17:30:16 +0200
Message-ID: <CAHp75VdHRhC1txRfb3WrQxapOOcE0gQhpD8H-Bm=G-eakVW9FQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] platform/x86: dell-smo8800: Allow lis3lv02d
 i2c_client instantiation without IRQ
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

On Fri, Jun 21, 2024 at 2:26=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> The Dell XPS 15 9550 can have a 60Wh battery, leaving space for a 2.5"
> sata disk; or a 90Wh battery in which case the battery occupies the space
> for the optional 2.5" sata disk.
>
> On models with the 90Wh battery and thus without a 2.5" sata disk, the BI=
OS
> does not add an IRQ resource to the SMO8810 ACPI device.
>
> Make the misc-device registration and the requesting of the IRQ optional
> and instantiate a lis3lv02d i2c_client independent of the IRQ being there=
,
> so that the non freefall lis3lv02d functionality can still be used.

non-freefall

> Note that IRQ 0 is not a valid IRQ number for platform IRQs
> and this patch relies on that.

...

> +       err =3D platform_get_irq_optional(device, 0);
> +       if (err > 0)
> +               smo8800->irq =3D err;
> +
> +       if (smo8800->irq) {

You can still do it in one branch less. But I think I understand the
motivation of the split.

> +               err =3D misc_register(&smo8800->miscdev);
> +               if (err) {
> +                       dev_err(&device->dev, "failed to register misc de=
v: %d\n", err);
> +                       return err;
> +               }
> +
> +               err =3D request_threaded_irq(smo8800->irq, smo8800_interr=
upt_quick,
> +                                          smo8800_interrupt_thread,
> +                                          IRQF_TRIGGER_RISING | IRQF_ONE=
SHOT,
> +                                          DRIVER_NAME, smo8800);
> +               if (err) {
> +                       dev_err(&device->dev,
> +                               "failed to request thread for IRQ %d: %d\=
n",
> +                               smo8800->irq, err);
> +                       goto error;
> +               }
> +
> +               dev_dbg(&device->dev, "device /dev/freefall registered wi=
th IRQ %d\n",
> +                        smo8800->irq);
>         }

...

>  error_free_irq:
> -       free_irq(smo8800->irq, smo8800);
> +       if (smo8800->irq) {
> +               free_irq(smo8800->irq, smo8800);
>  error:
> -       misc_deregister(&smo8800->miscdev);
> +               misc_deregister(&smo8800->miscdev);
> +       }

This is quite unusual.
I would rather expect

  label_foo:
    if (...)
      foo()
  label_bar:
    if (...)
      bar()


--
With Best Regards,
Andy Shevchenko

