Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 108B14DD8A1
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Mar 2022 12:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235585AbiCRLB7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Mar 2022 07:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235572AbiCRLB5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Mar 2022 07:01:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A662D7AA7;
        Fri, 18 Mar 2022 04:00:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 254266167A;
        Fri, 18 Mar 2022 11:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0747EC340E8;
        Fri, 18 Mar 2022 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647601238;
        bh=3mi/n5McmbEsHpxK2c8PlaiFTLtjU6PteuZdaFFYR/0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Uh/VuSbeR4IrEW1j4rNBPJ2exbSEZZOA9uL9uMZnbRxXNtwxKoVuBS7NmaNM76aXE
         hDwmc+MvGca/qL8laaaszVCsWowQj1LItOGax7QQ9YKak5mRgrTizxJVBAtNNQ1+qe
         45kDiZwebc6MVFiC3ah7bbJFVNmFc7xiY9jGFOlvfngSLZ+rm4BtcJWcWmzKPINFpM
         WnDpVWw+CICyxlNg1F3TPKxwTPLkk6rTvoNdhWUzgoxC2YwawhNhX5CIhmofAQgGeB
         1KWZWhOoBWdF+57VywdVtBYI7YCtpbUDJ5TOkyvbeuv1tJdm18aDDNIL4+T+oKB1XD
         wQsyC3udsY1Mg==
Date:   Fri, 18 Mar 2022 12:00:34 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Message-ID: <YjRmUokDFPezGI5B@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Zev Weiss <zev@bewilderbeest.net>, Peter Rosin <peda@axentia.se>,
        linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <ae14fd3c-2f50-b982-c61c-9db3bb28c809@axentia.se>
 <Yh1O6w56zsNtNRbb@hatter.bewilderbeest.net>
 <f3c56f5a-6a6b-039c-9fdf-a994d054645d@axentia.se>
 <YiAPKGSDJrO+MxLR@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Hah0JhUylLqwqRmo"
Content-Disposition: inline
In-Reply-To: <YiAPKGSDJrO+MxLR@hatter.bewilderbeest.net>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Hah0JhUylLqwqRmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Can someone give me a summary What is the status of this series?


--Hah0JhUylLqwqRmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI0ZlIACgkQFA3kzBSg
Kbakig/+M0zq0PwNLJzYw7Eh1eBJH5P441BTGTBs/b+eSb2l9Px4RsFpbzKUss3f
OPuHiKtNcbCC5WnzrhR0YlRVzk93QERPdchLvUDYyMK0RfAIRNTDMzEy3rphVvxl
Ab/WQ193r+fxUrtJPmgIs6HZl/WFvh7ll0W3eYpUbSBN0fzMu0OiTdIi7aNwJqPF
xwktlpv6fsnLN3MKf+l0UW6wTXzRHCndSUWpEdXiG2rurDSFnHksKq/+ac0Plvn1
W6vhCayfaohwCiJMFMk83ytP2WUAnGX8Kil0X1BBaFxVq2GvYB1cpkQ9Oxhsmm2/
TD7XCVMUWCupTFsAp7OFhpfSgbs8jAFH9hIRYfjfLfZEyrOpSEMJGFTN8/n38nqM
mZewiE/OKRRx68sy2YVUWIjOB8q9yGuvYFalSxzALYcxVIw075CH0dAjq0zWPl9x
91YIXM3eVFSyyB5Mg8QK5kGgnqSHb83xhBNlVNyRSnS9+mzoHZw867dW/bpBTn5/
3sJLmzgyALXe2E7CQEZuqOHO7Zt9cpdVBxPyzu7WBPOwD2IAMah9ymOjLrs81B59
rUotjc6vqrcNLr0imN7GUMvuecr1U604eCyUWhD3lZJcY0PZ69fP2SZxL8NZLnHp
+0G8vt5yrjH3T3n2zc8cpQ1CndtPL5kuZwOR8wDF7ro0jvTTpOs=
=sb+n
-----END PGP SIGNATURE-----

--Hah0JhUylLqwqRmo--
