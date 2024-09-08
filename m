Return-Path: <linux-i2c+bounces-6357-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB149706C6
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 12:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A378281FAC
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 10:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518931531C2;
	Sun,  8 Sep 2024 10:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2QHiaLl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CDE4B5AE;
	Sun,  8 Sep 2024 10:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725793124; cv=none; b=TEvdYv4XlO9R1UDtrP6ecqjvjBP90LIDTp/2nqCxXCjKCk7n6/yt9WK9FOinOm/UkQlDa47WYgIuxnVnMz61+iUAW1kVzbBCEpGgL8DASdKJd6sFwh7S3lZOgBH4pbQu74k4YoWunTRMRTGAMILD95EqOQpDpkxaYKLZ+KHhjNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725793124; c=relaxed/simple;
	bh=K/6mlzVzop0ReaWhpJex3yfaSrj4OKc2vPe05yd8ngo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aAJIZrFD3BKy62nS5EBkEf4khpaNiFTmM7Y2L8ZO5mg+LxxEcmKJng32m6AkmfibtxNvcoDfCUTS1iOZYYyDhMCQ4Huv6onz99HEkiCoHi2bnDeoi4m0iJVffzKU8pGBMMN5YhaVxK5lEpFrdcOZcH2XUF14qNVzcb/GorizX5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2QHiaLl; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c3c30e6649so4194586a12.2;
        Sun, 08 Sep 2024 03:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725793121; x=1726397921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7fqY6U/cxvjBE+lCHhb79+U+IBZZTdEO1cL6Ww0FMI=;
        b=C2QHiaLlqOpwg0B8hvjCtthtaqMt9ZQ4sL92Aj6hEmKTAbyBr1teq+Us8eEN3x1EXR
         XwVdZVcryrs/2zks71AN1HaNNrtcddrHaB7JaVqyjp3GxOviRwwQdBYiPRgn2CgAu4jq
         mswN6fBI780QOAqx3h1uGJEJfN+1uy35Ny4yjAK80enfaEoBAiPg36VjXrwPL2Ek0X09
         rBlR/rp4xuvKi7S+yIrh9Dv0X+dltdaJHWEnuheLrDa4osqV2YELZkcqOpCZc6CaYxYT
         Mg/xDrCIhaj2tIZbaO7O/yhyXety8ijf3WmcTpsdUqEYVbHkWFvrA0fMRo99oiZ4VDEc
         xThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725793121; x=1726397921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7fqY6U/cxvjBE+lCHhb79+U+IBZZTdEO1cL6Ww0FMI=;
        b=jkDZph2vqgtijKLNCci+1ZSyDZaGcRP8flV2nvtf82N1y7S4RS2v7XUCNiEqx4S5uy
         YiCpG8NarVkidHyHGLgRi3KB5LEzqth2ck33EEzRa4trGryEjweijAUAX31qAxwvBRN6
         CFE3fGRps2YgfPCF86m9GvfujG+iPNE+z5FTiQoDYZqcXRjv8zaYUlhxVYqImLK0bkUG
         MBnCyRk2UDb2JiJtm2W61KTJhD1Pfe860wCfcLmQvF6A9Ar0jlZO1wpNvuYjASnodKwE
         +wwVCW8aGmkWXKu8mVv6C2IM0aBmtz4ZwpGS6hGhhVFZor/28IKyNkWzQ2lqjV70q6M5
         Wd/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoGazKvj9gpbGewC6Wkz7kYLM52fB0wtGZifoWeeg9GEknXGkNztl5+ZjseexELy7W4fZPX4E/rbk=@vger.kernel.org, AJvYcCWgZ5nxaYugTyn+UpXuGqx+udDfs63JUKGQI2Fr2rh4VTFSmY3C16Mt5BnJZNN9IE/wODXNEkfNCHPR7w05@vger.kernel.org
X-Gm-Message-State: AOJu0YxvLm0yKwjcWIE5P+lXLQB7jvHozZxLtf5pyZVFadWunpf5wyjT
	mbpWyiQPZRdNVyDjQzr1k7Qly6Z/Hnl7OT8boPX485Q25kMckWxDlmo1U5/H9O1RebCUgJaI6RB
	tFU004p+koTVdNi/yVPGM0TrRvoPyvonNoC8=
X-Google-Smtp-Source: AGHT+IEZR3MHhdgXo7TUrROfd6+7Y0uP1oucdSzBfzf0VIGBOcB42Mz+Nh2eAOCNe7YZNFcBag+BYm/nI04DNY+iS8o=
X-Received: by 2002:a05:6402:50c6:b0:5c0:9fca:9352 with SMTP id
 4fb4d7f45d1cf-5c3dc7e4a2cmr3709906a12.36.1725793120594; Sun, 08 Sep 2024
 03:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com>
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Sun, 8 Sep 2024 13:58:29 +0300
Message-ID: <CAHb3i=tt8hy==3BftYNGjgG_4MNLtRzQ64eyR7Qxw7jtg3aiRA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] i2c: npcm: Bug fixes read/write operation, checkpatch
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, andi.shyti@kernel.org, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Tali Perry <tali.perry1@gmail.com>

On Fri, Aug 30, 2024 at 6:48=E2=80=AFAM Tyrone Ting <warp5tw@gmail.com> wro=
te:
>
> This patchset includes the following fixes:
>
> - Restore the npcm_i2caddr array length to fix the smatch warning.
> - Enable the target functionality in the interrupt handling routine
>   when the i2c transfer is about to finish.
> - Correct the read/write operation procedure.
> - Introduce a software flag to handle the bus error (BER) condition
>   which is not caused by the i2c transfer.
> - Modify timeout calculation.
> - Assign the client address earlier logically.
> - Use an i2c frequency table for the frequency parameters assignment.
> - Coding style fix.
>
> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.
>
> Addressed comments from:
> - kernel test robot : https://lore.kernel.org/oe-kbuild-all/
>   202408080319.de2B6PgU-lkp@intel.com/
> - Dan Carpenter : https://lore.kernel.org/all/202408130818
>   .FgDP5uNm-lkp@intel.com/
> - Andrew Jeffery : https://lore.kernel.org/lkml/
>   20240807100244.16872-7-kfting@nuvoton.com/T/
>   #m3ed3351bf59675bfe0de89c75aae1fb26cad5567
>
> Changes since version 1:
> - Restore the npcm_i2caddr array length to fix the smatch warning.
> - Remove unused variables.
> - Handle the condition where scl_table_cnt reaches to the maximum value.
> - Fix the checkpatch warning.
>
> Charles Boyer (1):
>   i2c: npcm: Enable slave in eob interrupt
>
> Tyrone Ting (6):
>   i2c: npcm: restore slave addresses array length
>   i2c: npcm: correct the read/write operation procedure
>   i2c: npcm: use a software flag to indicate a BER condition
>   i2c: npcm: Modify timeout evaluation mechanism
>   i2c: npcm: Modify the client address assignment
>   i2c: npcm: use i2c frequency table
>
>  drivers/i2c/busses/i2c-npcm7xx.c | 276 +++++++++++++++++++------------
>  1 file changed, 172 insertions(+), 104 deletions(-)
>
>
> base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
> --
> 2.34.1
>

