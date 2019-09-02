Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB01A5D91
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 23:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbfIBVcR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 17:32:17 -0400
Received: from sauhun.de ([88.99.104.3]:44486 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726964AbfIBVcR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 2 Sep 2019 17:32:17 -0400
Received: from localhost (p54B337C1.dip0.t-ipconnect.de [84.179.55.193])
        by pokefinder.org (Postfix) with ESMTPSA id BDB4F2C0165;
        Mon,  2 Sep 2019 23:32:15 +0200 (CEST)
Date:   Mon, 2 Sep 2019 23:32:15 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     linux-media@vger.kernel.org
Subject: BoF at LPC "New hardware with modern I2C address conflicts"
Message-ID: <20190902213215.GD7253@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey everyone,

at LPC next week in Lisboa, there will be a BoF run by me which I want
to point out. Quoting the official description[1]:

===

"New hardware with modern I2C address conflicts"

For some time now, special camera setups exist having features which are
challenging for I2C address layouts as we know them in Linux: a) a
high-speed serial link which can embed I2C communication (e.g. GMSL or
FPD-Link III) and b) the ability to reprogram the client addresses of
the I2C devices on the camera.

The use case for these cameras is to run multiple of them in parallel,
and not just a single one. To be easily pluggable, they don't have a way
to configure the I2C addresses they need. They use initially all the
same I2C addresses and rely on software to reprogram them and sort out
that problem.

The really tricky thing is now that they are connected to the same
serial high speed link. As a result, all the clients with initially
equal addresses sit (more or less, depending on the link) on the same
I2C bus as well and need to be carefully reprogrammed one-by-one to a
unique address.

The camera setup above is the primary example we are facing right now.
Some early implementations for GMSL and FPD-Link exist with different
approaches to map the I2C topology. However, there might be other
hardware facing very similar problems. We definitely want to have you in
the room.

An introductory talk gives a few more details of current
implementations, and explains the current problems in abstracting all
this. From there on, we hope to have gathered enough highly interested
people for discussion, opinions, and brainstorming. The goal is, of
course, to enhance the I2C core to provide reasonable support for such
scenarios which will be beneficial for all users like these high speed
links.

====

The BoF takes place 11 Sep 2019, 10:45 in the Ametista-room-I.

If you face similar problems, know other HW behaving like this, or are
simply interested, you are very welcome to join the BoF. Or contact me
beforehand at the conference.

Hope to see you there!

Happy hacking,

   Wolfram

[1] https://linuxplumbersconf.org/event/4/contributions/542/


--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1tilsACgkQFA3kzBSg
KbZYkA//dVIarSguujsqS8z9aAMXc+bxSGjUXfDHKTqOl4iNvncXrMGGKtpB16Kh
oBd/YPDgzcjPjUcVGSoauR6Xyy29DgHD+8JgRh5cvAPO2HDH+Nesi1KFNOk3yLKd
NZuYD+5YWwxYMePXgwjnMImPRkxuSzZtuzpuTCrKP02z/Kv0eeAQZoFAp2+JXWeR
YkXqQsP7JNJlzATT8T6nSmq2CuYTL1UUvISd+0DK//7qZXtC1SR+Cgtl0WwmcfHi
LlEQy03+Q+oS3SWvksObwxN4gF+KhwU1wyWyzAJ5G0nXk4RyfWarCneGLx5Vpeaq
VJBf3RwbK3TL4LUlS2RzR1KTc2OMdu7L2aCHzx1Zq2HWlPvaZolxjly8hqCs249v
6m79KS5lFDbV6ZEqi+ic/bmwh9YvmEtBPMispHVnbezv+t3pKe9pNfLvSHHKCF6o
r6qpHujt3EhhNX3/wxFwWjHFz5b/TR7txvqgHCMPoon04o9GoMuL9F8JL7XkBx6C
/FrOcpAQUGT8aKBNGY3XPMHeBa75UMPHFo6nAsdlLyWbdtcRSjEOua8N1jY5uPip
7n7rKNnwVXThXLD6101ab+Z8U3ZFgW2Uu2xT/uyKZ4RJwr9k0tRc1oES9FVYWBtX
iCaams5HSoNeSo70i4pSQ0Y2wphxfJCfWGfJFQex2EpeRdfhfGM=
=fCdU
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--
