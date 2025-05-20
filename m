Return-Path: <linux-i2c+bounces-11062-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A571ABCD7E
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 05:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E0311897F2D
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 03:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B51A1D7E42;
	Tue, 20 May 2025 03:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZlPAvG5h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203707DA8C
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 03:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747710078; cv=none; b=dK4oRiL3XOKzw5mnbhMfUfC+YItT+4lW+05SpY9H/HYJiEuqQBzf8T6a8KLg+W6ciDOkM7SF14EZxwFTRBwohrNlYBR39uhuIwqYFGI8gexKdYVbW/o8FpWzC7KaYD/LPOB6QnBamfL8ZeBUUUOOo55HdzwRT81+2m44WAa/yLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747710078; c=relaxed/simple;
	bh=By7Yn2yxmnGDxuLuH0yfWAebcHTANMntBcq9/doce34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=jU/+lJ30wA+Tpm3bP0YpUOsOzn8JCx8EyT5NbAcl0Hhi5uluMfHyoBccVtHULmLAseYbrYGPL5S8/C+WaLL+2K//8WWIbH1SNJEq/NW0cAL7hDeUvLI3f8WL1dMK3Kc7VFdoYn5JkJ/TjkSesOwdgFxCtUtgIK5SQ2SXEDyy5qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZlPAvG5h; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c5eb7d1cso2963310b3a.3
        for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 20:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747710075; x=1748314875; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FFTLhKAyAIq2pgDDlazli0BqEh5hG63gGYiklCQl28=;
        b=ZlPAvG5hZ23wBcRwSUcE36w6ZHf3XELMovDuuBbjxN0DgUVB2JKow/D0zjSsGToXLc
         dgbiM7RH1ZVe70A7OhD+R5Vx9c4yMHTpyrvIZ8F+/ihm2xpkAol2+ScmHj9OCGhjs2nc
         E5XAlymSQQVbNLJpyDzLx1OKC3iVTMT9YZaNfGhGho28Lu1SQHhkhQgH4V0VYIuT9tpM
         HOdqB7DLsrOzR0Wk1NhgKxg++/hTE0QPEyN4WIg5+6Uhc+oBkJMrCO2/MNMEvuWjKhUy
         UL8aIwpZadQcN/RJWn5IZmy1+jm+UDfPJLMHFuwwbvez8X78yfz4EczFfYGoiPkyyGzD
         uALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747710075; x=1748314875;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FFTLhKAyAIq2pgDDlazli0BqEh5hG63gGYiklCQl28=;
        b=Ne0kXF4epF4UteKo7At/y9SBsFtq4jc8QhM7j+ll3Gl894FDtoBTc4PX21X03jUtnU
         FV3R9jZ8dOe5c/GOCUtJ9FaR7cpiGtNML0Q3OAFFT1SPMZPnw+8pi8nobC/BcfYVwRuq
         nTxxjotjKSQopQ4vb2PwPI8jadhn67Eayyhfe50N7/nuFM+14j/MdmBIdvnlmooAKqq0
         TpXIF4bouzo+qiCni4jpPQezGmLIrc0pqVVfeegVr3Otc8p71WWpE4dhHIXxLmJ2Cl5S
         lK9WNx7V773sQWVirGuYu4wh0KcgX7t7Cw+HtRls0UBBtbH25Ovhjwk8HzGZwauA5Dus
         s0yg==
X-Forwarded-Encrypted: i=1; AJvYcCVemetenZS293iwVhIM9YR3Ay+QMppFuV5LAVL1UqwojjqiC3Hb5eBrhCtjHQwhVcU0nGi7mhAATGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Et+heRTqoUylCsdokvAtQt+erTmZIAW/mT3DPgbYDu9Ynxa3
	P1x0h7H698GEv0CBup8LMl5SKqjzNu8Iqt/GnTJmpGiAtjw7bZZk6ovxQKHFehRri2bn3RS4GO9
	JbYaTJPuc1hTTaONMcT2fM/c4qUW2jtrqUqbLfXW7Lw==
