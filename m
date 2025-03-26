Return-Path: <linux-i2c+bounces-10023-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFCCA70F00
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 03:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A04CB7A608C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 02:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C0F13CA9C;
	Wed, 26 Mar 2025 02:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX65erbQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E376DDD2;
	Wed, 26 Mar 2025 02:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742956038; cv=none; b=G32R9pQCUxT+baH+0eoh+yKM7baZQMcInO2sRN37RgGCp0+C8JwO49qGj1q+QOEUmVgynN/0JvxHJFYZ78Ipsw6J9LePUkYJUdLUVqZtpLXfPfztqlja9tqelVII1CxXZoK++a/5TXZCc+QI/2pJP7KOkeFxW/A7pWw8FIzH56U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742956038; c=relaxed/simple;
	bh=OsYNUD0JrMVznUm/0Sb5u3pWCXxEM1pl+4CcCbQaFiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8P7jNj9E+zdAsqerKXOLMHmqIuaEv2QSyAAIfolplBcMYgACVPEHtnNivux6CYP/P/Gr9UJYoDNn9FeZvnKiGj/Lb60ZOBRMsZDlxjfvMjD7IyYmsMvn/q/yUgeGg7KOQap/bdKTVgq8IGCNUtIEd923JCK/xl5jR60oIe4YBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kX65erbQ; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e643f0933afso367469276.1;
        Tue, 25 Mar 2025 19:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742956035; x=1743560835; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OesivztSSmkVg2MxyN65puUzbiFCHezJeeQ4VZITXsY=;
        b=kX65erbQXqftn9bmSQ0V2U+Thy7k8x6FvwyTzj/WlvrmeMWo8+MH3WJvSkE4o7/5aM
         KOFD/54aTcoDHzP0B2qQpTnoKDKkoyX6788R1XOf75H8/tI42/L/fn4GXanySGB2guv/
         j2H085P51F51nENq6o1RjlAKuIfucsMDxhq28oY0xIay2p+w5q31QgWmDoz2hU3iFbYE
         TQTMhXdPyPSSyxpJjnhFyLBb72svObql9FbnlmfsKqARIbqXkaiJwznGSTCG60EID4MF
         j2cq8r4xfZ29jB7caItS9GedAaiYaFvwSAiDuw+fc1sMH+b1dxwwYVY63lzEmkE9fCtl
         0ICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742956035; x=1743560835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OesivztSSmkVg2MxyN65puUzbiFCHezJeeQ4VZITXsY=;
        b=fl96/+LpywN9od0uPYHQ2RZEof49IKngJcAT2idGLs47OUzWz72Fy2+1pgnAnUMHrk
         U2FNJwIH4vMeIOTixesDcO0CTGOrD14XJVbbIKEK2zPTpDfK0Xh1PMKk4AWZgcuXA9iX
         9pzdN3nb5zDHP3U7TWHohYvCuhfb33b0uqir41Ni8o7gVQCHZ5ydhKG95NfGilvxhuAZ
         fhFJbGTWeChHCx1+nuutXOqTlxzocKMtEUGUk0PuWq/MVK3clNmdOJWvTEpzS4BYAJkS
         B2Np5TnjcKiAjnJK4aU925L+8o/wAWDX1xerdRGk+sOSnyzCZO+AJGOzN6FZTCH9a2PZ
         OWyA==
X-Forwarded-Encrypted: i=1; AJvYcCUeS9pCMIWCkrmUz3TFbX8J/r1zBYshScWcfTU01LyrofRpu/N0DcjEFAfgi2Zvvq/5Bd+bwhaqfVw=@vger.kernel.org, AJvYcCUoQBamja1IacMCxp9AUplv52XviJ34+iZVgG9lepj6vs5SOJ2jSOgqU6MGtlq25EFYJvl0JLgLM7Sjsw==@vger.kernel.org, AJvYcCVMwd25H24b9FhjV6Y3jnwGF1TmhrHesNwlEH31vQ1p7iw/Lakqi4Z2Q7OYVkqZd0YFY96oclC97W3MG/0=@vger.kernel.org, AJvYcCWjeYGiNb6kEJ2+a9bvMB0pMMDBcHXlT4uwDozPOhN4yhfYZzVoMDP/6zEstgzTEpZE1++HdfhY8n/Z@vger.kernel.org, AJvYcCX7k/SaUWdzk2oClIX4o+Xy3/jviWuY5itVhmYdoIi/AtGJWukvg4jVCQ1IIcISXQGbjQF+oWJ20li4ROn2@vger.kernel.org, AJvYcCXIrCO9VsvuCnLq4NpsWA75rY86vLrumQR0pULaO8WEq0RwPZb8u2fasehpZaadvV/jjiOF/q7XcaoDuFOCMRY=@vger.kernel.org, AJvYcCXIrSd6DAROQQw+9B/yXk6w1pJ8JAM5FIkKGmCouaF+bsYd0dho1zJKDUARTTBaORAxXxgz93GWcSE3@vger.kernel.org, AJvYcCXnMuIAVPLwj9X8SidlXImJZYH4HZNyCztrblFeFcRqR0fUx50H9BQ/jX22Ir6HA9IqDbP4XbdI@vger.kernel.org, AJvYcCXzcbBhGg8BMSuiGdbOEk5WLVAp9Kz23iHnCU8n7ZElsht+8OzPZ0Ty5zlHQNHPWF1cPr6+4LC3hPXy@vger.kernel.org
X-Gm-Message-State: AOJu0YwsgzCnkDgSpRQhnA0N8emajIn88McgzWPRx5asz/z/DLCg6i+H
	d4T5INjuHeYFL7+q2A2LNuzzBGaARxuYpR55gOZBwItX1fyzMXKgMtszieRvkCSd09IpuRYiCDe
	4sN7FD/128FyKaH+F93453BH/l8o=
