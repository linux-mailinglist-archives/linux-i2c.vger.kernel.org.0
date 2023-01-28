Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25F4267FA40
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jan 2023 19:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjA1Spv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Jan 2023 13:45:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjA1Spu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Jan 2023 13:45:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42596211D
        for <linux-i2c@vger.kernel.org>; Sat, 28 Jan 2023 10:45:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DA90FB80B65
        for <linux-i2c@vger.kernel.org>; Sat, 28 Jan 2023 18:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103ABC433EF;
        Sat, 28 Jan 2023 18:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674931546;
        bh=KwZX6qU3zqR7E8IfEq3/u5bpWl4Qz5Nlm+A2Zu+3f5A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h7XoBVL07K2lWR2IVLBb8QNlFLtR3+G5MkoDVnSdHvOfWUNYPASLKygxoJG5xL+M4
         2T3/LpgGAmEMGg3uuQQYcJb/pFiRA50AChkuwzbPIGNcymgiCUys9k5tHH3B8ZRFWi
         uTZA22Q9JFGbZVEE7HisRE1tdhWvd1cZb5rxu0KGgd7NHHus6dJ/O+c9kP33j0aiwT
         bFY11jB6PZ2Ac3WgY7bWBNBIFCFnKKmpE7WTX3J4dZWnj2IjgBfgDCNwFbsQ8+LoDg
         mpL9S3LpLmffvf4NhGXuKvoUo7327bZqSQLs7QsB+PIwTHkDumGMcyG4YDPd0/0qeh
         gmb9eHF6IuWtg==
Date:   Sat, 28 Jan 2023 19:45:43 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4] i2c: designware: add a new bit check for IC_CON
 control
Message-ID: <Y9VtV1tFiV6yYliS@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
References: <20230124111127.1348054-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8Kx3eTXT+LYT61pf"
Content-Disposition: inline
In-Reply-To: <20230124111127.1348054-1-Shyam-sundar.S-k@amd.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8Kx3eTXT+LYT61pf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2023 at 04:41:27PM +0530, Shyam Sundar S K wrote:
> On some AMD platforms, based on the new designware datasheet,
> BIOS sets the BIT(11) within the IC_CON register to advertise
> the "bus clear feature capability".
>=20
> AMD/Designware datasheet says:
>=20
> Bit(11) BUS_CLEAR_FEATURE_CTRL. Read-write,Volatile. Reset: 0.
> Description: In Master mode:
> - 1'b1: Bus Clear Feature is enabled.
> - 1'b0: Bus Clear Feature is Disabled.
> In Slave mode, this register bit is not applicable.
>=20
> On AMD platform designs:
> 1. BIOS programs the BUS_CLEAR_FEATURE_CTRL and enables the detection
> of SCL/SDA stuck low.
> 2. Whenever the stuck low is detected, the SMU FW shall do the bus
> recovery procedure.
>=20
> Currently, the way in which the "master_cfg" is built in the driver, it
> overrides the BUS_CLEAR_FEATURE_CTRL advertised by BIOS and the SMU FW
> cannot initiate the bus recovery if the stuck low is detected.
>=20
> Hence add a check in i2c_dw_probe_master() that if the BIOS
> advertises the bus clear feature, let driver not ignore it and
> adapt accordingly.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Applied to for-next, thanks!


--8Kx3eTXT+LYT61pf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPVbVcACgkQFA3kzBSg
KbaOrA/7BV6+9IRMCmGF5bogDHuVDyfuroqpMi7nth2btg3Htd3bdFzA54jwwTx+
Ptw/qq5c0mjfWjW39hNLrXrIauvhVf8uzETkLXZtRmy3UcAPb1bcEj0vzTxHuRWj
aAa7s0tlNzn6X7OlLebNGAudA50RjiOrSbN4gcj90MrXY/0BE3kh/19xEh3b85sx
S9TdNXi1o2AvrqY6u1sG+Qw5XbgGoZLYsmj8fPbMoCVqSoyavyzdJeUQ0d6fsrlP
Jln24oq0VLxH7ErgnMIz0IeALZUjiIg4kNSahbOnPhSCvySgfAwmbhza/N6mQV6g
fslxhbqjcYfHD8yimc5sKfnaHFqXKdJJdfrenZOQuW1+M153g36kdElP1SDR1PWq
5lKOqjNfawrGrJLpp0BMCNpdwGxy0Yq7xyVNnty70G+F91A+BctMapVzKuA3GZl6
Gz4pV8ytSahLg1eh0ouCW53KeR/Lhsdy2OfyOKcur/qILtdaSq2nxmzRO+oeLALL
ub2x+Eih//JQFS/wToCJ2T73iAT3iqQafagd5BdyjCJnjeL157HXSd4BXwCW0snB
kD8Oclnz49SWNR9PRUrgsleKqDl6QCz6OhUI9v5dTU7znaUBEVFzS3UOPF+E+QXG
YVSUiTSQEPdB+TLky9FLLIhZ04eYaF3G09GYg6JhB8kIUmcZrEo=
=DvQv
-----END PGP SIGNATURE-----

--8Kx3eTXT+LYT61pf--
