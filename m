Return-Path: <linux-i2c+bounces-6451-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2963A972683
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 03:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B8061C237DF
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 01:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94EBF745F2;
	Tue, 10 Sep 2024 01:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTI9pVpc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6706F30C;
	Tue, 10 Sep 2024 01:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725930677; cv=none; b=tRUJ3i4xrG5ijDNngIVH1KKjaZphkdyV3ez4fIC3vuDoZ+Le20GD004/WCAsWypELEgHgEtsizmNO2ey/dcgvUbSW7T2ytCV4OGpsr5p7l2mpTSpDL/BdOYaD6Q2cohLilhjABzc5/dHFu3MhnY6QJV5MRixgSAF50CUMFF/NkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725930677; c=relaxed/simple;
	bh=MWbbj7M/hcbjZw5itry41PKqPYIOfHJ0Jxd/GmQSR+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQhbSE8xSO/qaDzX79hzLlQI9DfANgmXwRbpCFv/W3mGZ5MsCAN7m3FHZYMa+z5JTRPUxxQPj1zDQaQNm15icoIZTOl0/33qIUMQHB35RvL7npA0KZy9INM4ThNLrQ+S1JXerrek5c1lGgYKvc9ntuPQBSMegIMcGbccuEEUyL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTI9pVpc; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7aa086b077so449336866b.0;
        Mon, 09 Sep 2024 18:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725930674; x=1726535474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvs07E2i2bNd5B5P6vbRb4Hm2f1x+c2Jt21PSRfmQwg=;
        b=eTI9pVpcH7zt+8VZ0EPdMAuQpnbUSPyGTCKZwS7ccYE0Ik/ZxbAuNa4wwGnWDWC4Oa
         4XZasWzbamIazLzANPoUZnBK1mKlbvr1eUGrMiiNAVH+BLQsyydYQu2O6VIHyuh5Vwlp
         NYA3AUYyuxi9cF66cPnS/Eqw5FtAATkNOQCaQ+peq8VubbqoZaKlgw4if60CJQiC0kXR
         HYOkC2Ux3FazPAa3qlGt9MmdwcUhxHt0QNOvvEgL6vsZGxhA7aJnb494WKc556Kh8Lcn
         mdrdK49u9IwKWFwktpxydGIwVXerJvNmeuCX0wOGFlBuaE5dBMPN0oTiKvSZX045Grnq
         SD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725930674; x=1726535474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvs07E2i2bNd5B5P6vbRb4Hm2f1x+c2Jt21PSRfmQwg=;
        b=CNsiq7ckLScdFFpqU1YA9mVDDgdoQjko9Uh9rsjKTqZSTqnl7JfJJgXDeR/WKAdTgH
         57GtXoTsiUb8CrOWgzXf65LSKhh2AKK+8Dxy+iUYqjD/uhBnvZwMl5v3jflxJpBmedKi
         la5WkOk8jogBFBevSlUpBhwQPCEnj4tmXi8IfE4q98CKQAKa4UR4hnXTBrJB4Bppf35B
         XqWFJbK7OO6sNJeo7nLXkfT5i1mvAIqsCMrtMH8OE3RYQwhAfHgAC+Q/3uDkYrIvXRUO
         muOC4pKmNK+yjn5bXywnIgX6xpne6bbUqCFfz72KIYCj600KbApqgcA023cklrqecNBq
         S5qg==
X-Forwarded-Encrypted: i=1; AJvYcCUofi/P9QZNmhyxnJnLrfiYtIAz/93QKupmq0OLD67iXuu3UiF3uYHbI7wpskb6TzeiKgsUbus+UlLUIlBc@vger.kernel.org, AJvYcCXkfDFyLl/MrduPiPs5PZInnFy2AY8PJTckL9zaHa1QoqxzzIAbJp6uQ/Kj8oLXcvMCog4V1n4BfWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YylOYlm0tHZCDWaDIYKB+ShsB4w2G10z3EySxrsOZcE9JfHwF0V
	45nvLfeXYTsof0DysSI39sItn3xXLfaEEN9KkAthsbOqamsdPSrV3iYS6mUveHXg/Cg0IBbprAx
	BQQLwJBfecoq4ySChQbGA4aoHVA==
