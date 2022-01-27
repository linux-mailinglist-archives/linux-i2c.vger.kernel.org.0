Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9D149ED75
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jan 2022 22:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344375AbiA0Vfh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jan 2022 16:35:37 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:37872 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344382AbiA0Vfe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jan 2022 16:35:34 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6350FB8235A;
        Thu, 27 Jan 2022 21:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5E4C340E4;
        Thu, 27 Jan 2022 21:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643319332;
        bh=ZOy4cVJA1BbVLKHYo7U0M4xJy3LtHwHCgHuQBsugCEE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MkqdQm40rU2640o7ii+zKdxu1PyVT+dnjNDKb31tlXi69hKooYzZVjiM6SQr0cQaV
         hty2UXyrlyz3BFhxjLMfMe9uVS7Yx9f+pU4ls3IDI+9et2W5yGp0A1/2U6SUSfTLZX
         FfWhg3ckFL5hDCnEKX9ONzdEBc4WQLaWjUnrZyJiDkGViAml2dnjxT5MJdM/BNMLbj
         T55CcdqTtEE/Legh2uGmcSvAD26QNjTbCoWitUsT9ExVL8kXDzWO3kpw+MOif/PfeP
         NmMbEmvwWYZHjpff31iPkPp8A5nBtTMr/JEp/dyJi9gfwMED5oMVG7AuwNIV8Xh5Cb
         BTOzMAwjQN5Qw==
Date:   Thu, 27 Jan 2022 22:35:28 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Robert Richter <rrichter@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        sudheesh.mavila@amd.com,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v3 7/9] i2c: piix4: Add EFCH MMIO support to SMBus base
 address detect
Message-ID: <YfMQIERpNPUtm8Qg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Terry Bowman <Terry.Bowman@amd.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Robert Richter <rrichter@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>, sudheesh.mavila@amd.com,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
References: <20220119230626.31560-1-terry.bowman@amd.com>
 <20220119230626.31560-8-terry.bowman@amd.com>
 <CAHp75VdtnOuBK1ctkjO59vujopCrQ+MQ_LyBB+Mi2HJk4HaJuQ@mail.gmail.com>
 <67071cd7-b1b1-7647-3090-365b45b3b1f6@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EYvDka3TInQc7Mtl"
Content-Disposition: inline
In-Reply-To: <67071cd7-b1b1-7647-3090-365b45b3b1f6@amd.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EYvDka3TInQc7Mtl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'll leave as-is if Ok with you.

Yes, it is OK.


--EYvDka3TInQc7Mtl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHzEB8ACgkQFA3kzBSg
KbblYhAAprdLH9goT16zYOlebtVUGbzdVXBxS+AFY82JBO+svDGPAq1mvKgTKEFY
x4EobR9aVGdWILLXVK7T4YWE8vgH00U7JRDJE7+rYpRcAnQnk4x0j7G59wyMon+b
D3yHeSduTgECgg5pUFb1Eeds9gXLfqwC8OhM5oZoxaG1o4fnp32wudg/uFsJrnBZ
pGDOZc7vctlyeJF129Tuhb4C6L67EqymZLHLIgzW8fs+J4CtyEXPeaP4mpEjSfd2
D9iWNfmlcf4n2Uc9xYN6CKWQkrnTp6pj1pIjjPoJbelRhLhVrG1dXr3Wrdpm6V7U
3ucnMpF/cCZeepNGGdRBv+RNVwX+kle8pujN/jBhiZghsNy9V3K50jm+xAV85gGI
2bsh11kZsBmzijOudFgW0cDUyi6Re3spaD9GhaSk/+FqGL5SHNWMxvlX3S+LHmrk
Mrnq2WI5Ih68nEozYL9S0V+CRa08avetWtzPevqT3J8OOB+XutNIV94jtbygHvuB
fJY09pYIs1QLjgBjBF8BZEo4YM7H4/gCAfhLiXwYqHCsn0U0dw9GaCNsjJ9tV8oV
cL2uDE7Y+lCHy1m03niIOc0EcO7m6XWeDj9v8jNZf6jq8X3M0BIuysTqPhScUy33
MNC5aEfWLRCYeM7QVLemmRpt7yn6d/3sCrkQIFXowcwuJVNpN74=
=u+ce
-----END PGP SIGNATURE-----

--EYvDka3TInQc7Mtl--
