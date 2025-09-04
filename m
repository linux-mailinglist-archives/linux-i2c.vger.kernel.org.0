Return-Path: <linux-i2c+bounces-12595-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A68F6B42E30
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 02:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6892E169214
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 00:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0734C1885A5;
	Thu,  4 Sep 2025 00:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAGcaOUs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE7E155333;
	Thu,  4 Sep 2025 00:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756945674; cv=none; b=Ag0Qnxzl4uAltp9FoPmLJfF1078bpDfbrAHRG2rOb9eGFo12NCj6e0n/AqWL6P0CgpB5pdfW50zMqdDJDHY8HxrI9CdEPQq7nbfoJMdAijhJEtijWLFqlWQK5IOwU3MVBdn0x2YSHxFnzRAWCQud50mCwkI0ecaxHw0ScuTqVnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756945674; c=relaxed/simple;
	bh=HsqYZPmKUfnfEy5pJIqGEBIdC9fSx4mpiDsjwB9nzeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jW3cyWUDfSlw5UmKmxdunvDs47RzpnJYt3DHCpIx0TXilkxukNbayu7gBQE08sk2WJ3GMhGGTG1dmAdY2Z7qhavCeVuga1SJjSptV+edU7FmCFl7BwOrCfg0LIOmpUuX5M1ZfM3T/9RWBPqWw/m17lSNueOh+ZaZSpGEN9R50k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAGcaOUs; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d6051aeafso5517627b3.2;
        Wed, 03 Sep 2025 17:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756945672; x=1757550472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml206XCNIcvpuvAckP+1DV8optDPltV+v0NnGapirRc=;
        b=kAGcaOUs1LmVDTZ04FwZK5WuMfTFryNU7g8yQpih31CqOOt5ZbsoWAxIC/iz4u2U1d
         5EDQz+uRzr+8g+DeWd1foYkj9Lllxp8sMLJoNeYzr8UQ9x6EHl7LOuMMuG5uQuf85/k8
         G42YG5uzxqDz8Ef4NJbN4WAE0rXhXD6KkgM3WZo7gBEUma4WCfVKG6k4eRGNgk78LO4p
         Px1yCPRPtpbO+9YkqmIZhY/SMnKdlNMpKeW934gKpTb8VubvKA2ZsVywnhIQEeGxOAM8
         +TdJWxVxDgruJKBxIuxmKlsXT2Q2+88jm6rN4/+2VDR1zosp2wLziDFS+kdo41eTygj9
         KPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756945672; x=1757550472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ml206XCNIcvpuvAckP+1DV8optDPltV+v0NnGapirRc=;
        b=hoZwfi3xOy5u1tkSYxix/xgCken3aO28cJMMAJERlTYL0y0UxT2Su84SoTWKkhP46J
         LYLvjPZ+oj012qPOrEeZ0g8MIwO9K4d/Bwno1x8Uro8PAJAsqhiqPCWQjAmK7vGOKrCv
         H6NFsbtSmGrHDGyVc/gPeRr//AFhNHjkVjhASfyOGU/CCB/PCkM2DWPDQ0aYqE5cRYdI
         ovJCZqUDxoBp0I0gnWxeIMZ1XMZpuzFeb43+VrGdvyU6nFxReM0F3w9mgtDkNWBgPyRh
         p8FfhPJ39vQVh4IsVTzAkTV7QBlFgN1mjLPTJn0RKldt+M3F5WvBxVfGjLL/YAK/Vb44
         rDng==
X-Forwarded-Encrypted: i=1; AJvYcCVJTZ3Pr7Ol1CUbtNuKRgwmfkNnfgcbhPEdSWnQSrL2VMJM7uMmIO8Xzm22zmEdOw6bTh2u3RDCEmo=@vger.kernel.org, AJvYcCXEumWOzZhnIAKULH1Id2Zs/mkR29QAJ0OTBx0nMNLtpmov64MVzDgZx0Afbatf5Vf8TmBB2CW02A/UgE8x@vger.kernel.org
X-Gm-Message-State: AOJu0YwJBks/drSI02ZNwJnzKBNp+a0sHneMKv4HCLEf3qe5GvzHNJxN
	dzGiPjRNA67ZNgPfX4JLJQJ0NA68GI4xa0hnqwHl75Ef8rW7sBmJnl76ZTx3tF8vLc3aTkLf+6J
	mv5spUifoGaUwx6zE2iz8WuLux78z3UE=
