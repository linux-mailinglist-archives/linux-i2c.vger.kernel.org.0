Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 940047A5D2B
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 10:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjISI6c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 04:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbjISI61 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 04:58:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFDF120
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 01:58:21 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB34C433C7;
        Tue, 19 Sep 2023 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695113901;
        bh=btMSQV0k0d36XzeVxBDIvRVioNucy1pO8/g+IpnfBzY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GIIbkC0++EpKVF/2eX4mRjwjUof0yp+dqRm1sHtVyQbl/Y/YIeeRHV2lMzG+g6DD7
         V2dkTHljIVaZHTYxk93JgQcC/7WhBgd6IqS1CnR5DRZyk1DMkMgPNlCK6rYGtunNl1
         Gt85oknqyiCIjsI3KLLjiQATLSYtkYxx5u2hzL4h4kRCNGD5LEkDNNL3YbMOCQh8Nj
         Xn5icxBnnRwS7dWOJ/P/6E0Ur5aefgI5OJ4FP0bsSGPaqAlMC0sUzeFqTUIQ16XejT
         5Qsrww/n/5C9S0hmaqHP3oS3oV4eCVsNBnxwxSRFA46BzPegUHyIrgaue/tht4jIuO
         KHQCJr8cT5ZzQ==
Date:   Tue, 19 Sep 2023 10:58:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v3] i2c: i801: fix potential race in
 i801_block_transaction_byte_by_byte
Message-ID: <ZQliqdEjHaI2KQEE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <205f1930-f26c-9533-ef09-e37377d9ef10@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oZGmSW1v5LTBOVxk"
Content-Disposition: inline
In-Reply-To: <205f1930-f26c-9533-ef09-e37377d9ef10@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oZGmSW1v5LTBOVxk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 09, 2023 at 10:25:06PM +0200, Heiner Kallweit wrote:
> Currently we set SMBHSTCNT_LAST_BYTE only after the host has started
> receiving the last byte. If we get e.g. preempted before setting
> SMBHSTCNT_LAST_BYTE, the host may be finished with receiving the byte
> before SMBHSTCNT_LAST_BYTE is set.
> Therefore change the code to set SMBHSTCNT_LAST_BYTE before writing
> SMBHSTSTS_BYTE_DONE for the byte before the last byte. Now the code
> is also consistent with what we do in i801_isr_byte_done().
>=20
> Reported-by: Jean Delvare <jdelvare@suse.com>
> Closes: https://lore.kernel.org/linux-i2c/20230828152747.09444625@endymio=
n.delvare/
> Cc: stable@vger.kernel.org
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--oZGmSW1v5LTBOVxk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUJYqUACgkQFA3kzBSg
Kba1cw//Sn4z3hpcVeW9ZH25hrzJ+e9+ib/Ep/c3DKIoJOfh8EUSAie3Ns/+XJkP
M7xP5BgqNaKQ4DCLsTWazl491SKDjUKHBcV+i6Fm+mfIZ/1zZUOTNwMzuoQGWUY+
taZROHcSNQ5KGdR1DqihlG1Y+fiVhfNH1FyeuR++y+ubhz1d/ZKAmmnboVOdA7O5
wwWmAwsycCevSUsrTwjMAvIELAj2ANkgfeN/AfNUXBwfqeY826cABhubqO2wg+uT
Yoxmm4tSPcN4QWVoMGRyLM1KnyucC7QCC28PhZh8aetNBU+9pPh5Ch5+2hHgZoud
gsZ7ZI6Pg0pUVEEBvvCSuXrOX144ot4Qxdf2Zx13VcnNNeOnPPXiDYtr8+pqqe39
lleLhWyTEPRV6+/5Xu0w4avylwFDWuIxTdCYOz2FHE78OYfX2Y2NTamTxo/PT5Bp
H96gJz1Euo9yJzcofpUA+4uK9drbFE/Mn4aCmbCvVA5wplFTbH8jitGmaQ0bHumf
3bDPgXEQju/OEfgF8ICaz1xUAF+WB21ljdXnVNbL0ivHlLEcJ8jT/Rc9Wpd4dzZU
HQgPmPL0r0sx/Xq9cOhRX25Y4lUihOCOhZytVWme2qeUgYk6Q143DDVBfk21V5hN
sQI95nYnYC01grWLc2/x6f5I2B9zMHcPjvuU4+QihhU/qIVlsNk=
=XdcF
-----END PGP SIGNATURE-----

--oZGmSW1v5LTBOVxk--
