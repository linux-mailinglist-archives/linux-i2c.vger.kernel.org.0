Return-Path: <linux-i2c+bounces-10475-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCC7A93448
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 10:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B56241B66289
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 08:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AC426B095;
	Fri, 18 Apr 2025 08:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRG3qrrk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676D726AABC;
	Fri, 18 Apr 2025 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744964042; cv=none; b=LwJF2DRzADvKIJiuUnt9yB7xepSA4k9q649D3oQeewcZ8bW2tUECNdYkknG9xKZQYhhYcugjkDFJcShjeC88752p8pExzyfjTTdThG7tDKhnzc1cLOe18OlqgtBYJ6PVLL/o0r0TWW1/6nG2a/3gQKY7BMwbyX9dTTDYU6pumio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744964042; c=relaxed/simple;
	bh=GHCa+D5ED4Z7P9UO7A6wuIcTDN5pqLVDOaEFzRs4DS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=GIMBW5PD9TR9c963Y+gT67AGLIgoAb7VOwtmmjM22pmPqv96s6fMbd2dDzlg5IVvq1lzddIEQ/zyPahaILVi0Jc4DuvqjA6Ya1piJODXhZYzvKYajFvyd8KmMxVUvWyjRE9n5vPCdlf59Lq/B7MET2h62UVdoRulXQVa8y2uPw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRG3qrrk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3995ff6b066so901531f8f.3;
        Fri, 18 Apr 2025 01:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744964039; x=1745568839; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysES0mGIKICmlz7bXkgEqZ80p/S+y8pioakYf1xuDpQ=;
        b=KRG3qrrk51InaJxgu1BbxtYttPTpXE1mHwftDFvJUZZy/kYKaKiV7QNuibIzRV5has
         43ZQPVsILJxcSV+3xlxP2Oyi6KpSpKu7UHwvGeah+G2A35PARtxeUbkgNzKkwDHJWONj
         HWuLZCooZEa16ii1aHczamLttmRSh5grTAFg/c26RBNKDSKixP7/vbyd/zP83GHw81vv
         l9afk1QGd99j7G39vcwCb6jDATtfD8g8hFKz7/Do5JTz+w46//h1HJVG3KVeEVwTd0dJ
         DYl+9sM5QdybRJfi4AYP5bpNepfvcbBcmNkJe03Phf2eOi5SfedH7PZ/OvokgmwMfapT
         F8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744964039; x=1745568839;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysES0mGIKICmlz7bXkgEqZ80p/S+y8pioakYf1xuDpQ=;
        b=rXsdAF+vMfohf429KJxGQdUZMEsQhc9PJ2+eCW6V+k9nf3Zqiknj75P2MvBKdhLOoI
         VhCQ0p8+ST2z4T2L/3FLXNJoDv5yso+oaSqsmTocN95mtPxaxgM4qA1UYIVesd8ElKuf
         hnscQjIzVqAGvumwQOJtriBRDgUTjOFWm6kT0R+VKRn2Vb9MkoaRrO6ycWrseBEqolHt
         8k5C0jbG5ObLw2eRkEWZN8OYm8eAQwAFOP6m/ZGiI3UCK30cdrSLt9L5ucoJOttIYbg+
         AZQH6SZo0MJEge8vTAU/C+jtyWslEPPG2eyYMN1FdwUzZPwamixBz/fe/89haKW+COsQ
         zj+g==
X-Forwarded-Encrypted: i=1; AJvYcCUXF3XSqpK1TFQzJ+BkB4lZoF/4f4r4g4fRUqa77YGb9DJaIs2iaR013S8NBe+/lKzDX3AYhlancVMtI4Yz@vger.kernel.org, AJvYcCVstdKy7wntIfjb+ulEgUD6csuHlyQ9xc5VJaw7gdldq3yXe1NMgE76F6qa5b8QBdZHL5vZ7Pi97ytoCLnAI0LtxLg=@vger.kernel.org, AJvYcCX1nc+l5ADH1IGtcibwhUePzmIVY1I+oT+iozFX47NH2ao29B56i4Z4yfPklvLVowodJM0Y0AFAfJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMNhpCR9HF5OdNK2f9Ro9heyZvTwBDAxktm8FziGemRDGRTAih
	oT/OlObbtSc5+5vnd/1uTc5ZIBdtJeysSaRc8N73CcYOEqYNKJPjZo9X3Zu7cmGhNm8k7F1DpNJ
	S8ijD4/+5tUmyV5WmkE8oRIGPggnyi7aQfZc=
