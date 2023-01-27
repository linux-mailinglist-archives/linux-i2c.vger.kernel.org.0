Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19E2F67DF09
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 09:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbjA0I0i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 03:26:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjA0I0h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 03:26:37 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C738E38026;
        Fri, 27 Jan 2023 00:26:36 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id b24-20020a17090a551800b0022beefa7a23so7871739pji.5;
        Fri, 27 Jan 2023 00:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SM/ExPSk1r+9xsqtVHLz1skMoTDWJlw8hiYQxeE1S0E=;
        b=n5hLlJhf79PWW+THbSaOYmVgigSFhesbkWr0EA4LXGxHQoNB4JHTSvvWTZe/fe0DqP
         lehR6jyb75n3QNJvTjzirxyGavv+g9fKQlUteV2vvaTN2N8zpMOgEjOFdVWQu5utAA8p
         n7g/PzvQFti7L24u0X7RPAYanu4huDuATzrQhW6Bb42E3HtP8aPBlj8pWbQK6yHmaIrw
         jHNgCAaGS967xaStnziWX6QvrF5DQ+97RFPco4+KrFWeAHQ/0C8RC1KQPhwLU1Gv5SYm
         qv+5F3+yoR5K6D3inUo117T1+IY8ryRKwcjNFOH2YiNkNr1pnDy+VETsoEZQY3HYSkpm
         jZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SM/ExPSk1r+9xsqtVHLz1skMoTDWJlw8hiYQxeE1S0E=;
        b=lyNyJLjiXw0opvztGd2gCI1lnJezvjlKxY950QbguxmhdJMONAeeLgK5x23Bqc+zE7
         Q01xzRF2E3bpLDeyFItI0tO1XD/lWOLc2cHky7KHmlteGtY10YXKFkdEP0ngbCXnn/gb
         GJZ+V/DEyk2/20nnd6IVQMEZzu7YJ3PP1gRDRr9vIphOOswi8uOYyuG6Nvf9uPLYpVCT
         BM+ja8jXhw8uG9PEQTk26MfNMYB8+qXS72M/5w5vBku9fsLXnPb/NV1i1qc/cPUMW09m
         xG9GHUX693w2VxBhT/ay8lahu3AKifqj4IGd4/bfx6vwiysDOkHJ/FEaqXzCqnha+NGk
         Nbaw==
X-Gm-Message-State: AFqh2kqEjji1yNEm7oV17roJXxDmgF00TdXGC1/eQ+2D+6eF7VrhFVYW
        PYMKZIC8I/YLgDQIpwmGszo=
X-Google-Smtp-Source: AMrXdXtSHwi8MvaAffdSC9ayqN2H7B2HOwbmEDk6DKPqr1HWGuV1rYLt7N+3HQ9SfF9rIo3tQ9XN6A==
X-Received: by 2002:a17:90a:7105:b0:229:2dcc:7562 with SMTP id h5-20020a17090a710500b002292dcc7562mr41165390pjk.33.1674807996193;
        Fri, 27 Jan 2023 00:26:36 -0800 (PST)
Received: from debian.me (subs02-180-214-232-24.three.co.id. [180.214.232.24])
        by smtp.gmail.com with ESMTPSA id u8-20020a17090a2b8800b00229b00cc8desm16852542pjd.0.2023.01.27.00.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 00:26:35 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
        id 8471B105582; Fri, 27 Jan 2023 15:26:31 +0700 (WIB)
Date:   Fri, 27 Jan 2023 15:26:31 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 11/35] Documentation: i2c: correct spelling
Message-ID: <Y9OKtxIfYOj/KR3S@debian.me>
References: <20230127064005.1558-1-rdunlap@infradead.org>
 <20230127064005.1558-12-rdunlap@infradead.org>
 <Y9N55pFZc6TRD9S2@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nX+2ODXi06GqvwEl"
Content-Disposition: inline
In-Reply-To: <Y9N55pFZc6TRD9S2@shikoro>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nX+2ODXi06GqvwEl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2023 at 08:14:46AM +0100, Wolfram Sang wrote:
>=20
> > -  client->irq assigned to a Host Notify IRQ if noone else specified an=
 other.
> > +  client->irq assigned to a Host Notify IRQ if no one else specified a=
n other.
>=20
> I am not a native speaker, but shouldn't the last word be "another"?
>=20

Yes, the sentence should have been "... if no one else specified
another."

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--nX+2ODXi06GqvwEl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY9OKsQAKCRD2uYlJVVFO
o6MZAP49dy89iNWxY/kM77KoSiUssWTZt2o6yFfq8q+wuBLAQAD/a0+sPdeXEycB
cZvvSCJhz6K80F2D3K6Pyh0ny/XaogY=
=UffF
-----END PGP SIGNATURE-----

--nX+2ODXi06GqvwEl--
