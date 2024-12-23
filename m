Return-Path: <linux-i2c+bounces-8697-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3628E9FAA80
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Dec 2024 07:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80DBF1885FF6
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Dec 2024 06:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2757718C03D;
	Mon, 23 Dec 2024 06:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9SmRqz6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8CF18C002;
	Mon, 23 Dec 2024 06:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734935757; cv=none; b=RZNeODO/uu32EwdxMssejeLt+d0wRos51vI8HPoFWkjGv+l4ePY5AJdvborkHLzIPyIOryC18T7STAwtGEHlXJ1RWjxGm0JJp5TBsVoiZL76TbSgW7bTb6g2Wty7zmra1C/2vaDw7Islk1NI78P3qBCr+PhyZye3Uw0gaG03lTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734935757; c=relaxed/simple;
	bh=TY4H742bHom40kaEg/lqgfy5Dz45WYUVuUAY4LzvzlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=l01U0ZAoTILiiZUZI6bGDO3PeMedyS2RLBWVQt8Z3WrxTRWDLntFy/D6/XEzG9UVhAZ5rX+GaWVm0vqCjpiJzCQpGWHYpNB8xQrPm4m05gjsCtNWa2EKHl/1dFRQreJr1q07SaTxLPWpELJT0y3Rt/Tuf3YkzNBHbIigEsDrbNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9SmRqz6; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51889930cb1so1086422e0c.0;
        Sun, 22 Dec 2024 22:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734935755; x=1735540555; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY4H742bHom40kaEg/lqgfy5Dz45WYUVuUAY4LzvzlQ=;
        b=X9SmRqz6XoRBdMwwM9U2/gvCVeyENI/NTqvYJqmUkXzrIG90CkQTGG6NLzmPSolGEn
         Zcw+Edr/48IW77fLDpbl4nxATPtSJYoJW6BmTjAb4vn+wFcfWhRvOiSheIHkt/eIgCXV
         zazco8aknmtDj0IFA+sGfovN41MCzgJso5pEMwI+oRciQOK0xaAT/xSzCRTdgHalwKU0
         QuOEAyka8XpqsTK1WTAAXnIQmKpHIc3PsgJHnvxQNYRvZjaCoCZqPoIKGQ4oV2Xd1eRa
         3R587rXuia8KfOfotMDaliTUSAr2teVkjq1yYA8WDa9QCge9ugso23gufr2ZiH8R5dL7
         IdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734935755; x=1735540555;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TY4H742bHom40kaEg/lqgfy5Dz45WYUVuUAY4LzvzlQ=;
        b=fEyb1Yq+dqA9lOd/zKxge560MmMPY/H95tXDHCn/k1feUwFVMOsHBq+uBOR18rqTY5
         XWxyKpA8RZwTeSXj39bW8kD4M5vZvDwL4lyLoRD+AFpFMUkBVQX7iiHf0nvCRJSl2yfx
         zxyzYXCFK22xEWWf0hvIaQU58rcXUol9CFcgFuaRGmqQD1eqY6Ne4ni++6RW2mD3jeHu
         cxAGhzZnKiGHbQ5uvnEobp+C3UKv/M0ONpws9bbyR0JwUl3QuNBk/Uhw6I9ipE4Vmz2A
         JIfC5KCRU0URYRqkJOfQbnjlajx9xz8sOtQgAJljmjAgApGYMTx0RmJQxirLFxBmkw0J
         0gbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0S2sQTvNeZCPNiQAgZr7mBUXYQhWk7R5d9X8T9NP+EU8WiLCKtq5yR1pcxomvm06xmCKM8ykTqkSPsLO/@vger.kernel.org, AJvYcCXplINmsNUHSSmdr7a9OX5UQDxHApL4IyZeKedC4i4pOI19jweXV5fqOoB0pFSBFG504SK/v4+SXgw=@vger.kernel.org, AJvYcCXvrTobtb692bHZOGS+EUkDw6y9ehNEP+XX7pOeJAwMLDG0++4FmVqMtiqg5rWOMbA20Jtj46xRgN1dKhwuDWZyc0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLNk8Jh0FDIJVjYXui4tanln9PCgnmCDvzmOtVtG2XbGccCqtl
	F9bZlcN67IPKm/GaoYDrgG8fAI91o2QeTNQRAeTlFPYJc9VRAd/0gKS3g1S38sSIPPMI8cSt+5D
	X5f6EEmIHBbrhZvzR8/FoUWxeInk=
X-Gm-Gg: ASbGncsUO+f/r5NLlj4jLBTgNfzyE6k8ybfBioW+S1Kn6RU5Nk7O0jowD1y0ZI30lV8
	Mhl1Mmm4fEGcC6GbwgKjDsgjC6U0L3UX0bgYhza+lZtPRLiPFCEpjcrEC1jiHROnGNRBkC181
X-Google-Smtp-Source: AGHT+IHCCnQTCbMkG4Jn8B0kwRyw0CoibHYkuaUTNwHaiV7c1xG6JN7z8aynXlJ8/wgt+tfoy2gCupV4PjhDwrU9GL0=
X-Received: by 2002:a05:6122:4302:b0:515:c769:9d32 with SMTP id
 71dfb90a1353d-51b75c6f529mr9140807e0c.4.1734935754862; Sun, 22 Dec 2024
 22:35:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z2XewglpALJFE1Ay@ninjato> <CA+V-a8vB1c8Zp+zzoHp0zFpW8fjw-xq2=KPr=dyBUUZbOhBxJQ@mail.gmail.com>
 <Z2gJtlb5Sc9esEba@ninjato>
In-Reply-To: <Z2gJtlb5Sc9esEba@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 23 Dec 2024 06:35:28 +0000
Message-ID: <CA+V-a8s+tY6dnVHFhjyOZ43L+roLfqPr-_28FS1KyADwyTH2+w@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] i2c: riic: Implement bus recovery
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Wolfram Sang <wsa@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Sun, Dec 22, 2024 at 12:44=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > On the RZ/G2L and RZ/G3S there is a restriction for forcing the SDA/SCL=
 states:
> >
> > =E2=97=8F Write:
> > 0: Changes the RIICnSCL/RIICnSDA pin output to a low level.
> > 1: Changes the RIICnSCL/RIICnSDA pin in a high-impedance state.
> > (High level output is achieved through an external pull-up resistor.)
> >
> > So using the generic algorithm may be platform dependent as it would
> > only work on platforms which have external pull-up resistor on SDA/SCL
> > pins. So to overcome this and make recovery possible on the platforms
> > I choose the RIIC feature to output clock cycles as required.
>
> I would be super-surprised if this is really a restriction and not a
> very precise documentation. In other words, I am quite sure that there
> is no difference between the bit forcing SCL high (via high-impedance)
> and the internal RIIC handling when it needs SCL high. Most I2C busses
> are open-drain anyhow.
>
I had asked this previously to the HW engineers about the requirement
(as this restriction is not mentioned in the RZ/V2H(P) SoC, Ive seen
it for RZ/A series RZ/G2L family and RZ/G3S only) before the start of
the I2C recovery work but haven't got a response yet. Ive pinged them
again and I'll wait for their feedback.

Cheers,
Prabhakar

