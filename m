Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9538E4BAA70
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Feb 2022 20:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236922AbiBQT6R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Feb 2022 14:58:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbiBQT6R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Feb 2022 14:58:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C141289A4;
        Thu, 17 Feb 2022 11:58:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1EF2861D76;
        Thu, 17 Feb 2022 19:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00901C340E8;
        Thu, 17 Feb 2022 19:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645127881;
        bh=oalQTkWe66Sz6FegWOru/FZMiarvQZP3lDOvxiFyZWc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nAqJuyb6KfPCkA7BpJNdFjFIWRzwUrMnzKb2SBLomAkg1bA/ya4NNEPXe9GhYlHHK
         kr6sN4fUwmQGIgEBTjyp96CY2wc8ATUsn0RHp9+U2Stf+U/WsIodumxbM+Zg9hcOtu
         2VPQxTqSpbhcc0Sq2Wv3YMqdQR5HbUz7tRqKzlmJ42lElsWuyEiQdE/WG6vfomW3iM
         H26OmNpk0i/VPvZgSpV58o8BpZSevqzzjmujN8h/gN8OL0MzI6wn6IUVZ18ux2HjPh
         kOwzz4UVOfAktZID2rhIyznV+uiniR3EmMcdelQSshKJcgOVMOTElm9iVcqHcWV0dK
         NZ43tBGpQWbvg==
Date:   Thu, 17 Feb 2022 20:57:58 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/9] i2c: qcom-cci: fixes and updates
Message-ID: <Yg6oxrlQZIsJCkUY@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t4NivWcwK3gYw8cy"
Content-Disposition: inline
In-Reply-To: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t4NivWcwK3gYw8cy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Vladimir Zapolskiy (9):
>   dt-bindings: i2c: qcom-cci: add QCOM SM8450 compatible
>   dt-bindings: i2c: qcom-cci: add description of a vbus-supply property
>   i2c: qcom-cci: don't delete an unregistered adapter
>   i2c: qcom-cci: don't put a device tree node before i2c_add_adapter()
>   i2c: qcom-cci: initialize CCI controller after registration of adapters
>   i2c: qcom-cci: simplify probe by removing one loop over busses
>   i2c: qcom-cci: simplify access to bus data structure
>   i2c: qcom-cci: add support of optional vbus-supply regulators
>   i2c: qcom-cci: add sm8450 compatible

Patches 3+4 are already upstream. I wonder if patches 1+9 could be
applied to for-next also? Or is the vbus-supply a hard dependency here?
Patches 6+7 could probably also be resent individually after some
rebasing.


--t4NivWcwK3gYw8cy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIOqMYACgkQFA3kzBSg
KbZNPw//fv+WZ2UBn48Ke1DcG13kT9yp8NG0AiPh8w6c5QitPC4H2fdPoudqoqS9
A7tx8p52xMd2DBqQa2FYLs6Vb4y7Dtj2V6Oz6sAxtxkL/15ndZavrtEOdJ3zJEya
uuJOsuHhHWK5z7CCjyUBa/kZziOf0Acb8RzvDa3FhDe2+U1LmKE5guMKO/3It7RX
H/8RAswnpDlykcJU/HqcgbtmwaKrd2VKIx/Cj0YiaNJ7gUels1cwebonbTeclK/f
D3XpSyed2wG3ET1ExuV05GZQcSI1CZgJx843d1WdI56T3KIAqjezDn7Fh6SIns6F
zSkTmwm3DXUvoicEmUY/4XFoGV446hXZGp8TX2lVT3m7DVVB0rwLt3iOf8ltu9me
VdWaDupYhH0tg7poRDOEjdwaSv7iBds3lvaFX9Kuc1qQ1dE00xtH5zutTYP+ufeI
SDhxVO707aO+piXDZvcX7zT4KBDXYQgvjROjcGS74QfXleYNIlITNostcLGepsz7
AkcWJ3EHC4R+mwUxPO2MuI5TITKkGX5ergF7F4OOXTPB5G9J32FP+5pWdd2Khyyq
sVqwCiIOkysQlY9VTYtHR1CzWsJlloCK8/Hi7HLlT/oiHnmShtOAWU3K6aTe8+H0
rYBu5DZV0a42VbvnfAtHy6uy16g8TPE6xXUV0qPF+ikNTM5sc5I=
=tv/V
-----END PGP SIGNATURE-----

--t4NivWcwK3gYw8cy--
