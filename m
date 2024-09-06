Return-Path: <linux-i2c+bounces-6289-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E531096E7B3
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 04:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDDD01C22C85
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 02:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8EE208A0;
	Fri,  6 Sep 2024 02:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSQnFRPW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579D81CA94;
	Fri,  6 Sep 2024 02:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725589726; cv=none; b=gR02IeAumueie40SNq07ZwoPSQXkYbJAuTuwZDfpscxiqxEdXvtOG/knwoiKUWnWGeahERid4cKUT5UPqgmrKkYMjg0rwV3QczkwYfFpSByE8NbDI6rp+PNfDChQWJxNHftDBIRsCuY6Xv3inHgnNDclNwquUK6un7cs4byr1AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725589726; c=relaxed/simple;
	bh=GK7dt7abJmn961GOVaVJQUoLvO/GNZzeN3uTR3aqVdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovYH5j8A47Qm2DeZ7VH7c4TQLHkjefA04W0NpcLA+g33r+CGHG14jSUFHHsokMmnYUV3Ft7lNp75WBsmO/C+513nxkSA96N1urWyyT0Z4WLiiueRVa0noE+9SQohsbxHeWNB/mcSw0dgVz283zqfqNaWNdRKJm+n6FAS/YLZHcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSQnFRPW; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53653ff0251so1400837e87.0;
        Thu, 05 Sep 2024 19:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725589722; x=1726194522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GK7dt7abJmn961GOVaVJQUoLvO/GNZzeN3uTR3aqVdc=;
        b=NSQnFRPWUKKRStIsvbZ2M6JVXUD4tiYQzNiPyiykMAlfNoCapC+tALDE75/ezmjxFi
         cRapkwquFBHHswg1/Zh/e9x28Jc5k5ndLG0sE3lDAtYxFSWTJndgnbBkVizYJDbag3Tb
         rpMqcCdxnJwiwa2dvcLxHnWbyu6kVVwcXH666q5c4oQkMafN43nZamqdlZoh6RR4eSF4
         x5SBI6Hp3qQb024EDcjI2ts0h2F4dmzxpySUohWlcm0b7HpUBfrUrpAfllKkZxYKjyQ0
         ALr6EfPWgHUC5xDcztjPyRf5ZGqG9GAvJrb2vngla+rB30xKHMr8JSeOWETO0Xbh0cSa
         joog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725589722; x=1726194522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GK7dt7abJmn961GOVaVJQUoLvO/GNZzeN3uTR3aqVdc=;
        b=sqphTI71deM8070iWMf9cZxQTb9mnm30IMJgfp5Z0d5ZZF2Jqh2QLCov18OgxKJyZB
         b0Rs6UfhcJliKnnmE4zWYbt/+E6mB8kCIWtem9zTD9jto2aScXK/Hmu4tCKh14D4e2Ai
         8G6IXy5d6IbTIXwqB7zofIPv2dUK2cr8WuT8dxpby+bW44IauUzRkhN3iSIX8V/YFY87
         sqpe7uixKd2ufgvHuUuWMuFYYel6rDlYbuK4wp25AiFgX/BpAq3sBPbqxhBBMsfhytqz
         Ukrhc4Ggobj3dQRXfzpBraNx7Qm+j/lclByyC5ttLEEiAZ6F5RevhMuN9/YUtcNec1Tr
         yGlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1QTuEgTnqlGdrIPZhoSeh8g2SGbT8j43nJmnLYkAZ6rn5PmEgW5E0MkjozWs/N5JNUzukXKXxirXTf65i@vger.kernel.org, AJvYcCWbI/J6gNxEoiaUl8OsBwGe4g/XD25o30S0262ivNMOaZbqbBCr4IYMGIKuk2/0B/HaO1RbhuEL+iQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YygFmI0cj2n85GyX0DWjuI23NZFRMe+haruZ7LBk9ZjeYQ/d2zE
	QTtBXza+4KkPYJm0Q/f1V8reQoiMi3WnQzoWoZ5p8SUqMjKC46CI4HhlIr0lIx30GhRV/8Gfka2
	Y/KxE8U7pBXmLafH3LjTThbO7oA==
X-Google-Smtp-Source: AGHT+IGLL8kBf9+/E2NQeP7puMX03Eq9h3iMuhuBHNNWVlWmSqelsEaUKLbRuja63ty1DA8DhKY62ve783uWcW8rsPQ=
X-Received: by 2002:ac2:4f08:0:b0:52c:e05e:849b with SMTP id
 2adb3069b0e04-536587fc823mr490630e87.39.1725589721463; Thu, 05 Sep 2024
 19:28:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-2-kfting@nuvoton.com>
 <xdaufg4bju3iq5fqeo2gdej3yaxyufhuaiuyixnla234l2ej3r@fmvann767tib>
In-Reply-To: <xdaufg4bju3iq5fqeo2gdej3yaxyufhuaiuyixnla234l2ej3r@fmvann767tib>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 6 Sep 2024 10:28:30 +0800
Message-ID: <CACD3sJYt12H3DNqRwOU0ULDwJj2TbqUR5NhYWxBgvFggqKVyGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
To: Andi Shyti <andi.shyti@kernel.org>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Thank you for your comments.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:36=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> On Fri, Aug 30, 2024 at 11:46:34AM GMT, Tyrone Ting wrote:
> > The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <=3D 9".
> > The original design supports 10 slave addresses although only 2
> > addresses are required for current implementation.
> >
> > Restore the npcm_i2caddr array length to fix the smatch warning.
> >
> > Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> your email used in From: is different that your e-mail used the
> SoB. Is this done in purpose? If so I will keep it as it is, no
> problem for me, otherwise I can fix it while applying it.
>

I'll add the option "--from kfting@nuvoton.com", same as the patch
author's email while using the tool "git send-email"
in the next patch set.

> Andi

Have a nice day.

Thank you.

Regards,
Tyrone

