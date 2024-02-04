Return-Path: <linux-i2c+bounces-1629-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08081848CAE
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Feb 2024 11:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B81D1F226E0
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Feb 2024 10:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB4D1B5A4;
	Sun,  4 Feb 2024 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9fHPVby"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACBE1B598;
	Sun,  4 Feb 2024 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707041551; cv=none; b=HVTZWO1AhEYo8sB4HF7PkH48BYU4QQXVsweKO57+JCECO6xXR8E8/26Of2ccWZmBNF1dtBFbCoF0+My9rWTiBqpsQtJ8mdZ69TSRWhuoQSRDS12iCZ8vk/aHX9C+XEcED7Wu5AzdtYreLgamEeEG1t5r1xfSs7AQytpjpnoqT3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707041551; c=relaxed/simple;
	bh=+/CKCu2QlvmjQTlqBjr4NIaSI1yb9z5CsCzyf40yI/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGxbueGjezr2lhMh4yqCtIpwMcAYK6CfVRMccyER+0Z/RyiWh8ZCiXS7dxhmcyhfMSQ/6EJbh6yjfqxVbWdaTZOb2/wq2jXg0QGE4O6ufKgelsUAbm+WwcvsbY431GuzNazQmnafnvbBnXXo4Mx8Duk9xA7skclziOVMeIdUKK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9fHPVby; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d09faadba5so7930371fa.1;
        Sun, 04 Feb 2024 02:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707041548; x=1707646348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/CKCu2QlvmjQTlqBjr4NIaSI1yb9z5CsCzyf40yI/Q=;
        b=S9fHPVbyt1//SIM7ORp1hNCG6jwDa4Wa8tNk2hmI8Oc0RbP84vzwyyYS1UUuXGZdrA
         qKTkLvwPmM/oYshcYMH8515lv2NFtEzOAdVwhaJ5BYJ9O3fRGmNnua9D42uawct5ZGxc
         sbbBmzbiLM1NszsQppZMajDjvjYfHhYMTzB6HULLnemUjJzHYAPdqD3YEwdAIs0+JNYL
         WmfAVxmQ7x5OX+T7kKY5qqKgfsUXmHR+yEXk47W7/7B+Hr8arX6R+tpXYQOriGpLW+kJ
         nzd2rdRiNvhDeOnNcYVvd/4M6tPOUH6FyFauZGdbMScJWtHuH3Vp6xi4hqi+kh+dz+WN
         ykIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707041548; x=1707646348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/CKCu2QlvmjQTlqBjr4NIaSI1yb9z5CsCzyf40yI/Q=;
        b=QuobpeDXdAmG5jKr9V7eW4diaAra18fgbGlfZuSas4t6DJJKABoeS5zvbySxhF0tWR
         3sx5yl/T1tS01hYZwtaD+usDMnF2vMFk028WQzcjrBUDE8I4HlsPmTsrfXp/WicMqLWQ
         Bx9L/vN/4XlZtiswjFBgVsfgIQ1wzzQ8OaI75nZwWVLAwXBQPke07B0JO7Ebu1PBpGZg
         uP66ttuDfmKrsb1unzJeOs7XE/JyOR2HJRZO8+XxM/ztT3OqZqv5Gk7Ssxlo4FcQh0DP
         CbsLg0Rzz9RuC3xhK7KmFOHV9Gtr7uV0F/PRDgPglB6sq+C3fe4c50zxJtXBwBuoBFUm
         0PxQ==
X-Gm-Message-State: AOJu0Yxr9xQ1TUCQhLrGrvycuO7owluCZN54UNMWXiCB7doCHM0zXsFE
	/s+OMSFaHdV3vn4MMRBBHOfuZA1FC7T8VMMp2RKN1M3E83QFi1nw2YjujB4cHz4lTVwd8SrEm6F
	a65jv6qnBXYNx0Ifru37UhegIt6M=
X-Google-Smtp-Source: AGHT+IEiaNv3pmNejZuwag1ZJQAZwjJU2+NNpIjCJW39bWdB+TTTUdNstPCaEBu+C5P9BX5uHtZFhynbBgXzX5poWms=
X-Received: by 2002:a05:6512:3484:b0:511:49b9:74ff with SMTP id
 v4-20020a056512348400b0051149b974ffmr1117014lfr.48.1707041547885; Sun, 04 Feb
 2024 02:12:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109145121.8850-1-rand.sec96@gmail.com> <CAHb3i=ttHrFw7NuL3qw1xdXDkGu9tOQdH+WuCMWgukmU6QrTKA@mail.gmail.com>
 <111837c6-6c60-4bd4-9e66-1c652a43f3ae-pchelkin@ispras.ru> <Zb6luAVHcnX2fXz3@shikoro>
 <f5f26a7d-973a-4232-b0cb-b0543fddefe0-pchelkin@ispras.ru>
In-Reply-To: <f5f26a7d-973a-4232-b0cb-b0543fddefe0-pchelkin@ispras.ru>
From: Rand Deeb <rand.sec96@gmail.com>
Date: Sun, 4 Feb 2024 13:12:17 +0300
Message-ID: <CAN8dotnOgU5cgi3y3f74=bJQt_G7qKpP9imB+REvT7AUeFbQ2Q@mail.gmail.com>
Subject: Re: Re: Re: [lvc-project] [PATCH] i2c: Fix NULL pointer dereference
 in npcm_i2c_reg_slave
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Wolfram Sang <wsa@kernel.org>, Tali Perry <tali.perry1@gmail.com>, lvc-project@linuxtesting.org, 
	voskresenski.stanislav@confident.ru, Benjamin Fair <benjaminfair@google.com>, 
	Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Nancy Yuen <yuenn@google.com>, linux-i2c@vger.kernel.org, 
	deeb.rand@confident.ru, Tomer Maimon <tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 4, 2024 at 11:54=E2=80=AFAM Fedor Pchelkin <pchelkin@ispras.ru>=
 wrote:
>
> On 24/02/03 09:44PM, Wolfram Sang wrote:
> >
> > > If I'm not missing something, npcm_i2c_reg_slave() is called via a
> > > function pointer ->reg_slave here [1]. And seems `client` can't be NU=
LL
> > > there. Other drivers implementing ->reg_slave function don't check it=
s
> > > argument.
> >
> > Correct, we trust ourselves here.
> >
> > > Maybe we should just drop `if (!bus->slave)` check?
> >
> > Yes.
> >
>
> Okay, thanks for confirmation.
>
> Rand, would you like to prepare the patch, please?
>

Hi Fedor!,

Sure, In fact, there were two scenarios from the beginning, either
redundant condition or potential NULL pointer dereference.I relied on
the condition to determine the type of issue because I did not find
it logical to add a useless condition, but based on the Wolfram Sang
words "we trust ourselves here." then the scenario will change to
redundant condition, so i'll write a new patch and send it in new
thread.

