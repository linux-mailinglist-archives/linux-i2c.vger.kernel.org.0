Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB8A26DBDC
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgIQMny (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgIQMjv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:39:51 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32447C061756;
        Thu, 17 Sep 2020 05:39:47 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g4so1900462wrs.5;
        Thu, 17 Sep 2020 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M3VrJ2B64hTdjoHMpAuo3M/HRquUsGWW+o6/WochxAY=;
        b=MwXviNSTo4E0vsZJzHR+3iyyat1DlJOHlF1AjUVBwR7zzxmtVyM1sRZLC9Ft6eIzr5
         mOA6plpBEa46IwD0UBqh1+ul+hmDhhW/3hAXr3agW6qDyQcB0+o6ZK9LHKObodCAPHk9
         S0YGGjLh2gCDpcxx/qXaOw6NAVYHAfzbyXZAjNGbv7KPGBSPHg7ASx1tmxdUXrxfXZO9
         zqaS6wIRclAhn2TWKm9oYozQMSpe4tLygDD0DmatfZsDPBQDY/VEp7UqsjtKPfBYGeaf
         d7pi2U1e7Xsw2GllPDdqUDZYpP4ZCoWsZL+ADV30/kJplMx53dR2t05wiS8kNSGzG4tg
         jAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M3VrJ2B64hTdjoHMpAuo3M/HRquUsGWW+o6/WochxAY=;
        b=cbwSN4wQKvS+PHxaMkOuLb71HZ+wXiPELUSFCaKUaaMv03E43QZxMoo1sw3qQq5LEa
         wfp24crI0kv9F9AjYJTovlJpO73hhEgZZLCTJgDTgKZaxko2swWSbBcTpjsMiEShIJPC
         mB1UXVOqJK5ImXIXbxpMQPfyIgkMMQJUBOMZCulTFVb6NlitwU7eW1Inbyl8BnvOech4
         3mctSXmeaD+n60H9GWkU6nxt0X6IUG0PTKa347Mrm1z4K/tVL9gYRdHb1lL7tZq7MHki
         lGi8gkxJuL1wbEMG67QITyf/Scop+w0PkcDz0nBxmV4c5CQQU9WeebISYfDIwCO4M/7q
         taCw==
X-Gm-Message-State: AOAM5313qSgaBFaHIJhMuB8D+ztNr/6ii1LIyXFxdip43FSHee/37edd
        h4kvuLXl0VfIWWTLvw9HVKY=
X-Google-Smtp-Source: ABdhPJwNARbJle0Fo7MIze6k7+Xc1upTtPLfRazpjVArfGsQw8rJpp2d7itlBN81nyMk4GjjWjsZFQ==
X-Received: by 2002:adf:df05:: with SMTP id y5mr34872144wrl.39.1600346385927;
        Thu, 17 Sep 2020 05:39:45 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id i6sm42006453wra.1.2020.09.17.05.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 05:39:44 -0700 (PDT)
Date:   Thu, 17 Sep 2020 14:39:43 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 17/34] i2c: tegra: Remove outdated barrier()
Message-ID: <20200917123943.GR3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-18-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n8ucneZ6gTaxrU7s"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-18-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--n8ucneZ6gTaxrU7s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:49AM +0300, Dmitry Osipenko wrote:
> The barrier() was intended to reduce possibility of racing with the
> interrupt handler, but driver's code evolved significantly and today's
> driver enables interrupt only when it waits for completion notification.
> Hence barrier() has no good use anymore, let's remove it.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--n8ucneZ6gTaxrU7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jWQ8ACgkQ3SOs138+
s6GRkw/+LzdnbUbVJsJzpJFb8pf0FjefM/CIzNnJlVsnBxZMVRhP2cm0V9CDIX4W
MLnpLK/8uvrm8DKpWkofydqhv/ZAYhr3ta3cGtryfTEi+PggTLjcumf5XPOHppWd
XrZicV7PvwWPWf8MusIfeLjQ12qAtVZ21I5l+Cbmj0Su+wL0qaRrNyZpTZGRZ87T
eA/gj6fCgkJIJFBGJrKvfJrrBXYw5xFiwDr3DtRIf5ptMVo/zgq1wvNZ2fCCMrAg
rugaNvDkXykVwdeDWq0SS9+POOUahwSqotGxA5JvJ7VEdWI2rIcE6s/Z5Svi6lhf
561IrtkX/kpbVqdSJmsq/D6Q7FwbDIQ8hx+/u3lk0ZmdLzIlgacjYlMgqWAcrLo3
QriuKHG/wlqFh56PiUIkoiFoa7y+E1rFJgvDKgTA5hQQmGSweRe09ir6J55USaG2
hhB1U0Z7oYIpGQH7F4ZY4rl0PVGYEG1OzboW9z/n0UXD+e5RJRwhMVqgjIwiOsuC
BKg1XFHKUPsGnW1Clw1ER24sRhn429iYqqT/r/d8DmSgManw228hTf6l+1XcWCDQ
d1uMEq45KtsVBBpyZoDAXQ9eLVECRCDDDmjLuIAyDWSLHh7nP7299IVDSrrT2jGI
UTIE+sxljo+ERSG8QSwpe2egSYdDPuYCNHkB664ew4AXlFyC/Zg=
=JjQ+
-----END PGP SIGNATURE-----

--n8ucneZ6gTaxrU7s--
