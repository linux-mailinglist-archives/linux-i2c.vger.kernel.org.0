Return-Path: <linux-i2c+bounces-9782-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C934DA5CFD8
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 20:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FDD23A02AD
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 19:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAD5264625;
	Tue, 11 Mar 2025 19:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/NWMSzs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A4B2627E3;
	Tue, 11 Mar 2025 19:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741722394; cv=none; b=PIxhXCgXwtvPv8NldHQqOGmB6XlwOkfCk67sT3pdE75oDgAEp/T1PrBc+KB2KEwKqvidah2G/IcCYveoN0HWtfHZBU2ftttisZLXASN2y+WcC0Lc2zMUsKYzNl+shLMGFvQ1sF4s+43WDMxG7bHUqHogisHrLISgcJIq9i17eO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741722394; c=relaxed/simple;
	bh=SNWfUkkGZj7YIOrGLDlfUjQkdQ2XN+YaARHIvh++Uek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1u7cmeO9FgktGR0AIumAPbuaUyFtxeHU8XhYNQj+iBfwQlcY0pYUY3J0Jb3hv7uM3V9lB/Yzlz0RB89oM7xl28WQrVoXgow1aiWx/V+dWP3W8xBBlRuyMMzdD4jd+Ee4uvloQOGjIPLiLcet3OtzvjhE/y4uT6PTi4Xpuo27E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/NWMSzs; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab78e6edb99so892808766b.2;
        Tue, 11 Mar 2025 12:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741722390; x=1742327190; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObHgGrVteO0f2PuIdewx0nbUKb6HPyKqSYHnOKoTiJw=;
        b=c/NWMSzsH9jxVskM7ai6IY7Dr108rv1YmVrxSMW7v8y1MyJ4AsWnhx2K/A/3xIZLBT
         zsdVQwqcc0CbrebkO6Wx0igJ4hUJQ3c1HY/jt7mWYTOQ6pw/Qh4GXEpPO5Djb75t0uv0
         VglO1spE9XgME0a5PBeKe//h7mtdX5IqUAF+EwZGd0S97RhndpgckwIzQdX5WL89BHmR
         Fu4xwrDI5dn/ZVGaSVwRNqo+svJ8xGIpKoitJFLG0RGuZKBgiiq/dxzMqRnO1MzFnL9d
         swB8PGna76eduzx7iJtASl01wganpebUOscStGJGMXYGjACxkbSpFijOaAYmeF+HNEMf
         iMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741722390; x=1742327190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObHgGrVteO0f2PuIdewx0nbUKb6HPyKqSYHnOKoTiJw=;
        b=xVRPKGiVXPhNm1lJ29hLw4gHwGotjQsxMmZRjXohd2FQucCHeS2tP8HepyBQtz34kb
         BfPhpMhqw6Pvu5q0CAjyCCKUd+EFGHGBXcfyF0Ty7ScVv0RQlhp8G/LXbTVVwS29kGSl
         3HFNCKNIQ3cKgsF0qskSUAgyGiwabcz9zrtQxjpGhLvEcXkEhbkDuCZC3jzJpMfFAn4M
         bfY7EezyxLN4K2y4HcfoLJDEJXqYN6b8V41KhkEM5HJVRQ44POt/sc7L2oK1fU8878lA
         7IxrUzV1UP3M3n6ARx6Wr79ydTwvurUlt0fOAhdE9fik6JpucQfsJnj6dEyngilBxeqe
         iuMA==
X-Forwarded-Encrypted: i=1; AJvYcCUU93H8HnaJg3Y5wvJGwFye5CohYos1orAGs08iqf2AuidPXFFOCPFc8AdeokzZZTKsw6xbODMNjx7DbqW+@vger.kernel.org, AJvYcCW5zB5yCbw8IprNYg/16PCvMhpT21gE7HEEBhDyWM5v+RtSLw30+XW7Iowt4mh2PQ5aifvjo11u8Y0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjXGfmbNsoNazR83rblxw1wz5tImZawtyLJUp7qa7s73M8CeBz
	fZDu8VRb4JL5QXU3lJd/l+Vgiq9Khoo/fh2dvhWdpi4818C4KuxDpqc26ulV4XdFRxhiieH0X1d
	7mosh/833T7O6CAyBPspBEj3CGcKdfPo/
