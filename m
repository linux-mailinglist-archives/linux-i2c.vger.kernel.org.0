Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66AE8576E0C
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Jul 2022 14:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbiGPMqt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Jul 2022 08:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232140AbiGPMqr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Jul 2022 08:46:47 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 229A2201A7
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 05:46:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 8288BCE0906
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 12:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DF8C34114;
        Sat, 16 Jul 2022 12:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657975601;
        bh=TiHz76zACul4kFhDafq6vhKIw+Y6j31lhCCrTTtRo04=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UGgHLBPCRS3y4h2k37zqFqFh+Pp2Hrmc1DGFhSIF0j10LdAAi5T0e/Vc0Rw9PgtNQ
         iMEdB9yVJMiZ3WAYNNSRJ9WqKBCsYMiAvoJTSovXsqB1OlfC3nGJMPTBuMxClrAa8C
         fv2ZFDZlqhfS5u5ku8HuKUv9av30War+K2gfkudRuDEit14xrg5Osrf3HSCcCAzkDN
         Vfnp6N4FXQ7kBQ/ItsVHJuKnjGDFuXJoIK+zNKL6CTffRKe2sz/UQ3yM5glSAbIuQM
         2hn7S/saHPIG1JQgW94b+pf7oiQMss56O4AvOYKI0bjxgiI87eByHvYQlfbS/EfOVa
         yWMM+5UyR0ilQ==
Date:   Sat, 16 Jul 2022 14:46:37 +0200
From:   "wsa@kernel.org" <wsa@kernel.org>
To:     "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
Cc:     Robert Hancock <robert.hancock@calian.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Raviteja Narayanam <rna@xlnx.xilinx.com>,
        "Simek, Michal" <michal.simek@amd.com>,
        Anurag Kumar Vulisha <anuragku@xilinx.com>
Subject: Re: [PATCH] i2c: cadence: Change large transfer count reset logic to
 be unconditional
Message-ID: <YtKzLUtKwjfqOW22@shikoro>
Mail-Followup-To: "wsa@kernel.org" <wsa@kernel.org>,
        "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
        Robert Hancock <robert.hancock@calian.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Raviteja Narayanam <rna@xlnx.xilinx.com>,
        "Simek, Michal" <michal.simek@amd.com>,
        Anurag Kumar Vulisha <anuragku@xilinx.com>
References: <20220614232919.1372621-1-robert.hancock@calian.com>
 <BY5PR12MB490276306C7DFAD42708540681889@BY5PR12MB4902.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HimFNi+fvBYoh/ij"
Content-Disposition: inline
In-Reply-To: <BY5PR12MB490276306C7DFAD42708540681889@BY5PR12MB4902.namprd12.prod.outlook.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HimFNi+fvBYoh/ij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Reviewed-by Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>

Missing ":" here, so tools won't handle it automatically. Suggestion:
use macros to add tags, so there are no typos.


--HimFNi+fvBYoh/ij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLSsy0ACgkQFA3kzBSg
KbZCFg//fD63u+lQ2IeRYXfKPc4EA8ba0bKiTUbmPD9BTKlni1gXPo3bTzDP1SJd
r9Hq9hNcJBSQ5NLH7N/DGz/kNaO9d9TxTxBPmyQYluN0rDtf8Pu/IPWwlYLydPwM
sKLE1WcM95QJQfUGHFwqLPRBHvHADFkr+j6e5xrouZtEopeBbA8hvDQSn83mjUPC
dg/bExcvjGI7qf+Nui/iXluY6E9DECKRXiF66gM/COmoMtBVcu+qLtYuPhz51nss
tzMOA10egGCt3uv+nUCapRgPm6zcCCHinFFu2XwClH9KqHXeSYi9UIKwYjkhm72J
gvNPvFByGc/FFki2eudCBZ9KX7u6vlUtoI1v6dLPx5g/BhQKWAa17Onnp/ffda1I
/V2bci257csbM3fd5bnjJJRtXoHAwEnPvQVKZdVsp5NKWCRnEGNvHhkrGO6hPZPG
JrUvtWrda6TbbIH8udZAexcZAYSUsQXXFyJr7mYoxgDNmEvC4By6ce47Ne4dzJIX
NaqQw9IiBlrc2lorc8XlHPOPWafNVwtf8WDHG+rcT7RD1KH1xNLzQ4F7dsspGDu9
WM46KQtTFs3SJrgh1qpL46yWkNPpiPHzWSVTMbfttj+UK3qYQ1jCIwRRv67CicWh
BJhV9TwDDGSBxGvfhGzLRwMiRvj3AhNF9c5e2iv7VjERTCImOfQ=
=PXty
-----END PGP SIGNATURE-----

--HimFNi+fvBYoh/ij--
