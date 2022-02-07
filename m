Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B3B4AC15D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 15:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233926AbiBGOgg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 09:36:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1392281AbiBGOZy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 09:25:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A4BC0401C1;
        Mon,  7 Feb 2022 06:25:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 070E6B81366;
        Mon,  7 Feb 2022 14:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B21C004E1;
        Mon,  7 Feb 2022 14:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644243951;
        bh=HLHC5kYlmgiVol/HTCLPWA1+tcHtue1uHj+0Zm9Kz1E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NAkKnojlf8nOcd1zdvJG269h4VvgoS1tx2eMVLVUdq1KehG9ijhMcHmbPFGnjmwQl
         icebgXXfD0D3+32WbqQsxkIPFw9mdVH+Ei3Cdvu97I5IGXIcyWVge/rL2B7Az2a2wd
         N38P+BuKEUrZx8gmzHroUSIynEe9ebi+4RtcwV8gSJB8DZyNMHIqqU7atRxjPXpjJG
         k4uTpuAbIvL1lZaiM1eMkOvhg9PKRB8HoO/Idlfw8lr/fcEVhkmB634Q/pJAEWu7n6
         iGa/8qAVi+3IgtpCXk606OjwsW6PhX0LV+c8nK6skgmfCSUxxtGLCOFtz12lKyQZ6w
         9OCuWpn8SXUDQ==
Date:   Mon, 7 Feb 2022 15:25:48 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, hdegoede@redhat.com,
        rrangel@chromium.org, mw@semihalf.com, jaz@semihalf.com,
        upstream@semihalf.com, thomas.lendacky@amd.com,
        alexander.deucher@amd.com, Nimesh.Easow@amd.com,
        mario.limonciello@amd.com
Subject: Re: [PATCH v3 2/2] i2c: designware: Add AMD PSP I2C bus support
Message-ID: <YgEr7LtUAd4QWiiR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, hdegoede@redhat.com,
        rrangel@chromium.org, mw@semihalf.com, jaz@semihalf.com,
        upstream@semihalf.com, thomas.lendacky@amd.com,
        alexander.deucher@amd.com, Nimesh.Easow@amd.com,
        mario.limonciello@amd.com
References: <20220120001621.705352-2-jsd@semihalf.com>
 <20220202144302.1438303-1-jsd@semihalf.com>
 <20220202144302.1438303-2-jsd@semihalf.com>
 <YfqtkBIZZxp2Au2l@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SIzHU/GnM/M7r84T"
Content-Disposition: inline
In-Reply-To: <YfqtkBIZZxp2Au2l@smile.fi.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SIzHU/GnM/M7r84T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Side note, please start a new email thread for new version of the series.

Yes, please. Also, neither me nor patchwork got patch 1 of this series.
So, please ensure the series is complete when you resend.


--SIzHU/GnM/M7r84T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBK+wACgkQFA3kzBSg
KbYrsw//fiOCfzLwTF5MEYmWaoK3l/DgNzthdC4XSU9gf+fwP10TYHRCT0lPAvVY
lkXBNWrBOqXml78l6XIhQgHIaYkGYHYu/658IUdxBn7YR4VgInSQsYMUzA+hbY3G
ZG2bgttBXL5rQ6vWl++kB34W0wyNhDd5G+FGFn9HK8cHpAntzjFFWyaS4ZFXFLeQ
FFHHTxfAaDITr2MqEoE3OBc79bCg6uZ+JSeyqKzpxYDL9PhkNb5htEr+cgs159UX
GAIlDSPFYOtbvG5y3XWsWiejcSTaWFjDX6v6l02y6Gv1JmXpsXOy+mvif5qlpBTe
BLPd/Qi8CDW9xLiJa/9JQtEb3zKyfFbW1V6Ox3O89zXk94T1AWV7PKYYksRajDi7
K7nzSCpEF39mxKhNle+Zrr+DFF2u+XDm1zE4bTj41LYgI6WW7lnZI55lbxU104Xv
5XHz42qV3XwqClDBf1FmSPmI99OSWVDH0AGMgs4Qf1pwKGQzfiIE/VFTeU+6mlSX
i6qRwn48EX/8tp9p9RJfou7fwcFmFJCdvBFB6QBTmdFxcfkvPsBqhqe4tZWppFd3
jAtFdua/qlD22T7y860rk3a+xxOrSPG8HeeHtv1/Y2KhbUzuolnkQQu8c4IK5+NT
GIOd3FyH7uoJRXYGqer7FgWWxhXtFNXZEIeJQszRk7nk8qjT3i4=
=BnQ3
-----END PGP SIGNATURE-----

--SIzHU/GnM/M7r84T--
