Return-Path: <linux-i2c+bounces-3892-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 064978FE458
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2024 12:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E32E1C252CD
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2024 10:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252C5194C90;
	Thu,  6 Jun 2024 10:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ij9/iU/U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01CD3BB59
	for <linux-i2c@vger.kernel.org>; Thu,  6 Jun 2024 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717669926; cv=none; b=j42EfCHNb5Hubw/HezwXK6zYQu2Vx2CA+yeDzTFPjcIgZPPWe8zOJ+eeaJc6UwSmMx6um+OaoxzMVXy2qd1gptTaCi4FlN6WIEs5yUQZeWF93js/TaH1Ne8KQOOuYVY7vwuzIvSPJ3fYmk+eHfAnDVzze2SSqtj0KQhjq+CvDsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717669926; c=relaxed/simple;
	bh=n0hrzdYnBksW+DamHG6BupTO1J0YAJybs/VDL2sugrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uov7lggP/0YGwIvBHiIfFjDEWi42ZJFL98ws2FeWrQZ3w3tfNv89+MeZOz3y9h2K5LMhzXe3UrgwGo9wiXVadHDl+1YmIbSMA8nRwc6R15o7kz8dzcLMPoMAPrsH1h/yDpT8p7tjgeou0RIeXelIBRWV/jnEf0iLIAfAbOSPVns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ij9/iU/U; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaad2c673fso10432251fa.3
        for <linux-i2c@vger.kernel.org>; Thu, 06 Jun 2024 03:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717669923; x=1718274723; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yOK4FlQCW+JMOCwnWP72jJymCtr5dD6IgIpna60BCY=;
        b=Ij9/iU/Uyo6fcf8LONJ7xC09lvYBG8qaaeEz4vBXq2BTPZbQ2/pF3yyQBM4fRbFGfh
         G2YVI79pdecNzRewdbn8sACLDUSzd7rOjlh6zMMORYPcVD1QveoeZ2kHNSsE+9FRNNbv
         STcLcfiwZHhGsSEvRFW5mX9h4B8YphLBoSkl78uJsHCRnl9eDwrE59GFqtGknBB9mMy1
         OSPuYgWTVQS8j2w3KVuq+5S7UftcTUbs1qQVWVzbjEhqRqb3+fKICTURvn7oWD734yHM
         ft1saZpU5WP1Di0/lkFYY358dTnV3FFIlPJYisX1EUMUoYuw+wFXKiytWhGLxoNHAlTO
         IcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717669923; x=1718274723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yOK4FlQCW+JMOCwnWP72jJymCtr5dD6IgIpna60BCY=;
        b=hzqTkv06Y7eZwwF6KDyQr6cUvm5tHr2ugXJiHif9+YEYfz60wbZYL7gK0vVu5dyjX4
         0M/ccf5TI+N4nXDDk6rdO6DJN2Rkzcm/tK7c2JpbjJ6UbVCmDpxjTec4UtYsf181Xo5l
         YztRHKnjG7HW72b5kGdnhEmk9MhAewCDkSX4jyQilWI6zBXgpqS+xC+qDLtxZ3TOEb+U
         hsazNSLP7izKbdm4AnKVFYUOXB8wZvLIRFNRJy9Xydtbso6cuJ3kENK+q57X0XpwCbne
         5HvDwhc+9DkeXqtlgMcFwlKBqFxvd8EfTJ42c8TB7P7I7kgCn/+o79sHCUfs3g6j8RAu
         xPhg==
X-Forwarded-Encrypted: i=1; AJvYcCVtY+rkIqeMLUmw9YeEEzcLhhOWjqSozmzt8d8aGL2WcTZic/Lfh6Yo30r6UjdFA58/+OsajfdF3/Zf8UQihGcKZehHE00kMsQ5
X-Gm-Message-State: AOJu0YyIcmU32NzVQD2tZzJYltxFi5Y+AM3Z8sebA6naTMAxdyE9TWv+
	RevTgd5o9qV6YzZPtg37+6twoyGZ4fY9keiqwJEnPD5PWTMx0JKsL0tnCE2TwxmQj68m1P7SFLZ
	Q90jPdAMVPdtIHc3QEdUJ/IUR9fy724JBj6oB
