Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 808315F2067
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 00:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiJAWnz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Oct 2022 18:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbiJAWny (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Oct 2022 18:43:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613803AB2D;
        Sat,  1 Oct 2022 15:43:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EBE8560D34;
        Sat,  1 Oct 2022 22:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A714EC433C1;
        Sat,  1 Oct 2022 22:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664664232;
        bh=1FGwTriCp9nvACL+x9RNnCaglRBpjf8nxCV7CfXWQD8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fgQaqb817EbW0kRzNpJ1E3W4eIRqstkXEFfJdrYMC/MlCPFHZH5o3Gl8saRJ/hWKQ
         6RzF7YHnfzmPTzJ2Sqxt+QeNnGyZl5PXok8lIu3nVxIZ7ZT2ztH7xCiq5QAKxtTESU
         UC5Ga2y/ve1US/UAcN1Jfd2InNIn33RQRAkUlXx254Icdp11DRIUKzFs+UX5TYgZa+
         MtrSUAih3bnn6qSj3Dkl/fwIujoZiGBIjWYAfyrAN59eSddzbXOUtF1FyInv66PcA4
         jwOvhYUQCiTblU1u+9a99eqZYUhJq0jwJW5OnhQQPE0Jnu7J3sKUUE1ClCxgT9Nc+l
         tb37cRVAxxbrw==
Date:   Sun, 2 Oct 2022 00:43:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v2 2/2] i2c: designware-pci: Use standard pattern for
 memory allocation
Message-ID: <YzjCpA+O4sudZA/2@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
References: <20220929094215.76236-1-andriy.shevchenko@linux.intel.com>
 <20220929094215.76236-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6am/FPqihIaYu2uW"
Content-Disposition: inline
In-Reply-To: <20220929094215.76236-2-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6am/FPqihIaYu2uW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 12:42:15PM +0300, Andy Shevchenko wrote:
> The pattern
> 	foo =3D kmalloc(sizeof(*foo), GFP_KERNEL);
> has an advantage when foo type is changed. Since we are planning a such,
> better to be prepared by using standard pattern for memory allocation.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--6am/FPqihIaYu2uW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM4wqQACgkQFA3kzBSg
KbY9EA//XQSp3O6bSXVMq3Wvk82834Q/b4HGsoATlArVNdMFbhRFks8Ne1c9U7zs
il6spVGoq55jRBkumQqPg7W8196Ln6cOJ5W15xb+4kHKbff+jJDjbW7puNuEWAEe
FDHjU2G9Gah4KMqHqIT/W0s02gmC0wq8bwqwkVzaoD8NwhppqCfLjvOuj48KgLWQ
giARLNXGk57vsU77NORbipnX3jefn83aWZrtn+UzGqBiti85xqx2VR1kRYl5zxNy
nm6IJ81wa7VRnrYw4hJkl5nwfMZl7+1F4N77Ko3rgSSaL3CQaIgZ7T5VJhx1uqAM
qb7uaebVJdISTxpgCOgI3KUuWrz8X7A538q0OBLkqI6gBl1BRmt+mNpe1DVbrm9v
Mu9B4hqAVzXJcegRPaByR4PdE/vrvih+MY1n90LXcjE3EKsnzUJwppnfZKZ6HVrp
kgDW1y6KlQ9LOcoLINnNBZXF7bdrqOkStbApuhCSQbKt6Md/YLug0fIkhmHACYF1
dhCmpN/0SXFHqeqxaKexcx95TWm4uCl9uVJAx/R7ko8VSrk1nF9E4JzXKVzjN/Wv
leUTsEEw2oGmCC3A7BdE8CCklLjMMApS9SkjW6yr8tHmHhjLWYxRT6XQ+s4fv1DQ
FJhzmafdmou0uf3E41TI/e6dDT2Cdxv8a6AAp2idAYcXZ7QGcpQ=
=RnDD
-----END PGP SIGNATURE-----

--6am/FPqihIaYu2uW--
