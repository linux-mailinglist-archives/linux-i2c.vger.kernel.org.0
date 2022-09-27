Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D926A5ECE96
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 22:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbiI0Uc2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 16:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233024AbiI0UcZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 16:32:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 339DC83067
        for <linux-i2c@vger.kernel.org>; Tue, 27 Sep 2022 13:32:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CDA0161B6B
        for <linux-i2c@vger.kernel.org>; Tue, 27 Sep 2022 20:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913EDC433D6;
        Tue, 27 Sep 2022 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664310736;
        bh=1C9qBePYv3W/Hu22VrxVF9R5mlCEBGJ0wjiRozsx7LA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Co30iNgKdVCq/P674GuE2vHcR90ioWZ25aZisV7vFOB8amxlqGU3CkiEafxcv34oJ
         jfJbrlyV1QOMu6lZw40PhSwlCTf1qWAKXbiAvXB+NhHZMkB2MvVp2ef/Jcra2h8NA7
         DgO+ce9FtveQFgEtAibcAFzV0Zkm/FNnf/NzpKg+yyQ9Np4ekJP7nVdVljnE0ASxBH
         zECYaaG0DL1L/d7RNHg+Sc5klcHISajfkm3wBYeZ9Suhqg5MeXFe8pwUi4CbnDJsDS
         NAhwrkW7ow/oPowF/UzOvCCEFbIx0oGeZ+VpVgLfFOOVdtD5VRnemY0SXZuuy0eqII
         Q6/okd8kAS6bA==
Date:   Tue, 27 Sep 2022 22:32:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        git-dev@amd.com, Chirag Parekh <chiragp@xilinx.com>,
        Robert Hancock <robert.hancock@calian.com>
Subject: Re: [PATCH v3] i2c: cadence: Add standard bus recovery support
Message-ID: <YzNdytanT3dO1eai@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git-dev@amd.com,
        Chirag Parekh <chiragp@xilinx.com>,
        Robert Hancock <robert.hancock@calian.com>
References: <20220728055150.18368-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qg8Ik5bv6myv5j7D"
Content-Disposition: inline
In-Reply-To: <20220728055150.18368-1-shubhrajyoti.datta@xilinx.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qg8Ik5bv6myv5j7D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2022 at 11:21:50AM +0530, Shubhrajyoti Datta wrote:
> Hook up the standard GPIO/pinctrl-based recovery support.
> We are doing the recovery at the beginning on a timeout.
>=20
> Multiple people have contributed to the series.
> Original patch from Cirag and another one from Robert.
>=20
> Cc: Chirag Parekh <chiragp@xilinx.com>
> Cc: Robert Hancock <robert.hancock@calian.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Applied to for-next, thanks!


--qg8Ik5bv6myv5j7D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMzXcYACgkQFA3kzBSg
KbYFfBAAgYfE373iMBLzJw2ZfTO1H0qTylxuf6qI5NbELcRfsEuFV69oUmhujVGU
1guRMQScGtpCjVxs0NxxcVGYdmtBeNDopcpfUaVKjSOlOId5vntXHqADlTD6UGWF
+wW052EyY6OkLzi6eJl83xrIdHWGc1wu9T399qUM2MdLmI3TKMN73eraV1WtFjMJ
msSGvxWwS4vteYBxoRfPOTS+Pqt+nXkFZp8kYscYqP3VoXpSOu5BSWFDQbjQrPWe
bpImSstTq8snwHYg02uX/x76kuLwdOyLVAmgyEUFjPEDasD/3SZ//kkWhVaf9c0C
Jlqyvg6r7WUVNrVYaHcNGNgU/6dTE021B8/2FRPMZr5iIEfgQvNsNnw0yHiJsezj
b3skd2v6bYNtbVO5nIHpZ6VKpw/f+Hyh9NEHabX+GpEfhp1aFtjif1vYfw1lBzF+
n9q0Grh+MBNzkto5FwDGszJxQYqcWU65beLXfWQK4Hy0CEe6D83nLxuEb25penRl
hAbPd/WMOFtOs9PGjeaSq6qikL6+JLa50ogBccQqI0zggwhsZLHDnqZMGWP56Md9
23m67jVst9q+jh+I84sMG+3AnDicSL5zpjRw8Gy8XTig4Cm1Ep/uPKP3n3emQouP
3dJXYrQAp7AamgRThbn2iNMWOHiDo4SlI+OyczYpAoFGldPTWh8=
=+N1h
-----END PGP SIGNATURE-----

--qg8Ik5bv6myv5j7D--
