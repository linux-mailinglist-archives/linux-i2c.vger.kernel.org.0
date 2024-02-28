Return-Path: <linux-i2c+bounces-2051-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A1286B54C
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 17:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38BA01C2212F
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 16:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E123200D2;
	Wed, 28 Feb 2024 16:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwDGXj9L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A168C6EF1D;
	Wed, 28 Feb 2024 16:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709139007; cv=none; b=Qn00Bf0i13tC+mRNorBkPOjpLdtzBY2NcACDcAIdbOO109162nhY8BnoY6IzS8uBbg9Jh+TxXV0/8U4ugQc89rZC9T5H7L93FXsOWLAw7SsuGt3Ptggi9XYEFa5rZeeD27SVOrhdzazXADKjKvn0w0s93tcf1VLcrMgbePSHQqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709139007; c=relaxed/simple;
	bh=P330DyUnflf3jSKM0yP0FC9yk28R3q1OcWSbeH1zMTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iovO2gtYzrckK4ie7cgKJDd9rRWcg0dORyG6ykCa7BFZDKIZsad53bPxRU5mHabhxHeQ+rG9OVe8fLW7+XEmf3m7r7Zi49BSwe+gKFTfCuZ/eXV6lGrxUm7pNTncT6oARdaOBWZyr+86kRDC1gGecjXnZvxZnBCT4CXo2ELZD2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwDGXj9L; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-565b434f90aso5401637a12.3;
        Wed, 28 Feb 2024 08:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709139004; x=1709743804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P330DyUnflf3jSKM0yP0FC9yk28R3q1OcWSbeH1zMTg=;
        b=XwDGXj9LMFQE6HSuQBJ/6E2r4SSHxEBWtRM2MZeQz00PKt4NSBZEUJBwVb1isjPwQV
         5rvXfU5LzIbNtOo6LWurwZ9hWv5+nLrhF7Ce8IZvUcHpej/GZE/280F+1DJ1TRAOMpOz
         7DekpdKGmIzxch6dPa/H2+miPjZ0uzfQnOmBrHFLPJ2ue27DXC9qToemgfpW/iHYzltW
         y+w+OQthjeXUsyapJNNfgC84xZIhk+A9W3AbxxpHMwLbPi+FfjvFNbLvy+Ee9X9LsOaZ
         T5jx0VtQsc5pBKMt1auA4/Mtk9OKWr9mf/QxUeaAZZwSsJ3uHHpul8gWe6CgFE6g1eUg
         xrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709139004; x=1709743804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P330DyUnflf3jSKM0yP0FC9yk28R3q1OcWSbeH1zMTg=;
        b=WUjW9rqirHMeXM0aPJAnSxLAsujdm+1ikGweATpXzRNnpZND1mpSKY4bx3FtatlXGX
         sfkGkNFBBkjO+XfiJsS8HLVVDJhbscxctZ8OyQqSxPQEVTqxIdQ5Pt2A4EyAfYhF1/C8
         L7nrCtvI8rkIfMN1zOOe1n4M+Lw/RTihQRDCwuz77dcuuXs1EabEgQE9NA10N8igfgeU
         4GIqF8S9EiKnUZGQmJUHV5La9ESP9MIj2rHvwi2aKFuqZUpjTEg2Qm2r75or31iJnSw0
         FTyPPJyuHPwFNi6K+q92b/Nv495Obk/LQh0CUvf7hMrEnBxPTLi14GUMyD6ej01BxsbY
         OXVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFio88LyEBSIYfnzZf+7xFyyiQh52Io7Krn2UCm1MQDftsMkX3U/3Uy5pwTPmgatEFDEmHpUadRZYMoaXXLoHw68sCiStH9vUr/wWEWbHStYKVtJm2cHLgQJA/IPw5xkB6C4Nn5LHXZwSmMjjH3A==
X-Gm-Message-State: AOJu0YxUB5jBP1Hd/7USdNA3+/xEnf1zpYzTLUdp5nJlsModTGtgx/BU
	TrmCTwlfTrPMEvvLlNtBlJM85fCQ726diAKOOX3z98BNtsHgwU/LghlMkzvZWydcOY+U+IzJOIF
	xjhLpr3C25MLHHQZzO9+h04Nh+yU=
X-Google-Smtp-Source: AGHT+IFTRJnlxMwL4yOkbWtoh6NJ++yF0LRtRIRaoO0LK26KAwJQkomm7X+KqWnfu7HYRyi0nnPl5LSNB7GlXYHhveA=
X-Received: by 2002:a17:906:2c4a:b0:a43:a4a1:1945 with SMTP id
 f10-20020a1709062c4a00b00a43a4a11945mr171348ejh.75.1709139003816; Wed, 28 Feb
 2024 08:50:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240106160935.45487-1-hdegoede@redhat.com> <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali> <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com> <20240227214011.xeys7rtukn6hksdw@pali>
 <4344926b-40e9-4423-b208-c18263248a82@redhat.com>
In-Reply-To: <4344926b-40e9-4423-b208-c18263248a82@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Feb 2024 18:49:26 +0200
Message-ID: <CAHp75VfEUpnvBfTx7m2maGrYLswdPSuK_kPDhfVwU6N2bLA4hQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Jean Delvare <jdelvare@suse.de>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Andi Shyti <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net, 
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com, 
	Kai Heng Feng <kai.heng.feng@canonical.com>, platform-driver-x86@vger.kernel.org, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 3:10=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 2/27/24 22:40, Pali Roh=C3=A1r wrote:
> > On Saturday 17 February 2024 11:33:21 Hans de Goede wrote:
> >> On 2/13/24 17:30, Jean Delvare wrote:

...

> >> The i801 device is not hotplugable, so normally this will never
> >> happen. If the user manually unbinds + rebinds the i2c-i801 driver
> >> them the i2c_client for the smo88xx device will indeed get removed
> >> and not re-added. But this will normally never happen and if
> >> a user is manually poking things then the user can also unbind +
> >> rebind the dell-mso8800 driver after the i2c-i801 rebind.
> >> So I don't really see this as an issue.
> >
> > Well, rmmod & modprobe is not the rare cases. Whatever developers say
> > about rmmod (or modprobe -r or whatever is the way for unloading
> > modules), this is something which is used by a lot of users and would b=
e
> > used.
>
> Many modules actually have bugs in there remove paths and crash,
> this is really not a common case. Sometimes users use rmmod + modprobe
> surrounding suspend/resume for e.g. a wifi driver to work around
> suspend/resume problems but I have never heard of this being used
> for a driver like i2c-i801.

Hmm... The whole thing of reworking the p2sb was done due to
rebounding the i2c-i801 IIUC.

--=20
With Best Regards,
Andy Shevchenko

