Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF7534B2C0C
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 18:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349694AbiBKRuB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 12:50:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352312AbiBKRt7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 12:49:59 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B098BD55;
        Fri, 11 Feb 2022 09:49:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4B87D61D4F;
        Fri, 11 Feb 2022 17:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383DCC340E9;
        Fri, 11 Feb 2022 17:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644601790;
        bh=/MY7g7K/S9rPBg1ErgODVS3dd3Q0hPIO41YTsNkO0n8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gxjz0KIkERWVYXfMnMRSZCVUHbCk502YSRfr5xNjfwc1ZnuOmVe+3Jc6QBfMimFP0
         HtXDQUmYEER2KzgAWB6CVByBY8s1pfpCOeuP9A3ymAW57W1z7xrl1MYWu5xkbm0bL1
         cxIWqhe50YG6xKhcup2D025nwlZgBZLAKroFz2FedKkBc6rx/EocG2yCDrU5kfQgY7
         b39L0ADYpunXyq823VZrmEHZiRb9SXG0CXVUIMuJuWWk/XHyMbiBWHAR3mkKQnhyPk
         kD/66ILHAq7zSBY7I0wSR44AxE7msrWbOylfyXJ9C2CQJasVx1vdUK4haR5XrKHODn
         +8KumrrSfzQhw==
Date:   Fri, 11 Feb 2022 18:49:47 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/9] i2c: qcom-cci: fixes and updates
Message-ID: <Ygahuyi+/m8T/5cZ@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FeGIOYH7QYdC7GgM"
Content-Disposition: inline
In-Reply-To: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FeGIOYH7QYdC7GgM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> The new bus adapter specific bus_regulator from commit 5a7b95fb993e
> ("i2c: core: support bus regulator controlling in adapter") is reused,

Reusing is nice, of course, but I hope you noticed that I needed to
revert this feature:

a19f75de73c2 ("Revert "i2c: core: support bus regulator controlling in adapter"")

The thread to get it re-applied is currently here:

https://lore.kernel.org/all/20220106122452.18719-1-wsa@kernel.org/

Happy hacking,

   Wolfram


--FeGIOYH7QYdC7GgM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIGobsACgkQFA3kzBSg
KbZgbQ//Xo/4SYAPxhEcRML+UEkYT67KR/CaeIvVCe26KNgu6qFC/pC1wD+HBObD
nuOxQxe8JZ4qFaEjMctrdTGSU5K8W/JmLlkkxmPoQDL5N3dLRT8g25m5RtVGoVtw
O+9dauj9xsbpO4xabA4TpO7Zi4tdI08ZSUWATFOTLaP0I0T2t4cyQ1qRxC1ShbYX
mK+QlrAb5G96Z2lUwsCi/np4llaYSkEsElcHIg5xwJzmCQlohkHkgKMC1nwZ+S6j
kv/plvYRxcv7JXhLkvaU8LN+DmfcpyhqSGH/dOo2FZUo3nbCIcMkYeBET76kVDr+
ECO4MZtJaHEvQcZKqo/qqCZ3Ns91w3Eq4hFe0d70wA1jR/iy97QOXXwZiBZeEAQO
lwe37QAPjW28qGYSXxmYIJ/+T6/WGdvQiLVf27aaDifHri5loSV2NbCL3yLtHW9p
diUkLrMAQzRPzLONKMb1wxS0uPClqi4xLCXlUQeicWF/Q8lkALle4DCHew6AUL4f
4dNlM0+bK3y3fbrtJHyRaSN5ZGmwYK1luez5x9X5AlioSgE2w/5Vf1x21ODV0wZV
u0RZqOtH1WoeqALXgYQjZkkI9R+fngArJaC09uc35saSTmqV6SX/A3Cq+pualBi/
jzC32yAVJQW3YXIjkzkFpe1H+blH1JV59sO0O+q2rGNyq9vPBBM=
=imrT
-----END PGP SIGNATURE-----

--FeGIOYH7QYdC7GgM--