X-Gm-Gg: ASbGnctMBEuVc0cZLH3i1LYxZ6aAqRVq+oZE+savUSLArkWu7b+XpYlJPEVK5DLFB8x
	AHl5vzeQYPxiyZHm5747qq/VDhsJ+ch/u1e79kevYwhZLcycZsmLV+iZOwR5rYj/l5eojC6RsaA
	k+ocK6HM4+NhsEP//bMbqJ1ExcgER4lDuY03KJbv/K2P5pmHYKLgPq/dMBTDbAwjDVy7zPNaEwR
	KnNsCUcq7NMnOCh7L0=
X-Google-Smtp-Source: AGHT+IH6DUKWjCXGPiYug/JG+/9e2lkvIkBUeTwn8hI+YRqHtlM4OO5GBQX6J+aj15L7ZaPooLVDy8khn9UDN+pJuE4=
X-Received: by 2002:a05:690c:61c6:b0:721:6667:60a0 with SMTP id
 00721157ae682-722764acdd2mr174326297b3.31.1756945671557; Wed, 03 Sep 2025
 17:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250830093016.160753-1-chiru.cezar.89@gmail.com>
 <fkiu64vdlndg5lvuaktao2vmvmn5al7xcpksrjmxrr4ldz5ssn@dolroldcknpd>
 <aLh3rVYItYZ3CYpq@shikoro> <CANvS2vUf=kOdGKTcy8XWz2aO2uHTf7TkF-EQSedMSYE863oFcA@mail.gmail.com>
In-Reply-To: <CANvS2vUf=kOdGKTcy8XWz2aO2uHTf7TkF-EQSedMSYE863oFcA@mail.gmail.com>
From: Cezar Chiru <chiru.cezar.89@gmail.com>
Date: Thu, 4 Sep 2025 03:28:08 +0300
X-Gm-Features: Ac12FXwtTqNM7OPJjrfjTPka0QBs0JDOJ-fPD4jUyyUPEWIq4FIKQBU4UG9maAg
Message-ID: <CANvS2vWNrib9TXenDjUemCfJjU14LVJcq42GW7XZ11=6egWPRQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: Main i2c-*.c files and algos/ subdirectory : Fix
 errors and warnings generated by checkpatch
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: peda@axentia.se, jdelvare@suse.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andi, Wolfram,

Resending email to entire receipients in plain text mode from Gmail
client with linux-i2c@vger.kernel.org and linux-kernel@vger.kernel.org
who rejected the email as being not plain mode. I thought maybe you
didn't receive it. sorry if I sent twice..

I am new to submitting linux kernel patches. The first patch i
submitted "[PATCH] Fix checkpatch.pl warnings and errors in i2c driver
directory and subdirectories" was wrong and also missed
signed--off--by git signature. Some change i made originally broke the
build . I rushed and sent it before I built the kernel and modules.
rookie mistake.
But on the second patch I submitted, I built the kernel and modules
after i made the changes and fixed the build errors. I activated all
i2c external modules and built in modules in the .config under Device
Drivers---> I2C in the menuconfig. But didn't tested the kernel on my
linux laptop and didn't loaded all the external modules to see if they
generate dmesg errors.
I plan to resubmit and break down changes from 1 commit to several
commits(patches) as Andi suggested. I will create a commit in git
explaining how the patches apply (their order) and this patch can be
disregarded. And along with it i will  send 1 patch for each i2c file
i submit changes for. Also after I commit locally on git the final
version of the commits I will create a build with everything under
Device Drivers---> I2C menuconfig . Upon success I will locally test
the build on my laptop. load manually all external i2c modules and
make sure there aren't any dmesg errors and modules are loaded
successfully. Other than that I don't own any I2C hardware device that
I could test with my laptop.
Wolfram, Andi, if you have other ideas on how i could test the i2c
functionality to make sure i don't break anything with my changes
please let me know.
 I am a newbie to linux kernel development and want to take it slow
