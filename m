Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D87206E6A11
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 18:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232673AbjDRQpI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 12:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbjDRQpC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 12:45:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699A813C32
        for <linux-i2c@vger.kernel.org>; Tue, 18 Apr 2023 09:44:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 00B69636EA
        for <linux-i2c@vger.kernel.org>; Tue, 18 Apr 2023 16:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1CCC433D2;
        Tue, 18 Apr 2023 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681836295;
        bh=dCZnfQA68l+wEfA31+n5Yhd81jUD3Yd5cKGCk4wINDk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OLIfoUqZ0zNUzXhGKcJuP/6e9LeAvmhat/xwx7A7u1fRJVkvWP2Xhl+y6imabaUvn
         2IODyVcnQRcaCA2RlQXJyrRMiVwCxn8lTgulw7Y8ro4z1bmMYsn4vQQcwMw2lXwEFn
         du2neQJ/oiFF8kHHMBG+zXDKJ2yCgHJ/jalsdXmENEbyo1kxuxZGvnS+Rvj8GE4u4E
         dCJ/fe/3cp6zeQ8BylQICApwpNKetVj39WBEAvD6gb9Y6eMmGbuxfIOdssnXYubjfF
         ZEf1XfCO94e5Y7nj/wt8+al48yZkd4k3tGPvOLuvLbhPQl84lYeMoAGdcrxGK1JsKb
         i2HTdn0QQVfKA==
Date:   Tue, 18 Apr 2023 18:44:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: xiic: xiic_xfer(): Fix runtime PM leak on error
 path
Message-ID: <ZD7JBIjrmWTEGYqi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
References: <20230414021022.505291-1-lars@metafoo.de>
 <20230414021022.505291-2-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M3msAm5h55uVQ1/U"
Content-Disposition: inline
In-Reply-To: <20230414021022.505291-2-lars@metafoo.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--M3msAm5h55uVQ1/U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 07:10:22PM -0700, Lars-Peter Clausen wrote:
> The xiic_xfer() function gets a runtime PM reference when the function is
> entered. This reference is released when the function is exited. There is
> currently one error path where the function exits directly, which leads to
> a leak of the runtime PM reference.
>=20
> Make sure that this error path also releases the runtime PM reference.
>=20
> Fixes: fdacc3c7405d ("i2c: xiic: Switch from waitqueue to completion")
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied to for-current, thanks!


--M3msAm5h55uVQ1/U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ+yQQACgkQFA3kzBSg
KbbwwA/9Ea5QbtwO4hYRM6ebmyJjisBMTd6M8kIJtHh/FSnpIAjiNbkqHzPfn8qZ
5vvOxdQReooPpwj+qHlgF8bhJuDJ4JzCLs0SxIPJe/YpjiyE9//aUogaljVxPhF2
kKH0jmi8HJumXk7TRZX+FRrt9Y1OwxfGPfpeFrmszQY5lBCepG1FAysRQBtuo7o0
MBtEy4dtqpETKvDHtRzFVoc2D/xs3JueFEbDwxVFDME/nVYe96msIQWDDTiZxojN
kk9++Jpiq3sq3QBTSxWNwwIp6Ct60dnuIW4KqG94+PWhgkV7zmSof6z4Trw8jvDD
PwhdR8uETg6qc8Ape4RKpCa+pHDsb4vu2U2T6hTruyj3hCfBYrRXgwWBbLSJ7Nqk
lJeH0anTqVWMUdkgHCmHjAnTsEasE/vUPjPGSGoI93PT4vTlaqRDIf2uIcskaawk
VS7GW6QFOj83LxGvbc04uukMN5B75HPGvhNdtGrYaoAxSbvpuEqUTa9md88bk/y5
zH6Ye3+qv+PYGFMGOcYWaZ1i+i/bTMotKa6bp1hJ9nwXFUZ2bTm28waC1+Rff1kl
ts3P26iaHhLNadxQR+h5e87ogQxTAtkUdZhU6hwqiY9m+yc1trIzofy6vCl3rSj3
PhusUFuSwa11E4Q59WYDXvj8HxrbcWhsILAJGDrvreCxHtmcALQ=
=DZeI
-----END PGP SIGNATURE-----

--M3msAm5h55uVQ1/U--
