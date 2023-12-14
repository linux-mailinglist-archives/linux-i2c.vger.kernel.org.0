Return-Path: <linux-i2c+bounces-801-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 398CA81349B
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 16:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C6231C21219
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 15:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A8C5C912;
	Thu, 14 Dec 2023 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HaYtexrN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1B912C
	for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 07:22:51 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-28ae5fbde22so926875a91.1
        for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 07:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702567371; x=1703172171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcT2Jb1TBj0DcJUl7sM6tUpyzWt4ekggVFEBQkp4qCE=;
        b=HaYtexrNJbGiaDO9zlSIZeh6h74aZvIK+U9xf0Sq+Oep5wgHxBwC4U1we8x5XwUSwY
         Qz0lrqTmLMzoysyXFxkgFuopeliNDMjhoHD7oBhp1gXLKGJ4hV6dQ1soFe50iQhiD/GV
         mDr+C+F77vJPUoI8JGTF/MhlRUVQ6Ff/uwnwkDPdBxmtu5+k/v8M8ock2LiXp24ESrtW
         1bizF1Qjh5sFA+Wc2LK5Zf9NDwDJc/oMq/YRVFfMWSJqJMp/w5YQX5ekj55+IYIDegXN
         j7JDU+ey9gOZw/jF1/SOVJL5MoNvupR4gBy0W8/8TG6FsVJQx++7GnHWAT6cMEtVd7Cy
         C4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702567371; x=1703172171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcT2Jb1TBj0DcJUl7sM6tUpyzWt4ekggVFEBQkp4qCE=;
        b=sPDRZP8a9pem5gTTnarbnwjhLcd0Nj1EmW2xS7a+Y+qqar42X4KY5BUQy6R1wa+x3l
         /fkqOUPfc/73Ax3LqU2wLw512lN8EuSe/T21OgGWHZPL3HQs29VtV5rwarNBqGhQDB+J
         yuJJ47ynkoUGksO45ahL334p9rmuoI1gqk9hyKpcchhrR0Bv32HQ37RHna3HztKIFOmt
         h1eiwSWWKP5eMmwv6LImufnwQ07Qbetth3XtJ8NtleK1k5YAZCLKEbdRj/v3QPtFcBYB
         X+bW/kVYHXh9LTGCWlsup+NGevrrG4ApdmU1MUPwtPJGl+CPsoa+Ovm5383rKAB8pmBb
         gVqw==
X-Gm-Message-State: AOJu0Yxew8Qlz7PqDOE6yD/5qsdP3C0IhcqpIH/TgpC5UUFis78okazw
	ot4Fi00PeyVn1ebwWFkjzDpJ77yt5+SRIIL29S6MSw==
X-Google-Smtp-Source: AGHT+IGg/odB2Osxk9lczN4UnKuRrAxLwMC4GTU+Il1sBDYBfVUA0edf/1fZr1ZpXwv3dxbCvs+tLYcBum3fRFhMJHU=
X-Received: by 2002:a17:90a:590e:b0:286:55f1:5257 with SMTP id
 k14-20020a17090a590e00b0028655f15257mr4847377pji.17.1702567371411; Thu, 14
 Dec 2023 07:22:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-2-tudor.ambarus@linaro.org> <CAPLW+4kr=aVjuqGz3ps5f6EzM+QASTFEoB57g+fR7jKH0s+1Zw@mail.gmail.com>
 <0d3ae184-5ded-42ab-97cf-13bbb296083a@linaro.org>
In-Reply-To: <0d3ae184-5ded-42ab-97cf-13bbb296083a@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 14 Dec 2023 09:22:40 -0600
Message-ID: <CAPLW+4mpV0cy32MPS72-z=WYTZusnS7uTO7fbmOruVjAvcoBeA@mail.gmail.com>
Subject: Re: [PATCH 01/13] dt-bindings: clock: google,gs101: fix CMU_TOP gate
 clock names
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	conor+dt@kernel.org, andi.shyti@kernel.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, arnd@arndb.de, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 9:16=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
>
>
> On 12/14/23 15:07, Sam Protsenko wrote:
> > On Thu, Dec 14, 2023 at 4:52=E2=80=AFAM Tudor Ambarus <tudor.ambarus@li=
naro.org> wrote:
> >>
> >> The gs101 clock names are derived from the clock register names under
> >> some certain rules. In particular, for the gate clocks the following i=
s
> >> documented and expected in the gs101 clock driver:
> >>
> >>   Replace CLK_CON_GAT_CLKCMU      with CLK_GOUT_CMU and gout_cmu
> >>   Replace CLK_CON_GAT_GATE_CLKCMU with CLK_GOUT_CMU and gout_cmu
> >>
> >>   For gates remove _UID _BLK _IPCLKPORT and _RSTNSYNC
> >>
> >
> > Doesn't it break existing gs101 device tree?
>
> No, compilation went fine at this point. The TOP gates are not used in
> the device tree at this point. And since the bindings patch was just
> applied I think we should fix it, so that we avoid name clashes as
> described below (I found a clash with a gate from PERIC0).
>

Ok, in that case feel free to add:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> >
> >> The CMU TOP gate clock names missed to include the required "CMU"
> >> differentiator which will cause name collisions with the gate clock na=
mes
> >> of other clock units. Fix the TOP gate clock names and include "CMU" i=
n
> >> their name.
> >>
> >> Fixes: 0a910f160638 ("dt-bindings: clock: Add Google gs101 clock manag=
ement unit bindings")
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> >> ---
> >
> > (snip)
>
> Thanks for the review!
> ta

