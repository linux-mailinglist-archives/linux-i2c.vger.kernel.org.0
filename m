Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01B4A168E9A
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2020 12:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbgBVLvN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Feb 2020 06:51:13 -0500
Received: from sauhun.de ([88.99.104.3]:53212 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727186AbgBVLvN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Feb 2020 06:51:13 -0500
Received: from localhost (p5486C6B7.dip0.t-ipconnect.de [84.134.198.183])
        by pokefinder.org (Postfix) with ESMTPSA id 7187A2C07F9;
        Sat, 22 Feb 2020 12:51:11 +0100 (CET)
Date:   Sat, 22 Feb 2020 12:51:11 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Martin Volf <martin.volf.42@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [regression] nct6775 does not load in 5.4 and 5.5, bisected to
 b84398d6d7f90080
Message-ID: <20200222115111.GD1716@kunai>
References: <CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WChQLJJJfbwij+9x"
Content-Disposition: inline
In-Reply-To: <CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WChQLJJJfbwij+9x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Sat, Feb 22, 2020 at 12:13:07PM +0100, Martin Volf wrote:
> Hello,
>=20
> hardware monitoring sensors NCT6796D on my Asus PRIME Z390M-PLUS
> motherboard with Intel i7-9700 CPU don't work with 5.4 and newer linux
> kernels, the driver nct6775 does not load.
>=20
> It is working OK in version 5.3. I have used almost all released stable
> versions from 5.3.8 to 5.3.16; I didn't try older kernels.
>=20
> Even on new kernels the sensors-detect finds the sensors:
>         Found `Nuvoton NCT6796D Super IO Sensors' Success!
>             (address 0x290, driver `nct6775')
> but "modprobe nct6775" says:
>         ERROR: could not insert 'nct6775': No such device
> There is nothing interesting in dmesg.
>=20
> git bisect found out the first bad commit is
> b84398d6d7f900805662b1619223fd644d862d7c,
> i2c: i801: Use iTCO version 6 in Cannon Lake PCH and beyond
>=20
> Unfortunately I am not able to revert it in v5.4 to confirm it is really
> the culprit.
>=20
> Is there a way to have working hwmon sensors on my system in newer linux
> kernels?

Well, it worked before, so I am quite sure it can be fixed. Thank you
very much for your detailed regression report! Sadly, I am not familiar
enough with those drivers, but you put the right people on CC, so I
think you will get more feedback within the next days. I'll keep an eye
on this, too.

Happy hacking,

   Wolfram

>=20
> Thanks,
>=20
> Martin
>=20
> --8<--
> lspci
> 00:00.0 Host bridge: Intel Corporation 8th Gen Core 8-core Desktop
> Processor Host Bridge/DRAM Registers [Coffee Lake S] (rev 0d)
> 00:02.0 VGA compatible controller: Intel Corporation UHD Graphics 630
> (Desktop 9 Series) (rev 02)
> 00:14.0 USB controller: Intel Corporation Cannon Lake PCH USB 3.1 xHCI
> Host Controller (rev 10)
> 00:14.2 RAM memory: Intel Corporation Cannon Lake PCH Shared SRAM (rev 10)
> 00:16.0 Communication controller: Intel Corporation Cannon Lake PCH
> HECI Controller (rev 10)
> 00:17.0 SATA controller: Intel Corporation Cannon Lake PCH SATA AHCI
> Controller (rev 10)
> 00:1b.0 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root
> Port #17 (rev f0)
> 00:1c.0 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root
> Port #1 (rev f0)
> 00:1c.6 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root
> Port #7 (rev f0)
> 00:1d.0 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root
> Port #9 (rev f0)
> 00:1f.0 ISA bridge: Intel Corporation Z390 Chipset LPC/eSPI Controller (r=
ev 10)
> 00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)
> 00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 10)
> 00:1f.5 Serial bus controller [0c80]: Intel Corporation Cannon Lake
> PCH SPI Controller (rev 10)
> 00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (7)
> I219-V (rev 10)

--WChQLJJJfbwij+9x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5RFa8ACgkQFA3kzBSg
KbbkDw/8D/PpB5Muukf4L8rPt0Q0BAL/ZO7cmlwGKXUxZgm2f3KaqDqSYqrHFQs1
ACTDyyyg6q1RMNiHZQ6LMCBLvWHfgjtBeJcDhTgzFcA7CV+xDrpOan8+8mBHnd8X
q/vGIGXoBUREZqiGDkCkWu1Pty3nmbsdNgKXy0fc0Ej8q5Apr8dUJ+VU4r7ZzOt4
naHsYdb3oxyYIu7pNYIM1j64wfivCP6T5pnlfP3JdQkOZfL0dQuW0g3NTcr5n3Gg
aEdazPNQuN9HB4KH+wqaztxC9LqlCd++gVFx43rakydhVjVnh6BrYIGKkZoAhr4f
OyvPvyF2QWit0tr2UA5u4OIQUS3kzjW8FzvezozsVRjW/5qmDj2xZ/hesvK5oG+S
K6uMhABJd8bbBH6Z4/0v/kVgpe0WzMb7qrW125SygYqqckm4WvQ7CprgBIEMXUSg
7wzYbTU+f8bdT0XD/neK0YueQmutM+smcStwCAGtRPtDgfeCS6OBlfyoJTt22pYT
Wmaat8iCnX0T2nGXbevLgAI9IE7cbQdvRWCowpBTmQ9So7d9FtI2xhrGbn8xevhs
tycC0knPDkLmpM6NTibte5PkfIhJLcSEWp3NLzXoqCrFJMV2UoN4eQ2fvnFlvM2E
Q07PfpWT2mnpl7SGY7EItIIXdeJ/4aDfqr2GemEqnSJao27gUvs=
=lEKr
-----END PGP SIGNATURE-----

--WChQLJJJfbwij+9x--