X-Google-Smtp-Source: AGHT+IFHkrICs+xDdFNkI7+zSHcj2baGGC4Txv/LSEHP7d9YAivZ2e3Tq7DfFy1kLX72eL+3nujJ1JQHIDUUErgZWXA=
X-Received: by 2002:a17:907:72c4:b0:a8d:2c00:949a with SMTP id
 a640c23a62f3a-a8d2c009911mr659802066b.9.1725930672951; Mon, 09 Sep 2024
 18:11:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-7-kfting@nuvoton.com>
 <3wz36hrpicogoakqhmveppcrt6s52zmlcgjpio3wwpil3rdwdi@ft7tloqqf2zt>
 <CACD3sJYFNV9Vxmq1Ydp=+wh-52DOCMsECO+RmP_K6t4B8wzbmA@mail.gmail.com> <2kqhf2ad3omx3dsjucrqhtnonnox7ghtp7vkogrwrdfh3dgg2o@4cpa4gfg6c3f>
In-Reply-To: <2kqhf2ad3omx3dsjucrqhtnonnox7ghtp7vkogrwrdfh3dgg2o@4cpa4gfg6c3f>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 10 Sep 2024 09:11:01 +0800
Message-ID: <CACD3sJYHW6C7REgffBB1W+e3OTFYY57WdQyVKREKg-Fot-HbOw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
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

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=888:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Sep 09, 2024 at 09:56:25AM GMT, Tyrone Ting wrote:
> > Hi Andi:
> >
> > Thank you for your review.
> >
> > Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=886=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:43=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > Hi,
> > >
> > > On Fri, Aug 30, 2024 at 11:46:39AM GMT, Tyrone Ting wrote:
> > > > Modify i2c frequency from table parameters
> > > > for NPCM i2c modules.
> > > >
> > > > Supported frequencies are:
> > > >
> > > > 1. 100KHz
> > > > 2. 400KHz
> > > > 3. 1MHz
> > >
> > > I agree with Andy, please add a good explanation for this change.
> > >
> > > > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > > > ---
> > > >  drivers/i2c/busses/i2c-npcm7xx.c | 230 +++++++++++++++++++--------=
----
> > > >  1 file changed, 144 insertions(+), 86 deletions(-)
> > > >
> > > > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/=
i2c-npcm7xx.c
> > > > index 67d156ed29b9..cac4ea0b69b8 100644
> > > > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > > > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > > > @@ -263,6 +263,121 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADD=
R] =3D {
> > > >  #define I2C_FREQ_MIN_HZ                      10000
> > > >  #define I2C_FREQ_MAX_HZ                      I2C_MAX_FAST_MODE_PLU=
S_FREQ
> > > >
> > > > +struct SMB_TIMING_T {
> > >
> > > Please run checkpatch.pl before sending the patches.
> > I did run the checkpatch.pl against this patch.
> > Here is the log from the checkpatch.pl:
> > -------------------------------------------------------------
> > ./patch_i2c_v2/v2-0006-i2c-npcm-use-i2c-frequency-table.patch
> > -------------------------------------------------------------
> > total: 0 errors, 0 warnings, 265 lines checked
> >
> > ./patch_i2c_v2/v2-0006-i2c-npcm-use-i2c-frequency-table.patch has no
> > obvious style problems and is ready for submission.
>
> mmhhh... I thought checkpatch hated capital letter declarations.
>
> Please, then, use only lower character names for declarations.
>
I'll use lower character names for declarations in next patch set.

> Thanks,
> Andi

Thank you.

Regards,
Tyrone

