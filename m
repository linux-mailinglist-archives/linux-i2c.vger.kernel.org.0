Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 332FB7222D7
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 12:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjFEKCb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 06:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjFEKCa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 06:02:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB84F3;
        Mon,  5 Jun 2023 03:02:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 35193614C5;
        Mon,  5 Jun 2023 10:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6E2C433EF;
        Mon,  5 Jun 2023 10:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685959346;
        bh=wDMQp3EM29n8nZ/eyrN3WtLu2XgP5S4OYlBxnPAvpV4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hjwm58tFsNCa0MsNu2i76c25X16oi4OE3JGR95I3FoWfi+nj65agpOVa4H/8kFH0S
         jzWsYGrabVmc+DCzT8o9uSx6Muz+ia13IneVTIb+V0+DrliQVxRQ6ClYvZ0wMjQXHD
         9387CF1rXJOt9sDBFVmNRV6Spx45ubnYKPwMcX77YlMkBzu/JOnkdEtUZke8gXvjzb
         QUaffNJ3L9/H/cc6MUzQDVxmxV1ZtYrbilCr5LVxQB4suX/54i3Q050iXvCvV2l4th
         IsHNOmBZgKV6yi3V5g+Vc5e6iBwnXLg7ulAg8e7SOAAjwaLd0aBaQgP3npucHrzUnA
         QKR0Gx2bk/z8w==
Date:   Mon, 5 Jun 2023 12:02:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     David Zheng <david.zheng@intel.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com
Subject: Re: [PATCH v3] i2c: designware: fix idx_write_cnt in read loop
Message-ID: <ZH2yr1sFvjbAiBTq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        David Zheng <david.zheng@intel.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com
References: <ZG5UI7cJvmLXvtLg@davidzhe-DESK>
 <f9a38ff8-ca08-a9aa-e2ff-ce2ce956235a@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kGhRtULe50q054Gw"
Content-Disposition: inline
In-Reply-To: <f9a38ff8-ca08-a9aa-e2ff-ce2ce956235a@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kGhRtULe50q054Gw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 04:58:26PM +0300, Jarkko Nikula wrote:
> On 5/24/23 21:14, David Zheng wrote:
> > With IC_INTR_RX_FULL slave interrupt handler reads data in a loop until
> > RX FIFO is empty. When testing with the slave-eeprom, each transaction
> > has 2 bytes for address/index and 1 byte for value, the address byte
> > can be written as data byte due to dropping STOP condition.
> >=20
> > In the test below, the master continuously writes to the slave, first 2
> > bytes are index, 3rd byte is value and follow by a STOP condition.
> >=20
> >   i2c_write: i2c-3 #0 a=3D04b f=3D0000 l=3D3 [00-D1-D1]
> >   i2c_write: i2c-3 #0 a=3D04b f=3D0000 l=3D3 [00-D2-D2]
> >   i2c_write: i2c-3 #0 a=3D04b f=3D0000 l=3D3 [00-D3-D3]
> >=20
> > Upon receiving STOP condition slave eeprom would reset `idx_write_cnt` =
so
> > next 2 bytes can be treated as buffer index for upcoming transaction.
> > Supposedly the slave eeprom buffer would be written as
> >=20
> >   EEPROM[0x00D1] =3D 0xD1
> >   EEPROM[0x00D2] =3D 0xD2
> >   EEPROM[0x00D3] =3D 0xD3
> >=20
> > When CPU load is high the slave irq handler may not read fast enough,
> > the interrupt status can be seen as 0x204 with both DW_IC_INTR_STOP_DET
> > (0x200) and DW_IC_INTR_RX_FULL (0x4) bits. The slave device may see
> > the transactions below.
> >=20
> >   0x1 STATUS SLAVE_ACTIVITY=3D0x1 : RAW_INTR_STAT=3D0x1594 : INTR_STAT=
=3D0x4
> >   0x1 STATUS SLAVE_ACTIVITY=3D0x1 : RAW_INTR_STAT=3D0x1594 : INTR_STAT=
=3D0x4
> >   0x1 STATUS SLAVE_ACTIVITY=3D0x1 : RAW_INTR_STAT=3D0x1594 : INTR_STAT=
=3D0x4
> >   0x1 STATUS SLAVE_ACTIVITY=3D0x1 : RAW_INTR_STAT=3D0x1794 : INTR_STAT=
=3D0x204
> >   0x1 STATUS SLAVE_ACTIVITY=3D0x0 : RAW_INTR_STAT=3D0x1790 : INTR_STAT=
=3D0x200
> >   0x1 STATUS SLAVE_ACTIVITY=3D0x1 : RAW_INTR_STAT=3D0x1594 : INTR_STAT=
=3D0x4
> >   0x1 STATUS SLAVE_ACTIVITY=3D0x1 : RAW_INTR_STAT=3D0x1594 : INTR_STAT=
=3D0x4
> >   0x1 STATUS SLAVE_ACTIVITY=3D0x1 : RAW_INTR_STAT=3D0x1594 : INTR_STAT=
=3D0x4
> >=20
> > After `D1` is received, read loop continues to read `00` which is the
> > first bype of next index. Since STOP condition is ignored by the loop,
> > eeprom buffer index increased to `D2` and `00` is written as value.
> >=20
> > So the slave eeprom buffer becomes
> >=20
> >   EEPROM[0x00D1] =3D 0xD1
> >   EEPROM[0x00D2] =3D 0x00
> >   EEPROM[0x00D3] =3D 0xD3
> >=20
> > The fix is to use `FIRST_DATA_BYTE` (bit 11) in `IC_DATA_CMD` to split
> > the transactions. The first index byte in this case would have bit 11
> > set. Check this indication to inject I2C_SLAVE_WRITE_REQUESTED event
> > which will reset `idx_write_cnt` in slave eeprom.
> >=20
> > Signed-off-by: David Zheng <david.zheng@intel.com>

