Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126D526DA02
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgIQLUA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbgIQLTf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:19:35 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D577C06174A;
        Thu, 17 Sep 2020 04:18:49 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id c18so1623874wrm.9;
        Thu, 17 Sep 2020 04:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=K04b7PbXaP681BGxaFbgBimgA8sy918ShOEG0hyUvxU=;
        b=DVAH2SA3SnOw3xi1Ad4adT0AOCwVIzXzAVNzX1a0+/tZzuAmEnPb8Mso2rbyhtRoED
         9wex3pu261GatbMG4kuhc9b0Cr4bU+Voge6CNpInQWMBzVclT1U99V1O8ZQVVgK/jqM+
         Q45zsvcstn28XaERGtMuHHPagkymDlFcyH1oPDFMPdvvQ7i78mmypXQSIj9wBInrYH6r
         /Zq1qgXA7ajurKFLxPAeQ3Wt2UANo91yT8WePHs3KvgTxQI3ofJixDx7WlqMywyR3s4m
         DiSBMPpgTtQN4oQ2q97VAS7aZH9G/wwzsS1g4vZdXap24MnVUcmTCK9Mm6mHyaPjrNnr
         I8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=K04b7PbXaP681BGxaFbgBimgA8sy918ShOEG0hyUvxU=;
        b=MwoPdF5LTM4E/DNqlubnyJdR6xaj6f/Y8wH1uZ8tc+MhBPPwkEPUGyoBud1VOpU/5Q
         Pi8hXaZsXPxCNzZW5nhYiqBd83lweMTblYQKkb8k/Me6Ds21ytKFjukbaDwbwLv9KJ+5
         xhDiTMbmUKaMgF0f3yc0TCNs87Xqs9VT5JJxd0d14nKroA/2+m0mQL+7DVYazZ1GVIZL
         fOJmQmIKAPWUtS0KcqteiCioAl00uHcjRpCprXj3mRrFME7v0eny4IIqTYAxp57PMInv
         PtYUTDWhT580x0DcujVMxpxclTJpRiitSYbG3Uy5yCU+zSdKt09qKQ3/GvQgs5zey5Z/
         p8Rw==
X-Gm-Message-State: AOAM531/bGGGlefVkTUL9/B3gN4RIr+lScLGCKLWBW51VThHKjEKX4No
        +vVzmfAYbPJ52HEhjQBr1Do=
X-Google-Smtp-Source: ABdhPJzVa5mGsIMaw1I3+IgGSNKPNjfdThADxEWj/004hIPmlfVkCpWmX+tboS26ruJhPv7Zi8IPJA==
X-Received: by 2002:adf:fa02:: with SMTP id m2mr31340391wrr.273.1600341528604;
        Thu, 17 Sep 2020 04:18:48 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id c4sm38026287wrp.85.2020.09.17.04.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:18:47 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:18:45 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 04/34] i2c: tegra: Mask interrupt in
 tegra_i2c_issue_bus_clear()
Message-ID: <20200917111845.GP3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="H14uD12u8nekTETJ"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-5-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--H14uD12u8nekTETJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:36AM +0300, Dmitry Osipenko wrote:
> The tegra_i2c_issue_bus_clear() may fail and in this case BUS_CLR_DONE
> stays unmasked. Hence let's mask it for consistency. This patch doesn't
> fix any known problems.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--H14uD12u8nekTETJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jRhUACgkQ3SOs138+
s6Fzyw/+NNnTCuA3rYVOt6jyQLjDjZFuqL2t0AylDFQK03HNTk56ewvZu9Rd1CWh
aiF7VwoXfmIh513/JjTaYFMpj5xOuyJbqbVE4yRKf/Klv4H0zdHrDGjkHwOCMIEP
mBFI02TWjOBDstZ3K11204uY5J6XHu1IirZfV41zmklrvCxdZFMJOYPpWa0IcLx3
zXr2wfZ+/MXvSCN1WQXlPMG8Zzv3DvNi+z5y9LjrAOBZ+ifcqR/Zg7yJYY8db8yU
kYih6MF3umvkh6o8fZZ3VhMvaezYmB7Pqpvtnk+68axtEhPrgpXmeS1hIIjmkA7p
NK9nwqlgmqs/w9iDtsEoGO6r/lbwvsZkSsKEdRUNayrBSGS6gRwj9YwIdVS7AMuS
jLG2TDLgmPl4OVpvWIo6ehFMfSUwpzbc0N+tgkcV5aEGJe7QTIR032ysxelAGX26
UyT2YMKAT5AKUcXXWBjzi7mWugBuCWQRk/6ORfezpJEGA2f20i7ZOmHsc2xTN1+U
jCoDI1Cfz4KJVEwgPGjMRFFkefpC1zy6c+jBkAzInct2EhsiB61boBWmq1uBEFX9
HhbuevEkNyzCz80jJtCfRrAh3iOfiN/GipO8JgsO9oizf9S45Oe+IkSBQm4mDbqo
w562UDz/gwquyUUdZsOfkHtJMNoE9CyYhGXb3otPKDH9WfZjzcE=
=GjoT
-----END PGP SIGNATURE-----

--H14uD12u8nekTETJ--
