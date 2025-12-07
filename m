Return-Path: <linux-i2c+bounces-14468-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4930CAB7D3
	for <lists+linux-i2c@lfdr.de>; Sun, 07 Dec 2025 17:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BD1D3004F3D
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Dec 2025 16:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BBE230BF6;
	Sun,  7 Dec 2025 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBir91JH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13E22E645
	for <linux-i2c@vger.kernel.org>; Sun,  7 Dec 2025 16:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765125967; cv=none; b=orA66C6Qu6++nfhqHLvhYzPpU3fDVNe/q+qoElwJGMABOyeXIoKwnPakcFHNk/cSbq6u7P+mxTXxu/OIa+KSqAqDQxzq/YrB8SQYovy7WwynCw+vNLxhq+yMb9BUnOK5hAn5t2w2+eBpuMjXQUxQFlWeWOa5IgLDhUPdSjPqrcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765125967; c=relaxed/simple;
	bh=I9Qx9n4Q79mBOZR4LXGGw10jVvLQ+xkac3lc1hwUVxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lPAVi684vtlyCcO9lWgOX7b4d+cGOq+uls84l4ghjnk+v1DeJgsmpVNM7rjH5cow43tEH4f5yk4XAV4HiCj7g9JLqo53Ot8dyPkD9GWLUGPST6x5pYS8GN/FV/1qWl9qYxXmfkItlLMjUZ1c/P52yd/xp1iw3Q0wCLtNzh2Bxjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBir91JH; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78ab039ddb4so35416767b3.3
        for <linux-i2c@vger.kernel.org>; Sun, 07 Dec 2025 08:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765125965; x=1765730765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9Qx9n4Q79mBOZR4LXGGw10jVvLQ+xkac3lc1hwUVxg=;
        b=CBir91JHkBNAEdojL2uT5hVYkK454TrqGILqeUbBA05z9UULrwX+ue7tzZJ1LGxDRK
         sggrLWEpkJvwuFrzzFZd8y9zRg5nJnQ8d4rppNg39LauVtJ11jf5zRU+WXuKKy3xdh+y
         GnOwpOGPhPslsjYOjt5c13M5BpbGBBuEYPS3EqhV7TcPOLfZxCM2F0XtM+btDZQ0Smhy
         S0LgEhFFpAoPkiN7NE9+iyJme0H/QYPfDNx1ziv3lYNDQNMop52xI6ib/PK0VY5+Ztn0
         RnqTAiIOvSiclU4bgeAM+zOgsVchZYeKHtVqXlIXeQQT0b+7DZJ1KhjSuMl2qu7E/o8/
         +Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765125965; x=1765730765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I9Qx9n4Q79mBOZR4LXGGw10jVvLQ+xkac3lc1hwUVxg=;
        b=E3zCmNshujLQilyDQDV5i83E/fXrATTcUCu8JfpG2gfEiLubf4DFF4+ZXBiryAHzPE
         1cbcQCHcPQ8DwGSH5285ddxcdKt4ASGOINw6VGSXRC+qnyZVoGs8U4w0NK4t9T+e7x+P
         y1n3P0R1cXVIp/0jiXb7eFChK33kxHkC7dg9ql+8+15m99+jYEo6OnMhSPdwcDt8URf5
         tBPSpHXeJpoSUXCXIWlb6lJ5UJT+Fa92+RCjtG0TvKGTwWaA+y6AMy1WNrfCtUfHqb7u
         VFxT78/lxhGgffpWN3ApU8G/V6HFBJZNMdjIClN2usz7p0WJo2X0OKtl1KabdrXbSaqh
         aaQw==
X-Forwarded-Encrypted: i=1; AJvYcCU4XwL/veJ0+uG7zzOG8l1GXTlP69SsGJgj/9LO3OagjbDjiNqgiw1ErC33uzKT9xst+R1NnmKiRlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF14aOumwozcLsIvBeqChOlp5NO5HBIPmahX+7Gq/p9rllp80s
	YnKXWLAA1VHaB5RFSGP2jtp/VHcDltpnDzNW5W/uxoHx4mipJoVCqpE7so22/bDkEg6ta1lOq2S
	3qsu+quLto3Pn0m8gK62DIptQ63wXkiA=
X-Gm-Gg: ASbGncseKGzYvyEePJ12JNcahGZLBwsxM5bghhVQO/5OKFM+1akqSGiT/q6DTJ9kSlj
	ukOn9y3C1F0/151cYftpkUrresKbfrXICB38l+v2G/IhrHyyVXApJ6QUnfP5wl8KctaPtyr172t
	p19JZalHvWN/QchniE74qwOOhplDKuJZgkoLuI/3BqoEuErDxOK6JlvTePxjSlc8pN/gHOd7ano
	mPlYG3cBr4zRYT4IGibF1bxX9uTeih0lUxjkMCFwKtEMQPKdEjkN3cQKC5OJ5WcXuNrWyhY
X-Google-Smtp-Source: AGHT+IFojsrwzBu58xmxqNiWONYhG9kxExBjgU7MJi2fTygt5IzjBHutS+yPKMllDxNSv0iDWafdsrpjLRVd2Us7NKw=
X-Received: by 2002:a05:690c:d91:b0:788:bda:47e0 with SMTP id
 00721157ae682-78c33b13875mr51874287b3.1.1765125964673; Sun, 07 Dec 2025
 08:46:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aTLjgEVfLCot0cSm@smile.fi.intel.com> <20251207040459.3581966-1-safinaskar@gmail.com>
 <aTVUakljrd-sysxP@smile.fi.intel.com>
In-Reply-To: <aTVUakljrd-sysxP@smile.fi.intel.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Sun, 7 Dec 2025 19:45:28 +0300
X-Gm-Features: AQt7F2qzPmg7UQ_bISru9-YSQqKjGJESrT0FY3SlqV8KJLp0EpCcDQigL4yk178
Message-ID: <CAPnZJGAxhXNOw1V5FTPK2Mrvu0YAPwm0Ph4UHd2aZv=kgx1qWg@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dell.Client.Kernel@dell.com, bartosz.golaszewski@linaro.org, 
	benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com, 
	linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, regressions@lists.linux.dev, rrangel@chromium.org, 
	superm1@kernel.org, wse@tuxedocomputers.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 7, 2025 at 1:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> I think nothing. It's better to try to actually fix the non-working scena=
rios
> rather than remove the feature completely.

OK.

> P.S.
> I'm sorry, but why are you so eager to remove something? While in many ca=
ses
> removal of (potentially dead or unused) code is considered a good thing, =
it's
> not always the case.

Removing code is easier than writing new code. :)

Speaking of initrd, I tried to understand Linux init code a long time
ago (out of curiosity),
and so I wanted to remove initrd (to help me understand the code).
Also I saw initrd
deprecation notice back in 2020, and I decided to send a patch for its
removal back then.
But I got time for this only now.

--=20
Askar Safin

