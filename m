Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96B734C943E
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 20:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235354AbiCATaF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 14:30:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235057AbiCATaE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 14:30:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EB8245789;
        Tue,  1 Mar 2022 11:29:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DEC5FB81C00;
        Tue,  1 Mar 2022 19:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0ADC340EE;
        Tue,  1 Mar 2022 19:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646162960;
        bh=uNrsfjrvwxmS4fwU6brFrs/8dvSzhgafz38Pv0bO1Wg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=odbmiyXgcNFBnO53zdYtqp6fuu34H7vuSe/DmFIDD8CdkrQKubApQ3GL7mF9LjbJI
         etWrcr9uo+b6ekp/vdSATrxoLCOF3pGmbNHdGbG3f+ko9pf/o++GPZK/W0ZBhMunUe
         nzquL8kbd/1m7cT9krZMg3cJ6fu/NkePrYn3titjWmsOCuceRM+sS+W3KAp5HcxHhC
         6Dr7vkEhzrKEp+rSaZdtJWnifIHsoly9hPZDwS4bkXTHPxji5zjA8/pzqmMnnDGqUs
         lI1zk7VVM8UI65qVD4hlPt+5d8CdJOdQTIVMVYFHF8nqRf2U7+woscOKgYoJtBOk+X
         5NJXoaiuIJcdQ==
Date:   Tue, 1 Mar 2022 20:29:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Raul E Rangel <rrangel@chromium.org>, upstream@semihalf.com,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -next] i2c: designware: Fix improper usage of readl
Message-ID: <Yh50DUUYXRMEIua0@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Raul E Rangel <rrangel@chromium.org>, upstream@semihalf.com,
        kernel test robot <lkp@intel.com>
References: <20220218133348.628962-1-jsd@semihalf.com>
 <Yh44rYi6m9csyF28@ninjato>
 <CAOtMz3N+wv1N_VmN-iGx0AeptvgYKw47PtaTv73CDqHkaCKMtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aHBu2wCgS9t/xhcV"
Content-Disposition: inline
In-Reply-To: <CAOtMz3N+wv1N_VmN-iGx0AeptvgYKw47PtaTv73CDqHkaCKMtg@mail.gmail.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--aHBu2wCgS9t/xhcV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So actually I've already added myself as a R:eviewer for
> i2c-designware-* files in one of the previous patches with the purpose

Ah, this is perfect then. I was only grepping for amdpsp, so I missed
it. Thanks for the heads up!


--aHBu2wCgS9t/xhcV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIedAgACgkQFA3kzBSg
Kbbqgw//YYPl9qrWmVGvIzu+FySDmA1/5MwonKQv4nwS7a4EYSUDOvQVbPtOh2Yx
MxG3NMTGiPX/yJfRWKQXYG8GEGV3Ghc9cuzR+dTebepkJZh3/E+0PPmEbyItVQ2r
7nopuiZ6UpOWd3KF8kT3kEh5ewRXokdzb3iVGURwX1MfIT9/mYczox6HelNhgxMX
d+f9MeZDbuuCdxuv7eL8B9pxoP+vAljmAOUnrw9DqIE6tkHjppW2OI9vMB42vjZJ
09r8+3/vG17B7DBNPxSzEnNYQcVHCPBfHziRYnXQGBFj67S7QQWMyg+MKc0IKzjt
/tpQJYFvxhqRklAefP0mSY6WMLvUUfy3/MJbrhphW9ypDIf+t5nwALhOAwBkZ+4p
JH4rMYV/SgT1NMatSLfcfgFSRDMjSXzly9S45C7DFjNAK/gGW3A4zDXnGZXhgr5/
zpsbqIo7cgh3wkJUuBoLO5fZeacGYmoY0rvCLq7+JxRFQhzTEutVaTQC03oodTeu
0OHhrSyxqJ8j88eOOrqmw9mTVe6pSHWYpzXn6QhUczpisDShJlunaSzbIYq3htgs
H5Qxm+aKKNjMQo8FD9hkSNjc7JzA0EmyRQesSuekJMk1UXxtCOkn08Ga9Cb39TRf
ok8mdEoujDmEcjRuAkgwXQ5vYYYnUshnAVKXsi0UxdnrxVqExEc=
=hOS2
-----END PGP SIGNATURE-----

--aHBu2wCgS9t/xhcV--
