Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBD8340438
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 12:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhCRLJJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 07:09:09 -0400
Received: from www.zeus03.de ([194.117.254.33]:44162 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229890AbhCRLJB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 07:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Uh0xSe7vBl7CPzsQtEmGyApnxkwe
        KUkmfv4AOAzOqqc=; b=Q1bZcfPzdSBAS3uk+3VV0bHBDxMfH2zZhrzVfFY7c3b5
        rq9iKpsJnOya6c0xmEBJKaQSQgXfGFP7ESIKJhYdiCnHsO5hw60BcVBKnYxbNxbD
        nKx8aAM+3ZKVD7EtefLk9T1LH9V8c4AJonYiajatEH6NqIsTk6YGGq0FZdttuaQ=
Received: (qmail 386134 invoked from network); 18 Mar 2021 12:09:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2021 12:09:00 +0100
X-UD-Smtp-Session: l3s3148p1@0oZZoM29NrwgARa4RaSzAQBVtUgvoxMO
Date:   Thu, 18 Mar 2021 12:08:59 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: adv7511: remove open coded version of
 SMBus block read
Message-ID: <20210318110859.GJ974@ninjato>
References: <20210127103357.5045-1-wsa+renesas@sang-engineering.com>
 <bea536b1-9d81-3f41-8ca5-7fb075422290@xs4all.nl>
 <cadc7e6e-377f-db65-514e-7b2e6a40a0ae@xs4all.nl>
 <20210318104330.GB974@ninjato>
 <5f5ea721-c68b-f64e-4398-cd4521c18d77@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RUqJLqMNe5u4kDWT"
Content-Disposition: inline
In-Reply-To: <5f5ea721-c68b-f64e-4398-cd4521c18d77@xs4all.nl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RUqJLqMNe5u4kDWT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I've delegated it to myself in our patchwork system, so it should appear in a PR
> for 5.13 next week or so.

Thank you!


--RUqJLqMNe5u4kDWT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTNMcACgkQFA3kzBSg
KbafSQ/4zLHfFL49Gfb1zTA2C2M3yVl0sWZSgDmtIskbMPJU2uNUBfBF7fRqWRia
Rap686hqXl1Rwnbcepuy69+d0NPHXETQQ6H2AEMLks5u5Vjg8nSCVQ0RFoIKbpws
jWVH7cCMWisHOg3wVdnz14I9h62Ynw4ay3i9IMnGu2nqXqwYKxadRewSIpVaptdT
q0+97nbxadxUkZgatGAXQDrGeBkkJsk43rHNM8nVT3kcPizjoxZxUjo+fYIhJPRQ
8xmJoNT0PK6biNkQiuQ1CEJdSDtz5/pV965pYMefZ+WCdi/lIWDrpYSdug7WKqgl
ZJKktEzLTwcH/XcIgwc+A9GAfs7pZFhL2/6w+bTfazMpnjHKMKjUlLs+xP6X/veT
6lrYyTIwWDwDDBrEalaVESHjlhQtBlmpMzG9nky5zA5kAFeHVF5FAtMOL5aC06XR
Mt0PDXm+RPbhJcWLKuv1g3//38ap2pBNVGT8rTH/XLOFw2PKS/kpvUAKDHwjC2cw
vUXvEf3Znu0tCBUvRX0QKllzq/jzal7BwRNOuJzu3IJhHdh1dUG3yb1IdkYOPncu
EWf5fJyeZB6CkBwe2MOvyl6y47uCMKonZkl9yF4uTfOAXZQslDno6okJ/+b1nSYj
8XH8grgrS+V48rmCouexufc4njsfJAqVTOItryN6UKW7TGiKpA==
=3a3t
-----END PGP SIGNATURE-----

--RUqJLqMNe5u4kDWT--
