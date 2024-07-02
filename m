Return-Path: <linux-i2c+bounces-4569-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 307A2923990
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 11:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E47BE28232A
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 09:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CC7153517;
	Tue,  2 Jul 2024 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="LWOxqZSk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BE3152DF1
	for <linux-i2c@vger.kernel.org>; Tue,  2 Jul 2024 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719911600; cv=none; b=ERNO87wC55bE+9ZxcZo6jVpP3hspCPpLFa9dylWEY3aU71g3npfXgP6FznIFuJk+Oa7HUVpz0eGJejrcOuFhFKe6t/r2ggZZZKKmZqSQA/SOlEET3g+lI7SAV1f0Cpgf8zkawAQr9zVmb7jptIvX+/JHEqC2TCv/WfXFNEqstLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719911600; c=relaxed/simple;
	bh=Cj/ExZo5KegJayf9omvwYrTwM3WwmmvC/v2iKfUUqys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPF2GQtiRWb6EiNG3gOcEwBvIJCV9OLXIt5naXVoosasEePE/vktW8mVZVLeim/XBMfLpU3TQ71gumA8e11j2qRNBv/92mTD0mgEK2F1g696vrVLOvvA1/okVWBByRm0RbPBNBeKE8f1NKCuXRv/NH7VO4AcoZ12bokxBpAqIDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=LWOxqZSk; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6b5932383e0so40138806d6.0
        for <linux-i2c@vger.kernel.org>; Tue, 02 Jul 2024 02:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719911597; x=1720516397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNCRj5+WTS2zLnBy60cKB4H7fdiaThTpR4MM3eLLC+M=;
        b=LWOxqZSk9f90D1lpHC3ioWGCt+9EyatQmc2ZogjfpVYMTVxRoEFSTxQUAy6vvLsDVx
         ZC2hmgSj/K3jjEhWrZBdVPi+087UMmwwsn/d61NfdEKTXEVact4KIOyHykfTaqG2Gq8R
         spHiuuly4AbgtN/df2k+/SEuozJOBmVEYFHwKlkqws+G6topELcwsmzUDsyRU96p6rKO
         GGh5h8cGiixRe1TfoVpa+tJXmz+fnTNiCCasj2g2fZZNay9/mcKtwnZad6JfnJStxci+
         4GpzMxw1iA6D4URwKsPddMdRsZSph+8mxmKBp7QNxxLoK7kncvR2UbX8SzUjlC67fhk9
         U4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719911597; x=1720516397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNCRj5+WTS2zLnBy60cKB4H7fdiaThTpR4MM3eLLC+M=;
        b=b92Kuj9JHHD7EzkzJwFSWkqq1Mj3gMYdT9otWh10VsdrHwrKucXfejy2Ed0zSbjO0M
         mLDi9hbwEXXixd3xnplMQrvlwSuAOvt9uq4pYQ46gzeSMLrL5NSrBpWTrvrQUFjH1+hv
         9y3287j/JtqrByRdlTPHg4EBotNw/RSZHidrMwf6d2kkkO9jBnWkiEZrWmA/YhqKwsF9
         dmuPPpHZ24itJNbQt/+AONgAGXFMhLgN/ACXx+UL+ZJnvB4BqKuxZKsRX0SNdm9WRRyg
         e0N+pU7psizi8Mk2BiYVbnqUXS1W977L/RQiwQhi3SsX6ImvfTAF6GUnEhElP8lHGPUs
         g46g==
X-Forwarded-Encrypted: i=1; AJvYcCVBeze9nrvswzs8b7ld3o2rLUdwYjQogfKHPULQWHMuE7SDV6cq/cbbPGyOWcfN1XyoWQeSC0aAP1c347cWINLkJ+UoEg6NmrpL
X-Gm-Message-State: AOJu0YxRhA8IFJqHbK4uu/dEpTgSLFVBeInUCEoyvXk3dQUGvrh1H77/
	gaYOlanatFVZ5CFCwiMiAorE07746fyeDOP+J81ZslUegqHJzTHJ3oIqEAXyDh1l147Myfswnpw
	WaMqGEwEaa8NfB3nVQtNKABcO8ChZ6WiQNeQiJQ==
X-Google-Smtp-Source: AGHT+IEksGpwMqWlcG2UmMwDj/u3dj8gsEuKSsiaTnE/PE6G/zcQs9Tki36CrUO/LfzjGUlMpfNogpKWCk0jvx3CAJc=
X-Received: by 2002:ad4:5c4d:0:b0:6b5:2c82:7d7d with SMTP id
 6a1803df08f44-6b5a545b22cmr230774936d6.24.1719911597497; Tue, 02 Jul 2024
 02:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628152543.281105-1-piotr.wojtaszczyk@timesys.com> <dudh4jdce3yxwv5yw345gw23diwparhwvsl4jrpsyzpv3sgge3@ojtdgsdgwcor>
In-Reply-To: <dudh4jdce3yxwv5yw345gw23diwparhwvsl4jrpsyzpv3sgge3@ojtdgsdgwcor>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Tue, 2 Jul 2024 11:13:06 +0200
Message-ID: <CAG+cZ06sqDuOer=fBcGhQkTUgWt9XqaLkAW0cmT8g=EJ+e8pWA@mail.gmail.com>
Subject: Re: [Patch v6] i2c: pnx: Fix potential deadlock warning from
 del_timer_sync() call in isr
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 1:01=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> w=
rote:
> > @@ -653,7 +624,10 @@ static int i2c_pnx_probe(struct platform_device *p=
dev)
> >       alg_data->adapter.algo_data =3D alg_data;
> >       alg_data->adapter.nr =3D pdev->id;
> >
> > -     alg_data->timeout =3D I2C_PNX_TIMEOUT_DEFAULT;
> > +     alg_data->timeout =3D msecs_to_jiffies(I2C_PNX_TIMEOUT_DEFAULT);
> > +     if (alg_data->timeout <=3D 1)
> > +             alg_data->timeout =3D 2;
>
> I don't see the need for this check. The default timeout is
> defined as 10.
>
> Thanks,
> Andi

That's the timeout value which was in the previous timer in i2c_pnx_arm_tim=
er(),
without this I had time out events.


--=20
Piotr Wojtaszczyk
Timesys

