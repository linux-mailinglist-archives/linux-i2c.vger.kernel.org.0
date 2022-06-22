Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D69555553C
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jun 2022 22:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377002AbiFVUIC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jun 2022 16:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377007AbiFVUIA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jun 2022 16:08:00 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D1C11820;
        Wed, 22 Jun 2022 13:07:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id AA35DCE2224;
        Wed, 22 Jun 2022 20:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66944C34114;
        Wed, 22 Jun 2022 20:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655928475;
        bh=AyEm/DsgtRvODwHTwbe8b+cxW30Z8a4jqqeWajrOL6c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qo1iNeQmk+JAeKqd8AUY3dq34k2BOzQe1qAozB57Wv4QA9vPVpLFUKnY3mgbT+daF
         m+fAByUO+ta4qc/eYdBWIwhCt6v9jdhT2Qltl7Wz7pFXjNwabgs8BNOldnaSZGVKPz
         C4SH2hmqGLzlxEHRcR9XzUoKBDEfcb2bapqwwFNSvs99LnCJ6DoJ8fZLyezYy7vHNO
         TCUEFFAzb7LGQ0eWWGnqtzqagB0Gn/1DG9CeGanwgfo8fuNj7E19qebA3DP5AtIbgk
         iKHaMhGO73PT3MDh022haHF67e1UabuVIu3RB0Vp7CVeRYRZ9Aes1KPPYh/WuMgL/0
         HNWvT32m9ONfQ==
Date:   Wed, 22 Jun 2022 22:07:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv6 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Message-ID: <YrN2lxvlP4cWfelY@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220620230109.986298-1-dinguyen@kernel.org>
 <YrI6EeVkkWVMNPFY@shikoro>
 <928b2996-b2e7-d847-0e20-7e19df3cbf03@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k3GeTzjyPXiwZ4uz"
Content-Disposition: inline
In-Reply-To: <928b2996-b2e7-d847-0e20-7e19df3cbf03@kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--k3GeTzjyPXiwZ4uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> From the original code, the first mechanism to a recovery is to acquire a
> GPIO for the SCL line and send the 9 SCL pulses, after that, it does a re=
set
> of the I2C module. For the SOCFPGA part, there is no GPIO line for the SC=
L,
> thus the I2C module cannot even get a reset. This code allows the function
> to reset the I2C module for SOCFPGA, which is the 2nd part of the recovery
> process.

The second part is totally useless if the client device is holding SDA
low. Which is exactly the situation that recovery tries to fix. As I
said, if you can't control SCL, you don't have recovery.

> > See, this function is named scl_recovery, but there is no SCL involved.
> > This is why I think there is the misunderstanding here.
> >=20
>=20
> I understand your point here. Perhaps just call it i2c_socfpga_recovery()?

No. adap->bus_recovery_info should be NULL.


--k3GeTzjyPXiwZ4uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKzdpIACgkQFA3kzBSg
Kbbenw/+MKIeOGi3aN2VFP3pJ8kgOpg4sbGFw9tClUx81LHRgs3VAxoZvDE2TIj7
wmOdoSflUKsUURKTcljecE3u9Mw/vHIPKKsBRN/KGdjvReXg+JUsAGqnnSWLFBzg
iLljZX0QyxtM4gjbIacARiSIvwm0xhqjbI8cyAE08juIFO6/0JNVdzTIE5kPLPOG
2Poz+79wckBg4iIV6SA4SrEcAb1HWHrQGbx41SRNg5421mbIzUrvqzmwHMRtYphL
G6FSQAaO6d6veTovNznqj3p4XqM7I7DwhZrw3vefQjsuIio0sKzpj144Y0A9glVP
A8eHtigSKFevE3OqsFuy9zyieOaLp/+9HIO4tGFz6iy58DFaqz3L6en2Yx29EUKi
3VjppRzYnKMftAkN9a4ckkGPWMsWhWHzDGZev5nhw9VNYXqGeHksadrG0ii4weft
gQ3JGdryUenF4O7xxWooRvOj1In8Aoe6RZj+TQxBRjuB2CxYazPsPKXs2lfWUI5a
Vrhqm3dyq7jsjTN0iO5CcZtwaMNw+1TgvF3s5kMSs1O1YFahrA7v2Dn0johCN0rX
Kc7fJEnLktb1Ul6ovrnSKEWbGDuSsdnB4mqTlHK3OeahO4v8OGAhetg0HKvu8zYp
Az8M/8l3eDMnEIdA+MtqwGEnbkxxGmEXuRnba2vSm2XdS0ZnMb4=
=jG7j
-----END PGP SIGNATURE-----

--k3GeTzjyPXiwZ4uz--
