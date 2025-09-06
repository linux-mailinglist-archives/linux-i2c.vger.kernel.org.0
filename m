Return-Path: <linux-i2c+bounces-12699-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C08DB469D0
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 09:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DFD35A578D
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 07:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774E12BEFEA;
	Sat,  6 Sep 2025 07:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QimvbJ0O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EEC1E51EF;
	Sat,  6 Sep 2025 07:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757142665; cv=none; b=f8ZbvTKQHXAIXYLzKSb3KVDZhlMvsRPmAgsVt0pRfwQWHT5wFeCJ8tOkieZBQxTFRFlPkFgeAzsnSccz5S6XkuU6vZNnXgeiW1OPd/ASF+KZ5BB7x/hNYnAOYeDqfFwgNIzSTUinBRHDQomenlviGczXY9tJ+UMvleXLybzVGXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757142665; c=relaxed/simple;
	bh=LVKk9wBJ40gG4bIsotkYdagMAkXVQFV+m2KqPK2A2QY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yp0dQvjCGX7L75zp0RofmLhNg0Z2FMRRReqv4MSDOZSQOKvGfTm6oCKI6Ody68qbcko897R1Fk0Ttdxhpgc7clOVUl51SQNW1wotk1ybqdM98+GUbgsd+a58j7CId/XXqrt+4gS82dZmJa9dOABphYkKGt5+U4r0brjMKl/yZgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QimvbJ0O; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-724b9ba6e65so24633787b3.2;
        Sat, 06 Sep 2025 00:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757142662; x=1757747462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FrG78jwHdJCalMEH+Yvb7uE3xxVQoihAPwpHcon8D4=;
        b=QimvbJ0OAeUgYM/ALksW/DweMwi7hFgPwCV7kwYUgxq78v+C1ldG71Izuv/cSocakm
         iD4z5Dq7prLOYvPr0hObvhwq78HF/+JY1eR0ltckug+8RfuD6Y7onx7DJYwHnRu+vkOm
         /yhRorEuH2tW+Tj8m18j1Ob/6IgroClt8LUMiuA2u9Bdr24AcYhSeK/FKcXdSuq87m6A
         Jhx9+6ElCSrZLEENhFdMgx4ZEW5KrcB+BEhqcLx5QpEtqj16nCOt2K0W6c2db1xInjqT
         SQHSkWOWNuYmezMJ3BQiv7vcb9i+bA/8Ipp4GBXjSk384ktTAYQMbWatX1HYTXFbPm1u
         fvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757142662; x=1757747462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FrG78jwHdJCalMEH+Yvb7uE3xxVQoihAPwpHcon8D4=;
        b=RbFcbR8zEgvUtmj9G4utP380rmmr3rJNFiIm60VWRCK+I6g++tSXWxzp8KbO1TNy9c
         NXeUGzxnf6A9vbr7xYFf/8sVxCVB7PiMlBvN1jnhtRo/05uWxK5ZuXBzJwU81bSSqv5I
         sS1AKe5a11OusXhc/Kxk+8oU5AYZjYbeqam+aD6h2MdQnrxa3T9N2uMLiqrK+FgYd4U6
         ZooorcwimWX4KFugECgO+B9V+OktcvEmHQribSCEWXOoEDfA0TjfEpMfrKf2XIropMRj
         fZbDxvlDUp5L2dlcaoqbYl2ybnPlaMDLtk94T24BgcS3LhuPVX9NauMfJxWtlaeol31D
         70NA==
X-Forwarded-Encrypted: i=1; AJvYcCUab38SnpsNMjkrCITUCUV+2Trda+9/cOoTygS1+ZaYOPYpKN7ThS9mI6wq0o5RH4n/H8BW9PpvF6wXiJOA@vger.kernel.org, AJvYcCUdHufQ/vg4C0BQAgRfibWc+Bjf9TmxzoofDKxGFfH426KmV5EOBUqa3lE20zpeDFpCUW0fCi8tqo6Wify7H/krDu4U@vger.kernel.org, AJvYcCXDgyq7EE2G/8F82iidicsCHG3xyfr+clGG/IF9uZI2W02vFyiNRPWunUqAJzr29hLDtTiiPGeYrWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKrnBmr3gJTw7EJi8Gr2sY6kgRaSXTdNx4DfzUopuXRfuRJW4m
	jkFxopxlXYCt5qzuINQMNuO2hxsvPb0MZ9qaEhSDrfIZ7/8eLKMQJSEbtRQaJH8pHjfHeSil7G3
	TnhvlJ2BCWDD4Yz7xbDOqnfZMO/0WfQIUzg3J