X-Gm-Gg: ASbGncvs+0/v+FWzSNl1nYVbWV9lr1cjMcrTN9xaD1h8ZDg5cxLo4pLLs7wEhJAHqA3
	9tM2C3tH1F5bqoWN7Y7jnUO2x+MHmPpMNKD+qzv8HeoeryUL2ty8y7h/BHCydtCQSjKn+bQK010
	ovjztIfO7YzjUzQLoZNrIuzJ/VcSfZw2NGFhR1TeaQSUq2MzBU01jmNMiM8Ccv8yP/bxoz1N0=
X-Google-Smtp-Source: AGHT+IE3Snfm2qHqVOKFt4OK9x43NDDK7USUND1kRLvFUR9KKrSRB3y9vtkk0LE7kTF3W/i9pdHGSCQ/R7I9CXHX7nk=
X-Received: by 2002:a05:6902:124b:b0:e66:a274:7fff with SMTP id
 3f1490d57ef6-e692eeb669bmr2931469276.21.1742956034774; Tue, 25 Mar 2025
 19:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com> <20250227-spicy-grebe-of-dignity-68c847-mkl@pengutronix.de>
 <CAOoeyxWSsy0Q0Y7iJE8-DZM5Yvcdto8mncFkM8X4BvVMEgfUiQ@mail.gmail.com> <20250317-cuttlefish-of-simple-champagne-ee666c-mkl@pengutronix.de>
In-Reply-To: <20250317-cuttlefish-of-simple-champagne-ee666c-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 26 Mar 2025 10:27:03 +0800
X-Gm-Features: AQ5f1Jp--uItuyd7OBONJJlx1w09CC-5QpS4AdX0orjyk40ENkleiPptvRU1DIc
Message-ID: <CAOoeyxXSC3rjeB0g5BtHKvKy-Y9Dszd5X9WuHeBeH1bk39d_Eg@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B43=E6=9C=8817=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=885:21=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> > > > +     priv->can.clock.freq =3D can_clk;
> > > > +     priv->can.bittiming_const =3D &nct6694_can_bittiming_nominal_=
const;
> > > > +     priv->can.data_bittiming_const =3D &nct6694_can_bittiming_dat=
a_const;
> > > > +     priv->can.do_set_mode =3D nct6694_can_set_mode;
> > > > +     priv->can.do_get_berr_counter =3D nct6694_can_get_berr_counte=
r;
> > > > +     priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LOOPBACK |
> > > > +             CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BERR_REPORTING=
 |
> > > > +             CAN_CTRLMODE_FD | CAN_CTRLMODE_FD_NON_ISO;
> > >
> > > Does your device run in CAN-FD mode all the time? If so, please use
> > > can_set_static_ctrlmode() to set it after priv->can.ctrlmode_supporte=
d
> > > and remove CAN_CTRLMODE_FD from ctrlmode_supported.
> > >
> >
> > Our device is designed to allow users to dynamically switch between
> > Classical CAN and CAN-FD mode via ip link set ... fd on/off.
> > Therefore, CAN_CTRLMODE_FD needs to remain in ctrlmode_supported, and
> > can_set_static_ctrlmode() is not suitable in this case.
> > Please let me know if you have any concerns about this approach.
>
> Where do you evaluate if the user has configured CAN_CTRLMODE_FD or not?
>

Sorry, I was previously confused about our device's control mode. I
will use can_set_static_ctrlmode() to set CAN_FD mode in the next
patch.


Thanks,
Ming

