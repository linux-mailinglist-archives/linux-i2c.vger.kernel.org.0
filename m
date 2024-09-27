Return-Path: <linux-i2c+bounces-7037-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F9A987CC7
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 03:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84BC31C229C1
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 01:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D116D1667F1;
	Fri, 27 Sep 2024 01:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHKUp61A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2018A139D04;
	Fri, 27 Sep 2024 01:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727402358; cv=none; b=SCYwS8D3kr+14Z/GUpiSJjthHH4gaNwN/1IGyQN7AjpCyvrM+Ws4qae9QGjzDl4kMfeLeT4ym/yZkFgDIRSeCsPLvL93Iz3No0Jc5ZE9f7VTxF3aEABTW9T0TKHHAZgwXMogUe2Af/w6lQjK9DntTdQeeMYjw/gS+iKqGfWIMFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727402358; c=relaxed/simple;
	bh=c5cR3Q8+qFlb50DTwf+gQ5cpJ9VTAnU8gdUxRmnDbYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S274rhc66Wo2OWMNx/GOom+YWJb75mPnKpHS1pTmisrxSW9+HFJ6N/2pQL8L7tqnlK8Pzec+dHitdPaIoTs9PvLIUMcZiOrYKEqPUUcy1AXW+NVPkS7RZRouTUIk8flC0O4/oyDnIEtAERyMI1IZLL8FrIILIDW+MLW9Ybj9N4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHKUp61A; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d0d0aea3cso218118366b.3;
        Thu, 26 Sep 2024 18:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727402355; x=1728007155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5cR3Q8+qFlb50DTwf+gQ5cpJ9VTAnU8gdUxRmnDbYM=;
        b=AHKUp61AJtMfruVZePyCsB1a0gkDZ4Nc+QLwXCYdLvtp5cAiS85+dchsNBto+bWTT0
         x/3IWivhWAsdwWOtL8OH57Vl9nn34Y66ahtiWBjhndjweWHiCWGy64lE1TCh8/maT6U7
         Vv/5bxNxRSTPMx3QoE/sn5IMyYAxa3XOj3FzAu3QNROSR8loL336jxl1PVwuapHLG6zV
         9jiimUT4zHeIFhytPR19Y030vvIhkrJ5zxhQGaXZesKI/Q0e/3kUJO2VVRk+cRGzea2r
         h6I4NprI145in4lQg2UgCNbtjHXbok88KgSNNfsxpsWGN5yfuG93eAiaeuXRtGNDIH4B
         mHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727402355; x=1728007155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5cR3Q8+qFlb50DTwf+gQ5cpJ9VTAnU8gdUxRmnDbYM=;
        b=vjnMpUchmq+5wDZOo6hYyJC1xNABqKHo8hL5qEtgwBr0CVd5hHBf7a/tz43ryLGbLX
         2ENzFcCvxZ/xffwh3uHHNVOvHtKhPkb/GGcnFy5VCwePRhVvXR/XCnuNvlyduZ0I/PuF
         OuIwmnIav+UH6UziGcEhmuyttzXYazAhqUbnSPgyuVi9wwuteDZJJIRfZJkOqdqqEsmq
         CYFAv3vRCUf+DQlnt8VJGtWGnNtM45lSQbeByZa/XfDfqGOm5CHPQ8GXN/TsbZ75gpMN
         1SkfEC5dQtqQAL/wrslQFMPAP6wxQ+LlTEN98zSYvSCcxbhfo4yEVH/hMSf1dZU/xiZC
         F4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUGQbq0gg/GsxigrG4EFlVrWOW5Z1shT8jHQV2vTbDArfb+Lgz7HGtQmX6H85GA8+SWOcy2MoFEm58=@vger.kernel.org, AJvYcCVVs7FIRh7pbBDAxCA69Q7LwDx91fpP0R1M01Pn3gRFDjL8myfhgm3bJSqeuDF8+pKZYyRU8Pi3iATNYKvZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyFOCZ3+7QPORVemmQB6rCZEKTEtX6ZBgHTlzTB8ZCwhe6st59V
	5zY8Zcnut8qLpn1DXKNlvF3u2RDCOnOyDLAb0NW8CenQHv0lFo6lN7qGqr+LxQWKjLoXyp17UNC
	/g9mpTvB62XfdvyPzTKK93D2/hPfcU8s=
X-Google-Smtp-Source: AGHT+IE+eDDaLETVOmmDQjeaQ6dwtiRqSGMOBSedce60yrewHjSxeDZdw+OY3ofOqrceL+QgiofjsTCuQYgh0var87Q=
X-Received: by 2002:a17:906:dac4:b0:a8d:51a7:d5e8 with SMTP id
 a640c23a62f3a-a93c4918365mr114251366b.15.1727402355429; Thu, 26 Sep 2024
 18:59:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920101820.44850-1-kfting@nuvoton.com> <20240920101820.44850-2-kfting@nuvoton.com>
 <rpu2o2vw6jqbuywabaxaqepathkqlzjzjvn7j6h5lq6zslitu4@icj5hpmwo6kr>
In-Reply-To: <rpu2o2vw6jqbuywabaxaqepathkqlzjzjvn7j6h5lq6zslitu4@icj5hpmwo6kr>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 27 Sep 2024 09:59:03 +0800
Message-ID: <CACD3sJYQeqo4+uvDYR7P14cC3R9_wHMDhzy6T4G9V018NmTMSg@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] i2c: npcm: correct the read/write operation procedure
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

Hi Andi:

Thank you for your help.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:19=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> On Fri, Sep 20, 2024 at 06:18:15PM GMT, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > From: Tyrone Ting <kfting@nuvoton.com>
>
> no worries, I can take care of this.
>
> > Originally the driver uses the XMIT bit in SMBnST register to decide
> > the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
> > write operation. If it's 0, then a read operation will be executed.
> >
> > In slave mode the XMIT bit can simply be used directly to set the state=
.
> > XMIT bit can be used as an indication to the current state of the state
> > machine during slave operation. (meaning XMIT =3D 1 during writing and
> > XMIT =3D 0 during reading).
> >
> > In master operation XMIT is valid only if there are no bus errors.
> > For example: in a multi master where the same module is switching from
> > master to slave at runtime, and there are collisions, the XMIT bit
> > cannot be trusted.
> >
> > However the maser already "knows" what the bus state is, so this bit
> > is not needed and the driver can just track what it is currently doing.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Tali Perry <tali.perry1@gmail.com>
>
> This patch is independent from the rest of the series, can I
> start takin this in and unburden you from this?
>

Sure, thank you again.

> Andi

Regards,
Tyrone

