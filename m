Return-Path: <linux-i2c+bounces-6919-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBC397E4AD
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 03:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45CBA28117F
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 01:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF511FA5;
	Mon, 23 Sep 2024 01:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jF+QW7i4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A07D184;
	Mon, 23 Sep 2024 01:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727056329; cv=none; b=di7yi1ewlgRnrgtoj5n1LIKoIWKAu7yY8XJYwmsnLlL4KkSAKzJCClKydbrpAZSpn7czF8D8jhrGUxBXSvbAgysEDFqOqQukZhmwRYIYaJRhGmCBajCuUweJlC/rcxXPJY0Av/Nui7vUrIkiFxUqtsC2AbW0T6E0X9o9tf/zAsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727056329; c=relaxed/simple;
	bh=sWMVVxxW+AfDBr5LSOb/cH6eDOfidObguR+oCv5UphQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UgblXk2q7HbSLK7vLvrOq2EmzR2QOHpHtrMAhkzr65kYzGe/s/NJVK5uPstzC0LdVe6Ma6lSyIF2aWduid/QPw4gJKCmPCtfUW/UNIaXkXc0XKBMiUJu0QoZKRhfrQbWEZrLWM9yiqpp8a1DSfinjsiKLZZ177hwZLZBRDMlPfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jF+QW7i4; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c26311c6f0so5359250a12.3;
        Sun, 22 Sep 2024 18:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727056326; x=1727661126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWMVVxxW+AfDBr5LSOb/cH6eDOfidObguR+oCv5UphQ=;
        b=jF+QW7i4bgUyKQiI4XkPMThSgP3T86xg92pHQv0VNhdGe2B7BPdpuTSLi2axLXDpcA
         pNnefcB2HWZ8HdU/hhhmPzVGchjFYKNzWpjX80MugIK9IEkHo3eDoejdkIsWbib2E3HM
         k8menP6b1pbTQMSIMzQRUYwzYIa6I3Q16GwcnxD6d+GJduGp10Vjp2RRJXH1uFiOETIX
         vAS0guOsUn0WuWm6GLIoS7HFmATrdHkO39MZpHjGCT/9P8iNpnc4ZZRT8zXImWA7p/7B
         aaYRY9ubVHlzjkhxDTHy1Oej/bK/CgZtbuKMjxiBegxc/7yS8ZIP/B7pF1C6erhK1qOi
         GWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727056326; x=1727661126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWMVVxxW+AfDBr5LSOb/cH6eDOfidObguR+oCv5UphQ=;
        b=awirhGcf+sSO0LjnG0BbETi4fXQseo2wGTpWUbVjs8UpmggKVGG49a2OA4/ap0B4P1
         1CsacSESarK19Bb0vuaOnQchxZHi8uj9/Muiros5/UlKYSouZ7iIXfNx94AKw9vOYSSo
         vtDa5i/cC1it90klV0OkRZUwfTGjUwVuGvZ0U07EiA+3L29CAM1lctGwYtHEU8Z1zPB4
         4hQl5SRh/Kk0UIEc0hmDhP3b5PwuRnoEJNyvyEEpl9+Z7DjBWCwQPefZN5oNezId1hrC
         rItXC8NgHQpSBhhNgfgnifCefInzy5BLh9Iqy77DJc01n6Njp/MyzW+pufxHV71k4/ig
         41pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfLz1Wg+kxAh0Vr0J/0ekZMwqIAU9Z5T0dBsQayTgtHmUGTmCzE3OYIQIzTCZfk+eQYlNpgNrcvPw=@vger.kernel.org, AJvYcCUgl1WMeP6qugxn1+2UnB8ljfArzxKu/N4bkJziI2UEUkRoPeTAQtrWzZCbSg1Do3FR+IbDZIlZ1aLqorRw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqxxbs1IgMoqYG1I4fP0NscVbfZb2qJDK6s+h008c3MioWf3WH
	0xIPshjarWHyqEqC/KJoh82Z6CWEGlfYZoxk3glcj3LhchkeqNVhbpn5awp4rMQmP/m2dIanma+
	45Do5Vh9DWhESLchbTyHs8ercvQ==
X-Google-Smtp-Source: AGHT+IFFETaOQGu652OB7nrGXOP/MzYyqIndUDFmdQaGb9RRqPWu8MVcTogmukY38ENE6g3voRpeLnI43t2ioo+hnB8=
X-Received: by 2002:a17:907:d3dc:b0:a7d:e956:ad51 with SMTP id
 a640c23a62f3a-a90d4ffe2a3mr912415966b.21.1727056326270; Sun, 22 Sep 2024
 18:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920101820.44850-1-kfting@nuvoton.com> <20240920101820.44850-2-kfting@nuvoton.com>
 <Zu2HGte_05AA6yky@smile.fi.intel.com>
In-Reply-To: <Zu2HGte_05AA6yky@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 23 Sep 2024 09:51:54 +0800
Message-ID: <CACD3sJYqWz3y2EZ1N3SqboNz20gdjZRaLz5c49u2bfztoVsudQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] i2c: npcm: correct the read/write operation procedure
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Thank you for your feedback.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
9=E6=9C=8820=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:30=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Sep 20, 2024 at 06:18:15PM +0800, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > From: Tyrone Ting <kfting@nuvoton.com>
>
> Something wrong with your email setup. This patch may not be applied in t=
his form.
>
> But before (re-)sending, wait for others to comment (up to 1 week).
>

I'll remove the "--from" parameter to git send-email command in next patch =
set.

> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone

