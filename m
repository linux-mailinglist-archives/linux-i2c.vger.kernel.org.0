Return-Path: <linux-i2c+bounces-10025-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F793A70F32
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 03:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 370B0177616
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 02:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9C014A4C6;
	Wed, 26 Mar 2025 02:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7uhKs7r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2336262BE;
	Wed, 26 Mar 2025 02:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742957192; cv=none; b=ZPfhtC7c5Qd7NhYBuQTA7R/u8QewGjg+cStYNJaHsOkz97dNfSi54ExX/420jxaWdVYkJ6LrRSsgG7aYvq5kkW8L1SafLNirE81CMzqIWjgoltoCAUKvVX6H4yijkq++FEUdUoqugVLUFo3L6DQlvisbN7hzWJ+DfPugs9RlesQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742957192; c=relaxed/simple;
	bh=TemeIxXOTP0Uco3Ec2kGFeEcW8zPICZSTXId1YidIAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLYQ8NpeOOPWNOAcpe+g3o7GyEFm4jK+5Jr/ratXQ1CD+0IcXY7ORsolcVdhh4FjZS1v1iR2hNMZrJazNXYtAnywC69izDmqsDQvnh3fTAeE0WEyqoQ1k19BilMvyV2z217DKMfsNJM+Zmil4lhEib94HyFLa7YzMHgN/pMBD8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7uhKs7r; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7020d8b110aso8925777b3.1;
        Tue, 25 Mar 2025 19:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742957189; x=1743561989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yESuct/MDFnKMjYbraaASh3Kh95O5CiA85bHOnZL3q8=;
        b=J7uhKs7rN5TZ6vJATgEuHF636BkXt1Gl9PHjD79tD1efPvDlaJTLPRH8+9lMQvdaoy
         jmKEXT53SDA9Vj5WUMNiPj3mwp8WayWTGsvfoAxTuJ/MGJPRDdMRDgUnDpbmwNEh0IXj
         FJMloBAreNzZp81YeUwa3AZXN5eZ7IzokssirRtliTGwV5lWNDJVwnU+DbvWIklEK//7
         3Kq37wa7OXzA7yoA1iAFTOZQIsvveaqmPi4PHQkYo9DRZLKkL1g8HJOokyB/y9ulKSdZ
         uyv0Al96iWLy0OaDCWO+KVn1F3xRXd/BhBNqNQLcnv/nzKS/O+CO6wI7vf6OnnMz1OMl
         pNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742957189; x=1743561989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yESuct/MDFnKMjYbraaASh3Kh95O5CiA85bHOnZL3q8=;
        b=HsdT8wNRvnXUq9iQyEyARMsmxZkzgtCAANYOr+ttXfRvoCwVJLRKnJ+EIV3TEf0t7l
         vx/IUqfk1DliHUUVM+4UJIqg4ZsAyPzom2o7vPy1/izrKzpoDfq71gTXJSocggq0565C
         DqMH6M77HRXUreGejlOzYZHl8veDoiSSIgOFkB95T1+dji7THqeaZiKuQH7CYrvYkuDI
         gkcCNDpWsdatGzNEb7ilg3YHnlj4Rh6FAeCxx+s1x15HierO1xQ8pmSulHtBZqXaNniu
         x83OvUOmDmNvqDljNdMRhl8M11n9xg/POJy5x0RYEvVZReuh0yR/qnZDIgQZUNEm2ZVn
         hFWw==
X-Forwarded-Encrypted: i=1; AJvYcCU+dlu14qcRsG0+TFz7W+tfXEpAO33D2Xipeui3ZqO1YsfTVBrNWk87RUbMvm4POMYCOS/hSdDaX97BMn4=@vger.kernel.org, AJvYcCUNZN12fcqcOzB9LCm92vYMgcEmpxhCwSpbNRC7gvgskE7WTG3RNb7C2qowZ6rl+FSiJtFstp2BWAw=@vger.kernel.org, AJvYcCUQlVXHJYpsTf2lM65Mpzwa178lBg5hIxb5P5HEArDoUYSZ1dOFB8X8E5vKjRRtAgpXFgSGvXDdyGd9@vger.kernel.org, AJvYcCUmHzWSqAmMZjo/k5MGOtqV3snXe5hxwZkmr1mxThpemW+JmLU1LGitoMPI+eSdEgF4YPa3dzvlXb1ubQuf@vger.kernel.org, AJvYcCV+gEnV6jZC78Cv9eFSd7WRGPVR6ifkxv0HtpXNyRhKUszesGDYhooqLW3j62OHHXE6lRJ7sENuPYSOIW3tFyA=@vger.kernel.org, AJvYcCVYXrVyfrBSm/xYtg120RCwx2ATN+qdTpj04xNAwVc2AfYBtHd+qAd2Wbb5fus9Wysd5YX7S6DXvor5@vger.kernel.org, AJvYcCWOEf617RDPUZQ3d6UxRh/TRqju3whOQ4k6WkXAhluILSDNtpu7KlwcQLtmfBg3dA81t5PQrBTH@vger.kernel.org, AJvYcCWc4ivZZFykSm8X1Uvm1B2+iHwVx1i/Lmw30Jz0byLda0uwo08HUkVTpK8WPsXDaO5V1cEtx3KWYaKMiw==@vger.kernel.org, AJvYcCXiC45PODz2og1iw64Rch9qcEJYD46w2TvC7D8WG+zJPWPzVDzhOZnSE9fCHa2oG19WOw1qGCnx4Cs+@vger.kernel.org
X-Gm-Message-State: AOJu0YxUlsq+BLoXY9hkwlFCb/+WQanHYpHLY6tW0/0vyKtKUnsAWpgI
	TTPJ5p+lNnb1noofvnV6HGOT4jd+3fzZTDK7y7W0hjZRYAJa1c/jC1IjXhTv0+gC/gHKrpyyD8T
	abui4xgvAVpqfPmHTs4mcIBPDnkI=
X-Gm-Gg: ASbGncvEKccXG6/fci0WZ6t9XOy10cjKg/3bpoJHlMMP05tocU33iGpYT9wjOXY5dWn
	0XWvDw83CtGWbdwS1kGmz4dHk1z+T8y1SU4cAJ6a7sOi4iJOMRLoS3BT/G7OKQI2OTUbHlM6Mlq
	KbSrv7TMpob1EvSA2NNpa2tof45CQvoWROx6slhnqDI2n3h++eyLQZ3f5AT44E
X-Google-Smtp-Source: AGHT+IFlXvJ6CTG+2JknDASvW7bjKlrzkRcYT6RT+aDT+hRu6ILVt+wIY5x0+ZpDOAOu+0XQ+vPtSQpiPpRl4f+ZLVk=
X-Received: by 2002:a05:690c:338f:b0:6fb:4fee:6044 with SMTP id
 00721157ae682-700bac61f86mr264571117b3.15.1742957189450; Tue, 25 Mar 2025
 19:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-4-a0282524688@gmail.com> <jpaqx2z5io2bvtluexnzrkz4zcvea7qqgpa6bdhm4yzby2rjgb@izncuolmv7tl>
In-Reply-To: <jpaqx2z5io2bvtluexnzrkz4zcvea7qqgpa6bdhm4yzby2rjgb@izncuolmv7tl>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 26 Mar 2025 10:46:17 +0800
X-Gm-Features: AQ5f1JotWQQLWQYsnc4zYwYRmgkRl0gS2ASZgEbf7NXF88zg4Wj3pquEN306WFE
Message-ID: <CAOoeyxUwgxsLNN1i8vM6_NdR+ytesuVA1iE_TSO4CPbSa2sAnw@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] i2c: Add Nuvoton NCT6694 I2C support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Andi,

Thank you for reviewing,

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2025=E5=B9=B43=E6=9C=8820=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=887:58=E5=AF=AB=E9=81=93=EF=BC=9A
>
...
> > +enum i2c_baudrate {
> > +     I2C_BR_25K =3D 0,
> > +     I2C_BR_50K,
> > +     I2C_BR_100K,
> > +     I2C_BR_200K,
> > +     I2C_BR_400K,
> > +     I2C_BR_800K,
> > +     I2C_BR_1M
> > +};
>
> do we need all these frequencies? I don't see them use anywhere.
>

Originally, I used module parameters to configure these I2C's baud
rate, Do you think this approach iis suitable?

> Besides, can you please use a proper prefix? I2C_BR_* prefix
> doesn't belong to this driver.
>

Okay, I will fix these macros in the next patch.


Best regards,
Ming

