Return-Path: <linux-i2c+bounces-8693-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 741BF9FA934
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Dec 2024 03:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B73821885C7E
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Dec 2024 02:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A82826ACD;
	Mon, 23 Dec 2024 02:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9Br0spa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7322C9D;
	Mon, 23 Dec 2024 02:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734919499; cv=none; b=pz3jOqQExg55LvitwnNyni27zlLxAs5zcHTquGU+bL5vtsoEFEXYryZcbDxurG0Lhuiq0MOlRmjP4VQ8s2fGTbDJZTGPNkOnD1rLc0si3rvX3KAppLXpd0SdJYUSJ+lIZpcPlBaZepKEMLCn36MSdEEMNBBJ8kcXJ9wga5yi4xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734919499; c=relaxed/simple;
	bh=nZO2sttRafi2sozREk9BqNLfgrqmhQtZ9Kh2qe6k6tE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ld7X5SEg2aG0YOK60c4cAJd3pBwufF34itiQL6Oea4y7b4e9vXyIC3yoKrBxK7EOuNK544B0vK1WFGvEUczt56/J09fvFsOqZjdJlkem5r40CAo0485SMyWuBUe8DuzO/G9GmQTVrJsqfqZ96vRrJQ8Er6yuQfevIDQeFidX5sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9Br0spa; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6eff4f0d627so32287557b3.1;
        Sun, 22 Dec 2024 18:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734919496; x=1735524296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ib9JXiyXSZuhJJgZiktnoQBlvcVMdoPCqOuDEz+MgSM=;
        b=g9Br0spaWVoD9DuN/PTMgEwN0rmQ1K/F7Htstt0iF/3fE4JftEDNOuailE4aIglKb2
         z29L69KlHnWiLwhMd9F/Z0Bk/z7fohfnF04QPMXWUXL5jHJvgPPhYPAOv5M+BPmw9sAC
         wJdFlqXKMqLTvu1HNnz4UK8WtH2eNmMKd8ieQTvg2uzS3EFuoCRuhlQ4FZXN77NmWszr
         /TAuG2Hl+euEO8cU51BtlQaMYCpe51i5u9hXYlTKw7HEXxu4+ZGsHUqQE6eH0v0cwo25
         SPujaWcM64qCppKc+stXAnBCoslcZfZSvc3lhK+HxP/TI8z3/an6lITzrE+P79L9RXre
         FKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734919496; x=1735524296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ib9JXiyXSZuhJJgZiktnoQBlvcVMdoPCqOuDEz+MgSM=;
        b=euevcbleiTfVq5BdI/4ghotvbbHWqwk1aas+tUhfuophuKNZv1J1v4tZPFU0Fpa3S1
         ELHZ4bYXJW2EGCojMdG16nf00RGEHffB/Bsk04E2fudFtf5Vo2yfN7twPDkFOmqFDHor
         M+P3uDFVrOtqRxkJ+alQd1r+4me3TlnGmKIB3ink0N7p4qvdzWNhm5x9YN0rjdhk4OiG
         pqrYYRNQNjOipo3rV6sSBH/P1pGWsuGHAd9pJnIOVMN90VmjePa5oRiNUbjnsdfZW6uS
         TX1D7KsACQje0NXIFXEva0JCtHVnRR6SHMkzOvR+iVIW9OLL5iGQTnOkBwsCkZmXd+6d
         7Zeg==
