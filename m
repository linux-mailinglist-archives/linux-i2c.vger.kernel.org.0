Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB70543D13
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jun 2022 21:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbiFHToI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 15:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiFHToH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 15:44:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4191D301;
        Wed,  8 Jun 2022 12:44:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8B9B4B82854;
        Wed,  8 Jun 2022 19:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DD7C34116;
        Wed,  8 Jun 2022 19:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654717444;
        bh=Att+LqdhkR6w/JyFVjxPin4t9B1Qqk8zksop2M3yoj8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nq3SaUPBWVYNiopPrkgm6eDiyhlBOZsSTK/5xx78esOq/woDQckQdcj8P+q6ufBj+
         7rSsDrEMr+9BSDAarl4LD1DaDJu+3TukkqouN0P9vt1oz5Nq3Sbgh4A/eUfKEY9b2u
         vXFCftlrH1lGKM6CGqOUArXSc+MS2tmmWrwxhkqtbCZ8x37SkGQAsEczSKxlRhBQ6q
         qGflCyw3mGK1URxVSRl+fv8zHRNUZIPL9HNXJgjfLNCDiB+MpwbQF9uwLWU/t+Zo4+
         CBoJVx8ufpjQ94+VDKRxvHEO5kep9XcyodJO67+77gozKDv5Ts/1V4K0AyVVwtjczM
         ma37tfySR5Czg==
Date:   Wed, 8 Jun 2022 21:43:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        dave.hansen@linux.intel.com
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Update Synopsys DesingWare I2C to
 Supported
Message-ID: <YqD7/3e03Us//r9W@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        dave.hansen@linux.intel.com
References: <20220530120247.70582-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="njmDEJOs1bnqM/32"
Content-Disposition: inline
In-Reply-To: <20220530120247.70582-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--njmDEJOs1bnqM/32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 03:02:47PM +0300, Andy Shevchenko wrote:
> The actual status of the code is Supported (from x86 perspective).
>=20
> Reported-by: dave.hansen@linux.intel.com
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Fixed typo in $subject and applied to for-current, thanks!


--njmDEJOs1bnqM/32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKg+/8ACgkQFA3kzBSg
KbZacBAAlMZzFnT7WhlvQ4sADHG9K3CvaGswKJQ58EbAvVFiIsvxSLBx6Hpf8WEb
9ZVhrBiNB87WRx9EvOxyV3t7DuJZBznCUo9RGzQQVOageYz79MdfvLbwpg8sa00Z
keCkbzYYGQ8gV6wCc+gD34lX6eBvmB/esq39Nep9YXsFhEHLd+BVBUriPkaGWd5t
Mdu8UuwLR3HvvyG8sUy5rzWIpCbkigDDfIVc7OV8lwNpItjPcVFSvbwzc6g02uvm
yMxmnLV0bXcTmPMWelMIjHmT8zPtoW/VgAAOa73fjPzdfSCD6jEy5wRrbfHYbj4I
caPHHgnGfculHnF0wJWVs/FMi+F9F8NspWOe5eHMaATm1uS6Kerpm3iICTDXWIRw
hWSz9e8pnThIHqsZcLfIgpe/X4hLHKKQlpxtvr1iJ1RQHBJ6Xko3b8HgEnshO1ls
Cg7XVrSVxyjzTUpgvQ4kB/qh11szghDYsmCT2fj009Rlj6pt3Z4Fertim19p8fR/
jlwhova2Ydcz61/cbxO1IlppfdfB/Hrtsf6wk/f7jwHiYSw+1WG2snBwRbbElpxp
jEAGWBTU5pVLgn/ntDbQPmUL4YiR1WMrVp+dUQyhFbNmLsSZDEVHJixeCIygW0y0
faSLS9p+BZ8KTBdQmsbr17X1fLKkj8ZahsCiTHjDEBqi6AcOn28=
=1k/a
-----END PGP SIGNATURE-----

--njmDEJOs1bnqM/32--
