Return-Path: <linux-i2c+bounces-9505-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72918A3D123
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 07:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 403193B2636
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 06:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DF11DED4A;
	Thu, 20 Feb 2025 06:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaBJ7CD7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CD91BE86E;
	Thu, 20 Feb 2025 06:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740031780; cv=none; b=EvEcpJgR05lHboFn1xQunDBd5Pmff5UN6PALU/g4bopbXyPsj65i6CMHtb7rB6woLLLYwpkCYTr/ua+lG4S3MsF7lK/67ZWBkhfXUjDVv/sw57++3+vVLNGL+oi0FO42YSTHJbXpxyHRzQpcaewrQ2nU78laLzApIpeAO9U7kZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740031780; c=relaxed/simple;
	bh=b9VYrcbgqOGdxlSddTg6C5EhWY3CuqOrBQ5Nh78hX3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nA2KXHYYWFCAsMtNnKEig9lSIPW/bGEjGb7zyhhtI0PgmCc/wk+E46VP+4qXrTwFw9R/594RxlV3viIoShcnsQ3Aii+8KHlpyh5hd8ZWGWY9QpGgjDVDfOjtGgroS2h0nSOlRvrhTpdh/KOqASj11CexAOvMTiXcN3QatthQn/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaBJ7CD7; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f6715734d9so4922357b3.3;
        Wed, 19 Feb 2025 22:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740031777; x=1740636577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YB+a5+t2K2SUKgQ/pKHmjYGw9OX5zZSaPIGBlRUmprQ=;
        b=ZaBJ7CD75svkp2e3dr1fGYqQArF3N7/lrp9YKLoIprpFo2rzfUQT3H5jiiOMh06NrG
         zMXwogYP2QfA7zqZ98CfRJ9yEq9oMUVzRDyqFUPLYset/SAbvPN/l1Z1kjiAHFUxIiLz
         03eTPRBIwyI/UMxn6VOvaHEHyzq9xrHL8CGg1OPhZDNKtmUWR0fh7jpqAnsH/mCzeahY
         Xi4y7/U+U6aOglFuvaLXvIQBaAanTCn8FekDynYLg9QW80gL9Err/BrEPFUJ1/gJmI3G
         fY0OVjEAcqDWoIBjGZTuZXYBSi42ZOxUKdVhu3SoGcsTPHWzgIFaTd1KpfnYy5aG6Gmo
         lBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740031777; x=1740636577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YB+a5+t2K2SUKgQ/pKHmjYGw9OX5zZSaPIGBlRUmprQ=;
        b=hBNIz21tPhGgvRVmTs0B5kP0urq9rYimLDUyajComTwb95lHkijBKe05q+0foyj5iW
         X6OcAT0SIlGDFarspcdRiMHvCwEwTIOU9pwE2Nil2o5bzDKIuAn/3K/2q4zsAs5UtTmV
         zVjXI/HwWBTCFe8IeYtJZRZhThjSEcGDNoYNu9bGu2E5UE++oDT2ta7rZSQHcDRMSTkF
         SJbAWITxSBDUOtKs98v/DjnFeCsBVoZYxSvd65WJ/26ye7rQfwq6MUFdCASQ5xv2+3T2
         DBJG9VwzKWekMhJ39G9trSTrVQFoHTLZ9jsbjF4mT6PCnIdApLwz8Y2lIrRpMzog/ZVF
         rCjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6kZ6Gof08u5Rm/dFZ7CnEWo4HjMZRvUfsUEzLyLjDMODbMNzAA97IYp2FuJBkHQ7yeKAPHmJDHEg=@vger.kernel.org, AJvYcCVTwD0Srf7ZjkNH+5zWguCIKCSwDW09IunR8Yk3cPpAkoGqy0GRVc8+sMZ+irzYKttviHJMBTsRiwxXS/vX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7A1cjg4STDb6aYxHZ4Dl8BkLb0yBo5UmJcm5IOMmMmpSymT94
	79niP9UWqWxKB84DGDdQtko94Zf4mIRt62QIOwyABtaRTnvs3Zq4MNsS7UdjMeLjKlXj4LoxmXD
	FsFztjNUgh6d+kz9buIEw/sCwMdU4KLdtMFE=
X-Gm-Gg: ASbGncvcpUtJlHeUgScDeKOt1d6LPgB+PjOow+ftBICn/ue4BWdgAkw6c9BQ1DYo+b2
	b4Xttg2KQ/WR5BdvR+t0wU7QIiyk/HB8jXHghSn3uJ/HfTcH+tJM81mFEs6vyS+ofz+23N6h8Xg
	==
X-Google-Smtp-Source: AGHT+IGAElPuWbcNKI929Lc7rJthMUbISUeHmF4ulGnrR57bxWEQfnU1NRee+Js+2fQ0Mu97EdPqEhBqZsXJ3FHbtn4=
X-Received: by 2002:a05:690c:d94:b0:6fb:1e5a:fcdd with SMTP id
 00721157ae682-6fb582b87a1mr196021137b3.17.1740031777627; Wed, 19 Feb 2025
 22:09:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220040029.27596-1-kfting@nuvoton.com>
In-Reply-To: <20250220040029.27596-1-kfting@nuvoton.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Thu, 20 Feb 2025 08:09:26 +0200
X-Gm-Features: AWEUYZnYGHaHjbR_KZEvGNt2rnhpAOwHjPZjRosnVh2OXcXgXdeqwQTPA_jCG9Y
Message-ID: <CAHb3i=t0sqAi3ufXf7KAhz0B_u9JpsXmKy8p19aV7qQ5z7G4LA@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] i2c: npcm: Bug fixes remaining interrupts
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, andi.shyti@kernel.org, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patch!

Reviewed-by: Tali Perry <tali.perry1@gmail.com>


On Thu, Feb 20, 2025 at 6:00=E2=80=AFAM Tyrone Ting <warp5tw@gmail.com> wro=
te:
>
> This patchset includes the following fix:
>
> - Disable the interrupt enable bit to handle the asynchronous smbus/i2c
>   interrupt status after the machine reboots as the interrupts were not
>   handled in the smbus/i2c transfer session due to the reboot.
>
> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.
>
> Tyrone Ting (1):
>   i2c: npcm: disable interrupt enable bit before devm_request_irq
>
>  drivers/i2c/busses/i2c-npcm7xx.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
>
> base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
> --
> 2.34.1
>

