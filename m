Return-Path: <linux-i2c+bounces-4330-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6167E9165E0
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 13:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 150ED1F22836
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 11:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E8814AD0C;
	Tue, 25 Jun 2024 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbYrjsGf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AA614AD17;
	Tue, 25 Jun 2024 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719313682; cv=none; b=YQqunROBNVkC7NVofYccz43sR66+wJmfmItiQPNjHuA736AawE3am+ccwToF6uYOgOph4A48P5V/xyNxHzP0qW4QMGuhmxYA38jdDVqRfdGyfIimQik6spwZUYt4TktJBarYM3JQ3TTdgrOnHd8wdhNuA8oLeZ6oLZo3AdwMdTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719313682; c=relaxed/simple;
	bh=EMGiarKQXGoQc0yA0COR4nttuOTzKKdusIL8aGAdE8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtDn8doN0QGi0u7+ne8D9DM+NA+1UktyiFjV75jcjHCuPKInE/N/8tixhda6YmgwXyGBzZIRzT2AlT7MiR05O/r7fHSBQeyW2eVk/Ysvjr/7jOjpoD4dC+il8rVAAkBJops9q1qCs6aIhS7Pb64ckE7T/2IhotJVtIG2TVaQfuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbYrjsGf; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57d4ee2aaabso2630021a12.2;
        Tue, 25 Jun 2024 04:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719313679; x=1719918479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMGiarKQXGoQc0yA0COR4nttuOTzKKdusIL8aGAdE8E=;
        b=PbYrjsGf5vFLrJ6HDBEvb7Uy00WhZ+u76TnMR7v+YVXYXe2pyssPGyr01ETcVP6qB1
         6LPfj/W/p+LD3CnrVR+gfZk2SZTk9JWah7EUU5gF2Kh8a20B+2OsEPSAybBnHNvvbOOW
         vnXK5kbRx8ljNnT5wc4+Yu6QYr4ZuB2FLjJ4FZYZlEpJPZn7xDZOJ4EQDeuEPplto+Ee
         iO2wyLKHXeAh41fBNsOml04h82Y2bfNByS+seJ+S3rF2v5UZXbFswy656PeIfjbyrukA
         xcXT3Yvk2FpGGB33FsB20aCgLR3a1bpFZ1dWCr+M3Le5aemM18L6xRKkGr3W5Z/o/gvQ
         eEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719313679; x=1719918479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMGiarKQXGoQc0yA0COR4nttuOTzKKdusIL8aGAdE8E=;
        b=KrbbOnmOh/LWVCC+vFGMEjS/++0N+i6jMR0pQAuwkkNKgtlGOxAYdOGZxqmKIGajZJ
         iTxJ/Ac7Nu4+GeXCKeFd/Jt5KkDeNKItn24/Cn9XHP6ISIS90Y9aqBO2712xLzwg+/aI
         85cjzGKh/ER12Q0POzEFgYdVcZ8VAWvEjI5W7RaiN/JBDHxaJw63ypmFVJMoUXlMMUAT
         EGRPAn/PcaIuXhGMViGq5a9JForsQodCqbop17ayeMXnOaAoGNjBqgZ1CTMGwvl6scRZ
         ChAThliK06P2WR+R0BJJpjspZwMd3dr8Y2AKklSpbG3zZvmeOy3hs9jYMRoUhGKPiLIj
         rFMw==
X-Forwarded-Encrypted: i=1; AJvYcCWD1ySu2qv525RfuzrNoKXaZxMpf4PwfZ+Mzcndg/M+1gO0gbwc/LqvOyefn0Unk1IDMjvpoNcufqKQ7UBLiQZcg+3sbZ5ixylBP/CYO7vKFKtb72in2un7a15rIBEKjzIkABGJzH50Q/HuMlt/ZkdsdtO6Z83wzJDmd3TIrgSttt63Vw==
X-Gm-Message-State: AOJu0Yxh6fcTA5OYy0sGcl4QRMfVBnPAO6m9X0s4O2kSgwdzb+win0ZK
	dBLYY3uh7lrECK2iCe4LhgOGI9zd0BCili4r068PA9Pef3/C5kGuAg76Mhw7Anj5azcjqabDHFU
	2duUVVi5/hrg6yLS2DLywha7REUE=
X-Google-Smtp-Source: AGHT+IEe2xGfvNx050QZvRa3uCMI4VfH32J96dIyH8WOhEq9Bxd1EpPG2PJBA8xq+rDXAELL8B8x7ekjeKRLmeJSQsY=
X-Received: by 2002:a50:d79e:0:b0:57d:101f:ae9f with SMTP id
 4fb4d7f45d1cf-57d4bdc76c9mr4563332a12.33.1719313679062; Tue, 25 Jun 2024
 04:07:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625065939.6146-1-kanakshilledar@gmail.com>
 <03174142-a2c0-4f9f-81ca-2aeb7f57ab79@kernel.org> <329ef10f-14d1-4346-8496-906aaf91ccfe@kernel.org>
In-Reply-To: <329ef10f-14d1-4346-8496-906aaf91ccfe@kernel.org>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Tue, 25 Jun 2024 16:37:47 +0530
Message-ID: <CAGLn_=vWxoHJivPgLHov8h7wHxmTH0y19twN=Xhyh_rZEmjbOg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: i2c: nxp,lpc1788-i2c: convert to dt schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 12:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 25/06/2024 09:02, Krzysztof Kozlowski wrote:
> > On 25/06/2024 08:59, Kanak Shilledar wrote:
> >> Convert the NXP I2C controller for LPC2xxx/178x/18xx/43xx
> >> to newer DT schema. Created DT schema based on the .txt file
> >> - added maintainer from the MAINTAINERS file.
> >> - added resets property required by the corresponding DTS files.
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> >> ---
> >> Changes in v3:
> > you already sent v3 so this is rather v4. What happened here? Why are
> > you resending this?
>
> Ah, I see the changes - you dropped the incorrect tags. It's fine but it
> should have been v4. Not sure how b4 or other tools will handle this.

I thought there is no need to bump up the version just for changing tags.
Shall I resend it as v4 and update the commit message with the change
log to include
the removal of kernel bot tags and addition of your review tag?

> Best regards,
> Krzysztof

Thanks and Regards,
Kanak Shilledar

