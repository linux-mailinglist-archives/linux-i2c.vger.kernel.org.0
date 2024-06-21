Return-Path: <linux-i2c+bounces-4226-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB142912938
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 17:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D796B271D7
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 15:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B39B6EB74;
	Fri, 21 Jun 2024 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTqaJ+v5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F65658ADD;
	Fri, 21 Jun 2024 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982837; cv=none; b=NOqIdAZtGaopBL9Ahrs5SGY0P/RIy8yfLigQKaWEIQ14nHMvEcKXVTlCNF9LaFF4T9vy6vHntOS99cZP1NJB+SnEJx1TcwioRHbsoGw18yvBH387XOH38b8SW+B3pyXlp1cyyDBAlC9QikDdoPcVT7sReR+lBP6xxgpNLZQodqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982837; c=relaxed/simple;
	bh=T0drkNW9hMvb20qoreXxo6ENaVbmihDLK7LGvGNZYcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oNJlNjdyE8BvUHXpnWpq2Xuy5b4k9gbMIo/ufKSLosDc88cpH/1Q+QgQoq8vtJKZ9DAy5UfmDwEllbintbmYPB4XzPZPqMiql+DUK/GaSata4uvPGjSpQb+If81PPkjppA2c3mHf7KeqAPAyFPhHUcH8LnKgZNApi20ieQEyHJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTqaJ+v5; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6fb341a7f2so268378366b.1;
        Fri, 21 Jun 2024 08:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718982834; x=1719587634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5opwDV8Oo5X57uNJ1UJuqEmfJHfnw57MVm4kexehWE=;
        b=dTqaJ+v5gXv6yGrWdmis/sajqy/k1ZdoFC+uOUAfan+v2DOc8E0EJ+utid1KuOIfl2
         nxbV/498huBHqfliJvVCSZgBLVJs2QzfZ5vPWHPwaXi8H1ttvanGL5PuHDVtEr8U925i
         1RcLCKZikHVBZUmVemIAGn7TphiXX2qwdRQMRpbDLssmHgzE2tkSR85zc5225ceLZaJM
         WLcdJ3vkCFNSmVuvQajU+2QnSPk75zmrJ1xvRqBn9d1IVdxjGJoYLwUE9HL1O/xunvkK
         TZsEtqzaj/Tw02MNIskt1d/kNVsl6bexgLPeuIcKyVgElerRcTOdVxHio2bS9UPmzTU6
         cxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982834; x=1719587634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5opwDV8Oo5X57uNJ1UJuqEmfJHfnw57MVm4kexehWE=;
        b=Pp4LNPyrtclaKfRocjMVrFe1eWxNn6FM15ugeQpSNxlHr7FAUwou1qOUfiWrVcQ3lS
         g8ZmWK91Yu/GK8D03cd3BUunCJhoe310wYMkpkCcFXck8mRLaf6Ki7tioIUPO1tVHgRJ
         d8zztioBJHO52BpNCwzs2iVu0IwgpoQKgGM4hITTEXqsiq5iurInCBO+5GjCZfaZx5RI
         WLcWjbS4U96AvFGBeQAQPS5d/vb8XV7E+Npu5JT18Ya3/zitINZWoZ6NNkshfreJXfS3
         E/LWfvOb8KVSknzcWg7uXUw/J5oet0neXsy8+l8PBdu55QoU3FFYZxssibIb03T8OTBv
         z+rA==
X-Forwarded-Encrypted: i=1; AJvYcCXHw0Kqj+P86NUFkIMtY2Haztoej0p4SG31WWVrvgpvzlxLYONHHzIHIZi7rKfPJzX4u0GLqeCayBXam02LDwS1Ioeu8yKx/pL4OhLw+SU7ghbZJapt4GMYgwbCCwMKMmT9Xw8O0kCoCSpfIAFryg==
X-Gm-Message-State: AOJu0Yz4Q7DMotk7eDFtYfkzjnS9mIEGRnYPgDSNH2Q/qTjggdceV5/i
	fAHHGJRvfpx1AItB5AzvdOJ9YeE4msVavwE74SCIWzb3wgctRbKhlqU3zIcwlPAZHn0hpLM8JSs
	FADVbvQVOC/BFb+zKvTI1Uo5iGBU=
X-Google-Smtp-Source: AGHT+IEYU1H4FeSm5DXCpsYUNZM2sto18JMFryD/37aB96vLus6h2dR6Y9I60o+xHQ5F24PbuIYUIrUj+wWNKYcvVMM=
X-Received: by 2002:a17:907:ca1b:b0:a63:49d3:e1c5 with SMTP id
 a640c23a62f3a-a6fab7d6a8emr521334666b.64.1718982833664; Fri, 21 Jun 2024
 08:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621122503.10034-1-hdegoede@redhat.com> <20240621122503.10034-3-hdegoede@redhat.com>
In-Reply-To: <20240621122503.10034-3-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 21 Jun 2024 17:13:17 +0200
Message-ID: <CAHp75VdenZ05oaBa2T+mC59qpWnEL=krw-1-pArb-+CDsE844Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] i2c: i801: Use a different adapter-name for IDF adapters
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

On Fri, Jun 21, 2024 at 2:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> On chipsets with a second 'Integrated Device Function' SMBus controller u=
se
> a different adapter-name for the second IDF adapter.
>
> This allows platform glue code which is looking for the primary i801
> adapter to manually instantiate i2c_clients on to differentiate
> between the 2.
>
> This allows such code to find the primary i801 adapter by name, without
> needing to duplicate the PCI-ids to feature-flags mapping from i2c-i801.c=
.

...

> -       snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> -               "SMBus I801 adapter at %04lx", priv->smba);
> +       if (priv->features & FEATURE_IDF)
> +               snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> +                       "SMBus I801 IDF adapter at %04lx", priv->smba);
> +       else
> +               snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> +                       "SMBus I801 adapter at %04lx", priv->smba);

Alternatively this can be

       snprintf(priv->adapter.name, sizeof(priv->adapter.name),
               "SMBus %s adapter at %04lx", priv->features &
FEATURE_IDF ? "I801 IDF" : "I801", priv->smba);

This will save a few bytes here and there.

--=20
With Best Regards,
Andy Shevchenko