X-Forwarded-Encrypted: i=1; AJvYcCUn1Ifr6nzLxdwTpxHWTzES038JV8ppuoIotNH8B8LbhL68jGAghl5ZBSsESrOXqCHO6XAzvI40@vger.kernel.org, AJvYcCUzhfaq6TDYPCHL+2EBrG5p5wZ+nh35N5clFJrGzP13C0oLbZiOwrFqOBXRO8rIUHPGsx0Qn8I6r9FbEh0T@vger.kernel.org, AJvYcCVCGns5clepezjwRYCKIRL/FUYWM78I9m5TbvKjZsfRp3zSlUbPZiEq/m3vYgza5z89JkS5S9UeXIk=@vger.kernel.org, AJvYcCVF+8IaZejMQSF2hlGy5L36UAEVL3bm8r9MLEN4i63VNZ4E9JYxK0fBTHmkPN8YiLqWJBkZUJEKMxc+@vger.kernel.org, AJvYcCW/vksTt4r1z00UCz6rT78GuTQ0WSvp61vHcHRw31fIQfbURkMWajust0eJnHuy5oQITtkVqWW9+hyGQVJ2KCI=@vger.kernel.org, AJvYcCWiDvGhLjQCOW3v7xP11rxsc3Mk6NA1iJL1TVhDhqOzOInEZSYh63nWJCckUZB5mXa11QF7O83AZfRGg5k=@vger.kernel.org, AJvYcCX/S//36s54S3APzcY2E3JJT/iTPDIG4P3SwEU8ezCWNGbPlD5rHmSZPBXVA0UyYGLrGXJQkV6ph2zg@vger.kernel.org, AJvYcCXmPaPdQt6C9kN8B08nOv/ZhzGEwR38QqL2ww7UHSmcov9sfLJn/ALib7HrgRn4aBXChy5ODgKaS9bDKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo17z+0ssLiXmZeyXcnip8aHrhwl8qhGqkhYQiAMTgP7OSWJ1J
	hFwaKm3GfMr28qZnsspunSwdhf1d8FT9mseB2gdnjhn7FinPk+5v9LHJiZobELk7Pe4x8j1T840
	oGEOVgosHzCC6Aw0/BQgLbCnjsPM=
X-Gm-Gg: ASbGnctjvF+/3fkzW++qvl8846ymGb9eHLhiQXakBzsWT1GJ8YP4NPZFAOe1LPo7U/A
	ZCfY9kbiiiBoSZH+YK6rV+754W7yCMJsGe3Si
X-Google-Smtp-Source: AGHT+IGHMWhTJnpzZ4uHwIT/SezNNPPFMGRfJJS0EfWsFh6mP0lNTmu9ZMqVjCXvD6zg/HdbPIIlpywSVP+ZRPNi6/I=
X-Received: by 2002:a05:690c:12:b0:6ef:8e4c:65ea with SMTP id
 00721157ae682-6f3f80d6278mr62872537b3.5.1734919496629; Sun, 22 Dec 2024
 18:04:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-2-tmyu0@nuvoton.com>
 <CACRpkdZh4hCvBN=7beFEgm-mmdwSTW1fd8OZhQO3kr6Cy7P=dA@mail.gmail.com>
In-Reply-To: <CACRpkdZh4hCvBN=7beFEgm-mmdwSTW1fd8OZhQO3kr6Cy7P=dA@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 23 Dec 2024 10:04:45 +0800
Message-ID: <CAOoeyxWpZF3-cdcT=yawRddADwyH5La0bMB+i3ic1O-TiFb9Cw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Linus Walleij <linus.walleij@linaro.org>
Cc: tmyu0@nuvoton.com, lee@kernel.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Linus,

Thank you for your reply,

Linus Walleij <linus.walleij@linaro.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=88=
20=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:45=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hi Ming,
>
> thanks for your patch!
>
...
> > +       while (*int_status) {
> > +               int irq =3D __ffs(*int_status);
> > +
> > +               if (*int_status & (1 << irq))
> > +                       generic_handle_irq_safe(irq_find_mapping(nct669=
4->domain, irq));
> > +
> > +               *int_status &=3D ~(1 << irq);
>
> What about doing what you do in the GPIO driver and
> #include <linux/bits.h>
>
> And search and replace "(1 << irq)" with BIT(irq)?
>
> PS the main reason we do this is because
>
> int a =3D (1 << 31);
>
> becomes a negative number on 32bit machines, and
> can lead to confusing side effects. BIT() always work
> on unsigned.
>

Understood! I will make the modifications in the v4.

Best regards,
Ming

