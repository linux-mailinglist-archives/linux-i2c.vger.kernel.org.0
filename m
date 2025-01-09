Return-Path: <linux-i2c+bounces-9008-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB937A079BE
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 15:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1BCB16763B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 14:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A827F21B196;
	Thu,  9 Jan 2025 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E88bcs3S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2123FB9C;
	Thu,  9 Jan 2025 14:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736434285; cv=none; b=QZeP+Cv0yZWwlzRDXgx70Srq3fRO1/J6kH7/dtAHhgBZYAnUrZ0D//7WnF1qNTrNy3BpDDUFX/MmCWpeSxWFb2wW4AAuia6yIX/XrnZOEqNhreeLz3aI325pM117LcCXU/vCKV7ZJPqWsN0eXokB2mkO7x8m3TJSJFD10XtvNVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736434285; c=relaxed/simple;
	bh=fp4Upo8JIdtXSpKLw29QJKOz2VUpp7n9gxzkl4gtE1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEunjw0qtO4lHV4EKXZFawuLUC+0yoUc1LTEf/zl+5qetkjQ4T9t8hdIZ5P6pTQjclovbeKHQLNl0eGBo4XxYLr51SYZN97I8xLXzBsQBcgTqipE5FTOq+Vu4BXuqu0i8e5pHukqBVEE7XxM+EoKxqTWBHv/N6K75BAuF7SvRL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E88bcs3S; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51878d9511bso357117e0c.0;
        Thu, 09 Jan 2025 06:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736434283; x=1737039083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fp4Upo8JIdtXSpKLw29QJKOz2VUpp7n9gxzkl4gtE1s=;
        b=E88bcs3S3xYWav4yZN2k2Ehnb5cGuzBPcnTl+L3S60qPCIcCVWd0HAbNaMfTirXygn
         k5csz9BFWXfoBwrttiS3t1nEZTGPhZK95r5ZiCUt4ay+o8varXDKH9NFYQVMiHQRKF9Q
         Gy0SUQHvIpCidQMz5IhPaOTsSGXKCRcZO3tBFVFV/fwslsGm0n65wbk9kMvRywO0K8TZ
         I/ImteEczgTOaP1kqbxF6LwcwWR6UxLKpLBXheglwmW1WO3tz8ISUvB6CofGGHSijCek
         yxthmcvyvrBcvmnkVPUC39lcqfVFxxn1Z4pXMBeSK3bjJHYKSe4Qb6Q2YsMhkXWFdspg
         RVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736434283; x=1737039083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fp4Upo8JIdtXSpKLw29QJKOz2VUpp7n9gxzkl4gtE1s=;
        b=kYhu3tfcrvLmTnYDeImM8b//TXfLleaKCla+d5r9z9qdW3p5RNEy+NXrUeePbVFfwd
         zM15Zdd6cXviO9I8PAKCeTxFHKnAAtAHio+EhAX3Jx7KgItkSMGHen4O6vP4BlVi4fuj
         NDThMdYZRyOTAAH59KXZtBivETDNubTtK6SGSfDDa2Lanme/FzspM1tEieiwMIyrPeT/
         j6BUqbrGp7o1X+sehH3oJw3JyEoN3sVfnkn30+KpLuMZOOo91UBLK2b8bgTVawKD6hml
         W3SZDQGvFj02H2B3ev1G2CU8m/eIl9KZIy3FcEUvWQLPi0uhhfEeNz40uk1TkVCwoTVc
         9UOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+7gV65K0AHTtXNankkUp4CB2BEGZ3h6srbV+I40v+6d/DzVBjavbMxjRitBwwnzg1twFKCFWDbhqK8LQW@vger.kernel.org, AJvYcCUmWqSWRgB2szjNQetnJmW/+MUcOfz633Hl+vibkOi6p8/bnU2Mx38of6MGTHvW+gQJt4yxh/aK0Kl6zsbL8yD0dnU=@vger.kernel.org, AJvYcCXbGZ0mTmzFFZdJKqklqJrT5Q1pZqwxtIrn1TGCOQsjahipgpka61T01PQidLVkT5tCpVzGYZJs1B8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoGOeA7utxfzwipcY2LjHZbQxi5OCnWYoW73l6/pDodja5wgrx
	JLXVB5qYE7al9AOTkzh39tyOcAfDoQmPYNbNMtauBio0ezmnRtyHKkx2mBBdUBlwkzkmjf827mZ
	kxUnpJbR5qPghfned9PKU+CP9DNs=
X-Gm-Gg: ASbGncuOMbNQ7zNg4oJe556Cmg2Eay62FYxfVF9oxc0O2lBVVxkNVh2n6usltNYrcb1
	RbTEdTi7HgblqJkpwxK+WRHKLoTNFq5bubPUAIEM=
X-Google-Smtp-Source: AGHT+IGllgVhkIVMR+kSPAyDuhLFwM8Ph5dIqQGdkBm7nwk5oK5sl8Q6xLenbusRv+5N/1X3gL5lHvqch36R95+eC2U=
X-Received: by 2002:a05:6122:1acf:b0:516:24c4:963d with SMTP id
 71dfb90a1353d-51c6c4303e1mr5935867e0c.2.1736434282787; Thu, 09 Jan 2025
 06:51:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <2am3ib7lohj4ilqv3ldww3pkku456m2vyd2zzgm5akx6vluivm@g6wf6d32h62q>
 <CA+V-a8t2V1HP-T-3H4GdMENiaVy+FBXreLd6NxbeWZ-umupJEw@mail.gmail.com> <xyphhdf7iesomnbdihonmcnyihgervwczqd2n73a2oguuqvn6s@4axo2yd7gfha>
In-Reply-To: <xyphhdf7iesomnbdihonmcnyihgervwczqd2n73a2oguuqvn6s@4axo2yd7gfha>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 9 Jan 2025 14:50:57 +0000
X-Gm-Features: AbW1kvZWtMtJo2BuPpmXEmX8Mdth-u09bX_lrIot5WCw4VMa74ZR-d6_6Za4VGY
Message-ID: <CA+V-a8urFv4UdKzWVdsizsnDuOzeBKYVoa_FY0S1-W=EC5rcyA@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] i2c: riic: driver cleanup and improvements
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Thu, Jan 9, 2025 at 2:44=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> w=
rote:
>
> Hi,
>
> On Sat, Jan 04, 2025 at 08:15:56AM +0000, Lad, Prabhakar wrote:
> > On Fri, Jan 3, 2025 at 11:54=E2=80=AFPM Andi Shyti <andi.shyti@kernel.o=
rg> wrote:
> > > I will need for Andy's ack here because he had some comments.
> > >
> > I'll have to respin the series fixing patch 1/9.
>
> if you want you can only send patch 1. It's OK as far as I'm
> aware of it ;-)
>
> I pinged Andy privately to give an ack here, we still have a few
> days to the merge window.
>
My initial plan was to send a v5 including the recovery patch too, I
switched to using the generic i2c recovery algorithm and saw issues
which I reported [0] and waiting for Wolfram's reply.

Maybe for now, I'll send patch 1/9 only, thanks.

[0] https://lore.kernel.org/all/CA+V-a8s4-g9vxyfYMgnKMK=3DOej9kDBwWsWehWLYT=
kxw-06w-2g@mail.gmail.com/

Cheers,
Prabhakar

