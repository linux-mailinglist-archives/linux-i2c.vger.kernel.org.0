Return-Path: <linux-i2c+bounces-7560-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 371B89AF6E4
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 03:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C594AB2097F
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 01:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9B02744B;
	Fri, 25 Oct 2024 01:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oi+AsDSX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317914C83;
	Fri, 25 Oct 2024 01:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729820200; cv=none; b=f9foWzWwc/o3eDIicBC4HT4yriescZlc45zXz9jWRUg+kodPYMhMfyfZqN0tlm8VgUB7qea9k+k6fREBIpRmFpYPBC+l6wHL6mRzRrieOO0FTG6Ii7lEYJrb/DxwG16f3a5YgyLeUVRm61UeTIjg8aM147WxBPKm5In5fOxbsKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729820200; c=relaxed/simple;
	bh=AT8mhgj8dK/Dt/LNnUA0ZWBwiNximHfFxs/xVLFV8Og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EedfTa5WiT+oLngIrVmZJpU22QPOWXMrmu6dp3A57SsjntUuAjR0BGTvlwq5ZyIz02IvPluI4s2Ep+RD75/9jgQ+92/lj00QO48uefc9X3U/NVn2cKyAon7E3kEcYRu5L+hgaZ7VI3fQWaHArFqx0W5FYrJ0edPlauUjcjTlwXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oi+AsDSX; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so1207351f8f.3;
        Thu, 24 Oct 2024 18:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729820196; x=1730424996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AT8mhgj8dK/Dt/LNnUA0ZWBwiNximHfFxs/xVLFV8Og=;
        b=Oi+AsDSX0ma4/SiYFZstO4PSt9RIyTu9JHx+30JMYsZ906r4TLDsuclSlR8o2i8wES
         r0y5yl8oxgw/KG2XKbGc2Ua9o+QwWLK9XoNjmbyySL2iMJv2qjMlx57zu8ZP08MI3oex
         EUSYDOFqaQJnOewL6kAMS5kZU9efr4g/S590tiB+7HN8aS2rSOotS5r9VbEQ22v2UPaE
         8r1OVbOgve/0KIEEjCZws5iH+E8OXyPEv78t4DwbYKbiBuJ8UoTA2hYhKH9ozFFRJaZ2
         VdHX4vDU5nqZ/z3ruwxWsYlj/CXya0lWuuJrEY28Ve1BnLTS1cEPzZv+JmJg9G1c7wO0
         ekyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729820196; x=1730424996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AT8mhgj8dK/Dt/LNnUA0ZWBwiNximHfFxs/xVLFV8Og=;
        b=vGgBEPXOJ7TFmvwhdV/EoPETGkjx4yrW3CVhP6kQ5mwYOgAbFFYIHlLBxGpxv/Liwf
         xdkoI0JLcpIOGiak1ar5rQ+nTOF3uf+JjhzAh0VQk2C5Gwtgvnei9Vkhqvb1xvmw/RFF
         5l7Nh6rLIWnxHwxfKRVj4r7w6r0+tQ3+99JQsgcng0MeLMG/n6ULzZkSdwuMkOCdRm2y
         q0FUVr9Ypk3jIoyJ6II47Mh+GyOxot+u8+RHhtoi9STD2GvaAu6SuIJNNvDc5LzUotVH
         7Ylg7wRN8bzi7b2JvT3tHAcTsI//7DJXgsYKGY3yPAq3xmhv2eBGpPfFsF/hA+SlY+fh
         t1Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUwk+mMHlhl4T34/EKDXXmPt82Rr1cbQ2+XiLPpxVikeKNfnmFDFrXzi8OVBI0xx/GsMHRsLWa7wEQpMJya@vger.kernel.org, AJvYcCXM0dj/xMsN6YpbwmvmlH1sQqZEMPEnGyRipknOb5F46GiCMcXX6J/Ub4Zz6UiaAZozO53Dzg4EGZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYwh0/L2lHuDUbyRV+kpBgGuuYje8lVNRlr7VPlmOhus61ym1I
	+3op9pYOCxHfWVt1QobPpUeUgxteKh76IyBlI6xjby0krbNSD1zOBDQkaZskQL84lbgg5TIJZKB
	QrLNPsVKH96RnsKuSqmvY1lSpQg==
X-Google-Smtp-Source: AGHT+IGrg5Qsx7UtEtWPquGFb4c1OOVDWrYwbdFq5xvgXAuMTsixP4ouyOpiTyOMy6JfgLM6ucsGueCV3JQPW30Sc6k=
X-Received: by 2002:adf:e0c2:0:b0:37d:4744:9d1d with SMTP id
 ffacd0b85a97d-37efcf34f36mr4957208f8f.35.1729820196315; Thu, 24 Oct 2024
 18:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-3-kfting@nuvoton.com>
 <67d34216-e98b-43d9-afd1-2e73ffb71968@molgen.mpg.de> <CACD3sJb_xF_wYuLEMV3yF0HdtrOX3vnPUdZ6_x5yof7yj4yUNg@mail.gmail.com>
 <n4buyofrjkgvbgimcziqpm7hfba6du64lbe4aa42d4dhyx6zdn@m4ofnrx66ww6>
In-Reply-To: <n4buyofrjkgvbgimcziqpm7hfba6du64lbe4aa42d4dhyx6zdn@m4ofnrx66ww6>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 25 Oct 2024 09:36:24 +0800
Message-ID: <CACD3sJauX4dg927nAvfTKOG_phW2d40CRLV09L2OigLn06kbUQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, avifishman70@gmail.com, tmaimon77@gmail.com, 
	tali.perry1@gmail.com, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com, andriy.shevchenko@linux.intel.com, wsa@kernel.org, 
	rand.sec96@gmail.com, wsa+renesas@sang-engineering.com, 
	tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, 
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Andi:

Thank you for your help on this.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:28=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> On Tue, Oct 22, 2024 at 04:08:46PM +0800, Tyrone Ting wrote:
> > Hi Paul:
> >
> > Thank you for your comment.
> >
> > It'll be addressed in the next patch set.
>
> No need to resend, I can take care of it.
>
> Andi

Have a nice day.

Regards,
Tyrone