X-Gm-Gg: ASbGnctEFqWn6FXkHGHKTHx9p9s17sMJyW1RUgtsH6UXc6qdioA53+vEqjZZXSsoh1S
	+PS2gwWSr1Auj+Og6DPBb5nappxtyEtDj98TTNa1GWbsGjt/4Gcm4l53jBfFc4TGJLIlXzq8N/h
	8TEqS0FXZthrJflyNPmiTcK7L4qqh1fwmT3VY6jGf11yJyvAXGu1boBzxl3DD2SRWWddThFKX4n
	SiApzmxuV22U/dMRA==
X-Google-Smtp-Source: AGHT+IHrdQ3al7zZzllY0Hp21OWiobcLb+yIZFo+OjkIuFFQ/RNdEWTCl3woU0n74B6QFHpyPtihpZ3UOk49dRByNic=
X-Received: by 2002:a05:690c:45c3:b0:71f:d792:608e with SMTP id
 00721157ae682-727f27de2f4mr14553477b3.10.1757142662437; Sat, 06 Sep 2025
 00:11:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250817-refactor-add-i2c-tracepoints-v2-1-c0bad299e02e@gmail.com>
 <aLnw0L3ncTsQm2eD@shikoro>
In-Reply-To: <aLnw0L3ncTsQm2eD@shikoro>
From: Mohammad Gomaa <midomaxgomaa@gmail.com>
Date: Sat, 6 Sep 2025 10:10:51 +0300
X-Gm-Features: Ac12FXyLNjRcg3DQ6NgcYGpVI8r6un5Ltzz5fIRPK1xJbohT9I2Cv0H8i8UmtpE
Message-ID: <CAKRcmag2naB67VTJj+xdyJGN3i6Q9a9EmF1qamfZSFs-w1RkMQ@mail.gmail.com>
Subject: Re: [PATCH WIP v2] i2c: add tracepoints to aid debugging in i2c-core-base
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	kenalba@google.com, hbarnor@chromium.org, rayxu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Thanks for your replies and guidance, I truly appreciate it.

ChromiumOS had a small subset of Chromebooks that had failing input devices
without any useful information in the Kernel logs, initially we
thought it had something
to do with the i2c probing logic, which led to us trying to improve
logging in the i2c probe function.

We started by adding a bunch of `dev_err` and `dev_debug` then we moved
to traces when we saw this Kernel Patch (note: it didn't get merged):
https://patchwork.kernel.org/project/linux-input/patch/C1C54D7FA3DF3958+202=
50710073148.3994900-1-wangyuli@uniontech.com/

My point is: we can always circle back to using `dev_err` and `dev_debug`,
while focusing on making the least amount of changes.

Few examples of where we think adding an extra log line would be beneficial=
:
- https://elixir.bootlin.com/linux/v6.6.94/source/drivers/i2c/i2c-core-base=
.c#L539-L544
(log that no driver were matched)
- https://elixir.bootlin.com/linux/v6.6.94/source/drivers/i2c/i2c-core-base=
.c#L614
(log that probing failed)

I hope this makes more sense, what do you think?

Thanks,
Mohammad Gomaa



On Thu, Sep 4, 2025 at 11:04=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Mohammad,
>
> On Sun, Aug 17, 2025 at 10:55:14AM +0300, Mohammad Gomaa wrote:
> > Add tracepoints to i2c-core-base.c file to help trace
> > and debug I2C device probe failures.
> >
> > The new trace points are:
> > - i2c_device_probe_debug: records non-failure routines
> >   e.g. IRQ 0.
> > - i2c_device_probe_complete: records failed & successful
> >   probbes with appropriate trace message.
> >
> > To support operation of these tracepoints an enum
> > was added that stores log message for debug and failure.
> >
> > Signed-off-by: Mohammad Gomaa <midomaxgomaa@gmail.com>
> > ---
> > Hello,
> >
> > This patch adds tracepoints to i2c-core-base to aid with debugging I2C =
probing failrues.
> >
> > The motivation for this comes from my work in Google Summer of Code (GS=
oC) 2025:
> > "ChromeOS Platform Input Device Quality Monitoring"
> > https://summerofcode.withgoogle.com/programs/2025/projects/uCdIgK7K
> >
> > This is my first submission to the Linux kernel, so any feedback is wel=
come.
>
> Welcome to Kernel hacking!
>
> I understand from the link above that this patch is intended for quality
> assurance. With automatic testing, you can find regression of firmware
> updates much easier.
>
> The drawback is that it is quite some code for such a niche use case.
> Also, I would think this code is very fragile because whenever the code
> path in probe changes, one must ensure that err_reason is still set
> accordingly. This adds maintenance burden.
>
> I wonder if you can't use the output in the kernel log to identify
> problems? We could add some if they are really missing. I know such
> strings are not static. Still, my gut feeling says some application
> should handle the complexity, not the kernel. Wouldn't we need a patch
> like this for each and every subsystem if we follow that route?
>
> Happy hacking,
>
>    Wolfram