X-Gm-Gg: ASbGncutPD59jrk+7+HhUyLy4VsGk7IKSR0/eFOsWNmsKo23/mHYRYbytLqMTQqqrbg
	CavcSb4M31Z9UDZh9DwW8Pf+vLKjt9Tr1QSwFJn19bIPPrXBtL71Il+wupRylH4et6sK883yPFY
	wJuxpfvPOTl9/retrdM6Uwr+KWzA==
X-Google-Smtp-Source: AGHT+IHrekHFcY9xXhdLUJAIdxRbcYXC7zT5lh/hwcGr03scty47dbbVNjSfaz/CYED0/DidVl4jBykoXWu9yXNBWGU=
X-Received: by 2002:a17:906:5589:b0:ac2:6ba6:46fe with SMTP id
 a640c23a62f3a-ac26ba64e00mr1598438966b.50.1741722390071; Tue, 11 Mar 2025
 12:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311023435.3962466-1-aryan.srivastava@alliedtelesis.co.nz> <20250311023435.3962466-4-aryan.srivastava@alliedtelesis.co.nz>
In-Reply-To: <20250311023435.3962466-4-aryan.srivastava@alliedtelesis.co.nz>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Mar 2025 21:45:53 +0200
X-Gm-Features: AQ5f1JqCrcSXtRBkCncfO0ixmiLgzMPHzuDFzg-QPYe1r4r0djVhVXew4Sqt5Bk
Message-ID: <CAHp75VceyOKq1FJkWLg3wUEW-QMEhC9ffJ9JW3V7NaO4zxNvpA@mail.gmail.com>
Subject: Re: [PATCH v12 3/3] i2c: octeon: add block-mode i2c operations
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: Andi Shyti <andi.shyti@kernel.org>, Markus Elfring <Markus.Elfring@web.de>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Robert Richter <rric@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 4:34=E2=80=AFAM Aryan Srivastava
<aryan.srivastava@alliedtelesis.co.nz> wrote:
>
> Add functions to perform block read and write operations. This applies
> for cases where the requested operation is for >8 bytes of data.
>
> When not using the block mode transfer, the driver will attempt a series
> of 8 byte i2c operations until it reaches the desired total. For
> example, for a 40 byte request the driver will complete 5 separate
> transactions. This results in large transactions taking a significant
> amount of time to process.
>
> Add block mode such that the driver can request larger transactions, up
> to 1024 bytes per transfer.
>
> Many aspects of the block mode transfer is common with the regular 8
> byte operations. Use generic functions for parts of the message
> construction and sending the message. The key difference for the block
> mode is the usage of separate FIFO buffer to store data.
>
> Write to this buffer in the case of a write (before command send).
> Read from this buffer in the case of a read (after command send).
>
> Data is written into this buffer by placing data into the MSB onwards.
> This means the bottom 8 bits of the data will match the top 8 bits, and
> so on and so forth.
>
> Set specific bits in message for block mode, enable block mode transfers
> from global i2c management registers, construct message, send message,
> read or write from FIFO buffer as required.
>
> The block-mode transactions result in a significant speed increase in
> large i2c requests.

...

> +static int octeon_i2c_hlc_block_comp_read(struct octeon_i2c *i2c, struct=
 i2c_msg *msgs)
