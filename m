Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06AE473084E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 21:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234541AbjFNTf0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 15:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbjFNTfX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 15:35:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9357E4D
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 12:35:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3F13C62984
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 19:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3C8C433C0;
        Wed, 14 Jun 2023 19:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686771321;
        bh=oqaI9JtfpEcVNz6SVP2Rw+voUVIqdiAJITLmJVgRRHM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tz33cnUm5sfMtvpTmtsjQqhCWxfCr2/EGa7N3I+dHQrn0DUJIHY1Jk1sdYGYcCWr5
         VkXaKecY+9r1FPBII878wosetzNd7sSJIs3xnK9KkWfSCMZ0/HHI3lnxVdtSIMbu0M
         IL/UlRWLyOBgVKbhfv5+gweCv/Nak6BSkymlVj4W4/heYYx87QgtLKfRjKFMIzyvGd
         GWUtkbsy9GR/AWsQFIr9/TJhzbl4MOMgZZDzxpLI0TxyG/xzNft7nc5xBdRwuqxLtp
         wkTt0JwFul+H/JKtE5BMnGFBcIDKKVDLOPUI5NertDBRzSJ2X/YL9np5zuZd3ywmrs
         J7fE6ecH7S6Zw==
Date:   Wed, 14 Jun 2023 21:35:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Paul Wise <pabs3@bonedaddy.net>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Update links for https and changed URLs
Message-ID: <ZIoWdSZyG8FgBj63@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Paul Wise <pabs3@bonedaddy.net>, Jean Delvare <jdelvare@suse.de>,
        linux-i2c@vger.kernel.org
References: <20230526003157.60368-1-pabs3@bonedaddy.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s1+MkbpTclDsqsIi"
Content-Disposition: inline
In-Reply-To: <20230526003157.60368-1-pabs3@bonedaddy.net>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--s1+MkbpTclDsqsIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 26, 2023 at 08:31:57AM +0800, Paul Wise wrote:
> The read-edid project moved to a new maintainer.

Applied, thanks!


--s1+MkbpTclDsqsIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSKFnUACgkQFA3kzBSg
KbaRaw/+Otc5ODyelpzr6NR9ROgVEfrwpHTkdOTvWLDa2w9rlZfnvJwAeBr5DOwP
eP8mLnMQgLZCKHmncfTH4ynSFa7iPLJNGl6ZspgUelkQe3yqdfjQ5gwGIOKNQPkh
8jdmfpuPFxgoWhLH8gmIzKBqiGKEtfpm0ZIPRKnx56HVdBjfyQLrJHtc1i3C/TC2
oHYaBjJT6Ih9m7h2y1BiDSUhqqNGc7yam8l3FWV18btwTOTxza8eGv/Lw9q+Ocf9
khymrVpzF3WJi/Jwlep4CxBjWprtNwQ8d4VNYA7X6WqqCrgYGui93bBgJza6Nylw
ZbeswnZt9xppA4Y2/0gL9E4THZk8MVQ0tWOSaNAHOqRTWeAcZG93/6kv2tnMNG1X
j+qvXas6oRctX+pveTBdUZN8QHhbjE1NryP0sSlnknRrzIHlHVxlmDgpQEqZO7HL
KetMPNiOIWL0YK2Q1i+OJi++jHwiAmccmgSGqY55/ZvNl3N17priHyYs59SyQiU9
URD7Wln1jUet/w2DngF1HXTXmGDdkgn6MF2usyxBPWXZROVAx4TcLAhrOI/DGKS/
dN5z6Ep6XhXD0JrPnVZf9Ngu8PMXRRG2JXVC1duWNr1Bba3M0YKXHYTdRcUIKaaa
jdX9VXIuygFHxuEmsTRvTM3v+tI21hpYfmGbSz3G1aqsalXHQzk=
=QZ05
-----END PGP SIGNATURE-----

--s1+MkbpTclDsqsIi--
