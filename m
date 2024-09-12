Return-Path: <linux-i2c+bounces-6618-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2905B976C2E
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 16:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80E76B2337D
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 14:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280331AB6D5;
	Thu, 12 Sep 2024 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpwwYNHj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7CC1E529;
	Thu, 12 Sep 2024 14:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726151551; cv=none; b=SM1HgJUHqvVolMitNQU5oUzc368zWE2HA/UU9rlsWXDquurPBrwRraVWX5QnPAUSY0zVJl8DHiHvPmD3ijVpiRTtmKVEcnW1wk2el3YxvZkDglEGzcKvH0dUtnPpy7uDjoqfokMumw6EXpPw1SuanTUxuZh5btW6ohXgfw/MKlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726151551; c=relaxed/simple;
	bh=ZIgxOBr+LUIwGxzcvReySLBimnbVG06Bj6Le94EFSB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIDo/zzkQ5rN6QQctfVYI7pnmni5K/ji/n4xK0WNEawp5kn+I6Z6FXPKMAYuIFQZ93JP24LaxtON9sbp14Du2vSsMRFkeCexpVxFdBZTiPJ+mXj/LEJ1TWKv5GTZbNrj036sSzq1zdjmP/ihygRXN2Nhn96vhUyT3I5KQSKtuUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpwwYNHj; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9018103214so148285866b.3;
        Thu, 12 Sep 2024 07:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726151549; x=1726756349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/NO/bp2BRcv2Ga7qjyhvuGGI4Z4xlhL5eAhxJZku/w=;
        b=QpwwYNHjc8OQYUo/CZtZf4OJMeDS2fTfZA9bCe+5IwA8Bu+97Mhs6OyhhzcLlSXYNq
         oOBcZbHJDF83QiG+5m7K8RINzW7r2KxwlnlyCGaRQgT0QdprKYfI4wv6lTOHbZBvVHR9
         U6v1BaagbsrgdVnTgEj8VXnsw2mZpqxgK4jQUBgb6+7axS9cfiUUhERV17ftXamwiM6/
         SNtKMO++ZR3Akz2txvtF2k0gDvqt0+h1yp8mfd8TMr44Q7osCC1ExrV+Y8PTP55Kgadj
         bhVusipiK1w1qt0xtB6Trrq2QAGEHciu0TnKtaDzjepKmeHKgMAHTd/ZQLwhyWuDdy6X
         Wu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726151549; x=1726756349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/NO/bp2BRcv2Ga7qjyhvuGGI4Z4xlhL5eAhxJZku/w=;
        b=qg3llCzAhw+dNvkOyY+hRxYUuVXMHQuvpP7CBD2BozURxIdzZ3SRx1kUYCwz2jN94L
         TyPd9A3u/XslrkpA8gNIOzHDitLsg1BneCV+FZl20E8XYIivXlZ8qA842H8HRD/uZi+5
         gn9+e6Xj/blMMo75JWq7DglloXZ7hkuY9Auzy1U6mmf2DbNneRxHrrUbNNyTwV+aGw0g
         OhAi5SyG7BvkAI3CLcn+eoK5YBkWUQIHg8zKfq4cHCFCrBwz+n2xESrsWhQ5IPPSc5Vt
         GO1eeAjpx2LcxEZ5LG59E7KTNeoi6s0w/JplcdjBXjTvoUsYQHmXewlrf8VrYyuIgdH6
         N0Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWJzWcod7xEBVxTTptoRb3HvoHa62NzHoumaC9ysI6Lb/XbJXzl1IcgBWKDzCaOoNvFi5oMIsZq8HTOL7K+@vger.kernel.org, AJvYcCWx/pkEwhZz65X2RA3lXHADbtnt4q7OBQ/f+QGGjAAMb+Fa8uqsQ9XFlPkTM40bGh8W1PfdkWvwiefH@vger.kernel.org, AJvYcCXGo8Gmh3cXxFbNL2jgn1tsSmd8QePrlLSZoT9IXoKHC9tAsoXGVrhVu9fBplBbVDDv0GLT4Y3Z+ox0/s7BlVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIjfAQpMPuolLasY3E328dhgeOXm7lyQ9ipgd3YC54LpZJY8bX
	Lpw42xRVff9PT78Trr5X7H4s7coPzKl2IFPYjSkSQQ4NZ3SSoCuDZKUy2Uv19Q7nK+CxKcgGJr3
	O+25Gr3A6lfdJ1lvrvRsc7fxqKOlNpvz2
X-Google-Smtp-Source: AGHT+IGG+K9zRodKUyfIcrPD5dp8LwlvFqoWeZdZW/MIZ6JugJ94+A0FVDfNXHFrnZeogLuol/sR6GVprkIXZV3N8Ug=
X-Received: by 2002:a17:907:e2e5:b0:a8b:154b:7640 with SMTP id
 a640c23a62f3a-a90294acf95mr271319766b.37.1726151548277; Thu, 12 Sep 2024
 07:32:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a0fdf90803ab44508aa07f9190af5e00272231df.1704545258.git.christophe.jaillet@wanadoo.fr>
 <z5qdyk2onwohenaclbflb7jlfn3wadafjpxsxzpvkmax75mpvg@vhhasuuutjzh> <CAMj1kXFH+zB_YuUS+vaEpguhuVGLYbQw55VNDCxnBfSPe6b-nw@mail.gmail.com>
In-Reply-To: <CAMj1kXFH+zB_YuUS+vaEpguhuVGLYbQw55VNDCxnBfSPe6b-nw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Sep 2024 17:31:51 +0300
Message-ID: <CAHp75VeRNg+Sbyk9nA6nASatP4apzSXCPrNaJ_ZvsnXhAbyw0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: synquacer: Fix an error handling path in synquacer_i2c_probe()
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Wolfram Sang <wsa@kernel.org>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 1:23=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
> On Mon, 6 May 2024 at 11:03, Andi Shyti <andi.shyti@kernel.org> wrote:
> > On Sat, Jan 06, 2024 at 01:48:24PM +0100, Christophe JAILLET wrote:
> > > If an error occurs after the clk_prepare_enable() call, it should be =
undone
> > > by a corresponding clk_disable_unprepare() call, as already done in t=
he
> > > remove() function.
> > >
> > > As devm_clk_get() is used, we can switch to devm_clk_get_enabled() to
> > > handle it automatically and fix the probe.
> > >
> > > Update the remove() function accordingly and remove the now useless
> > > clk_disable_unprepare() call.
> > >
> > > Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C co=
ntroller")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >
> > Applied to i2c/i2c-host-fixes.
>
> These patches should be reverted: ACPI boot on SynQuacer based systems
> now fails with
>
> [    6.206022] synquacer_i2c SCX0003:00: error -ENOENT: failed to get
> and enable clock
> [    6.235762] synquacer_i2c SCX0003:00: probe with driver
> synquacer_i2c failed with error -2
>
> as in this case, there is no clock to enable, and the clock rate is
> specified in the PRP0001 device node.

Wouldn't simply moving to _optional fix the issue?


--=20
With Best Regards,
Andy Shevchenko

