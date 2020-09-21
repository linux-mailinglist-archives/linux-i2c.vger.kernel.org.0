Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03D9527221C
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgIULRW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgIULRW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 07:17:22 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126F1C061755;
        Mon, 21 Sep 2020 04:17:22 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s12so12290321wrw.11;
        Mon, 21 Sep 2020 04:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5r12szV9dZx0qXbkrbu9a7oCNIggqfSIuaTZ+HCpPBw=;
        b=qEx4SeSypuSulfF0ZqcMdvX4IFLpTDAyAwk8WDGr03rGSYt7q5Qxmo/0A6h7JMgRMw
         KxawOZN742aHbgGPPo/mc9Sp/eo6eGYEZHxrkKMQS17qtqhNTfWu2Pv6cDclORDau+Hn
         swUPN/iCuioP6IPx0NztsJ2MIcT/wfwDTDy4qF0LertV5PssDBXgqLp8yE74e5WRwZmf
         Jpop3NgHWA2OQ9XIJYOguHdX6VbQUiAfWNldVfWwq0+hc7xLfKP/cVxn/6DOgxsRXCy2
         q0XtLLEHPWc2+LrRKVYJ5LREEPRzURUVIgoLCchgWLpTY3igyGrM4xUqpiiviXzMXXHD
         ha7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5r12szV9dZx0qXbkrbu9a7oCNIggqfSIuaTZ+HCpPBw=;
        b=E3kdmyWZJ/WmTRZ08Mtld0KaTWKU4LOVN2ALFql+/u4HtzTZ1vtQckZ8eqIhengpXU
         +1+FydPAeXJoHOhbG5rWwwTEMhEsyDqcVrXd4XC+7eaij07KV7KlGATQodmMjWokm8bb
         Nelsys48V7VIVHy5GGBj0Vz+3akjQcZeVrn5mJg4cATZNspA02bJT8JI5iAWTVh8uC8E
         WYOnQ1SmFHb1iMhczXOHxochh66iO9nFx+fwUKT9b9iSQZ5nSkIFm77HRM/RHP3FKuIs
         +br002k8Bx1+3b2pPdJ9AvneU65+swIheP9Tz/ImlFy96R2dLmGYPwBlbafVgQKZGOEj
         Wu4Q==
X-Gm-Message-State: AOAM5336F1/2h4pagcz5wMoxdFxTQl/HpqAr8sif7r/Kq1DdhcnTUbKT
        LenlE1LPqacSTAB6Oqi7T7I=
X-Google-Smtp-Source: ABdhPJxslPywD7kxgK9moy2VLhYoljYd70soyLXyVa65oBk3FizZVb5IUOoQn6hyGIWG1g1vYaOucw==
X-Received: by 2002:a05:6000:1282:: with SMTP id f2mr55416573wrx.251.1600687040631;
        Mon, 21 Sep 2020 04:17:20 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id 92sm21095515wra.19.2020.09.21.04.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:17:19 -0700 (PDT)
Date:   Mon, 21 Sep 2020 13:17:17 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 14/34] i2c: tegra: Clean up probe function
Message-ID: <20200921111717.GH3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-15-digetx@gmail.com>
 <20200917123755.GO3515672@ulmo>
 <7d2803c3-b25e-da62-5e55-fca8e550fcda@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LZFKeWUZP29EKQNE"
Content-Disposition: inline
In-Reply-To: <7d2803c3-b25e-da62-5e55-fca8e550fcda@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LZFKeWUZP29EKQNE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 06:02:26PM +0300, Dmitry Osipenko wrote:
> 17.09.2020 15:37, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> +	/* interrupt will be enabled during of transfer time */
> >> +	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
>                                            ^^^^^^^^^^^^
>=20
> >> +	ret =3D devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
> >> +			       IRQF_NO_SUSPEND, dev_name(&pdev->dev),
> >> +			       i2c_dev);
> >> +	if (ret)
> >> +		return ret;
> >=20
> > Is it safe to install the interrupt handler at this point? What if,
> > perhaps because some bootloader didn't properly quiesce the I2C
> > controller, an interrupt triggers immediately after this?
>=20
> This is why we're using the IRQ_NOAUTOEN flag above :)

Ah, I missed that. Seems fine then:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--LZFKeWUZP29EKQNE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9oi70ACgkQ3SOs138+
s6F94A//Y8wN36lT+FIE1Gyzo6Go2+uOHQd1Ofag8Zcypmgp3TCI3frXZGJ8TNxL
ucXf2duY9hFNPXheFjrATPxww/Uiz2e/q7jHpoN9RNJEwRqvu9sJywNuDsENFPeX
BP9pctj09MujoWQ/+SJfgRpSO+Y5ZDr7oNba2VOnKNDE+Oqdz2S6Z6wuqbKGOpzY
WSOKhw3ywMutVWfpCtUlxmeKr2l/Hixrrk/L2AUMpBXMfDtKakTRWPZoahxZHNVg
LxlEVdcJip2jUon3UpoHmsPPVZTDStLegK2e2hjT5QRZEamNa/11s5dop6GFtea9
A4x3FjTLUePuE34PAnl2Y3sVCLeenO3LgrQoFlM2S889yd4cDPI97Rp4mgn2fmkK
rM6pwZBMUHtHpIochCvIcvD5N8QWJuxGUzf9x43l64Dj4KekmcL697eltkDx046t
7kbnzerXGH1tJO5dXLPaI5VIMWtWKdtGz9WPUcLuoCj+2peEQLIgmlz4WfM8IvoP
3MgRFLUq4Asac9JUGJg9GrcgTGSAcOWmqtTCXY2oTRhgO6G5kluOLUSUISHU/Gil
znMXbkjds7eEF7p68cg8R3HROAhIVQ3EMlVfg5eGbwc768TjHxivAAvs7TM8r2Vr
7apqVz2axOCKy1ieG9WMdclLDtOcnzjOjyuclse3fmRHx6JCNb0=
=KB40
-----END PGP SIGNATURE-----

--LZFKeWUZP29EKQNE--
