Return-Path: <linux-i2c+bounces-8035-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3A19D2536
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 13:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C160D28231E
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 12:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047E51CB32A;
	Tue, 19 Nov 2024 12:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vc71cjsd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E498614E2C0
	for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732017863; cv=none; b=bNfFrhTrVhyN7GEe95Lt/qA2A1sPkFiF5UIfR2zaGpyJ4GmMkI9vJEc4mGjS/RjEC7l2Is0m1UEyFFqZB/3abNF9fVFdwNy9CIk+UgSQUmgTdplcm6y62kv+bporN80mhSu+GEinDGYsyzMq5tmzlpSNS9VLqeFII9sdNez7iS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732017863; c=relaxed/simple;
	bh=rz2KLrwwLhGtEUjP5TagdHhlxf4NIXl+HuT6yxFML6s=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HtUh1mLw+J0IbTrIeuAziDZkq28KAylnjzXA3CtXrwPO2TQjHory92Fj2LSY0iBd/pTPtzm8z/idrRU47w/B2jlfERziCJb30mGAPvDu7L/9gpMuiv85rEV8ZqeGiUTKB3Gr8U5LkGV0BJGXMgdpAkjKHY+ehGojkgGAth5FftQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vc71cjsd; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb5743074bso45381781fa.1
        for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 04:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732017860; x=1732622660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WoKSxAA31MZTaszqylmhSRJ5z01T3YIo+No7ytpTdHw=;
        b=vc71cjsdB4WllaMDSEXy6fPZZfGUpBoaZbIT/fmo5DlH4iVsg4O6Vnup4ON95DNaOp
         zPTFMkSE++16I4qQoAhFfe4lwcp3u/q64x2OJa0lxUsNscw6Xof2lcI/QF7GljY1NnXd
         ttv/iB/mMH4tWqdS1Mwf6w1IlQ0/JotFtl3VmsoIuS8PvI1P/f/EmwsjCmnqdhZZb85M
         HeLyLPMeSS3R10Ncn9KnyK7Mdc5/EXfr57ytOC9pwbG9LI1gsw9dgDK2smXCLjUwCmOD
         AAU5R/EbaUt9HfHLPDUJANGLWPp52owrYVui+aHst8YM9JfKn6FR6ov4pVBNVGT3JVao
         2QqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732017860; x=1732622660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WoKSxAA31MZTaszqylmhSRJ5z01T3YIo+No7ytpTdHw=;
        b=lELlcoIeH4aabQUdr2O07kckUXC1vmSiW8sYeOudrJQsShTj42w7Gy9ulkmclIGy20
         CNLCJo1fR5/0vEODbpSwHsRQPSQxrmaMPD6EPIf84sdfMfmcSmeUHPCpm5POtbQZcE2j
         wJNv4ZlL4NGIp1xsCksIsXummhbWPO1fWT4o5rYwHbMAqr+S6r5m97jw/7qqaqpiPBUk
         wbd+2rD7AOtGcIpxn5BbRfdXmaPMXoCyXeaSKIcUHES448FQgETLx33622QN+25YRzkg
         w4IxqmKJS7Sru/fiEK8o8W5ZPW04Ibn5cBfADz5xDM+oL3lhcUM2zbcU4gPFrrWWcB5/
         lw8g==
X-Forwarded-Encrypted: i=1; AJvYcCW4rr+J6T5rK42URUn2zrr/vZuMFsir6UiVaDFPgZKJjUbrAuvNfQ6TKSs13qf++sDVEWbBgZ2V/hE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr+k73FvBr3eXLa1vuXGBbBdPP6/+XFMwPZdzXUMXoS00P1ucf
	pXV/BHCCAPlViVHjW7lWsRSF68rebCQNyqitK6A2uHJTJU9m7n5C7B/qtVc5msv6lFwIRtFpLG6
	iSdkKhGCNvZKOSb+XdXPv/7FZLuqUpgac3eP9sg==