> +{

> +       int ret =3D 0;

Why the useless assignment?

> +       u16 len;
> +       u64 cmd;
> +
> +       octeon_i2c_hlc_enable(i2c);
> +       octeon_i2c_block_enable(i2c);
> +
> +       /* Write (size - 1) into block control register */
> +       len =3D msgs[1].len - 1;
> +       octeon_i2c_writeq_flush((u64)(len), i2c->twsi_base + OCTEON_REG_B=
LOCK_CTL(i2c));

Why explicit casting? (And no need to have parentheses for simple
cases like this)

> +       /* Prepare core command */
> +       cmd =3D SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR | SW_TWSI_OP_7_IA;
> +       cmd |=3D (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
> +
> +       /* Send core command */
> +       ret =3D octeon_i2c_hlc_read_cmd(i2c, msgs[0], cmd);
> +       if (ret)
> +               return ret;
> +
> +       cmd =3D __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
> +       if ((cmd & SW_TWSI_R) =3D=3D 0)
> +               return octeon_i2c_check_status(i2c, false);
> +
> +       /* read data in FIFO */
> +       octeon_i2c_writeq_flush(TWSX_BLOCK_STS_RESET_PTR,
> +                               i2c->twsi_base + OCTEON_REG_BLOCK_STS(i2c=
));
> +       for (u16 i =3D 0; i <=3D len; i +=3D 8) {
> +               /* Byte-swap FIFO data and copy into msg buffer */
> +               u64 rd =3D cpu_to_be64(__raw_readq(i2c->twsi_base + OCTEO=
N_REG_BLOCK_FIFO(i2c)));
> +
> +               memcpy(&msgs[1].buf[i], &rd, MIN_T(u16, 8, msgs[1].len - =
i));

Why MIN_T()?! umin() or min() should work.

> +       }
> +
> +       octeon_i2c_block_disable(i2c);
> +       return ret;
> +}

...

> +static int octeon_i2c_hlc_block_comp_write(struct octeon_i2c *i2c, struc=
t i2c_msg *msgs)
> +{

Same comments as per above.

> +       bool set_ext =3D false;
> +       int ret =3D 0;

Why do you need these assignments? What for?

> +       u16 len;
> +       u64 cmd, ext =3D 0;
> +
> +       octeon_i2c_hlc_enable(i2c);
> +       octeon_i2c_block_enable(i2c);
> +
> +       /* Write (size - 1) into block control register */
> +       len =3D msgs[1].len - 1;
> +       octeon_i2c_writeq_flush((u64)(len), i2c->twsi_base + OCTEON_REG_B=
LOCK_CTL(i2c));
> +
> +       /* Prepare core command */
> +       cmd =3D SW_TWSI_V | SW_TWSI_SOVR | SW_TWSI_OP_7_IA;
> +       cmd |=3D (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
> +
> +       /* Set parameters for extended message (if required) */
> +       set_ext =3D octeon_i2c_hlc_ext(i2c, msgs[0], &cmd, &ext);
> +
> +       /* Write msg into FIFO buffer */
> +       octeon_i2c_writeq_flush(TWSX_BLOCK_STS_RESET_PTR,
> +                               i2c->twsi_base + OCTEON_REG_BLOCK_STS(i2c=
));
> +       for (u16 i =3D 0; i <=3D len; i +=3D 8) {
> +               u64 buf =3D 0;
> +
> +               /* Copy 8 bytes or remaining bytes from message buffer */
> +               memcpy(&buf, &msgs[1].buf[i], MIN_T(u16, 8, msgs[1].len -=
 i));
> +
> +               /* Byte-swap message data and write into FIFO */
> +               buf =3D cpu_to_be64(buf);
> +               octeon_i2c_writeq_flush(buf, i2c->twsi_base + OCTEON_REG_=
BLOCK_FIFO(i2c));
> +       }
> +       if (set_ext)
> +               octeon_i2c_writeq_flush(ext, i2c->twsi_base + OCTEON_REG_=
SW_TWSI_EXT(i2c));
> +
> +       /* Send command to core (send data in FIFO) */
> +       ret =3D octeon_i2c_hlc_cmd_send(i2c, cmd);
> +       if (ret)
> +               return ret;
> +
> +       cmd =3D __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
> +       if ((cmd & SW_TWSI_R) =3D=3D 0)
> +               return octeon_i2c_check_status(i2c, false);
> +
> +       octeon_i2c_block_disable(i2c);
> +       return ret;
> +}

--=20
With Best Regards,
Andy Shevchenko

