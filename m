Return-Path: <linux-i2c+bounces-9061-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8184AA0C13A
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 20:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 996A81882E25
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 19:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DD11C5F2D;
	Mon, 13 Jan 2025 19:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crYk+g3g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893DD38F91;
	Mon, 13 Jan 2025 19:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736796093; cv=none; b=YXYnvGqtiGyO/H1EVoCEcAYZ8Q1qHtrwuvky5k+GjMN5J0IgMeTlnv83K2YNQ580ykU2hp+qInQ17wRfaUIWiU8AOP2VudeszEHfSDUl4DN+IJpxKArWM2iDVqf3TAEnz4ZxONblpQvUuZVeMgF6WtG2/2m/BpHW32MyBYqJn4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736796093; c=relaxed/simple;
	bh=uKM0xEMdhodnFldfyLZ1N6K5+wwgw1fXhTvCmxnwpWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtW6XUNMYVAiSGE8wla0VX3HqKj6z36y/HgXAG9IksZsHQqDlYQWg0WAbWZs4TXR7CJCUrCXEZNxc/8dhmnZ1cv4FGEVcyWTRALwm/9EkR7+D8V/9vEExCnqgTTa6+YTOcfmwVpK2ZlupmvcM7Z9FYtnCA+FUtHE1k4Ug+P3F0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crYk+g3g; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaeef97ff02so767410266b.1;
        Mon, 13 Jan 2025 11:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736796090; x=1737400890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKM0xEMdhodnFldfyLZ1N6K5+wwgw1fXhTvCmxnwpWY=;
        b=crYk+g3gDnRsqlnXWuTnZpuYa/pGMT4903nvDsEm9e/td/6OYcfl7BO7QCO8HXlYfu
         iSQS/6zgwWNI31qjX0OqzjCxN2B8S2vvl+6J7j3k0YQvAGRAbyS+q96Gp7KIM55nR9/k
         qGsz6R0DuVlBeaQp3Tpjqizk5yrnZEqZm5JOGYk/SeZpBZDEs4BSq1E8A+UrfbDIo/BR
         nudOnE/lgS/lp5lVPUBOZwVK6njDT7tGlHEE9XYJg76AZcRxUqnw2zuIHN3EXuifZb3v
         2jZEII3HyMizqOYE8RgRx8Yc8KLxjHyQmz1AwysY9RBqmL0kyA7sHCs5MZ+JXfUz29OR
         MUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796090; x=1737400890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKM0xEMdhodnFldfyLZ1N6K5+wwgw1fXhTvCmxnwpWY=;
        b=YmoiMGX0J1VzSNRcsp/zUiXdGFdYJBz58CP/7eyKnRh0xJH/K9pGzNBVZThBU2E9Ry
         Qw47A3eg83pMFZCyrihoAFCZ5asOA5T4c4rfZWnElF4SNr2/FRatDESH8UOCFwkOj5dk
         vusRqALwYQBrj30PEEoCCSaBpZajmiZEQkq+EWMVkot1J4J7ziIOE/3GSBS3/v2u/e7O
         5nwPZd/B40cEBYw7I4CV20HmEM0znVgJFnYXY6btez+GKloRUFWVZtFV/avCYTaMAFMU
         Puoyv2o5QCWKQoeR/Yi/3Eab+O1A9qMvr4dv0iONjSqKLRIxCP/z4DE4F+BXgoVmoQfD
         7RLw==
X-Forwarded-Encrypted: i=1; AJvYcCUy/QhzZZNZtO8jVsfDnAWZDdAZIgRmnxqgyQ7LR58nRK3lXCuL1E4wpGwBnINYSYRAoBqLfhfro0veCnW5@vger.kernel.org, AJvYcCVONjLtTEeP+91uhZzNzDzpp+2XY9PP5bHr9Huctaxt3pSdcj/mQ3LKzJoAP65xceeTVcTWyQUranU=@vger.kernel.org, AJvYcCXAeVba4kuiEZBO7I3o+QzLbo5nT8Poy0XF7eB8RVTZfLtWgTFENr6GjqeJdGuz5qVdZmZ99fi7lYD4JUwY2xZZbKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd3VjVGQhi2y4+QiMhWVPufFD31wu4JBCF0Cvv5RmK+TTMA/Hr
	MF28Q7v51x1BV0FClRabbsKRWz89riDHAeivHzW3gssn5egcqLc9nQJCwd+xYjRsSWv4qKMGlDT
	ROOg/Vofi3oeUHglyfaIHnrLvX78=
X-Gm-Gg: ASbGncuzXbQRlMNjyej4eRQtWiDDN4C/ivtP1sXlWSI7YFFX++00i7q5p4U7hMnaKq/
	kKCGWD3fbay94rydLeO6Q6PFIag9hhma+stu2xw==
X-Google-Smtp-Source: AGHT+IFuRJzZwhIKbkN1qmjRgLVaZisH8Rdh0otbC/rWR8IhNKsNvRWjwf7wrqy6BzXuaYK6uj63AM50tRWdN7O1wJY=
X-Received: by 2002:a17:907:9687:b0:aa6:912f:7ec1 with SMTP id
 a640c23a62f3a-ab2abc779dcmr2279801866b.39.1736796089543; Mon, 13 Jan 2025
 11:21:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Jan 2025 21:20:53 +0200
X-Gm-Features: AbW1kvaiKWVqse3YDCAyJM532SKbNjB-13jTovFS7fsuWhcwgqtJ3FPbgos9vAc
Message-ID: <CAHp75VfsRX7-_dguLOGKWEqrBeASPTSBYqyStcuPJ9zYNGcpTw@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] i2c: riic: Add support for I2C bus recovery,
 along with driver cleanup and improvements
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 2:26=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi All,
>
> This patch series introduces support for I2C bus recovery in the RIIC
> driver, which is utilized in RZ series SoCs. The addition of bus recovery
> functionality enhances the reliability of the I2C interface by allowing i=
t
> to recover from error conditions that might leave the bus in an unusable
> state.
>
> Alongside the bus recovery implementation, the series includes several
> cleanup and improvement patches that simplify and modernize the driver
> code. These include replacing `dev_err` calls with `dev_err_probe`,
> consistent usage of the `BIT` and `GENMASK` macros, leveraging devres
> helpers for reset management, and improving code readability by marking
> static data as `const`.

Looks very good to me now, thank you.
FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

