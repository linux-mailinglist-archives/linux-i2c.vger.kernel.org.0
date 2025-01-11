Return-Path: <linux-i2c+bounces-9028-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C80A0A48D
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Jan 2025 17:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6DE93A9866
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Jan 2025 16:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E13192589;
	Sat, 11 Jan 2025 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G19Vb8ut"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE55C14A4D1;
	Sat, 11 Jan 2025 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736611536; cv=none; b=gkOHLI5T+ZMGCkSRCrts1ksQ+l88v22feu8KbADcOWDwMj8nLIsajdgixzzUCtNDc5xZVGqSdzxiLqZT1OpF8V+bSf8UxBCzqJ89oRbbCro3mFIn+hIbcNxpdaE0Xho7n7wWTsW84Trq3luVj/OAylehxNMLPnx4KS60UEholDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736611536; c=relaxed/simple;
	bh=gexsX31ZUC+DOxnFtCksHO7C6pi0kMNmxcbuMdT+BEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djqAPyGoPv73urfCTE63LzQNCi7c0vbhnSx95NT8ZCNxDtJh36hcEmoGYXgsNRbEXuFLiLRMzpnVqL2nleaJ/yr3PCXiD+01KW8BBoXrth3QR4+mryF20i3QNfkrrgbjYduh/st3Q35xZlR6chAa430OvhnVSY8ksYQv21vUPWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G19Vb8ut; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so4905589a91.2;
        Sat, 11 Jan 2025 08:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736611534; x=1737216334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gexsX31ZUC+DOxnFtCksHO7C6pi0kMNmxcbuMdT+BEI=;
        b=G19Vb8utPSpMVUyWWS1fCCVyqd3lSzC5NwwU3BOo9A/DvHn0xhNHmlNf2/9d3pM5/z
         ydbbVJpLt4BE+d1TfKWWqYeGTGqkOifCJyZgNMKnotHyUWyTes6GJz2Vc9pT0BYp6bdF
         PEjFjTH4xKhhlv3U2Mxb7gT4cX2efQl6QNnQlm0c8T+THuCpZOxVwjFCAqo1qP1pc8V7
         gmIfJAeniHhU1r+FOk+GSlyufPNRt9JB9MpN10s3+rQ6rZB/rn0tdfB1X0fRtLH9RjmM
         eUuan1EbcsKyWx2PkaAlqOZ9pl5P1M8BbD6OeXTExypeeaPo6tCgga4VnzXO8QUJTeBr
         jfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736611534; x=1737216334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gexsX31ZUC+DOxnFtCksHO7C6pi0kMNmxcbuMdT+BEI=;
        b=F/HpUBaYyV+l1jbmdjqUW7nbiu6Ry7CFgkPpNXF5XHE5Eju4gGBGA/J0zlqVej/ZIy
         J0CunzRRWmtcl46vrwnkw8qVneDRApIEIvQnOYAvooNy2hJNkNCOjhOLovrQWjyiPGkJ
         rbBynZOrsQ2BKp0INJwxcOMAMbHKiIcQ8v/9rC0xvkrpSpdt+gMLR+U6HJ/TS3MAIjbj
         2yZAFiob6RD299KzMcoyYI0J+ZK8yMFgK23AS14lI0t5OsWGB5aOrp9+xQ6YI7pRhrgd
         xyxZgg/fl/9MPSYqRXEzpkXnOANU2TpuMua3d8Yx0OtvyAl3a6GkBwiuXg2hvtRTrI4T
         dc+w==
X-Forwarded-Encrypted: i=1; AJvYcCXJ/J8DaK5nssm/CPiBMqHmrf1Hmzgdkn/AvBnqFt0Dkzsp+KWNgP4vP2vC769kmhAcToaeYVlItalW@vger.kernel.org, AJvYcCXVKyuBGZQnlO86/m0bEVPeIOx8HZwIXEBSDeDG9ZsiruDP7s44MMFZOMFwTOviqMk6xfKnK/M5tDhu@vger.kernel.org
X-Gm-Message-State: AOJu0YxefSQ+ZBoXy8biTaivr6Kdkd8wo9d5zW6dy+GkJ7hafP8upoAp
	qrK7VRI0Z9Z7My4sXCacKlbWghGiyAF+bKsLXukXuxxWOZpgWqKofMtK+qRQ+Yshv+os3KBOxI4
	jkztL7GHTYqt/3hItc+aYSj89ziNMUnwZ6q4=
X-Gm-Gg: ASbGncvfyMS8FTI+N+zhpwgKDWz1ceTn6Lt0uMcj2R/TyL28SUTjW6aqWxK5ykayc30
	dSdbFkiJNV0GlUL731De2yJJZxtbKTjkAAV7pFg==