X-Google-Smtp-Source: AGHT+IHb92CvWzY0UMLIO3bnYXJ9lrbqmbf5jFApgNniI36TJ0LubnwynaglXsT5ps/3HCuaPh8FvkYR0EYkfnbTRiI=
X-Received: by 2002:a2e:9643:0:b0:2e1:9c57:195a with SMTP id
 38308e7fff4ca-2eac7a5fd4dmr33302121fa.32.1717669922881; Thu, 06 Jun 2024
 03:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com> <20240605175953.2613260-8-joychakr@google.com>
 <f98a1d8f-e936-4798-8447-c642e8fe11d5@moroto.mountain> <CAOSNQF0Qj2CnRDWAGM8Y1wyEdgWP04RDJx1TKO-Ge4nUH=qxoQ@mail.gmail.com>
 <2b979aa4-3a63-4010-9670-294ce7624e18@moroto.mountain>
In-Reply-To: <2b979aa4-3a63-4010-9670-294ce7624e18@moroto.mountain>
From: Joy Chakraborty <joychakr@google.com>
Date: Thu, 6 Jun 2024 16:01:42 +0530
Message-ID: <CAOSNQF02nUPZ=8re=uyruhxReQSjPoc8L-9yTnWMe4EfJ0-huA@mail.gmail.com>
Subject: Re: [PATCH v1 07/17] misc: eeprom: at25: Change nvmem reg_read/write
 return type
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, manugautam@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 3:41=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Thu, Jun 06, 2024 at 03:12:03PM +0530, Joy Chakraborty wrote:
> > > These functions are used internally and exported to the user through
> > > sysfs via bin_attr_nvmem_read/write().  For internal users partial re=
ads
> > > should be treated as failure.  What are we supposed to do with a part=
ial
> > > read?  I don't think anyone has asked for partial reads to be support=
ed
> > > from sysfs either except Greg was wondering about it while reading th=
e
> > > code.
> > >
> > > Currently, a lot of drivers return -EINVAL for partial read/writes bu=
t
> > > some return success.  It is a bit messy.  But this patchset doesn't
> > > really improve anything.  In at24_read() we check if it's going to be=
 a
> > > partial read and return -EINVAL.  Below we report a partial read as a
> > > full read.  It's just a more complicated way of doing exactly what we
> > > were doing before.
> >
> > Currently what drivers return is up to their interpretation of int
> > return type, there are a few drivers which also return the number of
> > bytes written/read already like
> > drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c .
>
> Returning non-zero is a bug.  It won't break bin_attr_nvmem_read/write()
> but it will break other places like nvmem_access_with_keepouts(),
> __nvmem_cell_read() and nvmem_cell_prepare_write_buffer() where all
> non-zero returns from nvmem_reg_read() are treated as an error.
>

Yes, I will resend the patch to fix that.

> > The objective of the patch was to handle partial reads and errors at
> > the nvmem core and instead of leaving it up to each nvmem provider by
> > providing a better return value to nvmem providers.
> >
> > Regarding drivers/misc/eeprom/at25.c which you pointed below, that is
> > a problem in my code change. I missed that count was modified later on
> > and should initialize bytes_written to the new value of count, will
> > fix that when I come up with the new patch.
> >
> > I agree that it does not improve anything for a lot of nvmem providers
> > for example the ones which call into other reg_map_read/write apis
> > which do not return the number of bytes read/written but it does help
> > us do better error handling at the nvmem core layer for nvmem
> > providers who can return the valid number of bytes read/written.
>
> If we're going to support partial writes, then it needs to be done all
> the way.  We need to audit functions like at24_read() and remove the
> -EINVAL lines.
>
>    440          if (off + count > at24->byte_len)
>    441                  return -EINVAL;
>
> It should be:
>
>         if (off + count > at24->byte_len)
>                 count =3D at24->byte_len - off;
>
> Some drivers handle writing zero bytes as -EINVAL and some return 0.
> Those changes could be done before we change the API.
>

Sure, we can do it in a phased manner like you suggested in another
reply by creating new pointers and slowly moving each driver to the
new pointer and then deprecating the old one.

> You updated nvmem_access_with_keepouts() to handle negative returns but
> not zero returns so it could lead to a forever loop.
>

Yes, that is a possible case. Will rework it.

> regards,
> dan carpenter
>
Thanks
Joy

