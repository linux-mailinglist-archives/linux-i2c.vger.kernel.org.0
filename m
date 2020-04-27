Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B82D1B98F6
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 09:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgD0Hsl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 03:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbgD0Hsl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 03:48:41 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88EAC061A0F;
        Mon, 27 Apr 2020 00:48:40 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id d15so17675788wrx.3;
        Mon, 27 Apr 2020 00:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ykXrmH4eSp0lHQxOKpg8eyJKQJcyO1JQD5mT6efAflk=;
        b=AnOZDOpsgAeWPgZxk3V6/dCZNFwCY/j5llSevfYQXGFxKBG3I/CMCk8t1S9VSNoqcY
         hl8EoO26MUaPwv3ndjPJatIziugH5mTzeYWYjVhU1U3hJQnZgFEMSCyCF9Y+t7+9tkaI
         Fn0nStQlSQ8PoJmuIVheLGoh9FlhHuUSabQL7lt4hL1JxsaOj3MPhgtIBjyxARBfBoHa
         rwgDF8raeWiCWPY/EXLQ4QoUOlvvEN6IvK/SGjzuN/GvMj4Kk0llYh/xqFUdDRrb0VW+
         c3ldtWhISc6kQr6FLkR+6bLxZGsLtwRXsTat4GR1Oz8zX9FpOWnOcSopD5OlF7o6uWxT
         COAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ykXrmH4eSp0lHQxOKpg8eyJKQJcyO1JQD5mT6efAflk=;
        b=sSiwlFZq/ixqw8pl2eomYnyEvsY2GeydwVc5A+MQLFl69iZ3W/BfEvn+be0aW2OJGX
         e/vjBmzs/9NVN1krp9TQhxuVWbdLtk5Re4o+2zDP0RxZOR16pZTlkgGnHvrHzP4J6+qD
         7p6t76P4uYH+5JskmDbcw0U7dkiqawmxnin/eiERhEni5Jis55TAEftAW/64gPfF7auO
         J8iUxUqfCrDMAFsvRmzsyuFLq9+sJAxt9FVOr8mSo0A5PHBX99RmOrIYOWBPw54UYUJ2
         t8LBx0PoEMMtH2vJ8ljjc5Bqxfpgzolg4469eX0qFJzlek+i1XlLDXRwIl5ALS650RRa
         V6xQ==
X-Gm-Message-State: AGi0PuZ23Ta/KW6WGAkw3Qi6+AKJau5DXGDImSDFcT2vizEiPzOB8m7l
        rpjZVlLt4vAOZcJfgoKh7qI=
X-Google-Smtp-Source: APiQypLr4pMzeVYP4oKRwidwWpS/8tfvK74Y8iLP/UR5diqSW/Ip7nQvQA645SUPQxdfR8mfEZCrOw==
X-Received: by 2002:adf:fc4f:: with SMTP id e15mr26149257wrs.415.1587973719735;
        Mon, 27 Apr 2020 00:48:39 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id c1sm20626643wrc.4.2020.04.27.00.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 00:48:38 -0700 (PDT)
Date:   Mon, 27 Apr 2020 09:48:37 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Message-ID: <20200427074837.GC3451400@ulmo>
References: <bba0a93a-8ec4-eda6-97f3-fb2ab0b9b503@gmail.com>
 <6f07e5c8-7916-7ea2-2fe7-d05f8f011471@nvidia.com>
 <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
Content-Disposition: inline
In-Reply-To: <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 04:19:25PM +0100, Jon Hunter wrote:
>=20
> On 24/04/2020 15:45, Dmitry Osipenko wrote:
> > 24.04.2020 10:10, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > ...
> >>> Could you please clarify why pm_runtime_get_sync() can't be used by t=
he
> >>> I2C driver's in NOIRQ phase?
> >>
> >> Yes take a look at commit 1e2ef05bb8cf ("PM: Limit race conditions
> >> between runtime PM and system sleep (v2)").
> >=20
> > I2C driver now uses irq-safe RPM since ede2299f7 ("i2c: tegra: Support
> > atomic transfers"), and thus, the RPM's workqueue shouldn't be a
> > problem. I guess RPM should work fine in this case, don't you think so?
>=20
> I was testing, and I did not see it using atomic transfers. I can
> confirm if the RPM callbacks are called or not, but I did not think so.
> However, let me confirm.
>=20
> >>> Yes, keeping PCI regulators always-enabled should be a good immediate
> >>> solution.
> >>
> >> I was thinking about that, and I am not sure it is. I don't think that
> >> the failure to send the I2C command should break suspend.
> >=20
> > It shouldn't, but looks like it should be a separate problem.
>=20
> Maybe but all these other problems appear to have existed for sometime
> now. We need to fix all, but for the moment we need to figure out what's
> best for v5.7.

To me it doesn't sound like we have a good handle on what exactly is
going on here and we're mostly just poking around.

And even if things weren't working quite properly before, it sounds to
me like this patch actually made things worse.

Given all that, I think the best course of action at this point is to
revert for v5.7 and prevent this from spreading[0]. After that we need
to look at fixing the regulator issues and make sure that suspend/resume
actually works properly and without errors. After that we should have a
better chance of isolating why exactly this patch fails.

Wolfram, can you revert the following two patches for v5.7, please?

	8814044fe0fa i2c: tegra: Synchronize DMA before termination
	a900aeac2537 i2c: tegra: Better handle case where CPU0 is busy for a long =
time

Thanks,
Thierry

[0]: https://lkml.org/lkml/2020/4/24/498

--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6mjlEACgkQ3SOs138+
s6GuPA//YCI4iiRaXv/ZB4BV/jq0WNLoCvWW1RIunKE3zf6VZ6DTdT29DXUZXEx+
5e0ruCZPLzlF5m2hF5TGYlRJcsimli2K5QolOi2Mn0ROxPF2Lso1FKwtFrGhJwdB
22oUXuUDjeIPdTl7EQHEoaVcGPSVfxIWJOJoyQKK3WSpirU1NFkWJLIx5S8xpcMd
E5MdrQVZVvVjFYETLy3e8cbvW8AzwA+TBsls03/UszuORf4GJXCjQHEQKRrb8Ouw
Av4zI4C3pIgdlj5pEsUCbkAQOMtwEgiezoiedZKVj3RpQtLVR3ntmB7S9Em1ra0N
+4MkeSKcoPULYZgnmikrtY2H+ok14axoqN2aQROiGNcytggWEbsqyaKErrHzlq72
RCNAeplgBsy9h2AoeWEfIqTy+bApoMX4QkVlOCxyCIn4Z0nbSta1MGjN+QHbX1L3
atmaTITY2aGc6G74tMMkPBgvIYY2hgLoZc05jBY8P3fKNgj56tAAwCJ4Bx9OLMsS
k5VchUOnHoCS5MefRBpQh4ikFOzXgpFzqYNphBxOk1YeRGZU9Xg6Vm4be31aRHdY
hf1QocwpWOuhdNjzL/mCU+TiIDJv8/27YTXE/lMFRRhCyZ4oXcIq0VUMFyCerDgH
K7RmwFiB54pxeOBHBRYFOfgSi51TCv4du9+AHL7J+7IXEkjf/MM=
=MOEg
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--
