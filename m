Return-Path: <linux-i2c+bounces-3597-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 967608C9E33
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 15:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32CFFB24636
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 13:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94615472A;
	Mon, 20 May 2024 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8VkvGBY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366CF1E87C;
	Mon, 20 May 2024 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716211857; cv=none; b=lKVXGlqscBAayK0wG/aPJwcCBOkardJ4rrP/0/XUy6CXe6YGjWseiVXb5+EcrX8sjyzWnJdIsd7n3Xh72b16SrIKoCNO3fi2KxaWBkGfjhgBVsQ5khcU/YCeiqoAiN8YjaffPX9f058gJvYpL6i5Q9Kp9MYsv+VwQt3yvkAHcF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716211857; c=relaxed/simple;
	bh=kZHxyEYpeqymvbNV5Acz0S9qU02H/GfF0vbbl2YfxXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TClGeolLkh4Xsqy6MsE+A16QRTUCB/VpD/TI7iYgJXnTt/Kv8jRu4ZBz7PWTL9z9EowlnXHb4BAcND+Fs4xT9RuxCmbvAcRiyH9aDAVOEA35Q48pOE/DtphLJM63v/bJtBBCP0+wxTotPgWeu9SnlyW188tpY9zCWsQPst+XDh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8VkvGBY; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34db9a38755so2526903f8f.1;
        Mon, 20 May 2024 06:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716211854; x=1716816654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZHxyEYpeqymvbNV5Acz0S9qU02H/GfF0vbbl2YfxXM=;
        b=m8VkvGBYs5dL4A4rtQ4t7wKhshn08WcuW9iEW7E3ZXI4H4bPQq+9YM0AAyR5L0m7VS
         OPLWKTPnEMhov1cJJ1yEKh0ls45Cy2ZZBWGH3t5gu9tiZzwNquOEw/dpulLxhJvuFnj8
         3TWI9aG8QXvW8eagxhvtRuK6LkAi81+MIT1uCvmTS4imMSClvDr+3NYWHVJuS3mTZMtF
         LZxs7JEs/Fu0p044CrEbQVpCSHzMJSnImuiodsv0ckeUy6a4tW0CFOt75eoxbfMzpZzy
         iJ4VhFcQnnggr/guKJ/9y6f2CUE64ylym3d5Q0SdM3QhQHqbZoAY+fCKJDw7v+/31Ykv
         ehPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716211854; x=1716816654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZHxyEYpeqymvbNV5Acz0S9qU02H/GfF0vbbl2YfxXM=;
        b=vKXmwZOJ8tLjxiurukblk5/hFIGvuR6UIP4k8PDOOdm3NX9OkPj4dXpXvC2oVN7aGd
         PtFjsAjszANB1/5fIdwx9a9gPFQRMUlfMDUmAQR7xq6AoF/LACYuER/cUza9pr9ZVktR
         ZA1SmsOKBnjgYiyd2dMhv80J4aIZi8awHxIQHNykRpwQJmpDPuzODLHxjgKwMb3yOVE5
         BoPB4E7Ld8QVxRrY4HH6iPHwimzx5AxTa8Mp000o4seruEj++s0bbdOLQ7j2s/KEfqR3
         f5yVGkiCvksRBcBz+7xrsL77sNwwIGK5loADbDnPbEj3GTMks4crXn8DR+SVBXwf31ul
         CwSA==
X-Forwarded-Encrypted: i=1; AJvYcCX9gHZv+PYq/g6+3vdsgsM4ZJUI1zX5sUr6ngQOLJ9ICRYqRx0kVP6uK2Bu6iCqjV5louP1Zbx3o8/JQmTY3oJRtEvMISo6d+IBtqxXa3YlvTdURysKSgTFcxfO3PygXi6qGADV124Lw4LeLHqrQa/hIPSoDZxsBtJ0KU/LSdjqF3/tVEaPDbY8
X-Gm-Message-State: AOJu0YzkMwegEUYP0aK0nEtjv6n4ct3L8bEVZHA8rf5i4Ou1kJwkFWWo
	Vgkp4xCWLOdWK9sVPckukzIucEGZ7cnRHAWJh5Y3LELP4J80h7EgjU7Yc16I/+vQKXdeLY3EfnT
	siyA/SwKphEUpsafd92QdGUsmloSkynSC
X-Google-Smtp-Source: AGHT+IFwxIwSzgN4Et+aYcjqi2uLRSFf/4UznGmV17LEMLE6uJqfvkNZ06oKf6rIcJVHNW77Bv3ygx2PKIZskzEdkJ8=
X-Received: by 2002:a5d:53c5:0:b0:34a:9adc:c364 with SMTP id
 ffacd0b85a97d-3504a630f38mr25053493f8f.8.1716211854324; Mon, 20 May 2024
 06:30:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240517191000.11390-1-grygorii.tertychnyi@leica-geosystems.com> <6eee1069-81ae-495a-850f-7f526006db8b@web.de>
In-Reply-To: <6eee1069-81ae-495a-850f-7f526006db8b@web.de>
From: grygorii tertychnyi <grembeter@gmail.com>
Date: Mon, 20 May 2024 15:30:43 +0200
Message-ID: <CAGFuAuyXhBT8Nkvz5qN8iejeoHMFmx1b86tTNmpVfQ2xqjMtLw@mail.gmail.com>
Subject: Re: [PATCH] i2c: ocores: set IACK bit after core is enabled
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>, 
	bsp-development.geo@leica-geosystems.com, linux-i2c@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Peter Korsgaard <peter@korsgaard.com>, Thomas Gleixner <tglx@linutronix.de>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2024 at 7:25=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > Sometimes it causes failure for the very first message transfer, =E2=80=
=A6
>
> Does such an information indicate the need for the tag =E2=80=9CFixes=E2=
=80=9D?

I'm not sure: the original initialization order was introduced by the
very first commit
18f98b1e3147 ("[PATCH] i2c: New bus driver for the OpenCores I2C controller=
").

Regards,
Grygorii

