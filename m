Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDB00A9E03
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 11:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732073AbfIEJQU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 05:16:20 -0400
Received: from sauhun.de ([88.99.104.3]:54110 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730518AbfIEJQU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 05:16:20 -0400
Received: from localhost (p54B335F6.dip0.t-ipconnect.de [84.179.53.246])
        by pokefinder.org (Postfix) with ESMTPSA id 9698D2C0509;
        Thu,  5 Sep 2019 11:16:17 +0200 (CEST)
Date:   Thu, 5 Sep 2019 11:16:17 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, alokc@codeaurora.org,
        agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: qcom-geni: Provide an option to select FIFO
 processing
Message-ID: <20190905091617.GC1157@kunai>
References: <20190904113613.14997-1-lee.jones@linaro.org>
 <20190904203548.GC580@tuxbook-pro>
 <20190904212337.GF23608@ninjato>
 <20190905071103.GX26880@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline
In-Reply-To: <20190905071103.GX26880@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lee,

> > It looks like a workaround to me. It would be interesting to hear which
> > I2C client breaks with DMA and if it's driver can't be fixed somehow
> > instead. But even if we agree on a workaround short term, adding a

So, are there investigations running why this reboot happens?

> > Is there no other way to disable DMA which is local to this driver so we
> > can easily revert the workaround later?
>=20
> This is the most local low-impact solution (nomenclature aside).

I disagree. You could use of_machine_is_compatible() and disable DMA for
that machine. Less impact because we save the workaround binding.

> The beautiful thing about this approach is that, *if* the Geni SE DMA

I'd say 'advantage' instead of 'beautiful' ;)

> ever starts working, we can remove the C code and any old properties
> left in older DTs just become NOOP.  Older kernels with newer DTs
> (less of a priority) *still* won't work, but they don't work now
> anyway.

Which is a clear disadvantage of that solution. It won't fix older
kernels. My suggestion above should fix them, too.

> The offending line can be found at [0].  There is no obvious bug to
> fix and this code obviously works well on some of the hardware
> platforms using it.  But on our platform (Lenovo Yoga C630 - QCom
> SMD850) that final command, which initiates the DMA transaction, ends
> up rebooting the machine.

Unless we know why the reboot happens on your platform, I'd be careful
with saying "work obviously well" on other platforms.

> With regards to the nomenclature, my original suggestion was
> 'qcom,geni-se-no-dma'.  Would that better suit your request?

My suggestion:

For 5.3, use of_machine_is_compatible() and we backport that. For later,
try to find out the root cause and fix it. If that can't be done, try to
set up a generic "disable-dma" property and use it.

What do you think about that?

Kind regards,

   Wolfram


--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1w0l0ACgkQFA3kzBSg
KbZwIw//V6IiIveJDn0aD/OW1kfJryDVHjJc9G0mc7e95Zv5IY4F77vlM/3CreL9
Af8mavqJNEfLlkVymEEVTAt5PqfsdhPd1Ttd54GEByAk7gFtXtbHt8LpkY2Sqn6p
gFdduWs32IP/JG6iQpi0Ee9CeLKhU4me95zYWcky93b2tdBA7+G7nZjD/+WL4OyB
32xbzQgElDmo0WiphV6jwpYpISbIcmpaeTTmFYSAs0UMXBbGV2aIN+Ji/mIko/Lv
BtZtPegtsBK+8DyuxqsRYwI6vpyoMf6RTBe0GnkpRVYeMJpuaGxEsNAkc8YpdiF3
f7rdd/EMf0mrONo37R6ZpYmxMAP/IJ7pBUYnpDffPRNDiXEhXfBD+DruIc//UcDi
GAtZXEOgpBAu9ajY0EUUqXkqgKYx6KeTdAWklCYBNt4/E9IaIvp9A+o4K0O19PI0
ArjbIhqNKKV70VytmD9DyGhzC248OYpkyY9A9emMSgeU8JoL2UsgbMzvAnykz3gc
d0xVBP9b37pTrpkvaQHY6kH7Jkso/5HgSFzS81OiAqmmBt1TrazTT+1FN02brO2G
KvnIbw0p1nwwbH3s4L0G6ejee2wf0Jjjki0rJi8Sy4WMN5K5pcVIHo3eTTtlhIr/
BI5zFeZg6eu8RkalM5glGaFpO1KWV27kaRx+INA1LdndZ+3RZmA=
=UyFF
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
