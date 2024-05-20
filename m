Return-Path: <linux-i2c+bounces-3600-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3B48C9F2E
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 17:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79504B209F5
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 15:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8021B136675;
	Mon, 20 May 2024 15:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlEVKSu3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C2728E7;
	Mon, 20 May 2024 15:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716217310; cv=none; b=dLASfI9k6v57bdTNOQ0BCFEx0+clZU5ACb0YELflWeRpYIXRQb+gGEYBxXfcJrn1ZRNkHTHS7KI+jtkMe7+7ITjs6g7VUkbf/8vaI6VLH1LhEVTOqsrkoE3+tt0wkbs0AbS3HJN7UDKxHUXl6tkzRw+nvQaO8LjY01dYAiv6Uiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716217310; c=relaxed/simple;
	bh=h9G+PzNOBo0XpGBoArWpCHVHv14Yl1PQqd7N8807B0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oLHzQv7EIg0PTA9xIWAIC3fuXl7398LUtvPn1qyrckrs9wftvzO1D6tdGtxQtJzK1L1ZNTAsQYq7d5kw/Ix0iPR53p++SUjWxqdW2lYqxdSjQbKVqypveaj2U/9MHETERMm/JgASfbDdL4KMcpWP+Cj1spJyG5lQEca9NjY6nEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlEVKSu3; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59b097b202so543072266b.0;
        Mon, 20 May 2024 08:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716217307; x=1716822107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrznS2cuTf/vafEauQb8pP6KkMct4u3y/Gx+jtIqOBk=;
        b=XlEVKSu3ROuRrQYunpZeWcMO4IZM+XoM6JLpT5YJtIsGtqejaXhAOd4oK8MDZqxUr5
         VVDby/eZMF5G2rvsIRCVLrnT3Hq5M3o6Ro+QfrPbucm7NnAUW4IK4lEL9rPR3oLC+PAi
         YQJ1hBWRwClNsTu6h6gatB3+0t4LSk6BVkwaSZVTAQmlC5SfUyQQ6/AEC+QoY/6sWB7G
         Ypu9GmmGRLHMCU3v3XAUgiIW9q6NUepxpFJUhUds6NNf0C7vbrhJOs+NssNfiEfeUHdr
         qRLe3/TviBKoPsf4LKQNbjiHVqKYSFDIuenBpUTuqTSR5ytFcHs6hTIjnE19wycNz9h6
         xxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716217307; x=1716822107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrznS2cuTf/vafEauQb8pP6KkMct4u3y/Gx+jtIqOBk=;
        b=g7r0RLpL2sHGdIwfvjhpICX4xnqV6DeH8aGgSU6Zrshg0AtIjLVnPWHefqPPP0R1XP
         7wI+Ntf4ARrK0JOfrxBC3efYHAoUPRRQQ4KUrX6cNkZ4IhYlup02Iy1yPCuvH8yq2M02
         I/grBkVrO+I3dozt01rqTmXoCvThVs3kx+7gc2I1387+rBSN4mhdn1b0YY6joTbdeWPr
         Xtc/3PHuoZgrHl10Q5Ov8HAw2CajvzX8OEeTHUhEGz2q6bMOTYFWbxkGZGD9XYAgXsvN
         5o/vBR7X84wCw4qtJmc8ljufHABZnAOBdB1Xy5d6pL4ruMfbMYz7uHxjLmoMXZzOU5Ie
         Ukfg==
X-Forwarded-Encrypted: i=1; AJvYcCX0siFaOPNOvktZB7hqLNN/O1WeOm48C6iFxpnyD2ejiJjcFF7sTUYvMqc6tjtepiidpVbleJGxRYhrM9epMX+FkYUvuTrXYTx3vg004665ZwqdccXkLggGWDteSJ0SH+Kq810c6gyZOV6k4xIg/2lOZgE2F6d40BKMbml7pQjZ7sze/ITVsu2d
X-Gm-Message-State: AOJu0YyIPJmW1S6+DyILpx5UqcX4DlmJjsvnNUFADSKr7af3X7w6STlb
	f7W9K5ryhU4/kyGG8PA9pNb7o7k0rJ2a2h7riqTEuVSnea8uATuh39ky7IUcJowKcgg48XK7Auk
	t+buqdcTGV9T7TUiQuSOahT1++zo=
X-Google-Smtp-Source: AGHT+IGGnQKNWxIxOvVxR+lGNx1s7DwBsojy6rWDdcN/SEWlpdlGR5yRRJJkPCknsF5uAt1G1irGlDzBZLb6IZHllVE=
X-Received: by 2002:a17:907:6e9e:b0:a59:c39b:6bc3 with SMTP id
 a640c23a62f3a-a5a2d6417e5mr2100229966b.49.1716217306721; Mon, 20 May 2024
 08:01:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240517191000.11390-1-grygorii.tertychnyi@leica-geosystems.com>
 <6eee1069-81ae-495a-850f-7f526006db8b@web.de> <CAGFuAuyXhBT8Nkvz5qN8iejeoHMFmx1b86tTNmpVfQ2xqjMtLw@mail.gmail.com>
 <a42d75ad-8065-49f0-906a-c8ae3761457c@lunn.ch>
In-Reply-To: <a42d75ad-8065-49f0-906a-c8ae3761457c@lunn.ch>
From: grygorii tertychnyi <grembeter@gmail.com>
Date: Mon, 20 May 2024 17:01:34 +0200
Message-ID: <CAGFuAuwot_7+R=J4NC=0Z_48YZ-RTJjRUoQnSjZUvpt=AWF39Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: ocores: set IACK bit after core is enabled
To: Andrew Lunn <andrew@lunn.ch>
Cc: Markus Elfring <Markus.Elfring@web.de>, 
	Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>, 
	bsp-development.geo@leica-geosystems.com, linux-i2c@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, Peter Korsgaard <peter@korsgaard.com>, 
	Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2024 at 3:41=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, May 20, 2024 at 03:30:43PM +0200, grygorii tertychnyi wrote:
> > On Sun, May 19, 2024 at 7:25=E2=80=AFAM Markus Elfring <Markus.Elfring@=
web.de> wrote:
> > >
> > > =E2=80=A6
> > > > Sometimes it causes failure for the very first message transfer, =
=E2=80=A6
> > >
> > > Does such an information indicate the need for the tag =E2=80=9CFixes=
=E2=80=9D?
> >
> > I'm not sure: the original initialization order was introduced by the
> > very first commit
> > 18f98b1e3147 ("[PATCH] i2c: New bus driver for the OpenCores I2C contro=
ller").
>
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
>
>   It fixes a problem like an oops, a hang, data corruption, a real
>   security issue, a hardware quirk, a build error (but not for things
>   marked CONFIG_BROKEN), or some =E2=80=9Coh, that=E2=80=99s not good=E2=
=80=9D issue.
>
> Your description of the very first message transfer failing sounds
> like a data corruption? Using the commit which adds the driver is also
> fine, some bugs have been there all the time.

Thanks! Yes, it is a data corruption.

> Remember to add a
>
> Cc: stable@vger.kernel.org

I will send v2.

Regards,
Grygorii

