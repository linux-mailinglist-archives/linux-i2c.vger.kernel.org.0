Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A7A1BA1AD
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 12:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgD0Kuf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 06:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726507AbgD0Kud (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 06:50:33 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D02C0610D6;
        Mon, 27 Apr 2020 03:50:32 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e26so19007830wmk.5;
        Mon, 27 Apr 2020 03:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=usvoDcQmOAQfSVCHZkaVpsS5uFVX3OgVFcU37tITmDU=;
        b=NkYnhxaEqBz0kuLI8UFoasBYsi3X5fu7TqTP6oou5tjAhgFfVQwbbxJ8cF9PzJ24Wp
         ngevZy52PSMUwshYEIVqoG7dw/Luk6rpiyw5/CYisM6co97UINwWjyfsaey9Cz1zvrpp
         ekGXAnNj8RpnwEREvzz260MNx0H8Lohc5BjLm18C5KQ0Yx+wakvB5EQ0pYA7rqi98j+X
         2lFk4aUM8hB99T5SrZU7rr741vjujrTZ1eoSvj8Mv8u5Iuz+vIgDDuKBpSrt9jEaG7mL
         xSZwY1VXTGBXLeAKNZQjm+qIs+lDZ7JQzq9MEqheJPdFh1ZTOqhAEyJnCZQNfIzJymV1
         MUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=usvoDcQmOAQfSVCHZkaVpsS5uFVX3OgVFcU37tITmDU=;
        b=mnsYaGCd0DOkEZ08p/dPrssES9Pmj8PcFvJ1voPzYMS4+gH8OTdIcfccrCBbx+EQoX
         lZuIVUxD56MJX+rj1YiZzGYmsWRzUxWvOS7292UX83sAh1hTRGTfRGXqGPV8x1D8343u
         GzvvqxQnFgHGCJ0qa6B2tB9rZPXMkcxBnwcG4bDKLkS5P6NXJnoYKDuhjkHsTue6ZWgW
         5J2h124e4uqr/FawZyguCQWAbeR5DoGwzkM1PCIehujMY+ZcmlxUziwPya8tm2mmSGkv
         2yf9A3Vu63pFiJVOoUeYPgOM9q/RLwfrFBrAeSB2q4jQT/QzBP1GfbyPvnOiHdIg32r+
         K2xQ==
X-Gm-Message-State: AGi0PuY5NgEaVG1Nb/xg3k21CpOk209fhLgzqBZDc6wqdD7P0+6FMhIN
        iOkJ8VecW6w8kWIploT3PYA=
X-Google-Smtp-Source: APiQypKBEJPhig0ZdzlTpmFNbyrFXFxDJfSJ0HQpzFOB2874Q6TduWtLpeS0K86eKEbwGPkjiGifVQ==
X-Received: by 2002:a1c:2002:: with SMTP id g2mr24635013wmg.109.1587984631690;
        Mon, 27 Apr 2020 03:50:31 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id l15sm14666438wmi.48.2020.04.27.03.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 03:50:30 -0700 (PDT)
Date:   Mon, 27 Apr 2020 12:50:29 +0200
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
Message-ID: <20200427105029.GB3464906@ulmo>
References: <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <20200427084424.GA28817@kunai>
 <820200ce-17f3-18c0-6f79-3e582f45492d@gmail.com>
 <20200427103553.GA24446@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline
In-Reply-To: <20200427103553.GA24446@kunai>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 12:35:53PM +0200, Wolfram Sang wrote:
> On Mon, Apr 27, 2020 at 12:07:19PM +0300, Dmitry Osipenko wrote:
> > 27.04.2020 11:44, Wolfram Sang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > >=20
> > >> Wolfram, can you revert the following two patches for v5.7, please?
> > >>
> > >> 	8814044fe0fa i2c: tegra: Synchronize DMA before termination
> >=20
> > This patch has nothing to do with your trouble, why do you want to
> > revert it?
>=20
> I'll wait some more before pushing out, so you can discuss it.

Okay, let me run a quick test with that second patch still applied to
make sure it really is harmless.

Thierry

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6muPUACgkQ3SOs138+
s6HeRA//R1ZgI3RIgFRMumlzLgXjk9E0ydZrGpjmIXD2Yq1hKWN7rDxl77D5X1z+
JemdX2sML4h6JIMiXGercu0mI5SrjO0LHh7L2AYITbdRtfHVjpK4ed96NewY9CNZ
ruYoVRDYIehUwq6jzX6aQmASBXnnrPiztYEMYqV/2SpTVLJDsAFBFcDI4VpaBpgm
Sy/tACPUi1JYn6zn5hu96sFqOEvG6BFRwYFVRqDFG8zNWS25YoogvgnKfbL4Yr+X
CGTw9+1iiMZ7YShdsOj9m/iQaCk8wPI4Nl10KzyEGQlsWDSfce/hcqtG6V0QZqnV
T0z8GdrKY/o6NqX+iHcEWCySq7aTtZQ42rYKU6zu2awHgxle0a/Y4O6uw+A0CIF8
eL3joxZcYWUG1Ns8mthGChimL8CVyioMrz7AoLyhcRv+nN6zHnAKi2ODqBFDe7HN
0UniHlFxJosmw5CE2KtSMzigrcDib6keHaqx7j3riafDORQchOeJh3QxmnhyaO1W
5KnB63lCx/sph1lPjgUuULp3lYQr8yJozcgTq3by5DvmEdnTNRHBo4FVI62uO2YR
KvURjkEhTn2OOcs+X6cRTI+mum3BlGHUGMF4vg0a8LVcYYZ1kH1lhDd9ZuhPZ9I4
CXPot1AVOsY9w//Nm5K4az98xyGkS3UbqL6SNu4psx8tMEFh6KI=
=dg8T
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