X-Google-Smtp-Source: AGHT+IEUc2lqPjmDsXIuUlfZ0Dnb1v5YbUDqiQOkCaBeNBuixeJU+0W8+OtcwHvMwjwrXIMeTFsXSWTPEpf3GrPWK3A=
X-Received: by 2002:a17:90a:d448:b0:2ee:d63f:d71 with SMTP id
 98e67ed59e1d1-2f548f2a85cmr23406906a91.14.1736611533940; Sat, 11 Jan 2025
 08:05:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105083358.GU3713119@black.fi.intel.com> <CACHtJB94K5OLdHgs8dDj4jDBtZmsdymovboCcJJUt5OkD8o+Mg@mail.gmail.com>
 <20250107072746.GW3713119@black.fi.intel.com> <CACHtJB-4UGaqKw5zZjE_vPeYX+bMUMiHPNfNYzD6Wmv6jdAuhg@mail.gmail.com>
 <20250108055150.GY3713119@black.fi.intel.com> <CACHtJB-33Pgoj0xORt75G0=cyoKem_K=Dfeg0iQNow18v2sV6Q@mail.gmail.com>
 <20250109111910.GD3713119@black.fi.intel.com> <CACHtJB9XeGBhg9de3Y0DkHKBUD-i=rKi2bEi93tv3jjz+LZ=_g@mail.gmail.com>
 <20250110112623.GF3713119@black.fi.intel.com> <0151b609-98d9-402a-b553-c9af5b0eb51f@linux.intel.com>
 <20250110120740.GH3713119@black.fi.intel.com>
In-Reply-To: <20250110120740.GH3713119@black.fi.intel.com>
From: R Ha <rha051117@gmail.com>
Date: Sat, 11 Jan 2025 10:05:23 -0600
X-Gm-Features: AbW1kvagOXDI_QDqPegI9r6Z4CwrDal30lqfC3WApNGxladdwp03ni3RRpMwBUU
Message-ID: <CACHtJB-mXYAkmPLT1bV-wZR-3SGfS8R8Wo3i2qUio8a7AmcZtw@mail.gmail.com>
Subject: Re: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, wsa+renesas@sang-engineering.com, 
	linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I updated the description, please let me know if it's covered everything.

Just as a question, because the touchpad works well at both 100KHz and
1000KHz, is it better to force it to 100KHz or 1000KHz? I was
considering that the Microsoft docs [1] specified that the frequency
should be "no less than 400KHz", but didn't change it for now because
the touchpad feels the same at 100KHz and 1000KHz, including for
gestures.

Is it possible that there will be any sort of compatibility issues if
the speed is set to 1000KHz? From what I can tell, the only other
device on I2C1 is the "Intel Smart Sound" related device, but I'm not
exactly sure what that does or whether it will work at 1000KHz. The
sound output itself seems to be unaffected regardless of the
frequency, though I don't think the other device is directly related
to sound output.

[1]: https://learn.microsoft.com/en-us/windows-hardware/design/component-gu=
idelines/touchpad-device-bus-connectivity#acpi-table-entries

On Fri, Jan 10, 2025 at 6:07=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Fri, Jan 10, 2025 at 01:45:03PM +0200, Jarkko Nikula wrote:
> > On 1/10/25 1:26 PM, Mika Westerberg wrote:
> > > Hi,
> > >
> > > On Fri, Jan 10, 2025 at 02:31:26AM -0600, R Ha wrote:
> > > > Hi,
> > > >
> > > > Sounds like a good idea. I'm a little worried I'm missing something=
,
> > > > so I think being able to check my earlier answers will help as well=
.
> > > > I'm sending the entire output as attachments, but let me know if it=
's
> > > > better to upload them somewhere and paste the link instead. Some of
> > > > the ssdt* files are missing, but they're empty files so Gmail won't
> > > > let me attach them.
> > >
> > > Thanks for sharing! Okay checked now dsdt.dsl (the other files are no=
t
> > > relevant here) and what I can tell the device is supposed to be run a=
t 400
> > > kHz. I suspect this is what Windows is doing as well, there is nothin=
g that
> > > indicates otherwise.
> > >
> > > And since this is a standard I2C HID device it should just work (as i=
t does
> > > not require any vendor specific driver even in Windows).
> > >
> > > Only thing I can think of that affects this is the LCNT/HCNT and SDA =
hold
> > > values of the I2C designware controller (and maybe the input clock) b=
ut
> > > there is nothing in the ACPI tables that set these so it could be tha=
t the
> > > Windows driver uses different values for those and that explains why =
it
> > > works better there.
> > >
> > > @Jarkko, do you have any input here? If we cannot figure a better way=
 then
> > > I don't see other option than to add this quirk.
> >
> > Unfortunately I don't have idea.
>
> Okay thanks anyway! Then I don't see any other option than adding that
> quirk.
>
> @R Ha, can you then submit a new version of the patch with the latest
> details in the changelog?

