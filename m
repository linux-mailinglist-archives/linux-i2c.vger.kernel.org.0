Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5421BA1A7
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 12:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgD0Ktq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 06:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726507AbgD0Ktp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 06:49:45 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240D6C0610D5;
        Mon, 27 Apr 2020 03:49:44 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id u127so19895569wmg.1;
        Mon, 27 Apr 2020 03:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ti6XX+QFzit0PUdlRv+q4FDbpNYXwxiJNOQSy8OVhSY=;
        b=Lgb2ZRSnwgcgdVrTP0vx1myxJSscHtMy8iNa5k7w+aqXFSSDYKnoG1GMGPy7gPJnYq
         2Vco6ldRfV8tB0aVDXH8VPUuyWOmkytgWKjngHAGy5bYV1TUPJD8g6JBO7RfPqsB7I7A
         1f6XhC4XMTaUcY7Wfp+uL5qzsHnBS+kq9ub1hYYw77QzlimpQjHSXgmS4TJeeCYulZng
         pJSS5XCXcICNMJvl0X/tThvVs9t5iq8ZeW0MQMHLMc2YpM5tdfWm8R3GO0NZBnvDj1xd
         suqfqXZk6OfFMfRW0uRwqbsPpQSGM0dIHJoXY4x+Ijv6QOnT+6Z7zKUDX+PHEf4+CkXq
         t9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ti6XX+QFzit0PUdlRv+q4FDbpNYXwxiJNOQSy8OVhSY=;
        b=e2gABC/YM+hWXjat8Umxc4fN9SnTc0YcojtLvpmLiUN7yh/POqzwb7jm0la7qjUKz8
         LHNMp3+T+r7TEDEf3W119eG6Xiaz9/fcVSebgHtkdWUTZvAU/SP07WJLJEhaj35BUAta
         3Zq5L1nZgOb8GLLWXbVrk4ta9+4ljri6HRS+COTtF1Oc9DowxafAEtTmmpT3tMcg3yYf
         Sx55f8CepwvHzi319j6IRhF77C4MvmZ5smJuYVluZcMMGDCniLNnQla674G4mSfK8/gN
         8GZLBhcroREz7A1BSYTUPqmFcdiiDmOmUFsYIzkU1H8OpFOD6w6DoAPomoVYBNW2cwOb
         HtpA==
X-Gm-Message-State: AGi0PuZiqgEjHehVBcjSpLo/L0H4G6mZ5ESfWBg2Bk03tle2IvQ4hzcQ
        hDlAwlAOA/1vgMQ3rLg4MUk=
X-Google-Smtp-Source: APiQypJ0HGaypdEafNHZCuSEFo2ktSx7EEFsJYPQXEpGQrBf3bgMRhOYbCwSRtTRvjF/TcQt1vRQGg==
X-Received: by 2002:a1c:43c6:: with SMTP id q189mr24141339wma.115.1587984582834;
        Mon, 27 Apr 2020 03:49:42 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id c83sm16582066wmd.23.2020.04.27.03.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 03:49:41 -0700 (PDT)
Date:   Mon, 27 Apr 2020 12:49:40 +0200
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
Message-ID: <20200427104940.GA3464906@ulmo>
References: <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <20200427084424.GA28817@kunai>
 <820200ce-17f3-18c0-6f79-3e582f45492d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
In-Reply-To: <820200ce-17f3-18c0-6f79-3e582f45492d@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 12:07:19PM +0300, Dmitry Osipenko wrote:
> 27.04.2020 11:44, Wolfram Sang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >=20
> >> Wolfram, can you revert the following two patches for v5.7, please?
> >>
> >> 	8814044fe0fa i2c: tegra: Synchronize DMA before termination
>=20
> This patch has nothing to do with your trouble, why do you want to
> revert it?

It was part of the same series and addressing the same "busy CPU"
scenario, so I think it makes sense to keep both in the same series. I
guess we could try to run some tests with only this applied and see if
that really doesn't break anything. If so, I don't have any objection
to keeping this.

Thierry

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6muMQACgkQ3SOs138+
s6HF2BAAqZf92sFTs/Eyv87f5posF3vq/kOLjtXrGynwpI3AifzD9eQ6i64bHgI6
2+Bygj2uHJCx7PAstQ8VvHjd/uRNa6b2ZACjOoVf17mcGhfUT+0LafnEHC3JqJ+z
kFmak2jgejP0LY/RGmvrJi79/cTituLrKeFR62kwrXojfMe14kS81sZ8uZ2ki6Na
MlyQdkSKJvkueA7cSN+J8QW+TDHrdMfGV3cn5DiR4UNs2JbwbxTawByKImMt/pCp
0fY+q9LSo9XAjR0tx9xo5h/+XfbxgwxKGvlmiy/PrGxltKWluFbgZbK8WBP/uSVD
j77w1WlqqlW3Xv90ysW027FE6sJi5KvtZpacuHJdM0AzgqB0148hWOd7VURngg5E
8v/hs2RPD4wWET1O7DrIAZY3HbSXPuXuoNMnkTcVsZaDofV/R+yh4T7munkBhrnq
/y0hnxsvmZu/MvuA6Dzy5k+aHALtJxc3IxDqJA+FbPsIisnDaIu8tZF9tpPitNdm
KtMsYLxFfFSMA+hvTnrOSlalTk2DYXh7NuYBd0z9MkkqQHm2e/reDpr8houPxzN5
oNYTHosfzOsmklBvZ5seMR9zjFKeAhhC37+EWi5KCbbfuq0uRJViDIRJwLSeoie+
z0RgqB2aX6q0QKtsaubnnEolKKPl8eKyGe5v9EJd1uenzeEBAaw=
=+wzR
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
