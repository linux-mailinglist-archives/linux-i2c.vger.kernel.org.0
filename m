Return-Path: <linux-i2c+bounces-10461-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FD9A91D5E
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 15:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 846287ADE96
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 13:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02C024339C;
	Thu, 17 Apr 2025 13:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vp+pDqd2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937BA1F463D;
	Thu, 17 Apr 2025 13:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744895464; cv=none; b=agDCJfmXRjaJfiFkU9ffEsjlsobjpnS1sbjTRf2ZFN/PoK6pNw60YR0qW4cuWQFUKy2fZ0nYC9TUluOrX+RAlfm8CrHBUly3KbWh35Qs0HjO7GWaAH8EmcWlZ0kQMYkqTiUF4Fh4Eljl21/rtfJRVgQQ1+Exxh97sSuGeJQJVds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744895464; c=relaxed/simple;
	bh=xDoSUF+t2BtVAblw1gUxoFZPSnQzxNcWYx2wwjhefXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=qYPcTznF7VeTX0RpFD/nFKWDCZQAYEEGzS//PQKcR1g9IrQbYN6wM2WuWsAsF1o7RPoaEcZZNligfbW40vwJz3hGUZ0eFE3jmvcleXBbmlqrOTshypBErW2jUXD08XBRfAjN+q/++WIZNaP46jxARf/fp6FbvaFfa7J8+94hS9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vp+pDqd2; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c0dfba946so441586f8f.3;
        Thu, 17 Apr 2025 06:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744895461; x=1745500261; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfU/FeD2B8y15uk/G1y09exWREViQBDYUy+yy5/sUEI=;
        b=Vp+pDqd2TcrTE5CCMV2Pd5iOSCDBt7JOC0r/VDthXhaOpwp2qFwAy1J9XNrPnd9Rsm
         PkIBsNt5IUTfbHo6hMA2st9YXbBe7o54BiL9wlo8ZrhyBZ8I+iiEViYBN53VxQHNAa5q
         QCT9D20opN/FrY5MDKV8GzsVPmLk8B6YPFD1QmgvU4ObkZDIXPOxmwdVSLhq3BMmfoAk
         8ejaPVyseqjEuVlICDgWn95u2BYJT2ieusYkRAzZnaP8INIcHuzvA+J3QiSIu8cKeSrF
         +X5KveWc9Gou86cgLirL0QHqopA7UVD7RXcl+d7R+c90J2zNtSPbhpQm0x36yyCADzCb
         3uSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744895461; x=1745500261;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfU/FeD2B8y15uk/G1y09exWREViQBDYUy+yy5/sUEI=;
        b=Lu1hAhaxlYc7tIFaIXTub4sPEY8j2agrUP67lTJsKkAJ44zNm4fXUQHMxxTm7SckZN
         zw4g2DTsDYN6G+fL1QIqjf15rCE23FBL63JyepRpi8wWJj7r3Otp+Fz8BoJ5wRVbxLF2
         5kyOa6V7PzmPh1VpVF6cHg62rG/k8AlvafDpIYkOA1sFkPz9+/o1lR3M0ukLs1+7h37m
         wcBcWp5zgrMiTVWoQuEVxePnLt70i9dU3uSXMYRMxHqVv+lxtoyQkTuPy8mEiNHm5dF5
         AKeGVPGVOqW81+YUM822DJUxy9atI7qaj4tmfcZl6PE6UpqCVXPmWBn0rliBUmwTySnj
         Uf6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4fw/Zx/rRPAzcSGwooE5djUIoKCkAAAa20yLerS4D4IALzr9Srk4kaJHv07O+UDK4c4f21wP1w5jqphdOwuQPXYM=@vger.kernel.org, AJvYcCW7UKgHFiwQsQJG8KdjhbPVToR6Eh3De+tsxbvG4Ki1QIdxdSJC0hhtmbWIwSpss0gzhmG0r0E5cL8=@vger.kernel.org, AJvYcCWGMQQ5JlzU/87rP+z3DlwwLnxoR6e9U+xuvMVbkgmo5vyjyx9RkPNnxafV/cifTibub8P6cucEncaJD2az@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5BWnV+EzlsPuVJxUwLMZMyh5WP08pjaX5q1flVLgbZ0/XsUTq
	R+1dsmNGN49l6YMOF4KOGKJDKFMWJbl4UpydM91JPGxYs8A6pO1Va8YTcaBptCQ0f5yEyoDZHi3
	ypBh2bjZmuGAPx/NTb7KJMJZ8ObyLhJzQam4=
