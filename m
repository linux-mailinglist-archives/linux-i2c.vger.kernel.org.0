Return-Path: <linux-i2c+bounces-3105-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFEB8B09F5
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 14:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FEDB1C24578
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 12:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129F1156C68;
	Wed, 24 Apr 2024 12:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8csSnqW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA9541A87;
	Wed, 24 Apr 2024 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713962781; cv=none; b=bXbte9fzTXICACUwT+4CJFN56roWeebvaLJjrNFR6ep0GoE0ftU5GtMmYy1Xv1R+sDLYKGM10KZWpYNiiuLNjEcfXyqEVrwSUQLzn5SnO/5jkjoexyInodyvb5PysW/R1U71UQCXqE3eyqA6qDG7Lq6aXh8a5ce+lWrHyzM1DBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713962781; c=relaxed/simple;
	bh=93+T8xJd3cXLT+8AE8EB6mYgzWWVXtgtKLQaSc/xBMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5EJKByz1S+wq7ri5+d6X0EYh0gKe+sRWE+/7xaxB7KtYBj1Nei/I+AQcdBzeQW8LDWnMfW1vCx3tmFUMXg6wo1VSb6UqSMCkMGiUetvPl1Xfk7bdZDTsO6flB0mDwYfY1QXTBlIf2VKA/4q0mMPn4wnxX/2cwmh49fl82ezYyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8csSnqW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516ef30b16eso8381007e87.3;
        Wed, 24 Apr 2024 05:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713962778; x=1714567578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6TyatYgquEoqN9hGCWnWbVOlkZrg/qYutSLoXl0UTk=;
        b=c8csSnqWkuOKSm2ryHvHEdB16KGx7xMB033UyC6ykMIecZMZVtWmDsXsrAqQi2DVnl
         4SIofNU79+qsZqlBh4R1Fw+6peesyBNNxTfzL9WMnRZKzPPdrCRFQ0z9Cn/DrbZrLruD
         PCLfCxIZpk6I7BsZ3LNrhP+KTT6zZf4vfdFkOMkiuwOwU6ccdsKCAmMIe/CsZLUWV0eB
         EZOWMJPbzG7hpLoY/irQFuLfXjrjOD1F2NByp60eDy4JrZhZ9FwGjSSQhDfHFjV2L8NJ
         TvmS9yNQBXD6B+6Defm/cEEBP3NvDp0EfE/KeyOZ+QUe2/PcqWp+dmbbEnPmfGjSqSnZ
         Ht8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713962778; x=1714567578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6TyatYgquEoqN9hGCWnWbVOlkZrg/qYutSLoXl0UTk=;
        b=khvlS8JsnPudBJvSFPW/aOZPuoI7s9/6rVeMT/jYf5erZIjPCHf+/umKmwRaNCGcpL
         oLIroao+mJO4ltssKDJdR3nRn9V49FQZk3SCP7eeH54itzV9viGUKim8OZnJMEn8A/fS
         Gz7SwhB1CxoLOYOe58cDvsn6nqqr/PPvMeQfEBLArVCluuAMFneg8FD5Vk/YLs3ubY4H
         EA0fOuby4+nnrk8iUphqqQsxX80WzPKlTa6BNqQk1KBAvFrb80mY1XnVtLabSjwLI8lO
         UW3VFX0tsD1Q+JsPDr3e97xUbhcejLn/XJDQ6bXYuLoNbPqIEeeXKQMPipD5IqJ4bLvi
         KcPA==
X-Forwarded-Encrypted: i=1; AJvYcCXaIKwMfvg3scMWreuFWUHyB6i/XPv5sm7ai1tVCj7q7CJXiCZ9CuStoeFCAmt1Ix/mGfdHLtRj0qJKhZcjqtxF5zwYUEowAu09yX/s30+2XV39EjMBvVrf0n4d8T04vPHX0fMVEqmhYkzXO1F835VXC7mRYe36cK4iwSQWZaTy
X-Gm-Message-State: AOJu0YxwhLcViy746m0tEL5ip6htgu9mrY9RH9L8dUyPXobykhtgjeBr
	y+5RydgHm3Yz4nBmocF4KiB3pkqu38H1LqKKcUVEr/H3Qbx9iduzowCy9Kraek+dMul3A9cuGS4
	tUqiqmvK+goSfjmRNp4eqCmdjgJc=
X-Google-Smtp-Source: AGHT+IEjbCu8zM2o9faAOyVL2dwkhogAJAXqFNtV2Wm2BJdBui8upObgqrxp6TVRNEGGaQGBWfOudgvaGBNm310z0n0=
X-Received: by 2002:a05:6512:b12:b0:51b:de39:3826 with SMTP id
 w18-20020a0565120b1200b0051bde393826mr1910497lfu.65.1713962778231; Wed, 24
 Apr 2024 05:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
 <20240423233622.1494708-2-florian.fainelli@broadcom.com> <ZihLSKe_BHxasBql@surfacebook.localdomain>
 <0aac2975-42d0-4abe-9405-bf8a38a94104@broadcom.com> <b3cdfeb7-6eb0-4522-96ae-d3155d677002@lunn.ch>
In-Reply-To: <b3cdfeb7-6eb0-4522-96ae-d3155d677002@lunn.ch>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Apr 2024 15:45:42 +0300
Message-ID: <CAHp75VfBnYdzs+rD2QLq=tavr=Aw2PsKbxXOseUJNWWwXsAwPw@mail.gmail.com>
Subject: Re: [PATCH 1/4] i2c: designware: Create shared header hosting driver name
To: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, linux-kernel@vger.kernel.org, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Duanqiang Wen <duanqiangwen@net-swift.com>, 
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>, 
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 3:18=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
> > > >   #include <linux/i2c.h>
> > > > +#include <linux/i2c-designware.h>
> > >
> > > Can it be hidden in the subfolder?
> >
> > That would require the MFD and ethernet drivers to include relative to =
where
> > they are in the source tree, do we really want that?
>
> Maybe linux/platform_data/i2c-designware.h ? There are a few NAME
> macros in there.

Yes, under subfolder I meant something like
include/linux/$SOMETHING/_this_header_.h or even deeper.

--=20
With Best Regards,
Andy Shevchenko

