Return-Path: <linux-i2c+bounces-11795-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2791AF6822
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 04:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 073EC4A6F2C
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 02:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A291B1E32B9;
	Thu,  3 Jul 2025 02:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHsQXu8j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3F92DE6F9;
	Thu,  3 Jul 2025 02:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751510413; cv=none; b=flQrU3Lx1+Z0TxiedxxUZylGrNLFGarJZV70oyGrwes4FvsQsL6ZUJBVUiAjiaH9DIZA1CZDYMzkMepzu6BoLzfKiPVjqPfQUin16sW1LNafd3AEX8q62pmojV6RfsG2owv65e0NxrCTeONHTEr9NI2aKrH0LvXdJbxU7osHXGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751510413; c=relaxed/simple;
	bh=vnQR0Tr+PpymeHZa8w9DI9rZ5j98BWtaiz9bufGuSc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O55tPrOGvZKEJWQZi3WBd53wTXxY/ACnPOLTbay763GoYd+2Q+2zp0fozW3e5LsUuitsbykKYyFdICiw6hzqF66Qix2P3ttPlFChSo37oRnoNFsqFvc1AQMtq7b9f+ETxMrQd+4HIdJphvIC0ujdil4nEdQbHKuDMM41Ne/QvRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHsQXu8j; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-713fba639f3so74305567b3.1;
        Wed, 02 Jul 2025 19:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751510411; x=1752115211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Za0Nw2qGXMtrH3M2cv6/kU8VGW5fkBA+DQjX7CKQXrM=;
        b=VHsQXu8jfZVtWZ5yfob34AOLoKCHoFAzDueDNQFHc/4bdrQdQPB9Frgm2XkgQW3qB8
         giQnS3TxVsqEcgfoYRZAQJBmzh03238orzIWRhLtzFRR8IXU7imxFxgfp9/OWmqxU38E
         FxliagbkfMfuWT3WdYIs3ssMu4TyKiWMW9+uyjRIOP4JCLS15TtN2FhRys/aofoe/20c
         VzV+Rux5Cikxdki2T+vmCfpDdawb98HAHbawhKQlY6oYpnobDj8sz+g5orH2iKVVGl8k
         RuVc/FoCGTvm8+izSlgCGnhqJYu5EadPcfPzU6D1rjvf+rTzKNcD3JiloZrjE9Le/3T5
         YSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751510411; x=1752115211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Za0Nw2qGXMtrH3M2cv6/kU8VGW5fkBA+DQjX7CKQXrM=;
        b=bZp+bgpKJlg+PeWXb+Qk2wF7OFY74umBXhEzOKTV4SICBllaQjYbTNVImp8H7phk4T
         jkf4CfRj7bOKlkbfih7xVdXTjQfl5zTbNRYgRvT3ZDUZ5VUrKXLbfrDXorl7xa6nr3Hb
         9kyZacNIK8S5dEYvymc2NKLeRwgfwxQWouMDNXLHGItqdVoINBqDHdPErnU9eLM822cC
         DBu9FKJ7KzfV7ZdZz+suuuGm/9cWbsXByaCSkyvPSj9LxEVZNAWxv8AJxYs0lgBwqyOu
         Wykjl/SGsBdRJ4AThyzXhmWtCW+0zeRS1OqnpXivWrte8MCQCJHMnoG7WMsF5I8hhhaw
         W32w==
