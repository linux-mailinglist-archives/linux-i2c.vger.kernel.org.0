Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA402D187
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2019 00:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbfE1WZ4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 18:25:56 -0400
Received: from anholt.net ([50.246.234.109]:49658 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbfE1WZ4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 May 2019 18:25:56 -0400
Received: from localhost (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id 07A3E10A03D5;
        Tue, 28 May 2019 15:25:56 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
        by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id f67l0HYwfo6f; Tue, 28 May 2019 15:25:54 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id B19BC10A1201;
        Tue, 28 May 2019 15:25:54 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
        id 40E792FE3AAE; Tue, 28 May 2019 17:25:54 -0500 (CDT)
From:   Eric Anholt <eric@anholt.net>
To:     Annaliese McDermond <nh6z@nh6z.net>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>, swarren@wwwdotorg.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        NWDR Team <team@nwdigitalradio.com>
Subject: Re: [PATCH v2] i2c: bcm2835: Model Divider in CCF
In-Reply-To: <E711B8C3-85B8-435C-97FD-E62BCB88B679@nh6z.net>
References: <20190508071227.18609-1-nh6z@nh6z.net> <4174B26B-4E3A-4CCA-A5ED-BE62A3B5E66A@nh6z.net> <20190516075848.GA1033@kunai> <2E6EDCD1-E0B1-4859-BD75-EF411D3D4C6B@nh6z.net> <20190527191534.GD8808@kunai> <E711B8C3-85B8-435C-97FD-E62BCB88B679@nh6z.net>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1 (x86_64-pc-linux-gnu)
Date:   Tue, 28 May 2019 15:25:53 -0700
Message-ID: <87r28ijjwu.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Annaliese McDermond <nh6z@nh6z.net> writes:

>> On May 27, 2019, at 12:15 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>>=20
>> Regardless which solution is favoured, I am going to apply this patch in
>> a minute:
>>=20
>> http://patchwork.ozlabs.org/patch/1097688/
>>=20
>> It enables this driver for ARCH_BRCMSTB. So, the solution should work
>> for this as well. (I don't know any of these platforms well)
>
> I did some looking the other day, and I had forgotten that the RPi has 3
> of the i2c-bcm2835 devices each with their own divider that sits in their
> register space.  This makes me think the correct solution would be for
> the divider to be controlled in the driver as was in my original patch.
> Otherwise we=E2=80=99d have to make three different dividers in the bcm28=
35-clk
> driver, and the i2c driver would no longer work for other platforms.

Control of the divider should definitely be in the i2c driver, not in
clk-bcm2835.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlzttXIACgkQtdYpNtH8
nuiAbg//X0j7M7BOUJsCvwPSJpLQIHbCOYkYw5Ei6i+7Qz0SEnTtCGPVkXkBGC3A
ZtKw5mR5T114FxhJL3GS40LwcUoW6nowzgaxop06/HCGCBP6pA98JRgbWhWznXHi
vCkhqBhK9gNsD+JbW8RqDQ10YovQJg6poZ9f6fehxhPl37Vts2HV70RtKaenV8FO
xoo1gw1wtcapre6nA7k1wy10+7DRAD3GVlCPu7vK29+Ih9sZcYkYLHmf6leIAQUp
2qM0lZkzGcW24O0vqCFW9g2vU2PXiebLzGQVq6s0s0oV11zXjilCAgP3C0Z8hj6P
+iqwQeUFFQGrzaN+okFp/O9f84caHuDF4btgboZ+zqgSvIVi5ZxWYa9EDdlnM3pK
HdYb5Nqcf+0rggfhj+L5EsIr1gO8w38JUT30KigbPnYb2Ps/lRrGFvqUnY1mnUCR
tE9CUa793+/j2JS9ETX1bo6yJph6JtlqIHqLq/rED0PxbPjAIRHx8dj7RsIpFuCD
/Ifk2KOzF/POKktZhXS0NYw2OQZaF8CPhs/bwiRix95WQlS3oF69DG4VKmI0V+0J
p6MHf1EZrGr3k23x9+poohIcEN7zpeaYA/SOULdhoKxTT7BWNRrJ9QS1gQ51wY6E
tZIMOXIBzptS4GoHjeeTm00GszKJsOMJQn4TeMWbf0WW6TvjPiQ=
=I88g
-----END PGP SIGNATURE-----
--=-=-=--
