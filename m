Return-Path: <linux-i2c+bounces-7395-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E020A99E991
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 14:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F8B91F218D5
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 12:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B271EF0A5;
	Tue, 15 Oct 2024 12:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ajhtBLHX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FDD1EC01D
	for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 12:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994745; cv=none; b=URpDfQp5dHevklgAnf00fBdaFomn91JyLinlmYUWeGN+92+t1rCWsYLaJoGl6rwiwj/BsA7zu9wJIbVnCzFVM9E1LxkXnVmCUKK3zayinfeMl753GpUSPaW9ZUKr/e7eXyE0KZcE/3Z1tV1tqK2pPSjlprlySDLxLG1VrPIGHns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994745; c=relaxed/simple;
	bh=aRCf8E0XYeMl3rjjwU9ql3OSCuCKiWZsGaedbuIwvyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lsEJYrGhP2JlFo1dYK5sycPaL+EG/TAZf5fMi8/A0jNtEamf8RxX/lB+kAP8i1xkj3hjjIv7Df0kHuU2IkSR2+jinE0DJnQ12Q4bmeMwvSIc1Ebm8wd7JJaCA8DVEJG1IG6GMY0SvoBmFeqZVjG/D1AeeTLn4iOXy9NbXvv0pxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ajhtBLHX; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f8490856so2160674e87.2
        for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 05:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728994742; x=1729599542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2Nzr/f3LnLUD1j4bkCrqVzP0/G5tRk6VST+iGhoZ4s=;
        b=ajhtBLHX5LC7n3SGalyBes5NTrchDZgudIJG+r0P2M+G9Fw1SIVxfA6Gm9PYtSlAvw
         LYLtO66ec+e1RLLAo5xDkeKA+Di9qepNVjqHHQL6EskKd2M5de+f6QCWsQPli5BB9/2n
         SnqPPjPzAIscgfSfjfc0NLA/bY58oxxq3D+3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728994742; x=1729599542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2Nzr/f3LnLUD1j4bkCrqVzP0/G5tRk6VST+iGhoZ4s=;
        b=f0MLhOHv/J3i+Z5iWGrWzJsQWYm38MIDc+A0vsmtjRoT2I6thIufUmX7kAK8FhO2A7
         62QosTzv4OMaIrrv3GbGxcEmEAoUTHSq3ltoHKnZW4KnPSbNlMMGb+o4VjYJlFONur/u
         Jo7OFuZGHjT+yKfOIlbk0MSqwULnmoNp4kufi990xVCUrh26GRq2RnXqLhgzG8wzKFN2
         I9VGissnvNceEieVd5cGCexUuSpHRjqY9zYfShDJApFzfKANm9mNu96s12tQk12+VkFz
         olwIIS6PLZrDkiDk9q+NMiZQH2NrmTl0y/yfdnL1tDfDITG9u1tkCVQbS7tndFFlSG7X
         fLlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWozjFU/5YX7t6YmdmZ2+UZJY4F7J94E4FabXPw3WJrGIux8feVc12ntmW64nvAdlUAVWZ+duaxruE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkdVarZ71sqn2cPkJ4SS8tQS/CB+tMV0d9xqX4fq4xRA4eBojb
	3KhxBtkSVIs62BD2EDehM1Vj1p8TlU7uFK3912EmOUMjgM8W7AEAAFUb68FlHS734Mipzjk3LiF
	kThaB0n5u0PpNPuN1VG0IYmo2/VM2AuEDCvPx
X-Google-Smtp-Source: AGHT+IHhelc1sPDiNO+kxEEhE8ky8z+lqqPZB1C0Uie/J5s8p86hdxcscCA4LhHzO10mmd95cq8TFxe0+nBzft1TCjY=
X-Received: by 2002:a05:6512:687:b0:52c:a5cb:69e4 with SMTP id
 2adb3069b0e04-539da599f59mr5899850e87.54.1728994742015; Tue, 15 Oct 2024
 05:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com> <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
 <CAGXv+5ED7j49ndT7BaESW8ZL7_mjVUJLM_FWma8Lwkg+Uh3saw@mail.gmail.com>
 <Zwz_Kl7SwfL0ZaAZ@smile.fi.intel.com> <CAGXv+5H0Yvt1cwPOim-quT3C+=s9NapnryJhNxs_QW=DAyAycQ@mail.gmail.com>
 <Zw5QzP-5hnHW--F-@smile.fi.intel.com>
In-Reply-To: <Zw5QzP-5hnHW--F-@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Oct 2024 20:18:50 +0800
Message-ID: <CAGXv+5FuMjSaUJ+qDrx7Vmr9o5vJ9VW=tss1ezvdJyaZZouHKw@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware prober
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 7:24=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 15, 2024 at 02:32:54PM +0800, Chen-Yu Tsai wrote:
> > On Mon, Oct 14, 2024 at 7:23=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Oct 14, 2024 at 12:56:20PM +0800, Chen-Yu Tsai wrote:
> > > > On Thu, Oct 10, 2024 at 11:32=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Oct 10, 2024 at 06:29:44PM +0300, Andy Shevchenko wrote:
> > > > > > On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > > > > > +   .cfg =3D &chromeos_i2c_probe_simple_trackpad_cfg,
> > > > > >
> > > > > >       .cfg =3D DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_s=
imple_ops),
> > > > > >
> > > > > > Or even
> > > > > >
> > > > > > #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                 =
       \
> > > > > >       DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)
> > > >
> > > > I'm not inclined on using compound literals here. "simple X cfg" wi=
ll
> > > > likely get shared between multiple |chromeos_i2c_probe_data| entrie=
s,
> > > > and AFAIK the toolchain can't merge them. So we would end up with o=
ne
> > > > compound literal per entry, even if their contents are the same.
> > >
> > > I'm not sure I follow, you are using compound literal _already_.
> > > How does my proposal change that?
> >
> > I'm using it where it makes sense, i.e. where the embedded variable
> > is not going to be shared with other instances.
> >
> > For the dumb probers, there's only going to be one instance per "type".
> >
> > For the simple probers, the config part is still one instance per "type=
",
> > but the parameters are board and component specific. There will be
> > multiple instances. Hence the config part can be shared, while the
> > parameters likely won't be.
> >
> > > > > With that also looking at the above
> > > > >
> > > > > #define DEFINE_I2C_OF_PROBE_CFG_NONE(_type_)                     =
       \
> > > > >         DEFINE_I2C_OF_PROBE_CFG(type, NULL)
> > > >
> > > > For the "dumb" case it makes sense though, since it would be one in=
stance
> > > > per type. But we could go further and just wrap the whole
> > > > |chromeos_i2c_probe_data| declaration.
> > >
> > > Maybe it's too far from now...
> >
> > This is what I have:
> >
> > #define DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB(_type)
> >                         \
> >        static const struct chromeos_i2c_probe_data
> > chromeos_i2c_probe_dumb_ ## _type =3D {       \
>
> >                .cfg =3D &(const struct i2c_of_probe_cfg) {
>
> But the below is static initializer, why do you need a compound literal h=
ere?

Because .cfg takes a pointer to a struct. It's not an embedded struct.
The compound literal creates the internal struct, and then its address
is taken and assigned to the .cfg field.

Does that make sense?

> >                         \
> >                        .type =3D #_type,
> >                         \
> >                },
> >                         \
> > };
> >
> > DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB(touchscreen);
>
> s/dumb/simple/g

"simple" is taken. This is "dumb" as in it does not need any helpers.
Maybe "no-op" if you don't like the negative connotation?


ChenYu