X-Gm-Gg: ASbGncuarmwIN6xpQXEf4zyOxDeOgFYoa2ddLqO2feVDwy4UbSktO9GrZiBJ+f8vOfm
	2i6nExIlKJw7Xz/U8TllSXqmIXjgK6qxVdYMWV40Py0cBOmlKoM/5TmgYHRtmSbDaiQQ+pRwtfN
	tH6qMNjuy3WbMtdlspsCjwnQ==
X-Google-Smtp-Source: AGHT+IEixeG56vKRHIfQZ9WsOF29rSKcalIFuTYowp5DR2TTigZduRtRr3/kyEZsUTNoi6kty3vschsKLRALWMCsvN4=
X-Received: by 2002:a05:6000:18af:b0:38f:3a89:fdb5 with SMTP id
 ffacd0b85a97d-39efba39855mr1321236f8f.11.1744964038466; Fri, 18 Apr 2025
 01:13:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407121859.131156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aAC8f0dAMERD8GjW@shikoro> <CA+V-a8sM2mFS--zLSZt28mOUDuO2FpW0TsaV50A_VxFZ-juP4Q@mail.gmail.com>
 <aAFgwEB4SdgH-1fQ@shikoro>
In-Reply-To: <aAFgwEB4SdgH-1fQ@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Apr 2025 09:13:32 +0100
X-Gm-Features: ATxdqUFA9156Eu4fxE42CTO7RyOYL7H7N298Z-M17LvBAVxksQ4kwAlr1vrCh38
Message-ID: <CA+V-a8tmTqFi4iqGhR3cfUgKw7mxJrm6ixGAHq747ptrL3t2jA@mail.gmail.com>
Subject: Re: [PATCH v8] i2c: riic: Implement bus recovery
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Apr 17, 2025 at 9:12=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > As suggested I have the below now, (are there any changes Ive missed?)
>
> Well, get_sda should really only get SDA :)
> >
> > +static int riic_get_sda(struct i2c_adapter *adap)
> > +{
> > +       struct riic_dev *riic =3D i2c_get_adapdata(adap);
> > +
> > +       /* Check if the bus is busy or SDA is not high */
> > +       if ((riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) ||
> > +           !(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI))
> > +               return -EBUSY;
> > +
> > +       return 1;
> > +}
>
> I have
>
> +static int riic_get_sda(struct i2c_adapter *adap)
> +{
> +       struct riic_dev *riic =3D i2c_get_adapdata(adap);
> +
> +       return !!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI);
> +}
>
> I believe the BBSY handling could be why it does not work.
>
Thanks, that did the trick. The incomplete_write_byte test case is
passing for me. Now moving onto the incomplete_address_phase case this
seems to be failing on my side. Did you test this on your side?

root@smarc-rzg2l:~/i2c# cat incomplete_address_phase.sh
cd /sys/kernel/debug/i2c/i2c-4/
for i in {1..1}; do
        echo 0x68 > incomplete_address_phase;
        val=3D$(i2cget -y -f 3 0x68 8)
        if [ "$?" !=3D "0" ] || [ "${val}" !=3D "0x83" ]; then
                echo "I2C Read error (ret:$?) ${val}!!"
                exit 1
        fi
        echo "Read val:${val}"
done

root@smarc-rzg2l:~/i2c# ./incomplete_address_phase.sh
Error: Read failed
I2C Read error (ret:0) !!
root@smarc-rzg2l:~/i2c# ./incomplete_address_phase.sh
Read val:0x83
root@smarc-rzg2l:~/i2c# ./incomplete_address_phase.sh
Error: Read failed
I2C Read error (ret:0) !!
root@smarc-rzg2l:~/i2c# ./incomplete_address_phase.sh
Read val:0x83
root@smarc-rzg2l:~/i2c# ./incomplete_address_phase.sh
Error: Read failed
I2C Read error (ret:0) !!
root@smarc-rzg2l:~/i2c#
root@smarc-rzg2l:~/i2c#

Cheers,
Prabhakar

