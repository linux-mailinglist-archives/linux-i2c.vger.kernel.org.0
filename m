Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6DD52DB23
	for <lists+linux-i2c@lfdr.de>; Thu, 19 May 2022 19:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242573AbiESRZQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 May 2022 13:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242635AbiESRZC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 May 2022 13:25:02 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65B23A5017;
        Thu, 19 May 2022 10:25:00 -0700 (PDT)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 713D8D3A61;
        Thu, 19 May 2022 17:21:03 +0000 (UTC)
Received: (Authenticated sender: didi.debian@cknow.org)
        by mail.gandi.net (Postfix) with ESMTPSA id BA400E0007;
        Thu, 19 May 2022 17:20:55 +0000 (UTC)
From:   Diederik de Haas <didi.debian@cknow.org>
To:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Cc:     =?utf-8?B?0KHQtdGA0LPQtdC5INCk0ZHQtNC+0YDQvtCy?= 
        <serfyod0vr@yandex.ru>, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: Systems with more than 4 memory slots not supported yet, not instantiating SPD
Date:   Thu, 19 May 2022 19:20:45 +0200
Message-ID: <8957561.CDJkKcVGEf@bagend>
Organization: Connecting Knowledge
In-Reply-To: <3837611652787835@vla1-3991b5027d7d.qloud-c.yandex.net>
References: <3837611652787835@vla1-3991b5027d7d.qloud-c.yandex.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3123807.5fSG56mABF"; micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--nextPart3123807.5fSG56mABF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
To: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Date: Thu, 19 May 2022 19:20:45 +0200
Message-ID: <8957561.CDJkKcVGEf@bagend>
Organization: Connecting Knowledge
In-Reply-To: <3837611652787835@vla1-3991b5027d7d.qloud-c.yandex.net>
References: <3837611652787835@vla1-3991b5027d7d.qloud-c.yandex.net>

On Tuesday, 17 May 2022 13:43:55 CEST =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 =
=D0=A4=D1=91=D0=B4=D0=BE=D1=80=D0=BE=D0=B2 wrote:
> On the advice of Diederik de Haas (didi.debian@cknow.org ) on May 16 at
> 22:41 I am sending you my message in
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1001286

That bug report and https://bugs.debian.org/1001286 do contain the full
history, but it looks like the most interesting/actionable part of that
conversation wasn't shared with upstream.

I have no specific knowledge about this issue, but will try to summarize it.

/var/log/kern.log
[    1.341085] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[    1.341467] i2c i2c-0: 8/8 memory slots populated (from DMI)
[    1.341470] i2c i2c-0: Systems with more than 4 memory slots not support=
ed yet, not instantiating SPD

On Monday, 16 May 2022 20:55:20 CEST =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 =
=D0=A4=D1=91=D0=B4=D0=BE=D1=80=D0=BE=D0=B2 wrote:
> 1. Systems with more than 4 memory slots not supported yet, not
> instantiating SPD. Now I have made it so that the system sees 8 slots, as
> described below, but I do not see SPD.
>=20
> 2. Kingston memory slots do not appear on the I2C bus, although I see them
> in the BIOS and can change their parameters. Nevertheless, Linux works
> fine.

> I rebuilt the kernel by changing to
> "./linux-source-5.17.6-1/drivers/i2c/i2c-smbus.c"
>=20
> line 358:
>         if (slot_count > 4) {
>                 dev_warn(&adap->dev,
>                          "Systems with more than 4 memory slots not
> supported yet, not instantiating SPD\n"); return;
>         }
>
> and replace with
>
>         if (slot_count > 8) {
>                 dev_warn(&adap->dev,
>                          "Systems with more than 8 memory slots not
> supported yet, not instantiating SPD\n"); return;
>         }

To which I responded:

The 4 slot limit was specified in 5ace60859e84113b7a185c117fbf2c429d381b59
(upstream commit ID) and the secondary commit message had this:
"Start with just DDR2, DDR3 and DDR4 on x86 for now, and only for systems w=
ith
no more than 4 memory slots. These limitations may be lifted later."

That commit by Jean Delvare was from ~2 years ago and it appears that there
may now be a reason to lift/change that limit of 4 (to 8)

As such a change should be discussed (and possibly implemented) upstream,
I asked to forward the request there/here.

Hopefully you now do have the needed information.

Cheers,
  Diederik

--nextPart3123807.5fSG56mABF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCYoZ8bQAKCRDXblvOeH7b
bgklAP90TlF+loOGAgtKXSTr+sUT6bGU4Z2VoYaL9UDqgvM5DQEA2rNgbAejD8dH
3+zpG+dtLwYnTmADPdLlLQehNoXTjwA=
=Jbcc
-----END PGP SIGNATURE-----

--nextPart3123807.5fSG56mABF--