X-Forwarded-Encrypted: i=1; AJvYcCUxI/G8AQSdzMfjBSgSxPDj2DDVu5JzXL/8hAW8gQTPOKMs04hqJJg7HXDvJC0BftkpZ5uQFN985DxKaA==@vger.kernel.org, AJvYcCV5ujWUGEM0dPD4bWXBnLBH0X7Hic0lyBRSiWh4YUcMQIMh3hUC/a+VAkJ+YAXo/mRUON9wIcMrU8T9+2VUr/k=@vger.kernel.org, AJvYcCVOGYIoocC1fJz6YIvPWf0Biwf4xQFF/brxrUPc9TpYRx9t7wtsYX32vUtnHSSK65R2ZYapcX21lLE=@vger.kernel.org, AJvYcCWPixUX0BVF9+enEliGjpIzx+ZoPkoCJ8HCn7DrOc9HZj+9Ypat5cnLeFo5OqvvlWkApFcQDNETSivZ@vger.kernel.org, AJvYcCWX8NwdANefk5JZ0G7yPQ53nUWUQCcjAnMXzVyAbApYzBVmfYFMlPXio8AGHyx4OiWBX4Q7aEognpRKjJXh@vger.kernel.org, AJvYcCXIIQQ6xGnlNayhtVfnrJLeoSFlvsc5KbwpS/DA6OSkmfrVqv519HIFS7Ol9/C6gzRfNLDK1KY2gurJ@vger.kernel.org, AJvYcCXKjEMol2J181IfkDxl0hHsa0Sh+IUlb1MXqNe2w3KqmRDW7kxGToHi44j3WWHFGVTbMZt3PIgk@vger.kernel.org, AJvYcCXQ1eeq9WXRL1uXG6ByZmU3JP21P9p62/hc9RSXPwjabWppsWiCdbZa2oAYzFJ+stAXhcDAn14hSzjS6g0=@vger.kernel.org, AJvYcCXgbEB1HmpHKQXOBMW8FT+G19WOtOKCWualFYzA75r8CzSD/pvXEvd7ftUXrZDaqRzWKRQfygMahRIW@vger.kernel.org
X-Gm-Message-State: AOJu0YxIBG7y9CSpNqtWxWOw7P21yOgfUyis6b4Yd/S6X1PclhZCIY3X
	JgdjytHuVvDW8LfSsoHup6bCmu6AvvR5kKPWRnsVX5yJNDRb2MkVOd9zgAhSSN7N2MeupRU0aN4
	6AYfuyz4WSFz6Byg93HwI+7K+1pYypPY=
X-Gm-Gg: ASbGncsoz0PFyekoCTvL9TNiAyZgcciv6xZl7/xbnkO53F0OXu6xrS8jsNKapzG5zD0
	upDs4p5yBQefEfmwc2AmO+VYqaZwv6uGwYFaFGLMawC2wVi3LtDEodTtcJd3cNAUeLKbITuKZ9h
	MbPdSa/BCwC++aVRrxp7u2pImdnItNC3cqbYkn093Bh0B6om9DVD2M3zxib6dFO69HsUvMswoVt
	Zs=
X-Google-Smtp-Source: AGHT+IFInAJFwtSvbRbpfWkJeWkQyPFJ4uUnPZCJSkqyT+CMSBuNG5K9HrPW5jNVrCExkOcwDsaWwLcorYB4rVgpR90=
X-Received: by 2002:a05:690c:48ca:b0:70e:7706:824e with SMTP id
 00721157ae682-7164d313418mr81180297b3.6.1751510410717; Wed, 02 Jul 2025
 19:40:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627102730.71222-1-a0282524688@gmail.com> <20250627102730.71222-2-a0282524688@gmail.com>
 <20250702161513.GX10134@google.com>
In-Reply-To: <20250702161513.GX10134@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 3 Jul 2025 10:39:59 +0800
X-Gm-Features: Ac12FXyfXTYeuK_eNNsj2MZDnEQB-Di_TdAXd7UH2wEmeYhkuTmXoczjV6dlS0E
Message-ID: <CAOoeyxXWbjWvOgsSvXb9u2y6yFExq347ceZe96bm9w+GQAp2Rg@mail.gmail.com>
Subject: Re: [PATCH v13 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Lee Jones <lee@kernel.org>
Cc: tmyu0@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Lee,

Thanks for your feedback and review.
Currently, the status of the sub-device drivers is as follows (A/R/T):
    [v13,1/7] mfd: Add core driver for Nuvoton NCT6694 (- - -)
    [v13,2/7] gpio: Add Nuvoton NCT6694 GPIO support (1 1 -)
    [v13,3/7] i2c: Add Nuvoton NCT6694 I2C support (1 - -)
    [v13,4/7] can: Add Nuvoton NCT6694 CANFD support (- 2 -)
    [v13,5/7] watchdog: Add Nuvoton NCT6694 WDT support (1 - -)
    [v13,6/7] hwmon: Add Nuvoton NCT6694 HWMON support (- 1 -)
    [v13,7/7] rtc: Add Nuvoton NCT6694 RTC support (1 - -)


Best regards,
Ming

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B47=E6=9C=883=E6=97=A5 =E9=
=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:15=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, 27 Jun 2025, a0282524688@gmail.com wrote:
>
> > From: Ming Yu <a0282524688@gmail.com>
> >
> > The Nuvoton NCT6694 provides an USB interface to the host to
> > access its features.
> >
> > Sub-devices can use the USB functions nct6694_read_msg() and
> > nct6694_write_msg() to issue a command. They can also request
> > interrupt that will be called when the USB device receives its
> > interrupt pipe.
> >
> > Signed-off-by: Ming Yu <a0282524688@gmail.com>
>
> This looks okay now.
>
> Do you have all of the other Acks?  If not, please let me know when you d=
o?
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

