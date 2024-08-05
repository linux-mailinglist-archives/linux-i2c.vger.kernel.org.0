Return-Path: <linux-i2c+bounces-5153-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A1494836E
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 22:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99F49B21393
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 20:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9964B1667E1;
	Mon,  5 Aug 2024 20:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJt2KSEl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB1013C809;
	Mon,  5 Aug 2024 20:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722889688; cv=none; b=jR4e1zuaxd+LgFxKpqLKqxd39B0V5x+iUIG4IEX8SwFZb9qqpTw6mKskwrYSSzhNjN9ACY80piGc+1+m7AS4tNbeEEPtv/dzOGi1LBBDMPUeD91m6w8PDPVKd3AnVXEyYJzYhZmFV2SMCMpwOPSKrKDUpFdsjFKzRCGfEDvzErc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722889688; c=relaxed/simple;
	bh=9ytzYQpQ4+WZ85FN6hNawauX8xGw/KTcp5WnEDPajA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=miQGEag4vtL7EHA1JfhG9uzCmQE9vU5kalAzJPNPgTqXDBZAHYBezYiGfK4wFyBHu9cMvyWDsq3Kp/fHq5Gd/V4vnmKpyDahui8UzZnPSGbeaUA/2pwPqPhecV253XZ0tlHdmhMZWT7309NCm+DsjPpSZAMfOqsEoe4lHw0TO2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJt2KSEl; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef7fef3ccfso125219111fa.3;
        Mon, 05 Aug 2024 13:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722889685; x=1723494485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPYjuTyEQs2R3Q5/ZX1kjZGFeSB5y0CNTTJelsnVz+c=;
        b=ZJt2KSElBIprGxv32HsQpHapi97jzO4kEQIYlEkXkEOsAJRB6zmCj1KmXX0ViawG6e
         SLTSM3JWLzoCxAjaY8ZjWWZvBP/LX/9Fx/OM0mCMUzbXR7B/t0USO/Go2LGVElA5gIP2
         7pmMIUJceyULX/yoD4FGqEX8OQI/t+VakVi6VffBJUWAF/+YcyrEWBTKNVvlD9LNZqAU
         oxT7tCiWP1w3GYu4cn8l1Pi/W3fOugfq93b56kVvkegGUE4GGTwFlLiqEcEawAe0qWtf
         zZKUtmysQUKCiGf9/lfGSgjwSEY4VxHJyJQWt1WeniOOQGJsbscLVIw9RyZ0cedbhP1A
         wOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889685; x=1723494485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPYjuTyEQs2R3Q5/ZX1kjZGFeSB5y0CNTTJelsnVz+c=;
        b=gHuaFB0bTkeFbaVkukOUjdS4+yBgXOm2tFWc8WVn69Fwp2DnaIehqjcNMQBEdd2FCF
         PnUT5sny4YccRMn+2V46Ele16wBlpynx8e54mSsDbuYUyBvtvnI7qCq0VY28jMQ7qJZ4
         7MvCColn9p4H0rhQiAxlYk4l2jX3sUx6mD49AOrNv4lfSellekTLynnTWyq7g7XQ+P7A
         G2vs40XL8GdA60UVJGdxX4npnEn/M07zj85/Ra5blbYrMcdUhCpgOjP8NEO+YhCXanjj
         wVpwJip064u5fzYO8B4r0gmyaop6z7Rn05gmaxWm4CrwBBha44IOJVfYi3KZvxeFlkKp
         ML0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1mnjRx7AEsJmvK1q8Ie/qNAdZwpJ6eVgBOUqDBzXStCy7z8kxW062m956RqacjSWxKT/LthVflc4WkU5emC0gu3UcyY8S8azsiu0HHrv+Xs/FvL10lfFvgdAYN32kNMc9YrQYLWz1fcRPKCRq6g==
X-Gm-Message-State: AOJu0YwUxyzYpetFz/nPUjsyhjgs0iDCpRAqZrVCjMJgCypgF3tQcyhs
	ANVPC4X3GC97XUX+Y9xXd/XW803ciB9UTl4v6nJwqo6twO3hpcH2CR3HSJWIoGqwrYvfhfwRnw0
	LMX1T1NeV8hE9jwQRA0jSK9VQl0E=
X-Google-Smtp-Source: AGHT+IEsABp6YOjTiSmEx8zbLxpT8lcuyYJX80orJKuHyDnmoJXuf93elJzKOGkfhZvmi6b7hfC8PkS7Tae5MBXKeMQ=
X-Received: by 2002:a2e:a0c9:0:b0:2ee:8720:b4c3 with SMTP id
 38308e7fff4ca-2f15ab1c1a2mr81600441fa.43.1722889684680; Mon, 05 Aug 2024
 13:28:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805133708.160737-1-hdegoede@redhat.com> <20240805133708.160737-4-hdegoede@redhat.com>
In-Reply-To: <20240805133708.160737-4-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Aug 2024 22:27:27 +0200
Message-ID: <CAHp75VckqF6==cJ7xoXXn3hr9kzYn7+oHqYZq01S5HEe9eK_-Q@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] platform/x86: dell-smo8800: Move SMO88xx
 acpi_device_ids to dell-smo8800-ids.h
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>, 
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>, 
	Dell.Client.Kernel@dell.com, Kai Heng Feng <kai.heng.feng@canonical.com>, 
	platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 3:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Move the SMO88xx acpi_device_ids to a new dell-smo8800-ids.h header,
> so that these can be shared with the new dell-lis3lv02d code.

...

> +#ifndef _DELL_SMO8800_IDS_H_
> +#define _DELL_SMO8800_IDS_H_
> +
> +#include <linux/mod_devicetable.h>
> +
> +static const struct acpi_device_id smo8800_ids[] =3D {
> +       { "SMO8800" },
> +       { "SMO8801" },
> +       { "SMO8810" },
> +       { "SMO8811" },
> +       { "SMO8820" },
> +       { "SMO8821" },
> +       { "SMO8830" },
> +       { "SMO8831" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(acpi, smo8800_ids);

The macro definition is in module.h.

> +#endif


--=20
With Best Regards,
Andy Shevchenko

