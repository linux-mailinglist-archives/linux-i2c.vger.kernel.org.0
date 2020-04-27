Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A131BA1D4
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 13:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgD0LAi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 07:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726700AbgD0LAh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 07:00:37 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5DEC0610D5;
        Mon, 27 Apr 2020 04:00:37 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j2so20013264wrs.9;
        Mon, 27 Apr 2020 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wDGYvSoUtWFCiB9f3JUcCvPqOGXmkZsIrQjt5HrnGos=;
        b=EuBMiAZvu4ghhUPR13OZX7veD1udkneRiqv1UF3fh7ByRMgGw2ddV+suF0fruNc5Ok
         QYPgDSM8BICnAd7TABQn5b7SqgG8goP9LImBRL0X922f5BXkHgm7eWUDk2nD2VSdo70b
         w2H4mdwDqQiDGdYMdqLq5YdrQsrXxbHBAi6MscQD7R31Wpopo6Zibs9AZhhXJtBiCs4T
         kswk+oF7lGwPaxqRCA1UXmg9/AUfwZ8EhKnSgotBBy4QItP9IZLS9GM/1RzwKs285DS8
         3UFXtQHQrAKO9BQ/cdUXvRDtS7VDL2m6xn+VkUSHtU7ToVyIAY6YRvNnEk1RsMUpVMl2
         Hx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wDGYvSoUtWFCiB9f3JUcCvPqOGXmkZsIrQjt5HrnGos=;
        b=DqIUv8RAAYruMMf2gxoYGKxCwaLZOJN/5WmKloTby/MGcObmPrdJA1niPB6bu0SiQn
         jXAPIz/Gy7FV1KiHMznpN6NYb9IpJDwzWeW7NXZ4Azk16pGCPD69zLfDmLAj/cp9ZNf/
         vbuPEo1ugZHhnwDCP7Yq8LzWDJnhR/+IQgkCQswS1aVwSV0BQuDuQYXT5T1V70ZE5aFp
         AJE2GNfd8e9J+bNbHcWVUMT/tXSPHYuKFIPh66BgAXtOaZ7kljaWUn0d3z7+Cr3eqPna
         KkMzXZiP3db+HscrEjvQtfG+NsOQ+1Q9+5rgjMWs1qUarGRNYxXBS3EN0suaDrOETCCd
         5lOA==
X-Gm-Message-State: AGi0PuaI6SLyVIka+MmgY/2ypnZed+cAVuEOzbQdMbndHX559NtoSF25
        rYrZ735SXHBu4jjCu+HQsqw=
X-Google-Smtp-Source: APiQypKLTGlMkyzyNm1oCRgxnUlkYlWbRZcOtewRjGQ7tA6PTzNS+l3A1g3PlVsB1E3DQnRXkF+Mqg==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr26110798wrw.353.1587985236176;
        Mon, 27 Apr 2020 04:00:36 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id y63sm15794861wmg.21.2020.04.27.04.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 04:00:34 -0700 (PDT)
Date:   Mon, 27 Apr 2020 13:00:33 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Message-ID: <20200427110033.GC3464906@ulmo>
References: <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Content-Disposition: inline
In-Reply-To: <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--m51xatjYGsM+13rf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
> 27.04.2020 10:48, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> Maybe but all these other problems appear to have existed for sometime
> >> now. We need to fix all, but for the moment we need to figure out what=
's
> >> best for v5.7.
> >=20
> > To me it doesn't sound like we have a good handle on what exactly is
> > going on here and we're mostly just poking around.
> >=20
> > And even if things weren't working quite properly before, it sounds to
> > me like this patch actually made things worse.
>=20
> There is a plenty of time to work on the proper fix now. To me it sounds
> like you're giving up on fixing the root of the problem, sorry.

We're at -rc3 now and I haven't seen any promising progress in the last
week. All the while suspend/resume is now broken on at least one board
and that may end up hiding any other issues that could creep in in the
meantime.

Furthermore we seem to have a preexisting issue that may very well
interfere with this patch, so I think the cautious thing is to revert
for now and then fix the original issue first. We can always come back
to this once everything is back to normal.

Also, people are now looking at backporting this to v5.6. Unless we
revert this from v5.7 it may get picked up for backports to other
kernels and then I have to notify stable kernel maintainers that they
shouldn't and they have to back things out again. That's going to cause
a lot of wasted time for a lot of people.

So, sorry, I disagree. I don't think we have "plenty of time".

Thierry

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6mu08ACgkQ3SOs138+
s6GkNQ/+MM+0bsgj+vHl+YaAN2lhG38F1/Aeh44skTQX8cmsPvvL03ucTRBOf3wW
TjMvlg4+8pFnBfUFEm6YfhBayoh4pemFZUyKjMiqrNExB3W2h+IPaixKQwRM5SPs
V6JpfP5Gc0Esye8UPKq7p8LUTFPRhlFfTzb3E9YcaWjW4cQu9Uv2BjfECQuSwkpa
dyTA7nuxuZzWk9vqNG8SDAb5yjXo5yZn5XxTKn0NoQSQkHGV0LLTO0xrhU7UIhah
oGT0bywp6iwncSYkHyKE0mgM1tLK3LUVyfjgXtwj9WK77VVrxkIeGPPRoG0z0GWj
NhoywNPnO8GCwpMpnJ+rY/YQPGbmIvxtxQ3WyydiWVpmV89+91Fo+bJa0hYTServ
tNlE2UoaZc43AvNkgpj6832xT4AjIWEF6HomFrr90qDhN/TIojUJYtyxEm1uh0UO
h78qHYBRqo+6WV+Txladbr2USeO2bMRNwYkohHawMIfTyGgPaZTlmR8a/tuVIyFe
Iz8DpUPs1yNKO0mbAGJ8yOaQs8QuJVoqQiWRMjedcyIqUASRQOVkjymqVrv8JZou
W9lgTK12eRxP47VyFtIY+sr4pT1g3Tx+eScMfZJb8SMw+/94q2F9keKuy7C2anM0
qfA8QFlxh9X71T+zlxeoWVrc5/LOmR+u0BJe/vLj4ix9FRGYVmg=
=IL/X
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--
