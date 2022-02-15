Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6C24B66E9
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 10:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235604AbiBOJE2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 04:04:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235638AbiBOJEP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 04:04:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EBEC1160D8
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 01:03:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A6316616AC
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 09:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A26C340EC;
        Tue, 15 Feb 2022 09:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644915827;
        bh=ms6y/d4kcVMsv3ZfGWa9A+ZubNs8Bz9KSyW7HRONhDo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LthgolgxpYIWWbRq3/XIPARDj2iRP9A+4Glw36gZCRrbUmb4mEap4ZTWu6fV31+1S
         WGIsXRShxaKAZSagCjqVUerogPQYUmKv5cHaFSO6iYIzQVObOSGtWXTeEnPQtRLBO3
         NdIkv7zkKXEenBPaB+/5yq1o1J3Jndc0q3n8tTyqERN0JFCFSM9axj5B/Y4Y2+0el7
         TVcGvgWz9X2qvytBK1DJmizGgXcvSdCrrUWXQ9+QTSsWJgkxwEcC2fICszs9APuAZ5
         Zyjq+4mSVmatns3/lQY6XS2GGPqAOme8fRung5HnYFaeIn1iRdzaAgo5wTG1r0sI35
         irsYtHyZyjz8A==
Date:   Tue, 15 Feb 2022 10:03:44 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] i2c: i801: Add support for Intel Raptor Lake PCH-S
Message-ID: <YgtscBCOOD7LwEAO@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
References: <20220211150001.1004004-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hh5XXvdKaIXJV6pC"
Content-Disposition: inline
In-Reply-To: <20220211150001.1004004-1-jarkko.nikula@linux.intel.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hh5XXvdKaIXJV6pC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2022 at 05:00:01PM +0200, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Raptor Lake PCH-S.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--hh5XXvdKaIXJV6pC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmILbHAACgkQFA3kzBSg
KbZQQw//Q0r1BH6PxgBqLCKPmpggJ2Zxrm0HdclxEmhNq2FDQ8uXlDMuTDaRZUGH
8wjjFqQPz0CDVCZhXSXNmxNUs9Ex250ZhVugKmZVOs/W8dNtAgM4MGxwRYOG2qxA
EWo3ki8wHZDUwtvxkCnV+dUEH7KfafiiRptv7VW4HyLb0sj9Qbf0EZAZYeNAmfvS
4mS8FvaPWlgFjvoTA5PWzpG8xV0WiKGiWLJiFhSu8EKbg3uG/yrry2Sst3X1tm/a
79yfJQ1r6DwHb3Y/SeV5z/u6OtxFtgtm3oghGNwCbJslPUSceprrLhDBPX1O0+LG
mQ2uoINbNK0YMtb+OMQsS7xDhRYQn3VqKvcCOViRpmtWL3mMkVp3Ys9U3j1Q81H3
zRo8ap9/jCgNWey7CLtGv4AYCbucPl3TcNfd8Wp7mRGrrwxzfFw6nfaS7LLBCfEp
d5tmZjKy6/u0NuHDXOZB/YGLa/jjKTpXCETIC9xnErPt/cejw6OCCf3qYMKVY3WR
fEUjROIKwl9N60tG6P+fIrU0AijLmd4FSlraWoeGRVzGeA215FUb0zg29m1jHy2E
HE15g5OC4LISP8xTxwkW353VLLcox0yAXII9UVUCvlvcp4nnAuTsgKgUgIWHM8UB
WHf8LLGjkcEqORLgOgjcbkVHZ3E8YwpgV9+1jY99rzmKBn8pYUs=
=fNLH
-----END PGP SIGNATURE-----

--hh5XXvdKaIXJV6pC--