with small changes in the beginning and then possibly to grow this in
a full time Linux Kernel Developer career.
I will be back to you with next patches by Sunday night. Sorry for the
long email but I wanted you to know the whole process I did to submit
the patches.

Best regards,
Cezar Chiru


On Wed, Sep 3, 2025 at 10:25=E2=80=AFPM Cezar Chiru <chiru.cezar.89@gmail.c=
om> wrote:
>
> Hello Andi, Wolfram,
>
> I am new to submitting linux kernel patches. The first patch i submitted =
"[PATCH] Fix checkpatch.pl warnings and errors in i2c driver directory and =
subdirectories" was wrong and also missed signed--off--by git signature. So=
me change i made originally broke the build . I rushed and sent it before I=
 built the kernel and modules. rookie mistake.
> But on the second patch I submitted, I built the kernel and modules after=
 i made the changes and fixed the build errors. I activated all i2c externa=
l modules and built in modules in the .config under Device Drivers---> I2C =
in the menuconfig. But didn't tested the kernel on my linux laptop and didn=
't loaded all the external modules to see if they generate dmesg errors.
> I plan to resubmit and break down changes from 1 commit to several commit=
s(patches) as Andi suggested. I will create a commit in git explaining how =
the patches apply (their order) and this patch can be disregarded. And alon=
g with it i will  send 1 patch for each i2c file i submit changes for. Also=
 after I commit locally on git the final version of the commits I will crea=
te a build with everything under Device Drivers---> I2C menuconfig . Upon s=
uccess I will locally test the build on my laptop. load manually all extern=
al i2c modules and make sure there aren't any dmesg errors and modules are =
loaded successfully. Other than that I don't own any I2C hardware device th=
at I could test with my laptop.
> Wolfram, Andi, if you have other ideas on how i could test the i2c functi=
onality to make sure i don't break anything with my changes please let me k=
now.
>  I am a newbie to linux kernel development and want to take it slow with =
small changes in the beginning and then possibly to grow this in a full tim=
e Linux Kernel Developer career.
>
> Best regards,
> Cezar Chiru
>
> On Wed, Sep 3, 2025 at 8:15=E2=80=AFPM Wolfram Sang <wsa+renesas@sang-eng=
ineering.com> wrote:
>>
>> On Wed, Sep 03, 2025 at 06:56:12PM +0200, Andi Shyti wrote:
>> > Hi Cezar,
>> >
>> > On Sat, Aug 30, 2025 at 12:30:15PM +0300, Cezar Chiru wrote:
>> > > Fixed some coding style errors and warnings plus some minor changes
>> > > in code as reported by checkpatch script. The busses/ and muxes/
>> > > subfolders will be dealt with another commit. Main changes were done
>> > > to comments, defines of 'if' statement, swapping 'unsigned' with
>> > > 'unsigned int' and other minor changes.
>> > >
>> > > Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
>> > > ---
>> > >  drivers/i2c/Kconfig              |  2 +-
>> > >  drivers/i2c/algos/i2c-algo-bit.c | 29 +++++++++------
>> > >  drivers/i2c/algos/i2c-algo-pca.c | 25 +++++++++----
>> > >  drivers/i2c/algos/i2c-algo-pcf.c | 61 ++++++++++++++++++++++-------=
---
>> > >  drivers/i2c/algos/i2c-algo-pcf.h | 10 +++---
>> > >  drivers/i2c/i2c-boardinfo.c      |  2 +-
>> > >  drivers/i2c/i2c-core-base.c      | 59 +++++++++++++++++++----------=
-
>> > >  drivers/i2c/i2c-dev.c            | 47 ++++++++++++++----------
>> > >  drivers/i2c/i2c-mux.c            |  1 +
>> > >  drivers/i2c/i2c-slave-eeprom.c   |  2 +-
>> > >  drivers/i2c/i2c-smbus.c          |  2 +-
>> > >  drivers/i2c/i2c-stub.c           | 29 +++++++--------
>> > >  12 files changed, 170 insertions(+), 99 deletions(-)
>> >
>> > first of all, thanks for your patch, but I can't accept it.
>> > Please split your patch in several smaller patches with single
>> > changes.
>> >
>> > Granularity is very important for reviews and git blame.
>>
>> Same comment as previous patch: describe testing please
>>