X-Gm-Gg: ASbGnctILGn46V6SlpsytJ+mNSVWB1+mSrzZVg/LsxSk5251R2l9zJrLfTanFf3duB0
	RBbqquKY5+cjR0AFpxBUgEYTBDRp7XxVDlitXb00mEuufu67AQAwWnq848TGcTtIqx2EC+Hw/jH
	MBlEYl3qenPkORjX5JZyNaokSe2G7gzs54
X-Google-Smtp-Source: AGHT+IHe8IeHMBruSy2OmJqIu5BulwSfPaVutWd/BDdoEX6OT87ImeTJYS49LegJyrfSfQbKWhmDk0r56i5nVbkhbf0=
X-Received: by 2002:a05:6000:4022:b0:39c:1f19:f0c3 with SMTP id
 ffacd0b85a97d-39ee5ba069fmr5082581f8f.46.1744895460627; Thu, 17 Apr 2025
 06:11:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407121859.131156-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <aAC8f0dAMERD8GjW@shikoro>
In-Reply-To: <aAC8f0dAMERD8GjW@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 17 Apr 2025 14:10:32 +0100
X-Gm-Features: ATxdqUFN80jEjR5nyR8PTGJy3DOuIY7N-bcdBPy5YnBJdqTQHWwl4yfUe47GLVI
Message-ID: <CA+V-a8sM2mFS--zLSZt28mOUDuO2FpW0TsaV50A_VxFZ-juP4Q@mail.gmail.com>
Subject: Re: [PATCH v8] i2c: riic: Implement bus recovery
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

Finally I got my setup out for this.

On Thu, Apr 17, 2025 at 9:32=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Mon, Apr 07, 2025 at 01:18:59PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Implement bus recovery by reinitializing the hardware to reset the bus
> > state and generating 9 clock cycles (and a stop condition) to release
> > the SDA line.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Reviewed-by: Andy Shevchenko <andy@kernel.org>
>
> As I wrote in the other thread: I took your generic_scl approach and
> replaced bus_free() with get_sda(). Works fine here with my G3S:
>
As suggested I have the below now, (are there any changes Ive missed?)

+static int riic_get_sda(struct i2c_adapter *adap)
+{
+       struct riic_dev *riic =3D i2c_get_adapdata(adap);
+
+       /* Check if the bus is busy or SDA is not high */
+       if ((riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) ||
+           !(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI))
+               return -EBUSY;
+
+       return 1;
+}
+
 static const struct riic_irq_desc riic_irqs[] =3D {
        { .res_num =3D 0, .isr =3D riic_tend_isr, .name =3D "riic-tend" },
        { .res_num =3D 1, .isr =3D riic_rdrf_isr, .name =3D "riic-rdrf" },
@@ -523,7 +568,11 @@ static const struct riic_irq_desc riic_irqs[] =3D {
 };

 static struct i2c_bus_recovery_info riic_bri =3D {
-       .recover_bus =3D riic_recover_bus,
+       .get_scl =3D riic_get_scl,
+       .set_scl =3D riic_set_scl,
+       .set_sda =3D riic_set_sda,
+       .get_sda =3D riic_get_sda,
+       .recover_bus =3D i2c_generic_scl_recovery,
 }

> # echo 0x1a > /sys/kernel/debug/i2c/i2c-2/incomplete_address_phase ; i2cg=
et -f -y 0 0x1a 3
> 0x0c
>
> And I see 9 pulses in the scope. Can you try this with your setup
> please?
>
This seems to be unreliable on my side below are my test results.

root@smarc-rzg2l:~/i2c# cat ./incomplete_address_phase.sh
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

root@smarc-rzg2l:~/i2c#
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
root@smarc-rzg2l:~/i2c# ./incomplete_address_phase.sh
Read val:0x83
root@smarc-rzg2l:~/i2c# ./incomplete_address_phase.sh
Error: Read failed
I2C Read error (ret:0) !!
root@smarc-rzg2l:~/i2c#
root@smarc-rzg2l:~/i2c#

Cheers,
Prabhakar