Applied to for-current, thanks!

Someone maybe has a Fixes tag for it?


--kGhRtULe50q054Gw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9sq8ACgkQFA3kzBSg
Kbbc9Q//TCUXaQovPdQLkXwhp3QMwJf54s87beL/9vOqI/8zhPg25Y0UTtsQ/n36
Rd5u61DEXqxYIXlKQXdIak8CUWgcuMpESPcY1M86roMBv/T+SjI7ROo7tQLBdFoD
uLIQRjlQr4JSh3h4QJiK2SkrXmS/1FgsppH+lro9TsRm9WaFZkAU5M8FBZd06WpX
1CES6MVSqLeQSO5TW5eDRBei2oKm+TJYjhGAovZhrgMxZ0SVzm6W0dY5x2t9kNpZ
JoUx8oj81QR0JPNHLJIybmJ2C+Ea9yL3fmKfviLkbkBgz22jmHvG+gbDsx21vfyx
oQUa9yHykwiAmAZXLCsGww9SW9uwCoLAvKy5Axj49iodocAMMUp7zwBzr3qciJpY
B0LMA/oki2hVMQaywj9YY/rT9mkCw2wzDH185ltcvAMxXvy/AGWc7GLWDzabj+q9
AryohX6UNs/3FIR7sbLcNPw/G8gwLsLI1ZPWnujqNSPsZBTeX0gX2kAmpouyd+co
aTJ2TeCpCDUMoP8LS7vOFuPS7sJJvV1c4OAtDtpjr6QOCxRT9MapRcRp0yodcQx6
a/Ze7/vNmYljDRpSLQF6oAkfar5nVTs9nlty5May/x7N22OrX8K/yXyZuv+2HX/0
uxrdGwAUzf0M2/01YS6JaMkOig9hDnDkf6LU52Ey9sjcnO7TYs8=
=SooM
-----END PGP SIGNATURE-----

--kGhRtULe50q054Gw--