X-Google-Smtp-Source: AGHT+IEerceyVJ5JcxrvedsqouZNp6jHQBnvDR5FHHap1MZUllto7WQTRg3X+wPTKZcHcUCqR5lxuEzu7z5AAutGPhM=
X-Received: by 2002:a2e:b16a:0:b0:2ff:8977:64cf with SMTP id
 38308e7fff4ca-2ff8977653dmr2742071fa.19.1732017859851; Tue, 19 Nov 2024
 04:04:19 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 Nov 2024 12:04:19 +0000
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <CAMuHMdXEWsx3YBewPC1s1Q-yZp1S9erpK5TgWzNxFH_JyM=R-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017184152.128395-1-marex@denx.de> <20241018132754.GA54765-robh@kernel.org>
 <3aa9e2f4-b1ad-46bf-a8c3-0d57cd3a7075@denx.de> <20241021181413.GA816269-robh@kernel.org>
 <CAMRc=McJ2_tT+iaLL3TMYPcMhSCLAWq-kOEvGzovuJfD+3MWFw@mail.gmail.com> <CAMuHMdXEWsx3YBewPC1s1Q-yZp1S9erpK5TgWzNxFH_JyM=R-Q@mail.gmail.com>
Date: Tue, 19 Nov 2024 12:04:19 +0000
Message-ID: <CAMRc=MfSySWMMdcTZtGrBqfJuUkePsVNLLvptqRQVbj78nmtug@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: at24: add ST M24256E Additional Write
 lockable page support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Marek Vasut <marex@denx.de>, linux-i2c@vger.kernel.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	devicetree@vger.kernel.org, kernel@dh-electronics.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 19 Nov 2024 12:01:54 +0100, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> Hi Bartosz,
>
> On Mon, Oct 21, 2024 at 8:36=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>> On Mon, Oct 21, 2024 at 8:14=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
>> > On Sun, Oct 20, 2024 at 06:29:13AM +0200, Marek Vasut wrote:
>> > > On 10/18/24 3:27 PM, Rob Herring wrote:
>> > > > On Thu, Oct 17, 2024 at 08:41:25PM +0200, Marek Vasut wrote:
>> > > > > The ST M24256E behaves as a regular M24C256, except for the E va=
riant
>> > > > > which uses up another I2C address for Additional Write lockable =
page.
>> > > > > This page is 64 Bytes long and can contain additional data. Add =
entry
>> > > > > for it, so users can describe that page in DT. Note that users s=
till
>> > > > > have to describe the main M24C256 area separately as that is on =
separate
>> > > > > I2C address from this page.
>> > > >
>> > > > I think this should be modelled as 1 node having 2 addresses, not =
2
>> > > > nodes.
>> > > We had the exact same discussion regarding M24C32D, see:
>> > >
>> > > https://lore.kernel.org/all/CAMRc=3DMdTu1gagX-L4_cHmN9aUCoKhN-b5i7yE=
eszKSdr+BuROg@mail.gmail.com/
>> >
>> > Seems like kernel implementation details dictating the binding to me.
>>
>> Yeah, that's on me. I would have known better today but 8 years ago
>> the DT situation was much more volatile.
>
> And there's no way we can fix that for new devices?  Perhaps even
> for old devices, by counting the number of entries in the "reg"
> compatible value?
>

For sure. We can always deprecate old bindings after upstreaming new ones b=
ut
we'd need to still carry the model ID in the compatible string and remain
backward compatible with existing DTs.

So an existing example of:

	at24c01@57 {
		compatible =3D "atmel,24c01";
		reg =3D <0x57>;
	};

	at24cs01@5f {
		compatible =3D "atmel,24cs01";
		reg =3D <0x5f>;
	};

Would become:

	at24cs01@57 {
		compatible =3D "atmel,24cs01";
		reg =3D <0x57>, <0x5f>;
	};

Now the driver takes the "atmel,24cs01" compatible and needs to count the '=
reg'
items to determine whether to create one or two nvmem sub-devices.

It's nothing impossible but would be quite tedious and make the driver so m=
uch
more complex.

I, for sure, don't have the bandwidth right now to tackle it but I'd happil=
y
help with testing and reviewing.

Bart

