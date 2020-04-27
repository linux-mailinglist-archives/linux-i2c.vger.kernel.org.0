Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C511BA80C
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 17:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgD0Pct (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 11:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727006AbgD0Pcs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 11:32:48 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97EC4C0610D5;
        Mon, 27 Apr 2020 08:32:48 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id d15so19459807wrx.3;
        Mon, 27 Apr 2020 08:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZIzsuUvV9z6GQyEY98USPySleDZj/xVpKFSZ8UafJXM=;
        b=fFXg0qpTLvU2IlHUyZVdIyF6/vGhim1diEKxwM2qtoOFiK2BtG/i7z1noQRnJaCXvO
         y7DKSCU6LjMNQMTadTjDIUwensi4FJjp35K6rq7BdKPxHTIgjP68YTUNMDxK+ESIZWsD
         X5LCpLmjvuMiApnfMLDR2yXnLwyYyhvrF8wGoM0n06xotbrDc8FEYIo1eqL8umbP+4F8
         RG2ZVrud7aXQS7SAmFkS4sys32lWdvnBynNshDqaRgrGPdl1tWzRu/bPngFv3c2rGFO4
         YGFXGKTA/CnUNJb8tpbohnhmsVSH5GoUo8Avn1ts4bgRUg/pRNN+pOP+2Z4ivxXIhHph
         2CEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZIzsuUvV9z6GQyEY98USPySleDZj/xVpKFSZ8UafJXM=;
        b=lqXVg7lH0v7ug0VMjvjSNnnoYKuVJobrPnkY73oNzwYeOsQckrSrlilTVJjAIj0FS8
         sEu/GeaDqfOH1fsuqlzz8FyIQX+d4hB34FeU1bYhx9HIO70iaaqc4fHXRDOFH8qw20P9
         amK41lwah/IS9Kn6Rpad4NuwGy5XuDUVyFgOo4NS5ViiQeAqw423NKZ9jfOgslPdB3Wo
         iQrv04vV04V3AsYPnY0WmqaESb7LwcOD53b4/QAl9i/fUctc0WgIGYG3oxFuIUfIXuY9
         tsxk+/Z3v0dmpXAizAUWoxfBJ0Ft+5nZQrsJCojOn1dNTH+1qLPHpY2r14vS7MqU5X/G
         dSZA==
X-Gm-Message-State: AGi0PubkSxA7L8SCKDI+j7C1hj5LQUYIjVTe4m3jNrIssFBMtGOLltnE
        1JXWAmz5JsLNKmSGMaNoUe2KyFDW
X-Google-Smtp-Source: APiQypKRH9R184BRYnJmesVMLKhNVqvYu6mnpCSX6Qy7Ob0arcGNZbYpOe5Dcp5JaawT49T6BYpqqw==
X-Received: by 2002:adf:e4d0:: with SMTP id v16mr26713589wrm.192.1588001567360;
        Mon, 27 Apr 2020 08:32:47 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id h3sm21178889wrm.73.2020.04.27.08.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 08:32:45 -0700 (PDT)
Date:   Mon, 27 Apr 2020 17:32:44 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Message-ID: <20200427153244.GF3464906@ulmo>
References: <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <20200427084424.GA28817@kunai>
 <820200ce-17f3-18c0-6f79-3e582f45492d@gmail.com>
 <20200427103553.GA24446@kunai>
 <20200427105029.GB3464906@ulmo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Y/WcH0a6A93yCHGr"
Content-Disposition: inline
In-Reply-To: <20200427105029.GB3464906@ulmo>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Y/WcH0a6A93yCHGr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 12:50:29PM +0200, Thierry Reding wrote:
> On Mon, Apr 27, 2020 at 12:35:53PM +0200, Wolfram Sang wrote:
> > On Mon, Apr 27, 2020 at 12:07:19PM +0300, Dmitry Osipenko wrote:
> > > 27.04.2020 11:44, Wolfram Sang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > >=20
> > > >> Wolfram, can you revert the following two patches for v5.7, please?
> > > >>
> > > >> 	8814044fe0fa i2c: tegra: Synchronize DMA before termination
> > >=20
> > > This patch has nothing to do with your trouble, why do you want to
> > > revert it?
> >=20
> > I'll wait some more before pushing out, so you can discuss it.
>=20
> Okay, let me run a quick test with that second patch still applied to
> make sure it really is harmless.

Alright, I tested v5.7-rc3 with this patch reverted:

	a900aeac2537 i2c: tegra: Better handle case where CPU0 is busy for a long =
time

and the results came back positive, so I think we can leave patch:

	8814044fe0fa i2c: tegra: Synchronize DMA before termination

in. But then again, I see that Dmitry posted this yesterday:

	https://lkml.org/lkml/2020/4/26/481

which seems like it would be related to this and potentially be a
follow-up fix for some corner cases? So I'm not sure how well this whole
set has been tested yet.

Maybe a better solution would be for the DMA synchronization patch to go
into the 5.8 queue instead to make sure we get more testing cycles.

Thierry

--Y/WcH0a6A93yCHGr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6m+xoACgkQ3SOs138+
s6E5gQ/+P87EF76Ek/gB3avyIodTtpcN7etsoM8oJNJWlmxgooiyhvZEaK6dBO+n
6bwBtehuMfy3b0KW1AjyMsijY4Tf56/COp2fP2rSEMB0IqCPSygjX4w5qmZCVneo
PiM5xCng+BjIu+P+yDiuDJ0w8DZ9IzCdBHuQsY+JIpFQdFZZ9zGO1bgw+rEytVUV
Z8Hcg4/D3dN6FBRFPOPY3riOmi0HCdT9vvV3BRaqQ3fkVLFfgZ/Ve65quPpS+k0t
ewnd8HUMTaP/KrCPU/85PvBmu6PSZ58qZXwVV+M3v1+x8lhdLPZHGsAMcJXXDP1l
okLYy+aFm6gx3+egIhkKNDbEn//RrrgsE1VqGHVwb8ECwL/kII+/bS1v3j7snz7A
e54Y0Er6D52SR8M+8oOGzSRueT/yuLNpx7h+++t72TGZpcvTGNR5KAp+NuIBeArg
ybEEK/IpaLE7DUXZfqZoe/ujdj7ZMPuEPW/pxq5Xl1+XrKkJe7NyWedfdOxvXOpc
AXqLcqSi8c+aKCx8Zoe/mh2klBRCShyYsBOCDiFklwM3lonSgBVIf4xW1bg1n10c
Fw8jeSylwPg+4/lUH3oiIn48fOJtt6yooKbUvBGJ0qaspVEdvMeTKDgEmzoztCBz
rzXVR3x6cdnAO4yIO3Gq3PxL/FR9rYjbZr0p/SwBlGF3KsqW+KA=
=8yDJ
-----END PGP SIGNATURE-----

--Y/WcH0a6A93yCHGr--
