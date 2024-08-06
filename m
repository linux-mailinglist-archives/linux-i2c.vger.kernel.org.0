Return-Path: <linux-i2c+bounces-5162-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA320948EB5
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 14:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 909AA28A6AB
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 12:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B771C3F3B;
	Tue,  6 Aug 2024 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ksg8Z6D/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFD71C3F35
	for <linux-i2c@vger.kernel.org>; Tue,  6 Aug 2024 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722946249; cv=none; b=YQ6gZDUhiDjLrghnfoWKKW6RuXP+7k7wxKgsLUqBQPZ+468ROv2ptNifgs4+WsyAePficgQNf8U/PJkvzRjhffXx6Ba1/YKYVJ/vckl4LvqjMSoU8fKWIfOAGS33/+iIqegiob4fLUqtX+u415hbYV5zLZ5lItkJXsofnLQLMq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722946249; c=relaxed/simple;
	bh=m4IxyTtX6Xxn5++y6Dom7WbK14ZIkNmOzfXHwMvDyPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRO7R/uzQ38vN7QBUAQVtjvN0Ld3O9wRRBRTyaH/LiDMeVm2BZbFXv4HAOLqactwl9yiEZqKUiNyuK7Ce1w3tXmpNPK6+amjnQga152SYcgI7/qa/R6Q+Wo6NQw0v5ruD7HOJGE0lQjk9crh74+EfWpNyoBtU9h9nGNbPCpzhBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ksg8Z6D/; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7a843bef98so57264666b.2
        for <linux-i2c@vger.kernel.org>; Tue, 06 Aug 2024 05:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722946246; x=1723551046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4IxyTtX6Xxn5++y6Dom7WbK14ZIkNmOzfXHwMvDyPM=;
        b=Ksg8Z6D/fYIilgDFgKN+G2BAF0gjsdif1mhOMxo1lMpzpN7v0bXPbnz9zVvjUb4zGg
         NuRLvtgWJ2xqU0NI68k9jt9tcpR+qLruheZAAzCnyx0mEb6T+BKjxh8rmLkEmZbZlzDb
         nb9h9bekgwjI7wkxKQRvyfWT/oLzMmOoewOAaGP2mP3m6pJVWkqvcWoXD0pMQe2Z2wYc
         vlMke/iOQiMzC0xxHGSWHLiYclpfNwQ1DC6qaLTBVNVauyZSvS9UwDaRub4AVdOs9V+X
         avyrr/zdgwf2BE16PRnkuoTPzrpjSs9LHi+ryscPRr+aVkiV6kbhZfD2J1Eiye0AmQG2
         awtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722946246; x=1723551046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4IxyTtX6Xxn5++y6Dom7WbK14ZIkNmOzfXHwMvDyPM=;
        b=DGaRpPoYDEtP7V2aB7jHfb2E1BHmxfg9o+FwkLPvCkTxs8KdiDthkZ1GS+UsQDiNfO
         QWpRw3jiodd2gyYJY+Wis0yhDJ/A2y+UGqKuufFnn5QUWeJXiGV8OB+DawAkKu3W4YYW
         EhfTtp60LdyP25YjZf6TmUq044Hhtn5TBldBp+siCDaJ+kTWh4qjP/BnOjIZTvZ5YN1H
         LmzGkFI6DKsWmcqaHHnnJQEXdVsoMZfC+mH+a51YXYq2N3bGgc305mTWqy9c3f3bZ2Nh
         xyYPpludkbDORRCGani0iu+VOYkSSxfULerkktcThHpoeRMdxCmoM6d9WowjrrnJcV2b
         a6MA==
X-Forwarded-Encrypted: i=1; AJvYcCUufZQd0L9SXQW6kqQ6WbHuACorwMTHOiN4E6ahu0c9lBkJENAo++Lr5yaDShbBDrxAQqzGhvub4q+ibgwDC+YpfZ20bqddMD7F
X-Gm-Message-State: AOJu0Yxxyna7TCMIQiZTVS8mCK1+fHR98zaHzkJwxpe22CuueknsPqEn
	6PK05QR0AnN74JCp0qamHdZHg+bDg2rNdLXCxENYKnHLohUfMbdu8R43/D9d4AMpsNhUUuNXNrf
	p84o57kMKCjhlYL4BX8/jQak+Ox0=
X-Google-Smtp-Source: AGHT+IG9/Yp5LEOPYQm6/SZz4KwnHThZsk3yJ8jaRG902854TTcxLHJ9cSZUUvwPHO9fpiS8REftpiI5xKYNFtHjotA=
X-Received: by 2002:a17:907:2d08:b0:a7a:929f:c0ce with SMTP id
 a640c23a62f3a-a7dc4df9533mr841505666b.19.1722946245764; Tue, 06 Aug 2024
 05:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240802130143.26908-1-ahuang12@lenovo.com> <di6c5rvbjapddcndjs7jzqia3nki2qzmzrsmutldi4q55wile7@yyo6be3s57zj>
In-Reply-To: <di6c5rvbjapddcndjs7jzqia3nki2qzmzrsmutldi4q55wile7@yyo6be3s57zj>
From: Huang Adrian <adrianhuang0701@gmail.com>
Date: Tue, 6 Aug 2024 20:10:34 +0800
Message-ID: <CAHKZfL0Y14X7NbFzBNK2uAFA-6hypZBhSLWdHASO8d+tCjSbrg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] i2c: designware: Fix wrong setting for
 {ss,fs,hs}_{h,l}cnt registers
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	linux-i2c@vger.kernel.org, Adrian Huang <ahuang12@lenovo.com>, 
	Dong Wang <wangdong28@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Tue, Aug 6, 2024 at 1:27=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> w=
rote:
>
> Hi Adrian,
>
> > Link: https://lore.kernel.org/linux-i2c/8295cbe1-a7c5-4a35-a189-5d0bff5=
1ede6@linux.intel.com/
> > Suggested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > Signed-off-by: Adrian Huang <ahuang12@lenovo.com>
> > Reported-by: Dong Wang <wangdong28@lenovo.com>
> > Tested-by: Dong Wang <wangdong28@lenovo.com>
>
> At first I thought that we need a Fixes tag, but on a second
> thought I judged this more as a behavioural fix. Please, let me
> konw if you think we want to have the Fixes tag here.

Agree with your second thought, so no need to add the Fixes tag.

> Meantime, I'm going to re-arrange the tag section. It's common to
> sort the tags in a chronological order:
>
> Reported-by: (it first gets reported)
> Suggested-by: (then someone suggested the fix)
> Signed-off-by: (then someone implemented the fix)
> Tested-by: (finally someone tested it)
> Link: (as reference)
>
> I will also appreciate that the Reviewed-by and Tested-by and
> Acked-by happen transparently and openly in the mailing list
> rather behind the curtains.

I'm sorry for the inconvenience. Wil pay more attention in the future.

> Said that, thanks for your patch, I merged it into i2c/i2c-host.

Thank you.

-- Adrian