X-Gm-Gg: ASbGncvLpruuNtXUZdpTjfxJVO4vYctna4nMNQs6GY04OyvUSJa8p4mPiUwDf1Bo/zr
	wmXL9a5lLbLIAn+OW7+FMdsWqEHiqn5LIBi9F9bxoASmSMQ0/wEwBDkxGPCu4yeXb3HkJb10fbJ
	QpQUKL7dXhXlj4c8cjOyimrsDOrrcs0QNkGwQBBBkPe39iag==
X-Google-Smtp-Source: AGHT+IGS+FekNktlVr2qoc5OQy9shoeTYsQUWA6b8sjkat088gtQG8oPZo0iUGir4U53OxZWqwQBEFwmJzO8EgsVoUc=
X-Received: by 2002:a05:6a00:6f57:b0:73d:b1ff:c758 with SMTP id
 d2e1a72fcca58-742a98abbecmr20097888b3a.18.1747710075339; Mon, 19 May 2025
 20:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209060422.1021512-1-zhangjian.3032@bytedance.com> <aCtkSBZfkc2k1jnb@shikoro>
In-Reply-To: <aCtkSBZfkc2k1jnb@shikoro>
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Tue, 20 May 2025 11:01:04 +0800
X-Gm-Features: AX0GCFss8Ye3lgycBlu2I0Xeul8aS9tVUxjI2p9D-d5f_PAKqa10XuO8-j7pvfM
Message-ID: <CA+J-oUvJ39Sz6Yt-8N33vJU=W0K8nN1oBwGwEDyHbhh+=BZpRQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] i2c: slave-eeprom: add latch mode
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jian Zhang <zhangjian.3032@bytedance.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 1:03=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Mon, Dec 09, 2024 at 02:04:21PM +0800, Jian Zhang wrote:
> > The read operation is locked by byte, while the write operation is
> > locked by block (or based on the amount of data written). If we need to
> > ensure the integrity of a "block" of data that the other end can read,
> > then we need a latch mode, lock the buffer when a read operation is
> > requested.
>
> I don't really understand what you want to fix here. Does this patch
> really fix your issue because...

The scenario I=E2=80=99m dealing with:
* I=E2=80=99m using this driver to simulate an EEPROM device.
* One byte of the EEPROM content contains the CRC of the preceding data.
* Each time I update the EEPROM data, I use i2c_slave_eeprom_bin_write
to write the entire buffer, so the data in memory is always
consistent.
* I expect the I2C master (peer) to be able to perform a block read
and get the full, correct data including a valid CRC.

The problem I=E2=80=99ve encountered:
* In i2c_slave_eeprom_slave_cb, a block read from the master triggers
multiple callbacks, each returning one byte.
 This results in a sequence like:
 1. Master sends a write
 2. Master reads the first byte.
 3. The EEPROM buffer is updated.
 4, Master reads the second byte.

This may lead to a mismatch during a single block read,
where the master receives data that is partially from the,
 old buffer and partially from the new one=E2=80=94causing
CRC validation to fail.

>
> >       switch (event) {
> >       case I2C_SLAVE_WRITE_RECEIVED:
> > +             if (eeprom->latch) {
> > +                     spin_lock(&eeprom->buffer_lock);
> > +                     memcpy(eeprom->buffer_latch, eeprom->buffer, eepr=
om->bin.size);
> > +                     spin_unlock(&eeprom->buffer_lock);
> > +             }
>
> ... what advantage brings you this memcpy of the buffer to a latch after
> every single byte is received?

If you agree that the scenario I described earlier is a valid case
worth considering,
I make a copy of the buffer at the beginning of a write operation,
and then use this latched buffer for all subsequent reads until the
STOP condition.

Sorry, I think I placed the copy logic in the wrong spot earlier.
Perhaps it would be more appropriate to do it in the
I2C_SLAVE_WRITE_REQUESTED callback.

>
> > +     if (of_property_read_bool(client->adapter->dev.of_node, "use-latc=
h")) {
>
> If there really is a problem, we don't need a binding for it but should
> use the fix in all cases.
>
i got it, thanks.

